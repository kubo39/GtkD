/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

module utils.GtkStruct;

import std.algorithm: sort, uniq, endsWith;
import std.conv;
import std.file : write;
import std.path: buildPath;
import std.uni: toUpper, toLower;
import std.range;
import std.string: splitLines, strip;

import utils.GtkFunction;
import utils.GtkPackage;
import utils.GtkType;
import utils.GtkWrapper;
import utils.XML;
import utils.LinkedHasMap: Map = LinkedHashMap;
import utils.IndentedStringBuilder;

enum GtkStructType : string
{
	Class = "class",
	Interface = "interface",
	Record = "record"
}

final class GtkStruct
{
	string name;
	GtkStructType type;
	string doc;
	string cType;
	string parent;
	string libVersion;

	string[string] structWrap;
	string[string] aliases;
	string[] lookupCode;
	string[] lookupInterfaceCode;

	string[] implements;
	string[] imports;
	GtkField[] fields;
	string[] virtualFunctions;
	Map!(string, GtkFunction) functions;

	GtkWrapper wrapper;
	GtkPackage pack;

	this(GtkWrapper wrapper, GtkPackage pack)
	{
		this.wrapper = wrapper;
		this.pack = pack;
	}

	void parse(T)(XMLReader!T reader)
	{
		name = reader.front.attributes["name"];
		type = cast(GtkStructType)reader.front.value;
		cType = reader.front.attributes["c:type"];

		if ( "parent" in reader.front.attributes )
			parent = reader.front.attributes["parent"];
		if ( "version" in reader.front.attributes )
			libVersion = reader.front.attributes["version"];

		reader.popFront();

		while( !reader.empty && !reader.endTag(["class", "interface", "record"]) )
		{
			switch(reader.front.value)
			{
				case "doc":
					reader.popFront();
					doc ~= reader.front.value;
					reader.popFront();
					break;
				case "doc-deprecated":
					reader.popFront();
					doc ~= "\n\nDeprecated: "~ reader.front.value;
					reader.popFront();
					break;
				case "field":
					GtkField field = new GtkField(wrapper);
					field.parse(reader);
					fields ~= field;
					break;
				case "union":
					GtkField field = new GtkField(wrapper);
					GtkUnion uni = new GtkUnion(wrapper);
					uni.parse(reader);
					field.gtkUnion = uni;
					fields ~= field;
					break;
				case "constructor":
				case "function":
				case "method":
				case "glib:signal":
					GtkFunction func = new GtkFunction(wrapper, this);
					func.parse(reader);
					functions[func.name] = func;
					break;
				case "virtual-method":
					// Virtual methods in the gir file are mirrored
					// as regular methods, so we only collect whitch are virtual;
					virtualFunctions ~= reader.front.attributes["name"];
					reader.skipTag();
					break;
				case "implements":
					implements ~= reader.front.attributes["name"];
					break;
				case "prerequisite": // Determines whitch base class the implementor of an interface must implement.
				case "property":
					reader.skipTag();
					break;
				default:
					assert(false, "Unexpected tag: "~ reader.front.value);
			}

			reader.popFront();
		}

		foreach( func; virtualFunctions )
		{
			if ( auto vFunc = func in functions )
				vFunc.virtual = true;
		}
	}

	string[] getStructDeclaration()
	{
		string buff[];

		if ( doc !is null && wrapper.includeComments && type == GtkStructType.Record )
		{
			buff ~= "/**";
			foreach ( line; doc.splitLines() )
				buff ~= " * "~ line.strip();

			if ( libVersion )
			{
				buff ~= " *";
				buff ~= " * Since: "~ libVersion;
			}

			buff ~= " */";
		}

		if ( !fields.empty )
		{
			buff ~= "struct "~ tokenToGtkD(cType, wrapper.aliasses);
			buff ~= "{";
			buff ~= GtkField.getFieldDeclarations(fields, wrapper);
			buff ~= "}";
		}
		else
		{
			buff ~= "struct "~ tokenToGtkD(cType, wrapper.aliasses) ~";";
		}

		return buff;
	}

	void writeClass()
	{
		if ( type == GtkStructType.Record )
			return;

		GtkStruct parentStruct = pack.getStruct(parent);
		if ( parentStruct )
			imports ~= parentStruct.pack.name ~"."~ parentStruct.name;

		if ( type == GtkStructType.Interface )
			writeInterface();

		string buff = wrapper.licence;
		auto indenter = new IndentedStringBuilder();

		if ( type == GtkStructType.Interface )
			buff ~= "module "~ pack.name ~"."~ name ~"T;\n\n";
		else
			buff ~= "module "~ pack.name ~"."~ name ~";\n\n";

		writeImports(buff);

		if ( doc !is null && wrapper.includeComments )
		{
			buff ~= "/**\n";
			foreach ( line; doc.splitLines() )
				buff ~= " * "~ line.strip() ~"\n";
			
			if ( libVersion )
			{
				buff ~= " *\n * Since: "~ libVersion ~"\n";
			}
			
			buff ~= " */\n";
		}

		if ( type == GtkStructType.Interface )
			buff ~= "public template "~ name ~"T(TStruct)";
		else
			buff ~= "public class "~ name;

		if ( parentStruct )
			buff ~= " : "~ parentStruct.pack.name ~"."~ parentStruct.name;

		bool first = !parentStruct;

		foreach ( interf; implements )
		{
			if ( parentStruct && parentStruct.implements.canFind(interf) )
				continue;

			GtkStruct strct = pack.getStruct(interf);

			if ( strct && first )
			{
				buff ~= " :";
				first = false;
			}

			if ( strct )
				buff ~= " "~ strct.name ~"IF";
		}

		buff ~= "\n";
		buff ~= indenter.format("{");

		if ( cType )
		{
			if ( type != GtkStructType.Interface )
			{
				buff ~= indenter.format("/** the main Gtk struct */");
				buff ~= indenter.format("protected "~ cType ~" "~ getHandleVar() ~";");
				buff ~= "\n";
			}
			buff ~= indenter.format("/** Get the main Gtk struct */");
			buff ~= indenter.format("public "~ cType ~" "~ getHandleFunc() ~"()");
			buff ~= indenter.format("{");

			if ( type == GtkStructType.Interface )
				buff ~= indenter.format("return cast("~ cType ~")getStruct();");
			else
				buff ~= indenter.format("return "~ getHandleVar ~";");

			buff ~= indenter.format("}");
			buff ~= "\n";
			buff ~= indenter.format("/** the main Gtk struct as a void* */");

			if ( parentStruct )
				buff ~= indenter.format("protected override void* getStruct()");
			else
				buff ~= indenter.format("protected void* getStruct()");

			buff ~= indenter.format("{");
			buff ~= indenter.format("return cast(void*)"~ getHandleVar ~";");
			buff ~= indenter.format("}");
			buff ~= "\n";

			if ( type != GtkStructType.Interface && cType != "GObject*" && cType != "cairo_t*" )
			{
				if ( parentStruct && pack.name != "cairo" )
				{
					buff ~= indenter.format("protected override void setStruct(GObject* obj)");
					buff ~= indenter.format("{");
					buff ~= indenter.format(getHandleVar ~" = cast("~ cType ~")obj;");
					buff ~= indenter.format("}");
					buff ~= "\n";
				}

				buff ~= indenter.format("/**");
				buff ~= indenter.format(" * Sets our main struct and passes it to the parent class.");
				buff ~= indenter.format(" */");
				buff ~= indenter.format("public this ("~ cType ~" "~ getHandleVar() ~")");
				buff ~= indenter.format("{");
				if ( parentStruct )
					buff ~= indenter.format("super(cast("~ parentStruct.cType ~")"~ getHandleVar() ~");");
				buff ~= indenter.format("this."~ getHandleVar() ~" = "~ getHandleVar() ~";");
				buff ~= indenter.format("}");
				buff ~= "\n";
			}

			if ( !lookupCode.empty )
			{
				buff ~= indenter.format(lookupCode);
				buff ~= "\n";
			}

			buff ~= indenter.format(["/**", "*/", ""]);

			foreach ( func; functions )
			{

			}

			buff ~= indenter.format("}");
		}

		if ( type == GtkStructType.Interface )
			std.file.write(buildPath(wrapper.outputRoot, wrapper.srcDir, pack.name, name ~"T.d"), buff);
		else
			std.file.write(buildPath(wrapper.outputRoot, wrapper.srcDir, pack.name, name ~".d"), buff);
	}

	void writeInterface()
	{
		GtkStruct parentStruct = pack.getStruct(parent);
				
		string buff = wrapper.licence;
		auto indenter = new IndentedStringBuilder();
		
		buff ~= "module "~ pack.name ~"."~ name ~"IF;\n\n";

		writeImports(buff);
		
		if ( doc !is null && wrapper.includeComments )
		{
			buff ~= "/**\n";
			foreach ( line; doc.splitLines() )
				buff ~= " * "~ line.strip() ~"\n";
			
			if ( libVersion )
			{
				buff ~= " *\n * Since: "~ libVersion ~"\n";
			}
			
			buff ~= " */\n";
		}
		
		buff ~= "public interface "~ name;
		buff ~= indenter.format("{");
		
		if ( cType )
		{
			buff ~= indenter.format("/** Get the main Gtk struct */");
			buff ~= indenter.format("public "~ cType ~" "~ getHandleFunc() ~"();");
			buff ~= "\n";

			buff ~= indenter.format("/** the main Gtk struct as a void* */");
			buff ~= indenter.format("protected void* getStruct();");
			buff ~= "\n";
			
			if ( !lookupInterfaceCode.empty )
			{
				buff ~= indenter.format(lookupInterfaceCode);
				buff ~= "\n";
			}
			
			buff ~= indenter.format(["/**", "*/", ""]);
			
			foreach ( func; functions )
			{
				
			}
			
			buff ~= indenter.format("}");
		}
		
		std.file.write(buildPath(wrapper.outputRoot, wrapper.srcDir, pack.name, name ~"IF.d"), buff);
	}

	/**
	 * Return the variable name the c type is stored in.
	 */
	string getHandleVar()
	{
		if (cType.length == 0)
			return "";
		
		string p = to!string(toLower(cType[0]));
		if ( cType.endsWith("_t") )
		{
			return p ~ cType[1 .. $ - 2];
		} else {
			return p ~ cType[1 .. $];
		}
	}

	/**
	 * Returns the name of the function that returns the cType.
	 */
	string getHandleFunc()
	{
		GtkStruct parentStruct = pack.getStruct(parent);

		if ( parentStruct && parentStruct.name == name )
			return "get"~ cast(char)pack.name[0].toUpper ~ pack.name[1..$] ~ name ~"Struct";
		else
			return "get"~ name ~"Struct";
	}

	private void writeImports(ref string buff, bool _public = false)
	{
		imports ~= "gtkc."~ pack.name;
		imports ~= "gtkc."~ pack.name ~"types";

		foreach( func; functions )
		{
			if ( func.noCode )
				continue;

			if ( func.throws )
			{
				imports ~= "glib.ErrorG";
				imports ~= "glib.GException";
			}

			void getReturnImport(GtkType type)
			{
				GtkStruct dType = pack.getStruct(type.name);

				if ( dType )
				{
					imports ~= dType.pack.name ~"."~ dType.name;
					
					if ( dType.type == GtkStructType.Interface )
						imports ~= dType.pack.name ~"."~ dType.name ~"IF";
				}
				else if ( type.name == "utf8" )
					imports ~= "glib.Str";
			}

			if ( func.returnType && func.returnType.cType !in structWrap )
			{
				getReturnImport(func.returnType);

				if ( func.returnType.elementType )
					getReturnImport(func.returnType.elementType);
			}

			void getParamImport(GtkType type)
			{
				GtkStruct dType = pack.getStruct(type.name);
				
				if ( dType )
				{
					if ( dType.type == GtkStructType.Interface )
						imports ~= dType.pack.name ~"."~ dType.name ~"IF";
					else
						imports ~= dType.pack.name ~"."~ dType.name;
				}
				else if ( type.name == "utf8" )
					imports ~= "glib.Str";
			}

			foreach ( param; func.params )
			{
				if ( param.type.cType in structWrap )
					continue;

				getParamImport(param.type);

				if ( param.type.elementType )
					getParamImport(param.type.elementType);
			}

			if ( func.type == GtkFunctionType.Signal )
			{
				imports ~= "gobject.Signals";
				imports ~= "gtkc.gdktypes";
			}

			if ( func.type == GtkFunctionType.Constructor )
				imports ~= "glib.ConstructionException";
		}

		GtkStruct parentStruct = pack.getStruct(parent);
		foreach ( interf; implements )
		{
			if ( parentStruct && parentStruct.implements.canFind(interf) )
				continue;
			
			GtkStruct strct = pack.getStruct(interf);

			if ( strct )
			{
				imports ~= strct.pack.name ~"."~ strct.name ~"IF";
				imports ~= strct.pack.name ~"."~ strct.name ~"T";
			}
		}

		imports = uniq(sort(imports)).array;

		foreach ( imp; imports )
		{
			if ( _public || imp.endsWith("types") )
				buff ~= "public  import "~ imp ~";\n";
			else
				buff ~= "private import "~ imp ~";\n";
		}

		buff ~= "\n\n";
	}
}

final class GtkField
{
	string name;
	string doc;
	GtkType type;
	int bits = -1;

	GtkFunction callback;
	GtkUnion gtkUnion;

	GtkWrapper wrapper;

	this(GtkWrapper wrapper)
	{
		this.wrapper = wrapper;
	}

	void parse(T)(XMLReader!T reader)
	{
		name = reader.front.attributes["name"];

		if ( "bits" in reader.front.attributes )
			bits = to!int(reader.front.attributes["bits"]);

		//TODO: readable private?

		reader.popFront();

		while( !reader.empty && !reader.endTag("field") )
		{
			if ( reader.front.type == XMLNodeType.EndTag )
			{
				reader.popFront();
				continue;
			}

			switch(reader.front.value)
			{
				case "doc":
					reader.popFront();
					doc ~= reader.front.value;
					reader.popFront();
					break;
				case "doc-deprecated":
					reader.popFront();
					doc ~= "\n\nDeprecated: "~ reader.front.value;
					reader.popFront();
					break;
				case "array":
				case "type":
					type = new GtkType(wrapper);
					type.parse(reader);
					break;
				case "callback":
					callback = new GtkFunction(wrapper, null);
					callback.parse(reader);
					break;
				default:
					assert(false, name ~": Unexpected tag: "~ reader.front.value);
			}
			reader.popFront();
		}
	}

	/**
	 * A special case for fields, we need to know about all of then
	 * to properly construct the bitfields.
	 */
	static string[] getFieldDeclarations(GtkField[] fields, GtkWrapper wrapper)
	{
		string[] buff;
		int bitcount;

		void endBitfield()
		{
			//AFAIK: C bitfields are padded to a multiple of sizeof uint.
			int padding = 32 - (bitcount % 32);
				
			if ( padding > 0)
			{
				buff[buff.length-1] ~= ",";
				buff ~= "uint, \"\", "~ to!string(padding);
				buff ~= "));";
			}
			else
			{
				buff ~= "));";
			}

			bitcount = 0;
		}

		foreach ( field; fields )
		{
			if ( field.callback )
			{
				if ( bitcount > 0 )
					endBitfield();
				buff ~= field.callback.getCallbackDeclaration();
				continue;
			}

			if ( field.gtkUnion )
			{
				if ( bitcount > 0 )
					endBitfield();
				buff ~= field.gtkUnion.getUnionDeclaration();
				continue;
			}

			if ( field.bits > 0 )
			{
				if ( bitcount == 0 )
				{
					buff ~= "import std.bitmanip: bitfields;";
					buff ~= "mixin(bitfields!(";
				}
				else
				{
					buff[buff.length-1] ~= ",";
				}

				bitcount += field.bits;
				buff ~=stringToGtkD(field.type.cType ~", \""~ field.name ~"\", "~ to!string(field.bits), wrapper.aliasses);
				continue;
			}
			else if ( bitcount > 0)
			{
				endBitfield();
			}

			if ( field.doc !is null && wrapper.includeComments && field.bits < 0 )
			{
				buff ~= "/**";
				foreach ( line; field.doc.splitLines() )
					buff ~= " * "~ line.strip();
				buff ~= " */";
			}

			string dType = tokenToGtkD(field.type.cType, wrapper.aliasses);

			if ( field.type.size != -1 )
				dType ~= "["~ to!string(field.type.size) ~"]";

			buff ~= dType ~" "~ tokenToGtkD(field.name, wrapper.aliasses) ~";";
		}

		if ( bitcount > 0)
		{
			endBitfield();
		}

		return buff;
	}
}

final class GtkUnion
{
	string name;
	string doc;
	GtkField[] fields;

	GtkWrapper wrapper;
	
	this(GtkWrapper wrapper)
	{
		this.wrapper = wrapper;
	}

	void parse(T)(XMLReader!T reader)
	{
		if ( "name" in reader.front.attributes )
			name = reader.front.attributes["name"];

		reader.popFront();

		while( !reader.empty && !reader.endTag("union") )
		{
			switch(reader.front.value)
			{
				case "doc":
					reader.popFront();
					doc ~= reader.front.value;
					reader.popFront();
					break;
				case "doc-deprecated":
					reader.popFront();
					doc ~= "\n\nDeprecated: "~ reader.front.value;
					reader.popFront();
					break;
				case "field":
					GtkField field = new GtkField(wrapper);
					field.parse(reader);
					fields ~= field;
					break;
				default:
					assert(false, "Unexpected tag: "~ reader.front.value);
			}
			reader.popFront();
		}
	}

	string[] getUnionDeclaration()
	{
		string buff[];
		if ( doc !is null && wrapper.includeComments )
		{
			buff ~= "/**";
			foreach ( line; doc.splitLines() )
				buff ~= " * "~ line.strip();
			buff ~= " */";
		}

		if ( name )
			buff ~= "union "~ tokenToGtkD(name.toUpper()[0..1] ~ name[1 .. $], wrapper.aliasses);
		else
			buff ~= "union";

		buff ~= "{";
		buff ~= GtkField.getFieldDeclarations(fields, wrapper);
		buff ~= "}";

		if ( name )
			buff ~= tokenToGtkD(name.toUpper()[0..1] ~ name[1 .. $], wrapper.aliasses) ~" "~ tokenToGtkD(name, wrapper.aliasses) ~";";

		return buff;
	}
}
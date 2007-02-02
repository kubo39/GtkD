/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * inFile  = cairo-cairo-t.html
 * outPack = cairoLib
 * outFile = Cairo
 * strct   = cairo_t
 * realStrct=
 * ctorStrct=
 * clss    = Cairo
 * interf  = 
 * class Code: Yes
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- cairo_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * 	- cairoLib.Surface
 * 	- glib.Str
 * 	- gdk.Region
 * 	- gdk.Rectangle
 * 	- gdk.Pixbuf
 * 	- gdk.Pixmap
 * 	- gdk.Color
 * 	- gtkc.gdk
 * 	- gdk.Drawable
 * structWrap:
 * 	- cairo_surface_t* -> Surface
 * 	- cairo_t* -> Cairo
 * module aliases:
 * local aliases:
 */

module cairoLib.Cairo;

private import gtkc.cairoLibtypes;

private import gtkc.cairoLib;

private import cairoLib.Surface;
private import glib.Str;
private import gdk.Region;
private import gdk.Rectangle;
private import gdk.Pixbuf;
private import gdk.Pixmap;
private import gdk.Color;
private import gtkc.gdk;
private import gdk.Drawable;



/**
 * Description
 *  cairo_t is the main object used when drawing with cairo. To
 *  draw with cairo, you create a cairo_t, set the target surface,
 *  and drawing options for the cairo_t, create shapes with
 *  functions like cairo_move_to() and cairo_line_to(), and then
 *  draw shapes with cairo_stroke() or cairo_fill().
 *  cairo_t's can be pushed to a stack via cairo_save().
 *  They may then safely be changed, without loosing the current state.
 *  Use cairo_restore() to restore to the saved state.
 */
public class Cairo
{
	
	/** the main Gtk struct */
	protected cairo_t* cairo;
	
	
	public cairo_t* getCairoStruct()
	{
		return cairo;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)cairo;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (cairo_t* cairo)
	{
		this.cairo = cairo;
	}
	
	/**
	 * Creates a Cairo context for drawing to drawable.
	 * drawable:
	 *  a GdkDrawable
	 * Returns:
	 *  A newly created Cairo context. Free with
	 *  cairo_destroy() when you are done drawing.
	 * Since 2.8
	 */
	this (Drawable drawable)
	{
		// cairo_t* gdk_cairo_create (GdkDrawable *);
		this(gdk_cairo_create(drawable.getDrawableStruct()));
	}
	
	/**
	 * Sets the specified GdkColor as the source color of cr.
	 * cr:
	 *  a cairo_t
	 * color:
	 *  a GdkColor
	 * Since 2.8
	 */
	public void setSourceColor(Color color)
	{
		// void gdk_cairo_set_source_color (cairo_t *cr,  GdkColor *color);
		gdk_cairo_set_source_color(getCairoStruct(), color.getColorStruct());
	}
	
	/**
	 * Sets the given pixbuf as the source pattern for the Cairo context.
	 * The pattern has an extend mode of CAIRO_EXTEND_NONE and is aligned
	 * so that the origin of pixbuf is pixbuf_x, pixbuf_y
	 * cr:
	 *  a Cairo context
	 * pixbuf:
	 *  a GdkPixbuf
	 * pixbuf_x:
	 *  X coordinate of location to place upper left corner of pixbuf
	 * pixbuf_y:
	 *  Y coordinate of location to place upper left corner of pixbuf
	 * Since 2.8
	 */
	public void setSourcePixbuf(Pixbuf pixbuf, double pixbufX, double pixbufY)
	{
		// void gdk_cairo_set_source_pixbuf (cairo_t *cr,  GdkPixbuf *pixbuf,  double pixbuf_x,  double pixbuf_y);
		gdk_cairo_set_source_pixbuf(getCairoStruct(), pixbuf.getPixbufStruct(), pixbufX, pixbufY);
	}
	
	/**
	 * Sets the given pixmap as the source pattern for the Cairo context.
	 * The pattern has an extend mode of CAIRO_EXTEND_NONE and is aligned
	 * so that the origin of pixbuf is pixbuf_x, pixbuf_y
	 * cr:
	 *  a Cairo context
	 * pixmap:
	 *  a GdkPixmap
	 * pixmap_x:
	 *  X coordinate of location to place upper left corner of pixmap
	 * pixmap_y:
	 *  Y coordinate of location to place upper left corner of pixmap
	 * Since 2.10
	 */
	public void setSourcePixmap(Pixmap pixmap, double pixmapX, double pixmapY)
	{
		// void gdk_cairo_set_source_pixmap (cairo_t *cr,  GdkPixmap *pixmap,  double pixmap_x,  double pixmap_y);
		gdk_cairo_set_source_pixmap( getCairoStruct(), pixmap.getPixmapStruct(), pixmapX, pixmapY);
	}
	
	/**
	 * Adds the given rectangle to the current path of cr.
	 * cr:
	 *  a cairo_t
	 * rectangle:
	 *  a GdkRectangle
	 * Since 2.8
	 */
	public void rectangle(Rectangle rectangle)
	{
		// void gdk_cairo_rectangle (cairo_t *cr,  GdkRectangle *rectangle);
		gdk_cairo_rectangle( getCairoStruct(), rectangle.getRectangleStruct());
	}
	
	/**
	 * Adds the given region to the current path of cr.
	 * cr:
	 *  a cairo_t
	 * region:
	 *  a GdkRegion
	 * Since 2.8
	 */
	public  void region( Region region)
	{
		// void gdk_cairo_region (cairo_t *cr,  GdkRegion *region);
		gdk_cairo_region(getCairoStruct(), region.getRegionStruct());
	}
	
	
	/**
	 * Description
	 */
	
	/**
	 * Description
	 */
	
	/**
	 * Description
	 */
	
	
	/**
	 * Creates a new cairo_t with all graphics state parameters set to
	 * default values and with target as a target surface. The target
	 * surface should be constructed with a backend-specific function such
	 * as cairo_image_surface_create() (or any other
	 * cairo_<backend>_surface_create variant).
	 * This function references target, so you can immediately
	 * call cairo_surface_destroy() on it if you don't need to
	 * maintain a separate reference to it.
	 * target:
	 *  target surface for the context
	 * Returns:
	 *  a newly allocated cairo_t with a reference
	 *  count of 1. The initial reference count should be released
	 *  with cairo_destroy() when you are done using the cairo_t.
	 *  This function never returns NULL. If memory cannot be
	 *  allocated, a special cairo_t object will be returned on
	 *  which cairo_status() returns CAIRO_STATUS_NO_MEMORY.
	 *  You can use this object normally, but no drawing will
	 *  be done.
	 */
	public static Cairo create(Surface target)
	{
		// cairo_t* cairo_create (cairo_surface_t *target);
		return new Cairo( cairo_create((target is null) ? null : target.getSurfaceStruct()) );
	}
	
	/**
	 * Increases the reference count on cr by one. This prevents
	 * cr from being destroyed until a matching call to cairo_destroy()
	 * is made.
	 * cr:
	 *  a cairo_t
	 * Returns:
	 *  the referenced cairo_t.
	 */
	public Cairo reference()
	{
		// cairo_t* cairo_reference (cairo_t *cr);
		return new Cairo( cairo_reference(cairo) );
	}
	
	/**
	 * Decreases the reference count on cr by one. If the result
	 * is zero, then cr and all associated resources are freed.
	 * See cairo_reference().
	 * cr:
	 *  a cairo_t
	 */
	public void destroy()
	{
		// void cairo_destroy (cairo_t *cr);
		cairo_destroy(cairo);
	}
	
	/**
	 * Checks whether an error has previously occurred for this context.
	 * cr:
	 *  a cairo context
	 * Returns:
	 * the current status of this context, see cairo_status_t
	 */
	public cairo_status_t status()
	{
		// cairo_status_t cairo_status (cairo_t *cr);
		return cairo_status(cairo);
	}
	
	/**
	 * Makes a copy of the current state of cr and saves it
	 * on an internal stack of saved states for cr. When
	 * cairo_restore() is called, cr will be restored to
	 * the saved state. Multiple calls to cairo_save() and
	 * cairo_restore() can be nested; each call to cairo_restore()
	 * restores the state from the matching paired cairo_save().
	 * It isn't necessary to clear all saved states before
	 * a cairo_t is freed. If the reference count of a cairo_t
	 * drops to zero in response to a call to cairo_destroy(),
	 * any saved states will be freed along with the cairo_t.
	 * cr:
	 *  a cairo_t
	 */
	public void save()
	{
		// void cairo_save (cairo_t *cr);
		cairo_save(cairo);
	}
	
	/**
	 * Restores cr to the state saved by a preceding call to
	 * cairo_save() and removes that state from the stack of
	 * saved states.
	 * cr:
	 *  a cairo_t
	 */
	public void restore()
	{
		// void cairo_restore (cairo_t *cr);
		cairo_restore(cairo);
	}
	
	/**
	 * Gets the target surface for the cairo context as passed to
	 * cairo_create().
	 * This function will always return a valid pointer, but the result
	 * can be a "nil" surface if cr is already in an error state,
	 * (ie. cairo_status() != CAIRO_STATUS_SUCCESS).
	 * A nil surface is indicated by cairo_surface_status()
	 * != CAIRO_STATUS_SUCCESS.
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the target surface. This object is owned by cairo. To
	 * keep a reference to it, you must call cairo_surface_reference().
	 */
	public Surface getTarget()
	{
		// cairo_surface_t* cairo_get_target (cairo_t *cr);
		return new Surface( cairo_get_target(cairo) );
	}
	
	/**
	 * Temporarily redirects drawing to an intermediate surface known as a
	 * group. The redirection lasts until the group is completed by a call
	 * to cairo_pop_group() or cairo_pop_group_to_source(). These calls
	 * provide the result of any drawing to the group as a pattern,
	 * (either as an explicit object, or set as the source pattern).
	 * This group functionality can be convenient for performing
	 * intermediate compositing. One common use of a group is to render
	 * objects as opaque within the group, (so that they occlude each
	 * other), and then blend the result with translucence onto the
	 * destination.
	 * Groups can be nested arbitrarily deep by making balanced calls to
	 * cairo_push_group()/cairo_pop_group(). Each call pushes/pops the new
	 * target group onto/from a stack.
	 * The cairo_push_group() function calls cairo_save() so that any
	 * changes to the graphics state will not be visible outside the
	 * group, (the pop_group functions call cairo_restore()).
	 * By default the intermediate group will have a content type of
	 * CAIRO_CONTENT_COLOR_ALPHA. Other content types can be chosen for
	 * the group by using cairo_push_group_with_content() instead.
	 * As an example, here is how one might fill and stroke a path with
	 * translucence, but without any portion of the fill being visible
	 * under the stroke:
	 * cairo_push_group (cr);
	 * cairo_set_source (cr, fill_pattern);
	 * cairo_fill_preserve (cr);
	 * cairo_set_source (cr, stroke_pattern);
	 * cairo_stroke (cr);
	 * cairo_pop_group_to_source (cr);
	 * cairo_paint_with_alpha (cr, alpha);
	 * cr:
	 *  a cairo context
	 * Since 1.2
	 */
	public void pushGroup()
	{
		// void cairo_push_group (cairo_t *cr);
		cairo_push_group(cairo);
	}
	
	/**
	 * Temporarily redirects drawing to an intermediate surface known as a
	 * group. The redirection lasts until the group is completed by a call
	 * to cairo_pop_group() or cairo_pop_group_to_source(). These calls
	 * provide the result of any drawing to the group as a pattern,
	 * (either as an explicit object, or set as the source pattern).
	 * The group will have a content type of content. The ability to
	 * control this content type is the only distinction between this
	 * function and cairo_push_group() which you should see for a more
	 * detailed description of group rendering.
	 * cr:
	 *  a cairo context
	 * content:
	 *  a cairo_content_t indicating the type of group that
	 *  will be created
	 * Since 1.2
	 */
	public void pushGroupWithContent(cairo_content_t content)
	{
		// void cairo_push_group_with_content (cairo_t *cr,  cairo_content_t content);
		cairo_push_group_with_content(cairo, content);
	}
	
	/**
	 * Terminates the redirection begun by a call to cairo_push_group() or
	 * cairo_push_group_with_content() and returns a new pattern
	 * containing the results of all drawing operations performed to the
	 * group.
	 * The cairo_pop_group() function calls cairo_restore(), (balancing a
	 * call to cairo_save() by the push_group function), so that any
	 * changes to the graphics state will not be visible outside the
	 * group.
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  a newly created (surface) pattern containing the
	 * results of all drawing operations performed to the group. The
	 * caller owns the returned object and should call
	 * cairo_pattern_destroy() when finished with it.
	 * Since 1.2
	 */
	public cairo_pattern_t* popGroup()
	{
		// cairo_pattern_t* cairo_pop_group (cairo_t *cr);
		return cairo_pop_group(cairo);
	}
	
	/**
	 * Terminates the redirection begun by a call to cairo_push_group() or
	 * cairo_push_group_with_content() and installs the resulting pattern
	 * as the source pattern in the given cairo context.
	 * The behavior of this function is equivalent to the sequence of
	 * operations:
	 * cairo_pattern_t *group = cairo_pop_group (cr);
	 * cairo_set_source (cr, group);
	 * cairo_pattern_destroy (group);
	 * but is more convenient as their is no need for a variable to store
	 * the short-lived pointer to the pattern.
	 * The cairo_pop_group() function calls cairo_restore(), (balancing a
	 * call to cairo_save() by the push_group function), so that any
	 * changes to the graphics state will not be visible outside the
	 * group.
	 * cr:
	 *  a cairo context
	 * Since 1.2
	 */
	public void popGroupToSource()
	{
		// void cairo_pop_group_to_source (cairo_t *cr);
		cairo_pop_group_to_source(cairo);
	}
	
	/**
	 * Gets the target surface for the current group as started by the
	 * most recent call to cairo_push_group() or
	 * cairo_push_group_with_content().
	 * This function will return NULL if called "outside" of any group
	 * rendering blocks, (that is, after the last balancing call to
	 * cairo_pop_group() or cairo_pop_group_to_source()).
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the target group surface, or NULL if none. This
	 * object is owned by cairo. To keep a reference to it, you must call
	 * cairo_surface_reference().
	 * Since 1.2
	 */
	public Surface getGroupTarget()
	{
		// cairo_surface_t* cairo_get_group_target (cairo_t *cr);
		return new Surface( cairo_get_group_target(cairo) );
	}
	
	/**
	 * Sets the source pattern within cr to an opaque color. This opaque
	 * color will then be used for any subsequent drawing operation until
	 * a new source pattern is set.
	 * The color components are floating point numbers in the range 0 to
	 * 1. If the values passed in are outside that range, they will be
	 * clamped.
	 * cr:
	 *  a cairo context
	 * red:
	 *  red component of color
	 * green:
	 *  green component of color
	 * blue:
	 *  blue component of color
	 */
	public void setSourceRgb(double red, double green, double blue)
	{
		// void cairo_set_source_rgb (cairo_t *cr,  double red,  double green,  double blue);
		cairo_set_source_rgb(cairo, red, green, blue);
	}
	
	/**
	 * Sets the source pattern within cr to a translucent color. This
	 * color will then be used for any subsequent drawing operation until
	 * a new source pattern is set.
	 * The color and alpha components are floating point numbers in the
	 * range 0 to 1. If the values passed in are outside that range, they
	 * will be clamped.
	 * cr:
	 *  a cairo context
	 * red:
	 *  red component of color
	 * green:
	 *  green component of color
	 * blue:
	 *  blue component of color
	 * alpha:
	 *  alpha component of color
	 */
	public void setSourceRgba(double red, double green, double blue, double alpha)
	{
		// void cairo_set_source_rgba (cairo_t *cr,  double red,  double green,  double blue,  double alpha);
		cairo_set_source_rgba(cairo, red, green, blue, alpha);
	}
	
	/**
	 * Sets the source pattern within cr to source. This pattern
	 * will then be used for any subsequent drawing operation until a new
	 * source pattern is set.
	 * Note: The pattern's transformation matrix will be locked to the
	 * user space in effect at the time of cairo_set_source(). This means
	 * that further modifications of the current transformation matrix
	 * will not affect the source pattern. See cairo_pattern_set_matrix().
	 * XXX: I'd also like to direct the reader's attention to some
	 * (not-yet-written) section on cairo's imaging model. How would I do
	 * that if such a section existed? (cworth).
	 * cr:
	 *  a cairo context
	 * source:
	 *  a cairo_pattern_t to be used as the source for
	 * subsequent drawing operations.
	 */
	public void setSource(cairo_pattern_t* source)
	{
		// void cairo_set_source (cairo_t *cr,  cairo_pattern_t *source);
		cairo_set_source(cairo, source);
	}
	
	/**
	 * This is a convenience function for creating a pattern from surface
	 * and setting it as the source in cr with cairo_set_source().
	 * The x and y parameters give the user-space coordinate at which
	 * the surface origin should appear. (The surface origin is its
	 * upper-left corner before any transformation has been applied.) The
	 * x and y patterns are negated and then set as translation values
	 * in the pattern matrix.
	 * Other than the initial translation pattern matrix, as described
	 * above, all other pattern attributes, (such as its extend mode), are
	 * set to the default values as in cairo_pattern_create_for_surface().
	 * The resulting pattern can be queried with cairo_get_source() so
	 * that these attributes can be modified if desired, (eg. to create a
	 * repeating pattern with cairo_pattern_set_extend()).
	 * cr:
	 *  a cairo context
	 * surface:
	 *  a surface to be used to set the source pattern
	 * x:
	 *  User-space X coordinate for surface origin
	 * y:
	 *  User-space Y coordinate for surface origin
	 */
	public void setSourceSurface(Surface surface, double x, double y)
	{
		// void cairo_set_source_surface (cairo_t *cr,  cairo_surface_t *surface,  double x,  double y);
		cairo_set_source_surface(cairo, (surface is null) ? null : surface.getSurfaceStruct(), x, y);
	}
	
	/**
	 * Gets the current source pattern for cr.
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current source pattern. This object is owned by
	 * cairo. To keep a reference to it, you must call
	 * cairo_pattern_reference().
	 */
	public cairo_pattern_t* getSource()
	{
		// cairo_pattern_t* cairo_get_source (cairo_t *cr);
		return cairo_get_source(cairo);
	}
	
	
	/**
	 * Set the antialiasing mode of the rasterizer used for drawing shapes.
	 * This value is a hint, and a particular backend may or may not support
	 * a particular value. At the current time, no backend supports
	 * CAIRO_ANTIALIAS_SUBPIXEL when drawing shapes.
	 * Note that this option does not affect text rendering, instead see
	 * cairo_font_options_set_antialias().
	 * cr:
	 *  a cairo_t
	 * antialias:
	 *  the new antialiasing mode
	 */
	public void setAntialias(cairo_antialias_t antialias)
	{
		// void cairo_set_antialias (cairo_t *cr,  cairo_antialias_t antialias);
		cairo_set_antialias(cairo, antialias);
	}
	
	/**
	 * Gets the current shape antialiasing mode, as set by cairo_set_shape_antialias().
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current shape antialiasing mode.
	 */
	public cairo_antialias_t getAntialias()
	{
		// cairo_antialias_t cairo_get_antialias (cairo_t *cr);
		return cairo_get_antialias(cairo);
	}
	
	/**
	 * Sets the dash pattern to be used by cairo_stroke(). A dash pattern
	 * is specified by dashes, an array of positive values. Each value
	 * provides the length of alternate "on" and "off" portions of the
	 * stroke. The offset specifies an offset into the pattern at which
	 * the stroke begins.
	 * Each "on" segment will have caps applied as if the segment were a
	 * separate sub-path. In particular, it is valid to use an "on" length
	 * of 0.0 with CAIRO_LINE_CAP_ROUND or CAIRO_LINE_CAP_SQUARE in order
	 * to distributed dots or squares along a path.
	 * Note: The length values are in user-space units as evaluated at the
	 * time of stroking. This is not necessarily the same as the user
	 * space at the time of cairo_set_dash().
	 * If num_dashes is 0 dashing is disabled.
	 * If num_dashes is 1 a symmetric pattern is assumed with alternating
	 * on and off portions of the size specified by the single value in
	 * dashes.
	 * If any value in dashes is negative, or if all values are 0, then
	 * cairo_t will be put into an error state with a status of
	 * CAIRO_STATUS_INVALID_DASH.
	 * cr:
	 *  a cairo context
	 * dashes:
	 *  an array specifying alternate lengths of on and off stroke portions
	 * num_dashes:
	 *  the length of the dashes array
	 * offset:
	 *  an offset into the dash pattern at which the stroke should start
	 */
	public void setDash(double* dashes, int numDashes, double offset)
	{
		// void cairo_set_dash (cairo_t *cr,  const double *dashes,  int num_dashes,  double offset);
		cairo_set_dash(cairo, dashes, numDashes, offset);
	}
	
	
	/**
	 * Set the current fill rule within the cairo context. The fill rule
	 * is used to determine which regions are inside or outside a complex
	 * (potentially self-intersecting) path. The current fill rule affects
	 * both cairo_fill and cairo_clip. See cairo_fill_rule_t for details
	 * on the semantics of each available fill rule.
	 * cr:
	 *  a cairo_t
	 * fill_rule:
	 *  a fill rule, specified as a cairo_fill_rule_t
	 */
	public void setFillRule(cairo_fill_rule_t fillRule)
	{
		// void cairo_set_fill_rule (cairo_t *cr,  cairo_fill_rule_t fill_rule);
		cairo_set_fill_rule(cairo, fillRule);
	}
	
	/**
	 * Gets the current fill rule, as set by cairo_set_fill_rule().
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current fill rule.
	 */
	public cairo_fill_rule_t getFillRule()
	{
		// cairo_fill_rule_t cairo_get_fill_rule (cairo_t *cr);
		return cairo_get_fill_rule(cairo);
	}
	
	
	/**
	 * Sets the current line cap style within the cairo context. See
	 * cairo_line_cap_t for details about how the available line cap
	 * styles are drawn.
	 * As with the other stroke parameters, the current line cap style is
	 * examined by cairo_stroke(), cairo_stroke_extents(), and
	 * cairo_stroke_to_path(), but does not have any effect during path
	 * construction.
	 * cr:
	 *  a cairo context, as a cairo_t
	 * line_cap:
	 *  a line cap style, as a cairo_line_cap_t
	 */
	public void setLineCap(cairo_line_cap_t lineCap)
	{
		// void cairo_set_line_cap (cairo_t *cr,  cairo_line_cap_t line_cap);
		cairo_set_line_cap(cairo, lineCap);
	}
	
	/**
	 * Gets the current line cap style, as set by cairo_set_line_cap().
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current line cap style.
	 */
	public cairo_line_cap_t getLineCap()
	{
		// cairo_line_cap_t cairo_get_line_cap (cairo_t *cr);
		return cairo_get_line_cap(cairo);
	}
	
	
	/**
	 * Sets the current line join style within the cairo context. See
	 * cairo_line_join_t for details about how the available line join
	 * styles are drawn.
	 * As with the other stroke parameters, the current line join style is
	 * examined by cairo_stroke(), cairo_stroke_extents(), and
	 * cairo_stroke_to_path(), but does not have any effect during path
	 * construction.
	 * cr:
	 *  a cairo context, as a cairo_t
	 * line_join:
	 *  a line joint style, as a cairo_line_join_t
	 */
	public void setLineJoin(cairo_line_join_t lineJoin)
	{
		// void cairo_set_line_join (cairo_t *cr,  cairo_line_join_t line_join);
		cairo_set_line_join(cairo, lineJoin);
	}
	
	/**
	 * Gets the current line join style, as set by cairo_set_line_join().
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current line join style.
	 */
	public cairo_line_join_t getLineJoin()
	{
		// cairo_line_join_t cairo_get_line_join (cairo_t *cr);
		return cairo_get_line_join(cairo);
	}
	
	/**
	 * Sets the current line width within the cairo context. The line
	 * width value specifies the diameter of a pen that is circular in
	 * user space, (though device-space pen may be an ellipse in general
	 * due to scaling/shear/rotation of the CTM).
	 * Note: When the description above refers to user space and CTM it
	 * refers to the user space and CTM in effect at the time of the
	 * stroking operation, not the user space and CTM in effect at the
	 * time of the call to cairo_set_line_width(). The simplest usage
	 * makes both of these spaces identical. That is, if there is no
	 * change to the CTM between a call to cairo_set_line_with() and the
	 * stroking operation, then one can just pass user-space values to
	 * cairo_set_line_width() and ignore this note.
	 * As with the other stroke parameters, the current line width is
	 * examined by cairo_stroke(), cairo_stroke_extents(), and
	 * cairo_stroke_to_path(), but does not have any effect during path
	 * construction.
	 * The default line width value is 2.0.
	 * cr:
	 *  a cairo_t
	 * width:
	 *  a line width
	 */
	public void setLineWidth(double width)
	{
		// void cairo_set_line_width (cairo_t *cr,  double width);
		cairo_set_line_width(cairo, width);
	}
	
	/**
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current line width value exactly as set by
	 * cairo_set_line_width(). Note that the value is unchanged even if
	 * the CTM has changed between the calls to cairo_set_line_width() and
	 * cairo_get_line_width().
	 */
	public double getLineWidth()
	{
		// double cairo_get_line_width (cairo_t *cr);
		return cairo_get_line_width(cairo);
	}
	
	/**
	 * cr:
	 * limit:
	 */
	public void setMiterLimit(double limit)
	{
		// void cairo_set_miter_limit (cairo_t *cr,  double limit);
		cairo_set_miter_limit(cairo, limit);
	}
	
	/**
	 * Gets the current miter limit, as set by cairo_set_miter_limit().
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current miter limit.
	 */
	public double getMiterLimit()
	{
		// double cairo_get_miter_limit (cairo_t *cr);
		return cairo_get_miter_limit(cairo);
	}
	
	
	/**
	 * Sets the compositing operator to be used for all drawing
	 * operations. See cairo_operator_t for details on the semantics of
	 * each available compositing operator.
	 * XXX: I'd also like to direct the reader's attention to some
	 * (not-yet-written) section on cairo's imaging model. How would I do
	 * that if such a section existed? (cworth).
	 * cr:
	 *  a cairo_t
	 * op:
	 *  a compositing operator, specified as a cairo_operator_t
	 */
	public void setOperator(cairo_operator_t op)
	{
		// void cairo_set_operator (cairo_t *cr,  cairo_operator_t op);
		cairo_set_operator(cairo, op);
	}
	
	/**
	 * Gets the current compositing operator for a cairo context.
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current compositing operator.
	 */
	public cairo_operator_t getOperator()
	{
		// cairo_operator_t cairo_get_operator (cairo_t *cr);
		return cairo_get_operator(cairo);
	}
	
	/**
	 * Sets the tolerance used when converting paths into trapezoids.
	 * Curved segments of the path will be subdivided until the maximum
	 * deviation between the original path and the polygonal approximation
	 * is less than tolerance. The default value is 0.1. A larger
	 * value will give better performance, a smaller value, better
	 * appearance. (Reducing the value from the default value of 0.1
	 * is unlikely to improve appearance significantly.)
	 * cr:
	 *  a cairo_t
	 * tolerance:
	 *  the tolerance, in device units (typically pixels)
	 */
	public void setTolerance(double tolerance)
	{
		// void cairo_set_tolerance (cairo_t *cr,  double tolerance);
		cairo_set_tolerance(cairo, tolerance);
	}
	
	/**
	 * Gets the current tolerance value, as set by cairo_set_tolerance().
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the current tolerance value.
	 */
	public double getTolerance()
	{
		// double cairo_get_tolerance (cairo_t *cr);
		return cairo_get_tolerance(cairo);
	}
	
	/**
	 * Establishes a new clip region by intersecting the current clip
	 * region with the current path as it would be filled by cairo_fill()
	 * and according to the current fill rule (see cairo_set_fill_rule()).
	 * After cairo_clip, the current path will be cleared from the cairo
	 * context.
	 * The current clip region affects all drawing operations by
	 * effectively masking out any changes to the surface that are outside
	 * the current clip region.
	 * Calling cairo_clip() can only make the clip region smaller, never
	 * larger. But the current clip is part of the graphics state, so a
	 * temporary restriction of the clip region can be achieved by
	 * calling cairo_clip() within a cairo_save()/cairo_restore()
	 * pair. The only other means of increasing the size of the clip
	 * region is cairo_reset_clip().
	 * cr:
	 *  a cairo context
	 */
	public void clip()
	{
		// void cairo_clip (cairo_t *cr);
		cairo_clip(cairo);
	}
	
	/**
	 * Establishes a new clip region by intersecting the current clip
	 * region with the current path as it would be filled by cairo_fill()
	 * and according to the current fill rule (see cairo_set_fill_rule()).
	 * Unlike cairo_clip(), cairo_clip_preserve preserves the path within
	 * the cairo context.
	 * The current clip region affects all drawing operations by
	 * effectively masking out any changes to the surface that are outside
	 * the current clip region.
	 * Calling cairo_clip() can only make the clip region smaller, never
	 * larger. But the current clip is part of the graphics state, so a
	 * temporary restriction of the clip region can be achieved by
	 * calling cairo_clip() within a cairo_save()/cairo_restore()
	 * pair. The only other means of increasing the size of the clip
	 * region is cairo_reset_clip().
	 * cr:
	 *  a cairo context
	 */
	public void clipPreserve()
	{
		// void cairo_clip_preserve (cairo_t *cr);
		cairo_clip_preserve(cairo);
	}
	
	/**
	 * Reset the current clip region to its original, unrestricted
	 * state. That is, set the clip region to an infinitely large shape
	 * containing the target surface. Equivalently, if infinity is too
	 * hard to grasp, one can imagine the clip region being reset to the
	 * exact bounds of the target surface.
	 * Note that code meant to be reusable should not call
	 * cairo_reset_clip() as it will cause results unexpected by
	 * higher-level code which calls cairo_clip(). Consider using
	 * cairo_save() and cairo_restore() around cairo_clip() as a more
	 * robust means of temporarily restricting the clip region.
	 * cr:
	 *  a cairo context
	 */
	public void resetClip()
	{
		// void cairo_reset_clip (cairo_t *cr);
		cairo_reset_clip(cairo);
	}
	
	/**
	 * A drawing operator that fills the current path according to the
	 * current fill rule, (each sub-path is implicitly closed before being
	 * filled). After cairo_fill, the current path will be cleared from
	 * the cairo context. See cairo_set_fill_rule() and
	 * cairo_fill_preserve().
	 * cr:
	 *  a cairo context
	 */
	public void fill()
	{
		// void cairo_fill (cairo_t *cr);
		cairo_fill(cairo);
	}
	
	/**
	 * A drawing operator that fills the current path according to the
	 * current fill rule, (each sub-path is implicitly closed before being
	 * filled). Unlike cairo_fill(), cairo_fill_preserve preserves the
	 * path within the cairo context.
	 * See cairo_set_fill_rule() and cairo_fill().
	 * cr:
	 *  a cairo context
	 */
	public void fillPreserve()
	{
		// void cairo_fill_preserve (cairo_t *cr);
		cairo_fill_preserve(cairo);
	}
	
	/**
	 * cr:
	 * x1:
	 * y1:
	 * x2:
	 * y2:
	 */
	public void fillExtents(double* x1, double* y1, double* x2, double* y2)
	{
		// void cairo_fill_extents (cairo_t *cr,  double *x1,  double *y1,  double *x2,  double *y2);
		cairo_fill_extents(cairo, x1, y1, x2, y2);
	}
	
	/**
	 * Tests whether the given point is inside the area that would be
	 * filled by doing a cairo_fill() operation on cr given the current
	 * path and filling parameters.
	 * See cairo_fill(), cairo_set_fill_rule() and cairo_fill_preserve().
	 * cr:
	 *  a cairo context
	 * x:
	 *  X coordinate of the point to test
	 * y:
	 *  Y coordinate of the point to test
	 * Returns:
	 *  A non-zero value if the point is inside, or zero if
	 * outside.
	 */
	public cairo_bool_t inFill(double x, double y)
	{
		// cairo_bool_t cairo_in_fill (cairo_t *cr,  double x,  double y);
		return cairo_in_fill(cairo, x, y);
	}
	
	/**
	 * A drawing operator that paints the current source
	 * using the alpha channel of pattern as a mask. (Opaque
	 * areas of pattern are painted with the source, transparent
	 * areas are not painted.)
	 * cr:
	 *  a cairo context
	 * pattern:
	 *  a cairo_pattern_t
	 */
	public void mask(cairo_pattern_t* pattern)
	{
		// void cairo_mask (cairo_t *cr,  cairo_pattern_t *pattern);
		cairo_mask(cairo, pattern);
	}
	
	/**
	 * A drawing operator that paints the current source
	 * using the alpha channel of surface as a mask. (Opaque
	 * areas of surface are painted with the source, transparent
	 * areas are not painted.)
	 * cr:
	 *  a cairo context
	 * surface:
	 *  a cairo_surface_t
	 * surface_x:
	 *  X coordinate at which to place the origin of surface
	 * surface_y:
	 *  Y coordinate at which to place the origin of surface
	 */
	public void maskSurface(Surface surface, double surfaceX, double surfaceY)
	{
		// void cairo_mask_surface (cairo_t *cr,  cairo_surface_t *surface,  double surface_x,  double surface_y);
		cairo_mask_surface(cairo, (surface is null) ? null : surface.getSurfaceStruct(), surfaceX, surfaceY);
	}
	
	/**
	 * A drawing operator that paints the current source everywhere within
	 * the current clip region.
	 * cr:
	 *  a cairo context
	 */
	public void paint()
	{
		// void cairo_paint (cairo_t *cr);
		cairo_paint(cairo);
	}
	
	/**
	 * A drawing operator that paints the current source everywhere within
	 * the current clip region using a mask of constant alpha value
	 * alpha. The effect is similar to cairo_paint(), but the drawing
	 * is faded out using the alpha value.
	 * cr:
	 *  a cairo context
	 * alpha:
	 *  alpha value, between 0 (transparent) and 1 (opaque)
	 */
	public void paintWithAlpha(double alpha)
	{
		// void cairo_paint_with_alpha (cairo_t *cr,  double alpha);
		cairo_paint_with_alpha(cairo, alpha);
	}
	
	/**
	 * A drawing operator that strokes the current path according to the
	 * current line width, line join, line cap, and dash settings. After
	 * cairo_stroke, the current path will be cleared from the cairo
	 * context. See cairo_set_line_width(), cairo_set_line_join(),
	 * cairo_set_line_cap(), cairo_set_dash(), and
	 * cairo_stroke_preserve().
	 * Note: Degenerate segments and sub-paths are treated specially and
	 * provide a useful result. These can result in two different
	 * situations:
	 * 1. Zero-length "on" segments set in cairo_set_dash(). If the cap
	 * style is CAIRO_LINE_CAP_ROUND or CAIRO_LINE_CAP_SQUARE then these
	 * segments will be drawn as circular dots or squares respectively. In
	 * the case of CAIRO_LINE_CAP_SQUARE, the orientation of the squares
	 * is determined by the direction of the underlying path.
	 * 2. A sub-path created by cairo_move_to() followed by either a
	 * cairo_close_path() or one or more calls to cairo_line_to() to the
	 * same coordinate as the cairo_move_to(). If the cap style is
	 * CAIRO_LINE_CAP_ROUND then these sub-paths will be drawn as circular
	 * dots. Note that in the case of CAIRO_LINE_CAP_SQUARE a degenerate
	 * sub-path will not be drawn at all, (since the correct orientation
	 * is indeterminate).
	 * In no case will a cap style of CAIRO_LINE_CAP_BUTT cause anything
	 * to be drawn in the case of either degenerate segments or sub-paths.
	 * cr:
	 *  a cairo context
	 */
	public void stroke()
	{
		// void cairo_stroke (cairo_t *cr);
		cairo_stroke(cairo);
	}
	
	/**
	 * A drawing operator that strokes the current path according to the
	 * current line width, line join, line cap, and dash settings. Unlike
	 * cairo_stroke(), cairo_stroke_preserve preserves the path within the
	 * cairo context.
	 * See cairo_set_line_width(), cairo_set_line_join(),
	 * cairo_set_line_cap(), cairo_set_dash(), and
	 * cairo_stroke_preserve().
	 * cr:
	 *  a cairo context
	 */
	public void strokePreserve()
	{
		// void cairo_stroke_preserve (cairo_t *cr);
		cairo_stroke_preserve(cairo);
	}
	
	/**
	 * cr:
	 * x1:
	 * y1:
	 * x2:
	 * y2:
	 */
	public void strokeExtents(double* x1, double* y1, double* x2, double* y2)
	{
		// void cairo_stroke_extents (cairo_t *cr,  double *x1,  double *y1,  double *x2,  double *y2);
		cairo_stroke_extents(cairo, x1, y1, x2, y2);
	}
	
	/**
	 * Tests whether the given point is inside the area that would be
	 * stroked by doing a cairo_stroke() operation on cr given the
	 * current path and stroking parameters.
	 * See cairo_stroke(), cairo_set_line_width(), cairo_set_line_join(),
	 * cairo_set_line_cap(), cairo_set_dash(), and
	 * cairo_stroke_preserve().
	 * cr:
	 *  a cairo context
	 * x:
	 *  X coordinate of the point to test
	 * y:
	 *  Y coordinate of the point to test
	 * Returns:
	 *  A non-zero value if the point is inside, or zero if
	 * outside.
	 */
	public cairo_bool_t inStroke(double x, double y)
	{
		// cairo_bool_t cairo_in_stroke (cairo_t *cr,  double x,  double y);
		return cairo_in_stroke(cairo, x, y);
	}
	
	/**
	 * Emits the current page for backends that support multiple pages, but
	 * doesn't clear it, so, the contents of the current page will be retained
	 * for the next page too. Use cairo_show_page() if you want to get an
	 * empty page after the emission.
	 * cr:
	 *  a cairo context
	 */
	public void copyPage()
	{
		// void cairo_copy_page (cairo_t *cr);
		cairo_copy_page(cairo);
	}
	
	/**
	 * Emits and clears the current page for backends that support multiple
	 * pages. Use cairo_copy_page() if you don't want to clear the page.
	 * cr:
	 *  a cairo context
	 */
	public void showPage()
	{
		// void cairo_show_page (cairo_t *cr);
		cairo_show_page(cairo);
	}
	
	
	
	
	/**
	 * Creates a copy of the current path and returns it to the user as a
	 * cairo_path_t. See cairo_path_data_t for hints on how to iterate
	 * over the returned data structure.
	 * This function will always return a valid pointer, but the result
	 * will have no data (data==NULL and
	 * num_data==0), if either of the following
	 * conditions hold:
	 * If there is insufficient memory to copy the path. In this
	 *  case path->status will be set to
	 *  CAIRO_STATUS_NO_MEMORY.
	 * If cr is already in an error state. In this case
	 *  path->status will contain the same status that
	 *  would be returned by cairo_status().
	 * In either case, path->status will be set to
	 * CAIRO_STATUS_NO_MEMORY (regardless of what the error status in
	 * cr might have been).
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the copy of the current path. The caller owns the
	 * returned object and should call cairo_path_destroy() when finished
	 * with it.
	 */
	public cairo_path_t* copyPath()
	{
		// cairo_path_t* cairo_copy_path (cairo_t *cr);
		return cairo_copy_path(cairo);
	}
	
	/**
	 * Gets a flattened copy of the current path and returns it to the
	 * user as a cairo_path_t. See cairo_path_data_t for hints on
	 * how to iterate over the returned data structure.
	 * This function is like cairo_copy_path() except that any curves
	 * in the path will be approximated with piecewise-linear
	 * approximations, (accurate to within the current tolerance
	 * value). That is, the result is guaranteed to not have any elements
	 * of type CAIRO_PATH_CURVE_TO which will instead be replaced by a
	 * series of CAIRO_PATH_LINE_TO elements.
	 * This function will always return a valid pointer, but the result
	 * will have no data (data==NULL and
	 * num_data==0), if either of the following
	 * conditions hold:
	 * If there is insufficient memory to copy the path. In this
	 *  case path->status will be set to
	 *  CAIRO_STATUS_NO_MEMORY.
	 * If cr is already in an error state. In this case
	 *  path->status will contain the same status that
	 *  would be returned by cairo_status().
	 * cr:
	 *  a cairo context
	 * Returns:
	 *  the copy of the current path. The caller owns the
	 * returned object and should call cairo_path_destroy() when finished
	 * with it.
	 */
	public cairo_path_t* copyPathFlat()
	{
		// cairo_path_t* cairo_copy_path_flat (cairo_t *cr);
		return cairo_copy_path_flat(cairo);
	}
	
	/**
	 * Immediately releases all memory associated with path. After a call
	 * to cairo_path_destroy() the path pointer is no longer valid and
	 * should not be used further.
	 * NOTE: cairo_path_destroy function should only be called with a
	 * pointer to a cairo_path_t returned by a cairo function. Any path
	 * that is created manually (ie. outside of cairo) should be destroyed
	 * manually as well.
	 * path:
	 *  a path previously returned by either cairo_copy_path() or
	 * cairo_copy_path_flat().
	 */
	public static void pathDestroy(cairo_path_t* path)
	{
		// void cairo_path_destroy (cairo_path_t *path);
		cairo_path_destroy(path);
	}
	
	/**
	 * Append the path onto the current path. The path may be either the
	 * return value from one of cairo_copy_path() or
	 * cairo_copy_path_flat() or it may be constructed manually. See
	 * cairo_path_t for details on how the path data structure should be
	 * initialized, and note that path->status must be
	 * initialized to CAIRO_STATUS_SUCCESS.
	 * cr:
	 *  a cairo context
	 * path:
	 *  path to be appended
	 */
	public void appendPath(cairo_path_t* path)
	{
		// void cairo_append_path (cairo_t *cr,  cairo_path_t *path);
		cairo_append_path(cairo, path);
	}
	
	/**
	 * Gets the current point of the current path, which is
	 * conceptually the final point reached by the path so far.
	 * The current point is returned in the user-space coordinate
	 * system. If there is no defined current point then x and y will
	 * both be set to 0.0.
	 * Most path construction functions alter the current point. See the
	 * following for details on how they affect the current point:
	 * cairo_new_path(), cairo_move_to(), cairo_line_to(),
	 * cairo_curve_to(), cairo_arc(), cairo_rel_move_to(),
	 * cairo_rel_line_to(), cairo_rel_curve_to(), cairo_arc(),
	 * cairo_text_path(), cairo_stroke_to_path()
	 * cr:
	 *  a cairo context
	 * x:
	 *  return value for X coordinate of the current point
	 * y:
	 *  return value for Y coordinate of the current point
	 */
	public void getCurrentPoint(double* x, double* y)
	{
		// void cairo_get_current_point (cairo_t *cr,  double *x,  double *y);
		cairo_get_current_point(cairo, x, y);
	}
	
	/**
	 * Clears the current path. After this call there will be no path and
	 * no current point.
	 * cr:
	 *  a cairo context
	 */
	public void newPath()
	{
		// void cairo_new_path (cairo_t *cr);
		cairo_new_path(cairo);
	}
	
	/**
	 * Begin a new sub-path. Note that the existing path is not
	 * affected. After this call there will be no current point.
	 * In many cases, this call is not needed since new sub-paths are
	 * frequently started with cairo_move_to().
	 * A call to cairo_new_sub_path() is particularly useful when
	 * beginning a new sub-path with one of the cairo_arc() calls. This
	 * makes things easier as it is no longer necessary to manually
	 * compute the arc's initial coordinates for a call to
	 * cairo_move_to().
	 * cr:
	 *  a cairo context
	 * Since 1.2
	 */
	public void newSubPath()
	{
		// void cairo_new_sub_path (cairo_t *cr);
		cairo_new_sub_path(cairo);
	}
	
	/**
	 * Adds a line segment to the path from the current point to the
	 * beginning of the current sub-path, (the most recent point passed to
	 * cairo_move_to()), and closes this sub-path. After this call the
	 * current point will be at the joined endpoint of the sub-path.
	 * The behavior of cairo_close_path() is distinct from simply calling
	 * cairo_line_to() with the equivalent coordinate in the case of
	 * stroking. When a closed sub-path is stroked, there are no caps on
	 * the ends of the sub-path. Instead, there is a line join connecting
	 * the final and initial segments of the sub-path.
	 * If there is no current point before the call to cairo_close_path,
	 * this function will have no effect.
	 * Note: As of cairo version 1.2.4 any call to cairo_close_path will
	 * place an explicit MOVE_TO element into the path immediately after
	 * the CLOSE_PATH element, (which can be seen in cairo_copy_path() for
	 * example). This can simplify path processing in some cases as it may
	 * not be necessary to save the "last move_to point" during processing
	 * as the MOVE_TO immediately after the CLOSE_PATH will provide that
	 * point.
	 * cr:
	 *  a cairo context
	 */
	public void closePath()
	{
		// void cairo_close_path (cairo_t *cr);
		cairo_close_path(cairo);
	}
	
	/**
	 * Adds a circular arc of the given radius to the current path. The
	 * arc is centered at (xc, yc), begins at angle1 and proceeds in
	 * the direction of increasing angles to end at angle2. If angle2 is
	 * less than angle1 it will be progressively increased by 2*M_PI
	 * until it is greater than angle1.
	 * If there is a current point, an initial line segment will be added
	 * to the path to connect the current point to the beginning of the
	 * arc.
	 * Angles are measured in radians. An angle of 0.0 is in the direction
	 * of the positive X axis (in user space). An angle of M_PI/2.0 radians
	 * (90 degrees) is in the direction of the positive Y axis (in
	 * user space). Angles increase in the direction from the positive X
	 * axis toward the positive Y axis. So with the default transformation
	 * matrix, angles increase in a clockwise direction.
	 * (To convert from degrees to radians, use degrees * (M_PI /
	 * 180.).)
	 * This function gives the arc in the direction of increasing angles;
	 * see cairo_arc_negative() to get the arc in the direction of
	 * decreasing angles.
	 * The arc is circular in user space. To achieve an elliptical arc,
	 * you can scale the current transformation matrix by different
	 * amounts in the X and Y directions. For example, to draw an ellipse
	 * in the box given by x, y, width, height:
	 * cairo_save (cr);
	 * cairo_translate (cr, x + width / 2., y + height / 2.);
	 * cairo_scale (cr, 1. / (height / 2.), 1. / (width / 2.));
	 * cairo_arc (cr, 0., 0., 1., 0., 2 * M_PI);
	 * cairo_restore (cr);
	 * cr:
	 *  a cairo context
	 * xc:
	 *  X position of the center of the arc
	 * yc:
	 *  Y position of the center of the arc
	 * radius:
	 *  the radius of the arc
	 * angle1:
	 *  the start angle, in radians
	 * angle2:
	 *  the end angle, in radians
	 */
	public void arc(double xc, double yc, double radius, double angle1, double angle2)
	{
		// void cairo_arc (cairo_t *cr,  double xc,  double yc,  double radius,  double angle1,  double angle2);
		cairo_arc(cairo, xc, yc, radius, angle1, angle2);
	}
	
	/**
	 * Adds a circular arc of the given radius to the current path. The
	 * arc is centered at (xc, yc), begins at angle1 and proceeds in
	 * the direction of decreasing angles to end at angle2. If angle2 is
	 * greater than angle1 it will be progressively decreased by 2*M_PI
	 * until it is greater than angle1.
	 * See cairo_arc() for more details. This function differs only in the
	 * direction of the arc between the two angles.
	 * cr:
	 *  a cairo context
	 * xc:
	 *  X position of the center of the arc
	 * yc:
	 *  Y position of the center of the arc
	 * radius:
	 *  the radius of the arc
	 * angle1:
	 *  the start angle, in radians
	 * angle2:
	 *  the end angle, in radians
	 */
	public void arcNegative(double xc, double yc, double radius, double angle1, double angle2)
	{
		// void cairo_arc_negative (cairo_t *cr,  double xc,  double yc,  double radius,  double angle1,  double angle2);
		cairo_arc_negative(cairo, xc, yc, radius, angle1, angle2);
	}
	
	/**
	 * Adds a cubic Bzier spline to the path from the current point to
	 * position (x3, y3) in user-space coordinates, using (x1, y1) and
	 * (x2, y2) as the control points. After this call the current point
	 * will be (x3, y3).
	 * If there is no current point before the call to cairo_curve_to()
	 * this function will behave as if preceded by a call to
	 * cairo_move_to (cr, x1, y1).
	 * cr:
	 *  a cairo context
	 * x1:
	 *  the X coordinate of the first control point
	 * y1:
	 *  the Y coordinate of the first control point
	 * x2:
	 *  the X coordinate of the second control point
	 * y2:
	 *  the Y coordinate of the second control point
	 * x3:
	 *  the X coordinate of the end of the curve
	 * y3:
	 *  the Y coordinate of the end of the curve
	 */
	public void curveTo(double x1, double y1, double x2, double y2, double x3, double y3)
	{
		// void cairo_curve_to (cairo_t *cr,  double x1,  double y1,  double x2,  double y2,  double x3,  double y3);
		cairo_curve_to(cairo, x1, y1, x2, y2, x3, y3);
	}
	
	/**
	 * Adds a line to the path from the current point to position (x, y)
	 * in user-space coordinates. After this call the current point
	 * will be (x, y).
	 * If there is no current point before the call to cairo_line_to()
	 * this function will behave as cairo_move_to (cr, x, y).
	 * cr:
	 *  a cairo context
	 * x:
	 *  the X coordinate of the end of the new line
	 * y:
	 *  the Y coordinate of the end of the new line
	 */
	public void lineTo(double x, double y)
	{
		// void cairo_line_to (cairo_t *cr,  double x,  double y);
		cairo_line_to(cairo, x, y);
	}
	
	/**
	 * Begin a new sub-path. After this call the current point will be (x,
	 * y).
	 * cr:
	 *  a cairo context
	 * x:
	 *  the X coordinate of the new position
	 * y:
	 *  the Y coordinate of the new position
	 */
	public void moveTo(double x, double y)
	{
		// void cairo_move_to (cairo_t *cr,  double x,  double y);
		cairo_move_to(cairo, x, y);
	}
	
	/**
	 * Adds a closed sub-path rectangle of the given size to the current
	 * path at position (x, y) in user-space coordinates.
	 * This function is logically equivalent to:
	 * cairo_move_to (cr, x, y);
	 * cairo_rel_line_to (cr, width, 0);
	 * cairo_rel_line_to (cr, 0, height);
	 * cairo_rel_line_to (cr, -width, 0);
	 * cairo_close_path (cr);
	 * cr:
	 *  a cairo context
	 * x:
	 *  the X coordinate of the top left corner of the rectangle
	 * y:
	 *  the Y coordinate to the top left corner of the rectangle
	 * width:
	 *  the width of the rectangle
	 * height:
	 *  the height of the rectangle
	 */
	public void rectangle(double x, double y, double width, double height)
	{
		// void cairo_rectangle (cairo_t *cr,  double x,  double y,  double width,  double height);
		cairo_rectangle(cairo, x, y, width, height);
	}
	
	/**
	 * cr:
	 * glyphs:
	 * num_glyphs:
	 */
	public void glyphPath(cairo_glyph_t* glyphs, int numGlyphs)
	{
		// void cairo_glyph_path (cairo_t *cr,  cairo_glyph_t *glyphs,  int num_glyphs);
		cairo_glyph_path(cairo, glyphs, numGlyphs);
	}
	
	/**
	 * cr:
	 * utf8:
	 */
	public void textPath(char[] utf8)
	{
		// void cairo_text_path (cairo_t *cr,  const char *utf8);
		cairo_text_path(cairo, Str.toStringz(utf8));
	}
	
	/**
	 * Relative-coordinate version of cairo_curve_to(). All offsets are
	 * relative to the current point. Adds a cubic Bzier spline to the
	 * path from the current point to a point offset from the current
	 * point by (dx3, dy3), using points offset by (dx1, dy1) and
	 * (dx2, dy2) as the control points. After this call the current
	 * point will be offset by (dx3, dy3).
	 * Given a current point of (x, y), cairo_rel_curve_to (cr, dx1,
	 * dy1, dx2, dy2, dx3, dy3) is logically equivalent to
	 * cairo_curve_to (cr, x + dx1, y + dy1, x + dx2, y + dy2, x +
	 * dx3, y + dy3).
	 * It is an error to call this function with no current point. Doing
	 * so will cause cr to shutdown with a status of
	 * CAIRO_STATUS_NO_CURRENT_POINT.
	 * cr:
	 *  a cairo context
	 * dx1:
	 *  the X offset to the first control point
	 * dy1:
	 *  the Y offset to the first control point
	 * dx2:
	 *  the X offset to the second control point
	 * dy2:
	 *  the Y offset to the second control point
	 * dx3:
	 *  the X offset to the end of the curve
	 * dy3:
	 *  the Y offset to the end of the curve
	 */
	public void relCurveTo(double dx1, double dy1, double dx2, double dy2, double dx3, double dy3)
	{
		// void cairo_rel_curve_to (cairo_t *cr,  double dx1,  double dy1,  double dx2,  double dy2,  double dx3,  double dy3);
		cairo_rel_curve_to(cairo, dx1, dy1, dx2, dy2, dx3, dy3);
	}
	
	/**
	 * Relative-coordinate version of cairo_line_to(). Adds a line to the
	 * path from the current point to a point that is offset from the
	 * current point by (dx, dy) in user space. After this call the
	 * current point will be offset by (dx, dy).
	 * Given a current point of (x, y), cairo_rel_line_to(cr, dx, dy)
	 * is logically equivalent to cairo_line_to (cr, x + dx, y + dy).
	 * It is an error to call this function with no current point. Doing
	 * so will cause cr to shutdown with a status of
	 * CAIRO_STATUS_NO_CURRENT_POINT.
	 * cr:
	 *  a cairo context
	 * dx:
	 *  the X offset to the end of the new line
	 * dy:
	 *  the Y offset to the end of the new line
	 */
	public void relLineTo(double dx, double dy)
	{
		// void cairo_rel_line_to (cairo_t *cr,  double dx,  double dy);
		cairo_rel_line_to(cairo, dx, dy);
	}
	
	/**
	 * Begin a new sub-path. After this call the current point will offset
	 * by (x, y).
	 * Given a current point of (x, y), cairo_rel_move_to(cr, dx, dy)
	 * is logically equivalent to cairo_move_to (cr, x + dx, y + dy).
	 * It is an error to call this function with no current point. Doing
	 * so will cause cr to shutdown with a status of
	 * CAIRO_STATUS_NO_CURRENT_POINT.
	 * cr:
	 *  a cairo context
	 * dx:
	 *  the X offset
	 * dy:
	 *  the Y offset
	 */
	public void relMoveTo(double dx, double dy)
	{
		// void cairo_rel_move_to (cairo_t *cr,  double dx,  double dy);
		cairo_rel_move_to(cairo, dx, dy);
	}
	
	/**
	 * Modifies the current transformation matrix (CTM) by translating the
	 * user-space origin by (tx, ty). This offset is interpreted as a
	 * user-space coordinate according to the CTM in place before the new
	 * call to cairo_translate. In other words, the translation of the
	 * user-space origin takes place after any existing transformation.
	 * cr:
	 *  a cairo context
	 * tx:
	 *  amount to translate in the X direction
	 * ty:
	 *  amount to translate in the Y direction
	 */
	public void translate(double tx, double ty)
	{
		// void cairo_translate (cairo_t *cr,  double tx,  double ty);
		cairo_translate(cairo, tx, ty);
	}
	
	/**
	 * Modifies the current transformation matrix (CTM) by scaling the X
	 * and Y user-space axes by sx and sy respectively. The scaling of
	 * the axes takes place after any existing transformation of user
	 * space.
	 * cr:
	 *  a cairo context
	 * sx:
	 *  scale factor for the X dimension
	 * sy:
	 *  scale factor for the Y dimension
	 */
	public void scale(double sx, double sy)
	{
		// void cairo_scale (cairo_t *cr,  double sx,  double sy);
		cairo_scale(cairo, sx, sy);
	}
	
	/**
	 * Modifies the current transformation matrix (CTM) by rotating the
	 * user-space axes by angle radians. The rotation of the axes takes
	 * places after any existing transformation of user space. The
	 * rotation direction for positive angles is from the positive X axis
	 * toward the positive Y axis.
	 * cr:
	 *  a cairo context
	 * angle:
	 *  angle (in radians) by which the user-space axes will be
	 * rotated
	 */
	public void rotate(double angle)
	{
		// void cairo_rotate (cairo_t *cr,  double angle);
		cairo_rotate(cairo, angle);
	}
	
	/**
	 * Modifies the current transformation matrix (CTM) by applying
	 * matrix as an additional transformation. The new transformation of
	 * user space takes place after any existing transformation.
	 * cr:
	 *  a cairo context
	 * matrix:
	 *  a transformation to be applied to the user-space axes
	 */
	public void transform(cairo_matrix_t* matrix)
	{
		// void cairo_transform (cairo_t *cr,  const cairo_matrix_t *matrix);
		cairo_transform(cairo, matrix);
	}
	
	/**
	 * Modifies the current transformation matrix (CTM) by setting it
	 * equal to matrix.
	 * cr:
	 *  a cairo context
	 * matrix:
	 *  a transformation matrix from user space to device space
	 */
	public void setMatrix(cairo_matrix_t* matrix)
	{
		// void cairo_set_matrix (cairo_t *cr,  const cairo_matrix_t *matrix);
		cairo_set_matrix(cairo, matrix);
	}
	
	/**
	 * Stores the current transformation matrix (CTM) into matrix.
	 * cr:
	 *  a cairo context
	 * matrix:
	 *  return value for the matrix
	 */
	public void getMatrix(cairo_matrix_t* matrix)
	{
		// void cairo_get_matrix (cairo_t *cr,  cairo_matrix_t *matrix);
		cairo_get_matrix(cairo, matrix);
	}
	
	/**
	 * Resets the current transformation matrix (CTM) by setting it equal
	 * to the identity matrix. That is, the user-space and device-space
	 * axes will be aligned and one user-space unit will transform to one
	 * device-space unit.
	 * cr:
	 *  a cairo context
	 */
	public void identityMatrix()
	{
		// void cairo_identity_matrix (cairo_t *cr);
		cairo_identity_matrix(cairo);
	}
	
	/**
	 * Transform a coordinate from user space to device space by
	 * multiplying the given point by the current transformation matrix
	 * (CTM).
	 * cr:
	 *  a cairo context
	 * x:
	 *  X value of coordinate (in/out parameter)
	 * y:
	 *  Y value of coordinate (in/out parameter)
	 */
	public void userToDevice(double* x, double* y)
	{
		// void cairo_user_to_device (cairo_t *cr,  double *x,  double *y);
		cairo_user_to_device(cairo, x, y);
	}
	
	/**
	 * Transform a distance vector from user space to device space. This
	 * function is similar to cairo_user_to_device() except that the
	 * translation components of the CTM will be ignored when transforming
	 * (dx,dy).
	 * cr:
	 *  a cairo context
	 * dx:
	 *  X component of a distance vector (in/out parameter)
	 * dy:
	 *  Y component of a distance vector (in/out parameter)
	 */
	public void userToDeviceDistance(double* dx, double* dy)
	{
		// void cairo_user_to_device_distance (cairo_t *cr,  double *dx,  double *dy);
		cairo_user_to_device_distance(cairo, dx, dy);
	}
	
	/**
	 * Transform a coordinate from device space to user space by
	 * multiplying the given point by the inverse of the current
	 * transformation matrix (CTM).
	 * cr:
	 *  a cairo
	 * x:
	 *  X value of coordinate (in/out parameter)
	 * y:
	 *  Y value of coordinate (in/out parameter)
	 */
	public void deviceToUser(double* x, double* y)
	{
		// void cairo_device_to_user (cairo_t *cr,  double *x,  double *y);
		cairo_device_to_user(cairo, x, y);
	}
	
	/**
	 * Transform a distance vector from device space to user space. This
	 * function is similar to cairo_device_to_user() except that the
	 * translation components of the inverse CTM will be ignored when
	 * transforming (dx,dy).
	 * cr:
	 *  a cairo context
	 * dx:
	 *  X component of a distance vector (in/out parameter)
	 * dy:
	 *  Y component of a distance vector (in/out parameter)
	 */
	public void deviceToUserDistance(double* dx, double* dy)
	{
		// void cairo_device_to_user_distance (cairo_t *cr,  double *dx,  double *dy);
		cairo_device_to_user_distance(cairo, dx, dy);
	}
	
	
	
	
	/**
	 * Selects a family and style of font from a simplified description as
	 * a family name, slant and weight. This function is meant to be used
	 * only for applications with simple font needs: Cairo doesn't provide
	 * for operations such as listing all available fonts on the system,
	 * and it is expected that most applications will need to use a more
	 * comprehensive font handling and text layout library in addition to
	 * cairo.
	 * cr:
	 *  a cairo_t
	 * family:
	 *  a font family name, encoded in UTF-8
	 * slant:
	 *  the slant for the font
	 * weight:
	 *  the weight for the font
	 */
	public void selectFontFace(char[] family, cairo_font_slant_t slant, cairo_font_weight_t weight)
	{
		// void cairo_select_font_face (cairo_t *cr,  const char *family,  cairo_font_slant_t slant,  cairo_font_weight_t weight);
		cairo_select_font_face(cairo, Str.toStringz(family), slant, weight);
	}
	
	/**
	 * Sets the current font matrix to a scale by a factor of size, replacing
	 * any font matrix previously set with cairo_set_font_size() or
	 * cairo_set_font_matrix(). This results in a font size of size user space
	 * units. (More precisely, this matrix will result in the font's
	 * em-square being a size by size square in user space.)
	 * cr:
	 *  a cairo_t
	 * size:
	 *  the new font size, in user space units
	 */
	public void setFontSize(double size)
	{
		// void cairo_set_font_size (cairo_t *cr,  double size);
		cairo_set_font_size(cairo, size);
	}
	
	/**
	 * Sets the current font matrix to matrix. The font matrix gives a
	 * transformation from the design space of the font (in this space,
	 * the em-square is 1 unit by 1 unit) to user space. Normally, a
	 * simple scale is used (see cairo_set_font_size()), but a more
	 * complex font matrix can be used to shear the font
	 * or stretch it unequally along the two axes
	 * cr:
	 *  a cairo_t
	 * matrix:
	 *  a cairo_matrix_t describing a transform to be applied to
	 * the current font.
	 */
	public void setFontMatrix(cairo_matrix_t* matrix)
	{
		// void cairo_set_font_matrix (cairo_t *cr,  const cairo_matrix_t *matrix);
		cairo_set_font_matrix(cairo, matrix);
	}
	
	/**
	 * Stores the current font matrix into matrix. See
	 * cairo_set_font_matrix().
	 * cr:
	 *  a cairo_t
	 * matrix:
	 *  return value for the matrix
	 */
	public void getFontMatrix(cairo_matrix_t* matrix)
	{
		// void cairo_get_font_matrix (cairo_t *cr,  cairo_matrix_t *matrix);
		cairo_get_font_matrix(cairo, matrix);
	}
	
	/**
	 * Sets a set of custom font rendering options for the cairo_t.
	 * Rendering options are derived by merging these options with the
	 * options derived from underlying surface; if the value in options
	 * has a default value (like CAIRO_ANTIALIAS_DEFAULT), then the value
	 * from the surface is used.
	 * cr:
	 *  a cairo_t
	 * options:
	 *  font options to use
	 */
	public void setFontOptions(cairo_font_options_t* options)
	{
		// void cairo_set_font_options (cairo_t *cr,  const cairo_font_options_t *options);
		cairo_set_font_options(cairo, options);
	}
	
	/**
	 * Retrieves font rendering options set via cairo_set_font_options.
	 * Note that the returned options do not include any options derived
	 * from the underlying surface; they are literally the options
	 * passed to cairo_set_font_options().
	 * cr:
	 *  a cairo_t
	 * options:
	 *  a cairo_font_options_t object into which to store
	 *  the retrieved options. All existing values are overwritten
	 */
	public void getFontOptions(cairo_font_options_t* options)
	{
		// void cairo_get_font_options (cairo_t *cr,  cairo_font_options_t *options);
		cairo_get_font_options(cairo, options);
	}
	
	/**
	 * A drawing operator that generates the shape from a string of UTF-8
	 * characters, rendered according to the current font_face, font_size
	 * (font_matrix), and font_options.
	 * This function first computes a set of glyphs for the string of
	 * text. The first glyph is placed so that its origin is at the
	 * current point. The origin of each subsequent glyph is offset from
	 * that of the previous glyph by the advance values of the previous
	 * glyph.
	 * After this call the current point is moved to the origin of where
	 * the next glyph would be placed in this same progression. That is,
	 * the current point will be at the origin of the final glyph offset
	 * by its advance values. This allows for easy display of a single
	 * logical string with multiple calls to cairo_show_text().
	 * NOTE: The cairo_show_text() function call is part of what the cairo
	 * designers call the "toy" text API. It is convenient for short demos
	 * and simple programs, but it is not expected to be adequate for the
	 * most serious of text-using applications. See cairo_show_glyphs()
	 * for the "real" text display API in cairo.
	 * cr:
	 *  a cairo context
	 * utf8:
	 *  a string of text encoded in UTF-8
	 */
	public void showText(char[] utf8)
	{
		// void cairo_show_text (cairo_t *cr,  const char *utf8);
		cairo_show_text(cairo, Str.toStringz(utf8));
	}
	
	/**
	 * cr:
	 * glyphs:
	 * num_glyphs:
	 */
	public void showGlyphs(cairo_glyph_t* glyphs, int numGlyphs)
	{
		// void cairo_show_glyphs (cairo_t *cr,  cairo_glyph_t *glyphs,  int num_glyphs);
		cairo_show_glyphs(cairo, glyphs, numGlyphs);
	}
	
	/**
	 * Gets the current font face for a cairo_t.
	 * cr:
	 *  a cairo_t
	 * Returns:
	 *  the current font object. Can return NULL
	 *  on out-of-memory or if the context is already in
	 *  an error state. This object is owned by cairo. To keep
	 *  a reference to it, you must call cairo_font_face_reference().
	 */
	public cairo_font_face_t* getFontFace()
	{
		// cairo_font_face_t* cairo_get_font_face (cairo_t *cr);
		return cairo_get_font_face(cairo);
	}
	
	/**
	 * Gets the font extents for the currently selected font.
	 * cr:
	 *  a cairo_t
	 * extents:
	 *  a cairo_font_extents_t object into which the results
	 * will be stored.
	 */
	public void fontExtents(cairo_font_extents_t* extents)
	{
		// void cairo_font_extents (cairo_t *cr,  cairo_font_extents_t *extents);
		cairo_font_extents(cairo, extents);
	}
	
	/**
	 * Replaces the current cairo_font_face_t object in the cairo_t with
	 * font_face. The replaced font face in the cairo_t will be
	 * destroyed if there are no other references to it.
	 * cr:
	 *  a cairo_t
	 * font_face:
	 *  a cairo_font_face_t, or NULL to restore to the default font
	 */
	public void setFontFace(cairo_font_face_t* fontFace)
	{
		// void cairo_set_font_face (cairo_t *cr,  cairo_font_face_t *font_face);
		cairo_set_font_face(cairo, fontFace);
	}
	
	/**
	 * Replaces the current font face, font matrix, and font options in
	 * the cairo_t with those of the cairo_scaled_font_t. Except for
	 * some translation, the current CTM of the cairo_t should be the
	 * same as that of the cairo_scaled_font_t, which can be accessed
	 * using cairo_scaled_font_get_ctm().
	 * cr:
	 *  a cairo_t
	 * scaled_font:
	 *  a cairo_scaled_font_t
	 * Since 1.2
	 */
	public void setScaledFont(cairo_scaled_font_t* scaledFont)
	{
		// void cairo_set_scaled_font (cairo_t *cr,  const cairo_scaled_font_t *scaled_font);
		cairo_set_scaled_font(cairo, scaledFont);
	}
	
	/**
	 * Gets the extents for a string of text. The extents describe a
	 * user-space rectangle that encloses the "inked" portion of the text,
	 * (as it would be drawn by cairo_show_text()). Additionally, the
	 * x_advance and y_advance values indicate the amount by which the
	 * current point would be advanced by cairo_show_text().
	 * Note that whitespace characters do not directly contribute to the
	 * size of the rectangle (extents.width and extents.height). They do
	 * contribute indirectly by changing the position of non-whitespace
	 * characters. In particular, trailing whitespace characters are
	 * likely to not affect the size of the rectangle, though they will
	 * affect the x_advance and y_advance values.
	 * cr:
	 *  a cairo_t
	 * utf8:
	 *  a string of text, encoded in UTF-8
	 * extents:
	 *  a cairo_text_extents_t object into which the results
	 * will be stored
	 */
	public void textExtents(char[] utf8, cairo_text_extents_t* extents)
	{
		// void cairo_text_extents (cairo_t *cr,  const char *utf8,  cairo_text_extents_t *extents);
		cairo_text_extents(cairo, Str.toStringz(utf8), extents);
	}
	
	/**
	 * Gets the extents for an array of glyphs. The extents describe a
	 * user-space rectangle that encloses the "inked" portion of the
	 * glyphs, (as they would be drawn by cairo_show_glyphs()).
	 * Additionally, the x_advance and y_advance values indicate the
	 * amount by which the current point would be advanced by
	 * cairo_show_glyphs.
	 * Note that whitespace glyphs do not contribute to the size of the
	 * rectangle (extents.width and extents.height).
	 * cr:
	 *  a cairo_t
	 * glyphs:
	 *  an array of cairo_glyph_t objects
	 * num_glyphs:
	 *  the number of elements in glyphs
	 * extents:
	 *  a cairo_text_extents_t object into which the results
	 * will be stored
	 */
	public void glyphExtents(cairo_glyph_t* glyphs, int numGlyphs, cairo_text_extents_t* extents)
	{
		// void cairo_glyph_extents (cairo_t *cr,  cairo_glyph_t *glyphs,  int num_glyphs,  cairo_text_extents_t *extents);
		cairo_glyph_extents(cairo, glyphs, numGlyphs, extents);
	}
}

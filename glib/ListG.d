/*
 * This file is part of duit.
 *
 * duit is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * duit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with duit; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * outPack = glib
 * outFile = ListG
 * strct   = GList
 * clss    = ListG
 * prefixes:
 * 	- g_list_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * structWrap:
 * 	- GList* -> ListG
 * local aliases:
 */

module glib.ListG;

private import glib.typedefs;

private import lib.glib;


/**
 * Description
 * The GList structure and its associated functions provide a standard
 * doubly-linked list data structure.
 * Each element in the list contains a piece of data, together with pointers
 * which link to the previous and next elements in the list.
 * Using these pointers it is possible to move through the list in both
 * directions (unlike the
 * Singly-Linked Lists
 * which only allows movement through the list in the forward direction).
 * The data contained in each element can be either integer values, by using one
 * of the
 * Type Conversion Macros,
 * or simply pointers to any type of data.
 * List elements are allocated from the slice
 * allocator, which is more efficient than allocating elements
 * individually.
 * Note that most of the GList functions expect to be passed a pointer to
 * the first element in the list. The functions which insert elements return
 * the new start of the list, which may have changed.
 * There is no function to create a GList. NULL is considered to be the empty
 * list so you simply set a GList* to NULL.
 * To add elements, use g_list_append(), g_list_prepend(), g_list_insert()
 * and g_list_insert_sorted().
 * To remove elements, use g_list_remove().
 * To find elements in the list use g_list_first(), g_list_last(), g_list_next(),
 * g_list_previous(), g_list_nth(), g_list_nth_data(), g_list_find() and
 * g_list_find_custom().
 * To find the index of an element use g_list_position() and g_list_index().
 * To call a function for each element in the list use g_list_foreach().
 * To free the entire list, use g_list_free().
 */
public class ListG
{
	
	/** the main Gtk struct */
	protected GList* gList;
	
	
	public GList* getListGStruct()
	{
		return gList;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gList;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GList* gList)
	{
		this.gList = gList;
	}
	
	/**
	 */
	
	
	/**
	 * Adds a new element on to the end of the list.
	 * Note
	 * The return value is the new start of the list, which may have changed, so
	 * make sure you store the new value.
	 * Note
	 * Note that g_list_append() has to traverse the entire list to find the end,
	 * which is inefficient when adding multiple elements. A common idiom to
	 * avoid the inefficiency is to prepend the elements and reverse the list
	 * when all elements have been added.
	 *  /+* Notice that these are initialized to the empty list. +/
	 *  GList *list = NULL, *number_list = NULL;
	 *  /+* This is a list of strings. +/
	 *  list = g_list_append (list, "first");
	 *  list = g_list_append (list, "second");
	 *  /+* This is a list of integers. +/
	 *  number_list = g_list_append (number_list, GINT_TO_POINTER (27));
	 *  number_list = g_list_append (number_list, GINT_TO_POINTER (14));
	 * list:
	 * a pointer to a GList.
	 * data:
	 * the data for the new element.
	 * Returns:
	 * the new start of the GList.
	 */
	public ListG append(void* data)
	{
		// GList* g_list_append (GList *list,  gpointer data);
		return new ListG( g_list_append(gList, data) );
	}
	
	/**
	 * Adds a new element on to the start of the list.
	 * Note
	 * The return value is the new start of the list, which may have changed, so
	 * make sure you store the new value.
	 *  /+* Notice that it is initialized to the empty list. +/
	 *  GList *list = NULL;
	 *  list = g_list_prepend (list, "last");
	 *  list = g_list_prepend (list, "first");
	 * list:
	 * a pointer to a GList.
	 * data:
	 * the data for the new element.
	 * Returns:
	 * the new start of the GList.
	 */
	public ListG prepend(void* data)
	{
		// GList* g_list_prepend (GList *list,  gpointer data);
		return new ListG( g_list_prepend(gList, data) );
	}
	
	/**
	 * Inserts a new element into the list at the given position.
	 * list:
	 * a pointer to a GList.
	 * data:
	 * the data for the new element.
	 * position:
	 * the position to insert the element. If this is negative, or is
	 * larger than the number of elements in the list, the new element is added on
	 * to the end of the list.
	 * Returns:
	 * the new start of the GList.
	 */
	public ListG insert(void* data, int position)
	{
		// GList* g_list_insert (GList *list,  gpointer data,  gint position);
		return new ListG( g_list_insert(gList, data, position) );
	}
	
	/**
	 * Inserts a new element into the list before the given position.
	 * list:
	 * a pointer to a GList.
	 * sibling:
	 * the list element before which the new element is inserted
	 *  or NULL to insert at the end of the list.
	 * data:
	 * the data for the new element.
	 * Returns:
	 * the new start of the GList.
	 */
	public ListG insertBefore(ListG sibling, void* data)
	{
		// GList* g_list_insert_before (GList *list,  GList *sibling,  gpointer data);
		return new ListG( g_list_insert_before(gList, sibling.getListGStruct(), data) );
	}
	
	/**
	 * Inserts a new element into the list, using the given comparison function
	 * to determine its position.
	 * list:
	 * a pointer to a GList.
	 * data:
	 * the data for the new element.
	 * func:
	 * the function to compare elements in the list. It should return a
	 * number > 0 if the first parameter comes after the second parameter in
	 * the sort order.
	 * Returns:
	 * the new start of the GList.
	 */
	public ListG insertSorted(void* data, GCompareFunc func)
	{
		// GList* g_list_insert_sorted (GList *list,  gpointer data,  GCompareFunc func);
		return new ListG( g_list_insert_sorted(gList, data, func) );
	}
	
	/**
	 * Removes an element from a GList.
	 * If two elements contain the same data, only the first is removed.
	 * If none of the elements contain the data, the GList is unchanged.
	 * list:
	 * a GList.
	 * data:
	 * the data of the element to remove.
	 * Returns:
	 * the new start of the GList.
	 */
	public ListG remove(void* data)
	{
		// GList* g_list_remove (GList *list,  gconstpointer data);
		return new ListG( g_list_remove(gList, data) );
	}
	
	/**
	 * Removes an element from a GList, without freeing the element.
	 * The removed element's prev and next links are set to NULL, so that it becomes a
	 * self-contained list with one element.
	 * list:
	 * a GList.
	 * llink:
	 * an element in the GList.
	 * Returns:
	 * the new start of the GList, without the element.
	 */
	public ListG removeLink(ListG llink)
	{
		// GList* g_list_remove_link (GList *list,  GList *llink);
		return new ListG( g_list_remove_link(gList, llink.getListGStruct()) );
	}
	
	/**
	 * Deletes the node link_ from list.
	 * list:
	 * a GList.
	 * link_:
	 * node to delete from list.
	 * Returns:
	 * the new head of list.
	 */
	public ListG deleteLink(ListG link)
	{
		// GList* g_list_delete_link (GList *list,  GList *link_);
		return new ListG( g_list_delete_link(gList, link.getListGStruct()) );
	}
	
	/**
	 * Removes all list nodes with data equal to data. Returns the new
	 * head of the list. Contrast with g_list_remove() which removes only
	 * the first node matching the given data.
	 * list:
	 * a GList.
	 * data:
	 * data to remove.
	 * Returns:
	 * new head of list.
	 */
	public ListG removeAll(void* data)
	{
		// GList* g_list_remove_all (GList *list,  gconstpointer data);
		return new ListG( g_list_remove_all(gList, data) );
	}
	
	/**
	 * Frees all of the memory used by a GList.
	 * The freed elements are returned to the slice allocator.
	 * Note
	 * If list elements contain dynamically-allocated memory, they should be freed
	 * first.
	 * list:
	 * a GList.
	 */
	public void free()
	{
		// void g_list_free (GList *list);
		g_list_free(gList);
	}
	
	/**
	 * Allocates space for one GList element.
	 * It is called by g_list_append(), g_list_prepend(), g_list_insert() and
	 * g_list_insert_sorted() and so is rarely used on its own.
	 * Returns:
	 * a pointer to the newly-allocated GList element.
	 */
	public static ListG alloc()
	{
		// GList* g_list_alloc (void);
		return new ListG( g_list_alloc() );
	}
	
	/**
	 * Frees one GList element.
	 * It is usually used after g_list_remove_link().
	 * list:
	 * a GList element.
	 */
	public void free1()
	{
		// void g_list_free_1 (GList *list);
		g_list_free_1(gList);
	}
	
	
	/**
	 * Gets the number of elements in a GList.
	 * list:
	 * a GList.
	 * Returns:
	 * the number of elements in the GList.
	 */
	public uint length()
	{
		// guint g_list_length (GList *list);
		return g_list_length(gList);
	}
	
	/**
	 * Copies a GList.
	 * Note that this is a "shallow" copy. If the list elements consist of pointers
	 * to data, the pointers are copied but the actual data isn't.
	 * list:
	 * a GList.
	 * Returns:
	 * a copy of list.
	 */
	public ListG copy()
	{
		// GList* g_list_copy (GList *list);
		return new ListG( g_list_copy(gList) );
	}
	
	/**
	 * Reverses a GList.
	 * It simply switches the next and prev pointers of each element.
	 * list:
	 * a GList.
	 * Returns:
	 * the start of the reversed GList.
	 */
	public ListG reverse()
	{
		// GList* g_list_reverse (GList *list);
		return new ListG( g_list_reverse(gList) );
	}
	
	/**
	 * Sorts a GList using the given comparison function.
	 * list:
	 * a GList.
	 * compare_func:
	 * the comparison function used to sort the GList.
	 * This function is passed the data from 2 elements of the GList and should
	 * return 0 if they are equal, a negative value if the first element
	 * comes before the second, or a positive value if the first element
	 * comes after the second.
	 * Returns:
	 * the start of the sorted GList.
	 */
	public ListG sort(GCompareFunc compareFunc)
	{
		// GList* g_list_sort (GList *list,  GCompareFunc compare_func);
		return new ListG( g_list_sort(gList, compareFunc) );
	}
	
	
	/**
	 * Inserts a new element into the list, using the given comparison function
	 * to determine its position.
	 * list:
	 * a pointer to a GList.
	 * data:
	 * the data for the new element.
	 * func:
	 * the function to compare elements in the list. It should return a
	 * number > 0 if the first parameter comes after the second parameter in
	 * the sort order.
	 * user_data:
	 * user data to pass to comparison function.
	 * Returns:
	 * the new start of the GList.
	 * Since 2.10
	 */
	public ListG insertSortedWithData(void* data, GCompareDataFunc func, void* userData)
	{
		// GList* g_list_insert_sorted_with_data (GList *list,  gpointer data,  GCompareDataFunc func,  gpointer user_data);
		return new ListG( g_list_insert_sorted_with_data(gList, data, func, userData) );
	}
	
	/**
	 * Like g_list_sort(), but the comparison function accepts a user data argument.
	 * list:
	 * a GList.
	 * compare_func:
	 * comparison function.
	 * user_data:
	 * user data to pass to comparison function.
	 * Returns:
	 * the new head of list.
	 */
	public ListG sortWithData(GCompareDataFunc compareFunc, void* userData)
	{
		// GList* g_list_sort_with_data (GList *list,  GCompareDataFunc compare_func,  gpointer user_data);
		return new ListG( g_list_sort_with_data(gList, compareFunc, userData) );
	}
	
	
	/**
	 * Adds the second GList onto the end of the first GList.
	 * Note that the elements of the second GList are not copied.
	 * They are used directly.
	 * list1:
	 * a GList.
	 * list2:
	 * the GList to add to the end of the first GList.
	 * Returns:
	 * the start of the new GList.
	 */
	public ListG concat(ListG list2)
	{
		// GList* g_list_concat (GList *list1,  GList *list2);
		return new ListG( g_list_concat(gList, list2.getListGStruct()) );
	}
	
	/**
	 * Calls a function for each element of a GList.
	 * list:
	 * a GList.
	 * func:
	 * the function to call with each element's data.
	 * user_data:
	 * user data to pass to the function.
	 */
	public void foreac(GFunc func, void* userData)
	{
		// void g_list_foreach (GList *list,  GFunc func,  gpointer user_data);
		g_list_foreach(gList, func, userData);
	}
	
	
	/**
	 * Gets the first element in a GList.
	 * list:
	 * a GList.
	 * Returns:
	 * the first element in a GList, or NULL if the GList has no elements.
	 */
	public ListG first()
	{
		// GList* g_list_first (GList *list);
		return new ListG( g_list_first(gList) );
	}
	
	/**
	 * Gets the last element in a GList.
	 * list:
	 * a GList.
	 * Returns:
	 * the last element in the GList, or NULL if the GList has no
	 * elements.
	 */
	public ListG last()
	{
		// GList* g_list_last (GList *list);
		return new ListG( g_list_last(gList) );
	}
	
	
	
	/**
	 * Gets the element at the given position in a GList.
	 * list:
	 * a GList.
	 * n:
	 * the position of the element, counting from 0.
	 * Returns:
	 * the element, or NULL if the position is off the end of the GList.
	 */
	public ListG nth(uint n)
	{
		// GList* g_list_nth (GList *list,  guint n);
		return new ListG( g_list_nth(gList, n) );
	}
	
	/**
	 * Gets the data of the element at the given position.
	 * list:
	 * a GList.
	 * n:
	 * the position of the element.
	 * Returns:
	 * the element's data, or NULL if the position is off the end of the
	 * GList.
	 */
	public void* nthData(uint n)
	{
		// gpointer g_list_nth_data (GList *list,  guint n);
		return g_list_nth_data(gList, n);
	}
	
	/**
	 * Gets the element n places before list.
	 * list:
	 * a GList.
	 * n:
	 * the position of the element, counting from 0.
	 * Returns:
	 * the element, or NULL if the position is off the end of the GList.
	 */
	public ListG nthPrev(uint n)
	{
		// GList* g_list_nth_prev (GList *list,  guint n);
		return new ListG( g_list_nth_prev(gList, n) );
	}
	
	/**
	 * Finds the element in a GList which contains the given data.
	 * list:
	 * a GList.
	 * data:
	 * the element data to find.
	 * Returns:
	 * the found GList element, or NULL if it is not found.
	 */
	public ListG find(void* data)
	{
		// GList* g_list_find (GList *list,  gconstpointer data);
		return new ListG( g_list_find(gList, data) );
	}
	
	/**
	 * Finds an element in a GList, using a supplied function to find the desired
	 * element.
	 * It iterates over the list, calling the given function which should return 0
	 * when the desired element is found.
	 * The function takes two gconstpointer arguments, the GList element's data as
	 * the first argument and the given user data.
	 * list:
	 * a GList.
	 * data:
	 * user data passed to the function.
	 * func:
	 * the function to call for each element. It should return 0 when the
	 * desired element is found.
	 * Returns:
	 * the found GList element, or NULL if it is not found.
	 */
	public ListG findCustom(void* data, GCompareFunc func)
	{
		// GList* g_list_find_custom (GList *list,  gconstpointer data,  GCompareFunc func);
		return new ListG( g_list_find_custom(gList, data, func) );
	}
	
	/**
	 * Gets the position of the given element in the GList (starting from 0).
	 * list:
	 * a GList.
	 * llink:
	 * an element in the GList.
	 * Returns:
	 * the position of the element in the GList, or -1 if the element is
	 * not found.
	 */
	public int position(ListG llink)
	{
		// gint g_list_position (GList *list,  GList *llink);
		return g_list_position(gList, llink.getListGStruct());
	}
	
	/**
	 * Gets the position of the element containing the given data (starting from 0).
	 * list:
	 * a GList.
	 * data:
	 * the data to find.
	 * Returns:
	 * the index of the element containing the data, or -1 if the data
	 * is not found.
	 */
	public int index(void* data)
	{
		// gint g_list_index (GList *list,  gconstpointer data);
		return g_list_index(gList, data);
	}
	
	/**
	 * Warning
	 * g_list_push_allocator has been deprecated since version 2.10 and should not be used in newly-written code. It does nothing, since GList has been
	 * converted to the slice allocator
	 * Sets the allocator to use to allocate GList elements.
	 * Use g_list_pop_allocator() to restore the previous allocator.
	 * Note that this function is not available if GLib has been compiled
	 * with --disable-mem-pools
	 * allocator:
	 * the GAllocator to use when allocating GList elements.
	 */
	public static void pushAllocator(void* allocator)
	{
		// void g_list_push_allocator (gpointer allocator);
		g_list_push_allocator(allocator);
	}
	
	/**
	 * Warning
	 * g_list_pop_allocator has been deprecated since version 2.10 and should not be used in newly-written code. It does nothing, since GList has been
	 * converted to the slice allocator
	 * Restores the previous GAllocator, used when allocating GList elements.
	 * Note that this function is not available if GLib has been compiled
	 * with --disable-mem-pools
	 */
	public static void popAllocator()
	{
		// void g_list_pop_allocator (void);
		g_list_pop_allocator();
	}
}

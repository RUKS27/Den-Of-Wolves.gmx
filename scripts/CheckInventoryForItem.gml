var item_ID = argument0;

// Check inventory list for item
if(ds_list_find_index(global.keyitems, ItemList(item_ID, 0)) != -1){
    return true;
} else {
    return false;
}

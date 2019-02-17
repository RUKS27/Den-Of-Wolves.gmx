// Arguments
var item_ID = argument0;
var quantity = argument1;

if(ItemList(item_ID, 1) == i_types.key){
    repeat(quantity){
        ds_list_add(global.keyitems, item_ID);
    }
} else if(ItemList(item_ID, 1) == i_types.consumable){
    repeat(quantity){
        ds_list_add(global.consumables, item_ID);
    }
}

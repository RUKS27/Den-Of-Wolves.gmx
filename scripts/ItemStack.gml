for(i = 0; i < 8; i++){
    if(ds_list_find_value(global.consumables, i) = i-1){
        var stack = 8;
                        
        if(UseCItem(eq_consumable) = "successful"){
            ds_list_delete(global.consumables, consum_pos);
            consum_pos = ds_list_find_index(global.consumables, i);
        }
    } else {
        if(UseCItem(eq_consumable) = "successful"){
            ds_list_delete(global.consumables, consum_pos);
            consum_pos++;
        }
    }
}

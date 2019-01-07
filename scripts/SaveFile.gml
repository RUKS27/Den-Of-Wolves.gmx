var file = argument0 + ".Tien";

var write_buffer = buffer_create(128, buffer_grow, 1);


for(i = 0; i < ds_list_size(global.data) - 1; i++){
    var dat = ds_list_find_value(global.data, i);
    buffer_write(write_buffer, buffer_u32, dat);
}

if(i = ds_list_size(global.data) - 1){
    buffer_save(write_buffer, file);
    return "success";
}



var read_buff = argument0;

var _data = buffer_read(read_buff, buffer_u32);

for(i = 0; i < ds_list_size(global.data) - 1; i++){
    ds_list_replace(global.data, i, ds_list_find_value(_data, i));
}

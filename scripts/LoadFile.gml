var file = argument0 + ".Tien";

if(file_exists(file)){
    var read_buffer = buffer_load(file);
    
    var _rm = buffer_read(read_buffer, buffer_u32);
    var _x_pos = buffer_read(read_buffer, buffer_u32);
    var _y_pos = buffer_read(read_buffer, buffer_u32);
    var _Health = buffer_read(read_buffer, buffer_u32);
    var _keyitems = buffer_read(read_buffer, buffer_u32);
    var _consumables = buffer_read(read_buffer, buffer_u32);
    var _eq_weapon = buffer_read(read_buffer, buffer_u32);
    var _key_pos = buffer_read(read_buffer, buffer_u32);
    var _consum_pos = buffer_read(read_buffer, buffer_u32);
    var _eq_passive = buffer_read(read_buffer, buffer_u32);
    
    show_debug_message(_rm);
    room_goto(_rm);
    
    if(room = _rm){
        if(!instance_exists(obj_player)){ 
            player = instance_create(_pos_x, _pos_y, obj_player)
        } else {
            player = obj_player;
        }
        
        with(player){
                if(x != _pos_x) x = _pos_x;
                if(y != _pos_y) y = _pos_y;
                
                Health = _Health;
                global.keyitems = _keyitems;
                global.consumables = _consumables;
                
                eq_weapon = _eq_weapon;
                key_pos = _key_pos;
                consum_pos = _consum_pos;
                eq_passive = _eq_passive;
        }
        
        if(player.eq_passive = _eq_passive) return "success";
    }
    
} else {
    show_debug_message("File is nonexistent you fucking moron");
    return "failure";
}

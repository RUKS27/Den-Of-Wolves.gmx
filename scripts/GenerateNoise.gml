var _x = argument0;
var _y = argument1;
var radius = argument2;
var ticks = argument3;

timer = 0;

if(timer < ticks){
    timer++;
    
    var nearbyEnemy = collision_circle(_x, _y, radius, obj_enemy, false, false);
    draw_circle(_x, _y, radius, true);
    show_debug_message("Clunk!");
    
    if(nearbyEnemy != noone){
        with(nearbyEnemy){
            e_state = e_states.alert;
            
            xx = _x;
            yy = _y;
        }    
    }
}

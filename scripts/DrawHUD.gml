// Draw Inventory Squares
// Key
draw_sprite_ext(spr_invsquare, 1, view_xport+32, view_yport+96, 2, 2, 0, c_white, 1);
draw_set_color(c_white);
draw_rectangle(view_xport+32, view_yport + 96, view_xport+96, view_yport + 160, true);
draw_sprite_ext(ItemList(eq_key, 2), 1, view_xport+32, view_yport+96, 2, 2, 0, c_white, 1);

// Consumable
draw_sprite_ext(spr_invsquare, 1, view_xport+98, view_yport + 96, 2, 2, 0, c_white, 1);
draw_set_color(c_white);
draw_rectangle(view_xport+98, view_yport + 96, view_xport + 162, view_yport + 160, true);
draw_sprite_ext(ItemList(eq_consumable, 2), 1, view_xport+128, view_yport+128, 1, 1, 0, c_white, 1);

// Weapon
draw_sprite_ext(ItemList(eq_weapon, 2), 1, view_xport+830, view_yport + 16, 2.5, 2.5, 0, c_white, 1);

// Passive
//draw_sprite_ext(ItemList(eq_passive, 2), 1, view_xport+32, view_yport+168, 2, 2, 0, c_white, 1);

draw_set_color(c_black);
draw_rectangle(view_xport + 32, view_yport + 32, (view_xport + 32) + ((2.3 * MaxHealth) + 4), view_yport + 64, false);
draw_set_color(c_red);
draw_rectangle(view_xport + 34, view_yport + 34, (view_xport + 34) + (2.3 * Health), view_yport + 62, false);
draw_set_color(c_white);
draw_rectangle(view_xport + 32, view_yport + 32, (view_xport + 32) + ((2.3 * MaxHealth) + 4), view_yport + 64, true);

var sub = 0;

if(obj_player.hidden && instance_exists(par_enemy) && par_enemy.spotPlayer = false || obj_player.hidden && !instance_exists(par_enemy)){
    sub = 1;
} else if (instance_exists(par_enemy) && par_enemy.spotPlayer){
    tm++;
    
    if(tm >= 6) sub = 2;
    else {
        sub = 3;
    }
    
    if(tm = 12){
        tm = 0;
    }
    
} else {
    sub = 0;
}

draw_sprite_ext(spr_indicator, sub, global.view_midw + 400, global.view_midh + 280, 1, 1, 0, c_white, 1);

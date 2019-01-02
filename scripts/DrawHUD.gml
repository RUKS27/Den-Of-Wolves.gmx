// Draw Inventory Squares
// Key
draw_sprite_ext(spr_invsquare, 1, view_xport+32, view_yport+32, 2, 2, 0, c_white, 1);

draw_sprite_ext(ItemList(eq_key, 2), 1, view_xport+32, view_yport+32, 2, 2, 0, c_white, 1);

// Weapon
draw_sprite_ext(spr_invsquare, 1, view_xport+98, view_yport + 32, 2, 2, 0, c_white, 1);

draw_sprite_ext(ItemList(eq_weapon, 2), 1, view_xport+98, view_yport + 32, 2, 2, 0, c_white, 1);

// Passive
draw_sprite_ext(spr_invsquare, 1, view_xport+164, view_yport + 32, 2, 2, 0, c_white, 1);

draw_sprite_ext(ItemList(eq_passive, 2), 1, view_xport+164, view_yport+32, 2, 2, 0, c_white, 1);

// Consumable
draw_sprite_ext(spr_invsquare, 1, view_xport+230, view_yport + 32, 2, 2, 0, c_white, 1);

draw_sprite_ext(ItemList(eq_consumable, 2), 1, view_xport+230, view_yport+32, 2, 2, 0, c_white, 1);

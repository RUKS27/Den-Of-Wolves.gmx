var enemy_instance = argument0;

with(enemy_instance){
    e_state = e_states.dead;
    
    show_debug_message("He dead.");
}

weapon_uses--;
obj_player.p_state = p_states.normal;

exit;

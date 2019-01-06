// Manage Acceleration And Deceleration
xSpd = 0;
ySpd = 0;

var isMoving;

if(Run || Sneak){
    mSpd = abs((Sneak * sSpd) - (Run * rSpd));
} else if(!Run && !Sneak){
    mSpd = 3;
}

xSpd = (RightMove - LeftMove) * mSpd; 
ySpd = (DownMove - UpMove) * mSpd;

if(xSpd != 0 && ySpd != 0){
    mSpd = (sqrt(sqr(mSpd) + sqr(mSpd)));
    show_debug_message(mSpd);
}

if(xSpd != 0 || ySpd != 0) isMoving = true;
else isMoving = false;
// Ensure that aim does not change if sneak is enabled
if(!Sneak && isMoving){
    if(Run){
        noise_radius = 256;
        if(alarm[1] = -1) alarm[1] = 8;
    } else {
        noise_radius = 64;
        if(alarm[1] = -1) alarm[1] = 16;
    }

    if(UpMove || (UpMove && LeftMove) || (UpMove && RightMove)){
        p_dir = p_dirs.forward;
    } else if (DownMove || (DownMove && LeftMove) || (DownMove && RightMove)) {
        p_dir = p_dirs.down;
    } else if (RightMove) {
        p_dir = p_dirs.right;
    } else if (LeftMove){
        p_dir = p_dirs.left;
    }
} else {
    noise_radius = 33;
    if(alarm[1] = -1) alarm[1] = 30;
}

// Collision Detection
if place_meeting(x+xSpd, y, par_wall)
{
    repeat(abs(xSpd)){
        if !place_meeting(x+sign(xSpd),y,par_wall)
        {
               x+=sign(xSpd);
        } else {
            break;
        }
    }
    
    xSpd=0;
}

if place_meeting(x, y+ySpd, par_wall)
{
    repeat(abs(ySpd)){
        if !place_meeting(x,y+sign(ySpd),par_wall)
        {
            y+=sign(ySpd);
        } else {
            break;
        }
    }
    ySpd=0;
}

// Move Player Along The Axes
x += xSpd;
y += ySpd;

// Change Items
if(keyboard_check_pressed(ord("1"))){
    show_debug_message(key_pos);

    key_pos++;
}

if(key_pos < ds_list_size(global.keyitems))
    eq_key = ds_list_find_value(global.keyitems, key_pos);
else {
    eq_key = ds_list_find_value(global.keyitems, 0);
    key_pos = 0;    
}

if(keyboard_check_pressed(ord("2"))){
    show_debug_message(eq_consumable);
    consum_pos++;
}

if(consum_pos < ds_list_size(global.consumables))
    eq_consumable = ds_list_find_value(global.consumables, consum_pos);
else {
    eq_consumable = ds_list_find_value(global.consumables, 0);
    consum_pos = 0;    
}

MaxHealth = 100;
MaxStamina = 100;
if(eq_passive != 0){
    PassiveEffects(eq_passive);
}

// Use Consumable Items
if(UseConsumable){
    if(eq_consumable > 0){
        if(UseCItem(eq_consumable) = "successful"){
            ds_list_delete(global.consumables, consum_pos);
            consum_pos++;
        }
    }
}

// Stealth
if(place_meeting(x, y, obj_darkness)){
    hidden = true;
    show_debug_message("Hidden");
} else {
    hidden = false;
}

// Combat    

// Stealth Kill

// Check Directions
switch(p_dir){
            case p_dirs.forward:
                var inst_enemy = instance_place(x, y-32, par_enemy);        
            
                if(inst_enemy != noone){ 
                    if(inst_enemy.lookDir = e_lookdir.forward) enemy = instance_place(x, y-32, par_enemy);
                } else enemy = noone;  
            break;
            
            case p_dirs.down:
                var inst_enemy = instance_place(x, y+32, par_enemy);
            
                if(inst_enemy != noone){ 
                    if(inst_enemy.lookDir = e_lookdir.down) enemy = instance_place(x, y+32, par_enemy);
                } else enemy = noone;  
            break;
            
            case p_dirs.right:
                var inst_enemy = instance_place(x+32, y, par_enemy);    
            
                if(inst_enemy != noone){
                    if(inst_enemy.lookDir = e_lookdir.right) enemy = instance_place(x+32, y, par_enemy);
                } else enemy = noone;  
            break;
            
            case p_dirs.left:
                var inst_enemy = instance_place(x-32, y, par_enemy);
            
                if(inst_enemy != noone) {
                    if(inst_enemy.lookDir = e_lookdir.left) enemy = instance_place(x-32, y, par_enemy);
                } else enemy = noone;  
            break;
}

if(enemy == noone) delay = 0;

if(Sneak){
    if(enemy != noone){
        if(enemy.e_state != e_states.dead && !enemy.spotPlayer){
            show_debug_message("enemy in range.");
            
            show_debug_message("Butcher him.");
                
            // Lock on to enemy
            locked_on = enemy;
               
            if(eq_weapon){ 
                if(Attack){
                    show_debug_message("Gaining composure..." + string(delay));
                
                    delay++
                } else if (Attack_RLS){
                    show_debug_message("Released.");
                
                    if(delay < 120){ 
                        delay = 0;
                    } else if(delay >= 120) { 
                        delay = 0;
                        event_user(1);
                    }
                }
            }
        }
    }
} else {
    delay = 0;
}

locked_on = enemy;

// Set enemy to noone to prevent crash
enemy = noone;

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
        Stamina-=2;
        noise_radius = 256;
        if(alarm[1] = -1) alarm[1] = 8;
    } else {
        Stamina-=1;
        
        noise_radius = 64;
        if(alarm[1] = -1) alarm[1] = 16;
        
        Stamina+=2;
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
if place_meeting(x+xSpd, y, obj_wall)
{
    repeat(abs(xSpd)){
        if !place_meeting(x+sign(xSpd),y,obj_wall)
        {
               x+=sign(xSpd);
        } else {
            break;
        }
    }
    
    xSpd=0;
}

if place_meeting(x, y+ySpd, obj_wall)
{
    repeat(abs(ySpd)){
        if !place_meeting(x,y+sign(ySpd),obj_wall)
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
    show_debug_message("1");

    if(eq_key < ds_list_size(global.keyitems))
        eq_key = ds_list_find_value(global.keyitems, eq_key+1);
    else eq_key = ds_list_find_value(global.keyitems, 0);
}

if(keyboard_check_pressed(ord("2"))){
    show_debug_message(eq_consumable);
    consum_pos++;
    
    if(consum_pos < ds_list_size(global.consumables))
        eq_consumable = ds_list_find_value(global.consumables, consum_pos);
    else {
        eq_consumable = ds_list_find_value(global.consumables, 0);
        consum_pos = 0;    
    }
}

if(keyboard_check_pressed(ord("3"))){
    if(eq_passive < ds_list_size(global.passiveitems)){
        eq_passive = ds_list_find_value(global.passiveitems, eq_passive+1);
        show_debug_message(eq_passive);
    } else eq_passive = ds_list_find_value(global.passiveitems, 0);
}

// Use Consumable Items
if(UseConsumable){
    if(eq_consumable > 0){
        UseCItem(eq_consumable);
    
        ds_list_delete(global.consumables, eq_consumable);
    }
}

// Combat    

// Stealth Kill

// Check Directions
switch(p_dir){
            case p_dirs.forward:
                var inst_enemy = instance_place(x, y-32, obj_enemy);        
            
                if(inst_enemy != noone){ 
                    if(inst_enemy.lookDir = e_lookdir.forward) enemy = instance_place(x, y-32, obj_enemy);
                } else enemy = noone;  
            break;
            
            case p_dirs.down:
                var inst_enemy = instance_place(x, y+32, obj_enemy);
            
                if(inst_enemy != noone){ 
                    if(inst_enemy.lookDir = e_lookdir.down) enemy = instance_place(x, y+32, obj_enemy);
                } else enemy = noone;  
            break;
            
            case p_dirs.right:
                var inst_enemy = instance_place(x+32, y, obj_enemy);    
            
                if(inst_enemy != noone){
                    if(inst_enemy.lookDir = e_lookdir.right) enemy = instance_place(x+32, y, obj_enemy);
                } else enemy = noone;  
            break;
            
            case p_dirs.left:
                var inst_enemy = instance_place(x-32, y, obj_enemy);
            
                if(inst_enemy != noone) {
                    if(inst_enemy.lookDir = e_lookdir.left) enemy = instance_place(x-32, y, obj_enemy);
                } else enemy = noone;  
            break;
}

if(Sneak){
    if(enemy != noone){
        if(enemy.e_state != e_states.dead && !enemy.spotPlayer){
            show_debug_message("enemy in range.");
            
            show_debug_message("Butcher him.");
                
            // Lock on to enemy
            locked_on = enemy;
                
                if(global.Attack_Press){
                    show_debug_message("Gaining composure..." + string(delay));
                
                    delay++
                } else if (Attack_RLS){
                    show_debug_message("Released.");
                
                    if(delay < 30) delay = 0;
                    else if(delay >= 30) { 
                        delay = 0;
                        event_user(1);
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

// Manage Acceleration And Deceleration
xSpd = 0;
ySpd = 0;

var isMoving;
var diagonalMove;

if(Run || Sneak){
    mSpd = abs((Sneak * sSpd) - (Run * rSpd));
} else if(!Run && !Sneak){
    mSpd = 3;
}

xSpd = (RightMove - LeftMove) * mSpd; 
ySpd = (DownMove - UpMove) * mSpd;

if(xSpd != 0 && ySpd != 0) diagonalMove = true;
else diagonalMove = false;

if(diagonalMove){
    mSpd = sqrt(sqr(mSpd) + sqr(mSpd));
    show_debug_message(mSpd);
}

// Ensure that aim does not change if sneak is enabled
if(!Sneak){
    if(UpMove || (UpMove && LeftMove) || (UpMove && RightMove)){
        p_dir = p_dirs.forward;
    } else if (DownMove || (DownMove && LeftMove) || (DownMove && RightMove)) {
        p_dir = p_dirs.down;
    } else if (RightMove) {
        p_dir = p_dirs.right;
    } else if (LeftMove){
        p_dir = p_dirs.left;
    }
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

// Set isMoving variable
if(xSpd != 0 || ySpd != 0){
    isMoving = true;
} else {
    isMoving = false;
}

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

// Generate Footsteps 
if(isMoving){
    if(Run && !Sneak){
        noise_sound = snd_footsteploud;
        noise_radius = 256;
        if(alarm[1] = -1) alarm[1] = 8;
    } else if (!Run && !Sneak){
        noise_sound = snd_footstep;
        noise_radius = 64;
        if(alarm[1] = -1) alarm[1] = 16;
    } else if(Sneak){
        noise_sound = snd_footstepquiet;
        noise_radius = 33;
        if(alarm[1] = -1) alarm[1] = 30;
    }
} else {
    alarm[1] = -1;
}

// Combat    

// Stealth Kill
// HOLY SHIT LOOK AT ALL OF THESE CONDITIONS
enemy = noone;

switch(p_dir){
            case p_dirs.forward:
                if(instance_place(x, y-32, obj_enemy) != noone) enemy = instance_place(x, y-32, obj_enemy);
                else enemy = noone;  
            break;
            
            case p_dirs.down:
                if(instance_place(x, y+32, obj_enemy) != noone) enemy = instance_place(x, y+32, obj_enemy);
                else enemy = noone;  
            break;
            
            case p_dirs.right:
                if(instance_place(x+32, y, obj_enemy) != noone) enemy = instance_place(x+32, y, obj_enemy);
                else enemy = noone;  
            break;
            
            case p_dirs.left:
                if(instance_place(x-32, y, obj_enemy) != noone) enemy = instance_place(x-32, y, obj_enemy);
                else enemy = -1;  
            break;
}

if(Sneak){
    if((place_meeting(x, y-32, obj_enemy) && instance_place(x, y-32, obj_enemy).lookDir = e_lookdir.forward) 
    || (place_meeting(x, y+32, obj_enemy) && instance_place(x, y+32, obj_enemy).lookDir = e_lookdir.down) 
    || (place_meeting(x-32, y, obj_enemy) && instance_place(x-32, y, obj_enemy).lookDir = e_lookdir.right)
    || (place_meeting(x+32, y, obj_enemy) && instance_place(x+32, y, obj_enemy).lookDir = e_lookdir.left)){
        if(enemy != noone){
            if(enemy.e_state != e_states.dead){
                show_debug_message("enemy in range.");
                
                show_debug_message("Butcher him.");
                    
                // Lock on to enemy
                locked_on = enemy;
                    
                if(Attack){
                    show_debug_message("Gaining composure...");
                        
                    alarm[6] = 30;
                } else if (Attack_RLS){
                    show_debug_message("Released.");
                        
                    alarm[6] = -1;
                }
            }
        }
    }
}

locked_on = enemy;

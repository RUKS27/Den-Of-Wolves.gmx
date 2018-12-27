// Manage Acceleration And Deceleration
xSpd = 0;
ySpd = 0;

xSpd = (RightMove - LeftMove) * mSpd; 
if(xSpd == 0) ySpd = (DownMove - UpMove) * mSpd; 

if(Run || Sneak){
    mSpd = abs((Sneak * sSpd) - (Run * rSpd));
} else {
    mSpd = 3;
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
// HOLY SHIT LOOK AT ALL OF THESE CONDITIONS
if((place_meeting(x, y-32, obj_enemy) && instance_place(x, y-32, obj_enemy).lookDir = e_lookdir.forward) 
|| (place_meeting(x, y+32, obj_enemy) && instance_place(x, y+32, obj_enemy).lookDir = e_lookdir.down) 
|| (place_meeting(x-32, y, obj_enemy) && instance_place(x-32, y, obj_enemy).lookDir = e_lookdir.forward)
|| (place_meeting(x+32, y, obj_enemy) && instance_place(x+32, y, obj_enemy).lookDir = e_lookdir.down)){
    show_debug_message("enemy in range.");
    
    if(Attack){
        alarm[6] = 30;
    } else if (Attack_RLS){
        alarm[6] = -1;
    }
}

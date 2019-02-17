// Arguments
var item_ID = argument0;
var ret_var = argument1;

enum i_types {
    consumable = 1,
    weapon = 2,
    passive = 3,
    key = 0
}

// Item Names

// Passive Items start from 75
name[75] =  "Health Boost";
type[75] = i_types.passive;
sprite[75] = spr_mshard;

// Consumables start from 55
name[55] =  "Health Injection";
type[55] = i_types.consumable;
sprite[55] = Health_Injection;

// Weapons Start From 40
name[40] =  "Sharp Stake";
type[40] = i_types.weapon;
sprite[40] = spr_mshard;
value[40] = 1;

name[41] =  "Knife";
type[41] = i_types.weapon;
sprite[41] = spr_knife;
value[41] = 4;

// Keys Start From 1
name[3] =  "Wooden Board";
type[3] = i_types.key;
sprite[3] = spr_tstkey;

name[2] =  "Rusted Key";
type[2] = i_types.key;
sprite[2] = spr_tstkey;

name[1] =  "Surveillance Key";
type[1] = i_types.key;
sprite[1] = spr_tstkey;

name[0] =  "Nothing";
type[0] = -1;
sprite[0] = spr_empty;

// Return Item Variable
/*
// Return Name = 0
// Return Type = 1
// Return Sprite = 2
// Return Value = 3
*/

if(ret_var = 0){
    return name[item_ID];
} else if(ret_var = 1){
    return type[item_ID];
} else if(ret_var = 2){
    return sprite[item_ID];
} else {
    return value[item_ID];
}

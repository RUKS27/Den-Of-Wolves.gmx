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
// Weapons Start From 40
name[40] =  "Sharp Metal Shard";
type[40] = i_types.weapon;
sprite[40] = spr_mshard;

name[41] =  "knife";
type[41] = i_types.weapon;
sprite[41] = spr_tstkey;

// Consumables start from 55
name[55] =  "Health";
type[55] = i_types.consumable;
sprite[55] = Health_Injection;

// Keys Start From 1
name[1] =  "Key";
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
// Return ID = 3
*/

if(ret_var = 0){
    return name[item_ID];
} else if(ret_var = 1){
    return type[item_ID];
} else if(ret_var = 2){
    return sprite[item_ID];
} else {
    return item_ID;
}

///followPathsIni(size,speed)

//path_start(testroompath,5,path_action_continue,true);
player = instance_find(obj_player,0);
followingPath = false;
//keeps track of what step the object is in when following the path
followingPathStep = 0;

nearestPath = noone;
//alarm[0] = room_speed*5;

//path destination uses path point
pathDestination = noone;
destination[0] = noone;
destination[1] = noone;

instructionPath[0,0] = -1;
instructionPathSteps = 0;
wasOnThisPath = -1;

midPath =noone;
size = argument0;
spd = argument1;

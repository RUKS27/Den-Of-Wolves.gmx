///validateGotoPath(x1,y1,x2,y2,radius)
//radius is used to determine the size of the character moving

check = collision_line(argument0,argument1,argument2,argument3,par_wall,false,true);
//if check1 fails then this can be done early
if(check != noone)
{
    //print("invalid path early");
    return false;
}
dir = point_direction(argument0,argument1,argument2,argument3);
dis = point_distance(argument0,argument1,argument2,argument3);
side0x = argument0+lengthdir_x(argument4,dir+90)
side0y = argument1+lengthdir_y(argument4,dir+90)
side1x = argument0+lengthdir_x(argument4,dir-90)
side1y = argument1+lengthdir_y(argument4,dir-90)

otherSide0x = argument2+lengthdir_x(argument4,dir+90)
otherSide0y = argument3+lengthdir_y(argument4,dir+90)
otherSide1x = argument2+lengthdir_x(argument4,dir-90)
otherSide1y = argument3+lengthdir_y(argument4,dir-90)

check0 = collision_line(side0x,side0y,otherSide0x,otherSide0y,par_wall,false,true);
check1 = collision_line(side1x,side1y,otherSide1x,otherSide1y,par_wall,false,true);

if (check0!=noone||check1!=noone)
{
    //print("invalid path");
return false
}
else 
{
    //print("Valid path");
return true
}

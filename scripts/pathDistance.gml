///pathDistance(path,point1,point2);

var length = path_get_length(argument0);
/*
print("script");
print(path_get_name(argument0));
print(argument1);
print(argument2);
print(length)
*/
if (path_get_closed(argument0))
{
    var pathDist = abs(argument1-argument2);
    //if greater than point 5 then go the other way
    if (pathDist>.5)
    {
        pathDist = 1-pathDist;
    }
    pathDist*= length;
    return pathDist;



}
else
{
    var pathDist = abs(argument1-argument2);
    pathDist*= length;
    return pathDist;

}

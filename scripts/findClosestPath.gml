///findClosestPath(x,y)
pathManager = instance_find(obj_path_manager,0)
if (pathManager == noone) {return noone}
with(pathManager)
{
        closestX = path_points[0,0];
        closestY = path_points[0,1];
        pathPos = path_points[0,2];
        pathID =  path_points[0,3];
        pathArrayID =  path_points[0,4];
        dist = point_distance(argument0,argument1,closestX,closestY) 
        for (i= 0; i< array_height_2d(path_points);i++)
        {
            //gather points
            xPos = path_points[i,0]
            yPos = path_points[i,1]
            pPos = path_points[i,2]
            pidPos = path_points[i,3]
            paPos = path_points[i,4]
            //find point closest to player
            testDist = point_distance(argument0,argument1,xPos,yPos)
            if (dist>testDist)
            {
                closestX = xPos;
                closestY = yPos;
                pathPos =  pPos;
                pathID = pidPos;
                pathArrayID = paPos;
                dist = testDist;
        
            }
        }
pathInfo[0] = closestX;
pathInfo[1] = closestY;
pathInfo[2] = pathPos;
pathInfo[3] = pathID;
pathInfo[4] = pathArrayID;
print (pathInfo);

return pathInfo;
}
 

//check if a straight line can be drawn towards target
if(pathDestination!=noone||true)
{
    if (validateGotoPath(x,y,destination[0],destination[1],size))
    {
        //get off the path
        var holdX = x;
        var holdY = y;
        path_end();
        x = holdX;
        y = holdY;
        //move towards destination
        move_towards_point(destination[0],destination[1],5)
        //clear variables
        nearestPath = noone;
        pathDestination = noone
        print("Early move to final");
    }
}
//Object is not on a path but needs to get to one.
if (nearestPath!=noone)
{
    
    if(point_distance(x,y,nearestPath[0], nearestPath[1])<7&&!followingPath)
    {
        attachToPath();
        print("ATTACHING");
    }
    else
    {
    //if something changes its position reset speed
        move_towards_point( nearestPath[0], nearestPath[1], 5 );
    }
    exit;
}

//object is on a path and needs to go to a path point near its destination
if (pathDestination!=noone)
{

    //if it reaches the end of the path and stops redo the nearest path set up 
    if (path_index == -1&&point_distance(x,y,pathDestination[0], pathDestination[1])>5)
    {
        print("path stop")
        
        
    }
    if (point_distance(x,y,pathDestination[0], pathDestination[1])<5&&followingPath)
    {
        
        x = pathDestination[0];
        y = pathDestination[1];
        followingPath = false;
        path_end();
        pathDestination = noone;
        print("Validate: "+ string(validateGotoPath(x,y,destination[0],destination[1],size)));
        //if on the last step of the instruction path and can reach point.
        if(validateGotoPath(x,y,destination[0],destination[1],size)
        &&followingPathStep == 0)
        {
            move_towards_point(destination[0],destination[1],5)
            print("move to final");
        }
        else if (followingPathStep ==0||wasOnThisPath == -1)
        {
            print("Could not reach target!");
            speed = 0;
        }
        else
        {
            
            //nearest path should be different to wasOnPath 
            //because it is transfering the object to the next track
            
            
            print("Was on this path: "+ string(wasOnThisPath))
            print("Path Choices: " 
            +string(path_points[instructionPath[followingPathStep,0],4])
            +" "+string(path_points[instructionPath[followingPathStep,1],4]))
            if (wasOnThisPath == path_points[instructionPath[followingPathStep,0],4])
            {
                for (var a =0; a< 5;a++){nearestPath[a] = path_points[instructionPath[followingPathStep,1],a]}
            
            }
            else
            {
                for (var a =0; a< 5;a++){nearestPath[a] = path_points[instructionPath[followingPathStep,0],a]}
            
            }
            followingPathStep-=1
            //pathDestination[2] needs to have the other value in order to function properly so it 
            if (wasOnThisPath == path_points[instructionPath[followingPathStep,0],4])
            
            {
                for (var a =0; a< 5;a++){pathDestination[a] = path_points[instructionPath[followingPathStep,1],a]}
                pathDestination[2] = path_points[instructionPath[followingPathStep,0],2]
            }
            else 
            {
                for (var a =0; a< 5;a++){pathDestination[a] = path_points[instructionPath[followingPathStep,0],a]}
                if (instructionPath[followingPathStep,1]!=-1)
                {
                    pathDestination[2] = path_points[instructionPath[followingPathStep,1],2]
                }
                
            }
            attachToPath();
            
            
            //print("Going to: "+string(nearestPath[4]))
            /*
            for (var a =0; a< 5;a++{midPath[a] = path_points[instructionPath[followingPathStep,0],a]

            nearestPath[0] = 
            nearestPath[1] = 
            nearestPath[2] = 
            nearestPath[3] = 
            nearestPath[4] = 
            nearestPath[5] = 
            
            pathDestination[0] = 
            pathDestination[1] = 
            pathDestination[2] = 
            pathDestination[3] = 
            pathDestination[4] =
            pathDestination[5] =
            */
        }
        
        
    }
    exit;
}
//object is at the nearest path point and has a straight line to the target 
if(destination[0] != noone)
{
    if (point_distance(x,y,destination[0], destination[1])<5)
    {
        speed = 0;
        
        print("Reached final dest");
        destination[0] = noone;
        destination[1] = noone;
    }
    exit;
}

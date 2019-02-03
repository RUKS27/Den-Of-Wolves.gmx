//calculate which path direction is closer
        //nearestPath[2]
        //pathDestination[2]
        pathDirection = 1;
        if(path_get_closed(nearestPath[3]))
        {
            difference = abs(nearestPath[2]- pathDestination[2]);
            print("Choose path direction")
            print(nearestPath[2]);
            print(pathDestination[2]);
            print(difference);
            if(nearestPath[2]>pathDestination[2])
            {
                if (difference<.5){pathDirection = -1}
            }
            else
            {
                if (difference>.5){pathDirection = -1}
            }
            path_start(nearestPath[3],4*pathDirection,path_action_restart  ,true);
        }
        else
        {
            if (pathDestination[2]<nearestPath[2])
            {
                pathDirection = -1;
            }
            path_start(nearestPath[3],4*pathDirection,path_action_stop  ,true);
        }
        //path_start(nearestPath[3],4*pathDirection,path_action_stop  ,true);
        path_position = nearestPath[2];
        followingPath = true;
        
        
        //print("move along path");
        print(pathDirection);
        print("Attached to: "+string(nearestPath[4]))
        wasOnThisPath = nearestPath[4];
        nearestPath = noone;

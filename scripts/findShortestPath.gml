///findShortestPath(pathArrayID,testArray,testArrayPoints,arrayPos,length)
print("Troublesome script");

var pathChoicesList;
pathChoicesList[0] = 0;

//get possible path choices
for (i = 0;i<array_length_2d(meet_paths,argument0);i++)
    {
    pathChoicesList[i] = meet_paths[argument0,i]
    }

foundPath = false;
//check if the path can be finished
for (var a = 0; a<array_length_1d(pathChoicesList);a++)
            {
            
                
                if (pathChoicesList[a] == startPathID)
                {
                    //print("found a match");
                   
                    
                    foundPath = true;
                    choosePath = a;
                }
            }
            
            
            

            
if (foundPath)//if it found a match then we can add the new path to the list
{
                previousPath = argument1[argument3];
                print("Prev Path recursion")
                print(previousPath)
                argument3++
                //add point and path ids to arrays
                argument1[argument3]= startPathID;
                
                    argument2[argument3,0] = meet_points[previousPath,choosePath]
                    argument2[argument3,1] = meet_points_other[previousPath,choosePath]
                    //print("last paths to be added")
                    //print(meet_points[previousPath,choosePath])
                    //print(meet_points_other[previousPath,choosePath])
                    
                
                
                possiblePaths[array_length_1d(possiblePaths)]= argument1
                
                //add the length
                addLength = instructionPathsLengthCalcArgs(argument2,argument3);
                           // print(addLength);
                //add the distance to the target
                arrayPoint = argument2[0,0];
                addFinalDist = point_distance(path_points[arrayPoint,0],
                path_points[arrayPoint,1],
                destination[0],
                destination[1]);
                
                            argument4 +=addLength;
                            argument4+= addFinalDist;
                            //print("Final Distance Result: " + string(argument4))
                
                //if the new path is shorter than the old path length then replace the instructions
                
                if(pathLength>argument4)
                {
                    pathLength = argument4
                    print("New Shortest Path");
                    print("pathLength: " + string(pathLength));
                    
                    //reset instruction path
                    instructionPath = noone;
                    instructionPath[0,0] = pathDestination[5];
                    instructionPath[0,1] = -1; 
                    //copy array so it can be used by the instructions
                    for (var b = 0;b< array_height_2d(argument2);b++)
                    {
                        for (var c = 0;c<array_length_2d(argument2,b);c++)
                        {
                        instructionPath[b,c] = argument2[b,c]
                        }
    
                    }
                    print(argument2)
                    print(argument1)
                }
                else
                {
                    print("New path is longer than current path");
                }
}
//else
//{


    //check each of the current path's transfer paths with recursion
    for (var a = 0; a<array_length_1d(pathChoicesList);a++)
    {
        //check if there is a path choice not already in the testArray
        unique = true;
        var arrayPos = argument3
        for (var b = 0; b< array_length_1d(argument1);b++)
        {
            if pathChoicesList[a] == argument1[b]
            {
                unique = false
            }
        }
        if (unique)
        {
            //add new path anc length
            //var previousPath = argument1[argument3]; 
            var previousPath = argument0;
            
            /*
            print("pathChoicesList")
            print(pathChoicesList);
            print(previousPath);
            
            print("patch choices of previous path: "+string(previousPath))
            //get possible path choices
            for (var c = 0;c<array_length_2d(meet_paths,previousPath);c++)
            {   
                print(meet_paths[previousPath,c])
            }
            print("patch choices of current path: " +string(argument0))
            //get possible path choices
            for (var c = 0;c<array_length_2d(meet_paths,argument0);c++)
            {   
                print(meet_paths[argument0,c])
            }
            
            
            
            
            
            
            
            print("pathChosen")
            print(pathChoicesList[a])
            print("index");
            print(previousPath);
            print(a)
            print(meet_points)
            print(meet_points_other)
            print("Current Path Stack")
            print(argument2)
            print(argument1)
            */
            print(pathChoicesList)
            argument1[arrayPos+1] = pathChoicesList[a];
            argument2[arrayPos+1,0] = meet_points[previousPath,a]
            argument2[arrayPos+1,1] = meet_points_other[previousPath,a]
            addLength = instructionPathsLengthCalcArgs(argument2,arrayPos+1);
            print("Path Added")
            print(argument1[arrayPos+1])
            print(argument2)
            findShortestPath(pathChoicesList[a],argument1,argument2,arrayPos+1,argument4+addLength)
        }
        
    }
//}



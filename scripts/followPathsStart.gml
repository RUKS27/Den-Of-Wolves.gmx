///followPathsStart(x,y)
//reset vars

pathDestination = noone;
nearestPath = noone;
destination[0] = noone;
destination[1] = noone;
followingPath = false;
instructionPath = noone;
instructionPathSteps = 0;
wasOnThisPath = -1;
followingPathStep = 0;

//exit path if in one
if (path_index!=-1)
{//get off the path
        var holdX = x;
        var holdY = y;
        path_end();
        x = holdX;
        y = holdY;
        //move towards destination
        //clear variables
        nearestPath = noone;
        pathDestination = noone
        
}



pathManager = instance_find(obj_path_manager,0);
paths = pathManager.paths;
path_points = pathManager.path_points
//copy meet paths so we can eliminate used paths



meet_paths_get = pathManager.meet_paths
meet_paths[0,0] = 0;
for (var a = 0;a< array_height_2d(meet_paths_get);a++)
{
    for (var b = 0;b<array_length_2d(meet_paths_get,a);b++)
    {
        meet_paths[a,b] = meet_paths_get[a,b]
    }
    
}



meet_points_get = pathManager.meet_points
meet_points[0,0] = 0;
for (var a = 0;a< array_height_2d(meet_points_get);a++)
{
    for (var b = 0;b<array_length_2d(meet_points_get,a);b++)
    {
        meet_points[a,b] = meet_points_get[a,b]
    }
    
}




meet_points_other_get = pathManager.meet_points_other
meet_points_other[0,0] = 0;
for (var a = 0;a< array_height_2d(meet_points_other_get);a++)
{
    for (var b = 0;b<array_length_2d(meet_points_other_get,a);b++)
    {
        meet_points_other[a,b] = meet_points_other_get[a,b]
    }
    
}





meet_points = pathManager.meet_points;
//go to nearest valid path

//GMS will override the array if you don't move it 
//to another array
var array;
array = findClosestPath(x,y,size);
for (i = 0; i<6;i++;){nearestPath[i] = array[i];}
nearestPath[0] = array[0];
move_towards_point( nearestPath[0], nearestPath[1], 5 );

//select a destination point (Pick player)
//player = instance_find(obj_player,0);
destination[0] = argument0;
destination[1] = argument1;
//array copying thing
//must be done with player so notme can be procced

array = findClosestPath(argument0,argument1,size);

for (i = 0; i<6;i++;){pathDestination[i] = array[i];}
print("Start Moving to path")


startPathID = nearestPath[4]
startPathName = path_get_name(nearestPath[3])
instructionPath[0] = pathDestination[4]
endPathName = path_get_name(pathDestination[3])

//clear instructions
instructionPath = noone;
instructionPath[0,0] = pathDestination[5];
instructionPath[0,1] = -1; 
pathLength = 1000000

//0 = stop at point 1 = next startpoint
instructionPathSteps = 0;



//first check to see if target is on the same path
if (startPathName == endPathName)
{
    print(instructionPath);
    print("Same start and end path!");
    exit;
}
else
{
    
//use path calculation scripts here
    
        possiblePaths = noone;
        possiblePaths[0] =0; 
    
    
        //print("Begin while Loop")
        //test array holds the paths while test array points holds the points
        testArray = noone;
        testArray[0] = pathDestination[4];
        testArrayPoints = noone;
        testArrayPoints[0,0] = pathDestination[5];
        testArrayPoints[0,1] = -1; 
        pathLengthTest = 0;
        
        
        invalidPath = false;
        foundPath = false;
        arrayPos = 0;
        timesLooped = 0
        
        findShortestPath(testArray[0],testArray,testArrayPoints,0,0)
        while(!invalidPath&&timesLooped<1000&&false)
        {
            timesLooped++;
            getMeetPathChoices(testArray[arrayPos])
            //testArray[arrayPos] is the height and i is the length
            
            for (var a = 0; a<array_length_1d(pathChoices);a++)
            {
                if (pathChoices[a] == startPathID)
                {
                    //print("found a match");
        
                    foundPath = true;
                    choosePath = a;
                }
            }
            if (foundPath)//if it found a match then we can add the new path to the list
            {
                previousPath = testArray[arrayPos];
                print("Prev Path original")
                print(previousPath)
                arrayPos++
                //add point and path ids to arrays
                testArray[arrayPos]= startPathID;
                
                    testArrayPoints[arrayPos,0] = meet_points[previousPath,choosePath]
                    testArrayPoints[arrayPos,1] = meet_points_other[previousPath,choosePath]
                    
                
                
                possiblePaths[array_length_1d(possiblePaths)]= testArray
                
                //add the length
                addLength = instructionPathsLengthCalc();
                            print(addLength);
                //add the distance to the target
                arrayPoint = testArrayPoints[0,0];
                addFinalDist = point_distance(path_points[arrayPoint,0],
                path_points[arrayPoint,1],
                destination[0],
                destination[1]);
                
                            pathLengthTest +=addLength;
                            pathLengthTest+= addFinalDist;
                            print("Final Distance Result: " + string(pathLengthTest))
                
                //if the new path is shorter than the old path length then replace the instructions
                
                if(pathLength>pathLengthTest)
                {
                    pathLength = pathLengthTest
                    print("New Shortest Path");
                    //copy array so it can be used by the instructions
                    for (var b = 0;b< array_height_2d(testArrayPoints);b++)
                    {
                        for (var c = 0;c<array_length_2d(testArrayPoints,b);c++)
                        {
                        instructionPath[b,c] = testArrayPoints[b,c]
                        }
    
                    }
                }
                else
                {
                    print("New path is longer than current path");
                }
                
                /*
                print("Completed Array")
                    for(var b = 0; b<array_length_1d(instructionPath);b++)
                    {
                            var left = "-1";
                            var right = "-1";
                            if (instructionPath[b,0]!=-1)
                            {
                            left = string(path_points[instructionPath[b,0],4])
                            left = left + " "+string(path_points[instructionPath[b,0],0])+","+string(path_points[instructionPath[b,0],1])
                            }
                            if (instructionPath[b,1]!=-1)
                            {
                            right = string(path_points[instructionPath[b,1],4])
                            right = right + " "+string(path_points[instructionPath[b,1],0])+","+string(path_points[instructionPath[b,1],1])
                            }
    
    
                            print("Left: "+left+" Right: "+right)
                    }
                
                */
                
                
                
                //eliminate the path -2 from the destination
                if (arrayPos>0)
                {
                    var elimIndex = testArray[arrayPos-1]
                    var elim = false;
                    for (var d = 0;d<array_length_2d(meet_paths,elimIndex)&&!elim;d++)
                    {
                        if(meet_paths[elimIndex,d] == testArray[arrayPos])
                        {
                            elim = true;
                            meet_paths[elimIndex,d] = -1;
                            //print("Eliminated");
                        }
                    }
                }
                else
                {
                    break;
                }
                //reset test array
                //print("Complete");
                //print("Reset Test");
                testArray = noone;
                testArray[0] = pathDestination[4];
                testArrayPoints = noone;
                testArrayPoints[0,0] = pathDestination[5];
                testArrayPoints[0,1] = -1; 
                pathLengthTest = 0;
                foundPath = false;
                arrayPos = 0;
                //break;
            }
            else
            {
                
                //check if there is a path choice not already in the testArray
                //print("test uniques")
                //print(string(testArray[arrayPos]) +": "+ string(pathChoices));
                //print(string(testArray[arrayPos]) +": "+ string(testArray));
                unique = false;
                choosePath = -1;
                for ( a = 0; a<array_length_1d(pathChoices)&&!unique;a++)
                {
                    if (pathChoices[a]!=-1)
                    {
                    
                        unique = true;
                        for ( b = 0; b<array_length_1d(testArray);b++)
                        {
                            //-1 indicates a path that has been tested
                            if (pathChoices[a]==testArray[b])
                            {
                            unique = false;   
                        
                            }
                        }
                        if (unique)
                        {
                            //print("unique number found " + string(pathChoices[a]))
                            choosePath =a;
                        }
                    }
                }
                if (unique)
                {   
                    //found an untested path add it to the test array 
                            //then re run the loop
                            //print("Current Array"+string(testArray))
                            
                            previousPath = testArray[arrayPos]; 
                            
                            //used for finding loaction in meet points that is needed to 
                            //create the point list
                            //print("Left: "+
                            //string(path_points[currentPathPoint,4])+
                            //" Right: "+
                            //string(path_points[nextPathPoint,4]))
                            arrayPos++
                            testArray[arrayPos] = pathChoices[choosePath];
                            
                                testArrayPoints[arrayPos,0] = meet_points[previousPath,choosePath]
                                testArrayPoints[arrayPos,1] = meet_points_other[previousPath,choosePath]
                            
                            //print("add");
                            //print(path_points[testArrayPoints[arrayPos,0],4]);
                            //print("adding: " + string(pathChoices[choosePath]))
                            //print("Redo Loop")
                            
                            addLength = instructionPathsLengthCalc();
                            print(addLength);
                            pathLengthTest +=addLength
                            /*
                            print("Current Path Coordindinates"
                            + string(path_points[testArrayPoints[arrayPos,0],0])+", "
                            + string(path_points[testArrayPoints[arrayPos,0],1])+" Path Pos: "
                            + string(path_points[testArrayPoints[arrayPos,0],2]));
                            
                            print("Previous Path Coordindinates"
                            + string(path_points[testArrayPoints[arrayPos-1,0],0])+", "
                            + string(path_points[testArrayPoints[arrayPos-1,0],1])+" Path Pos: "
                            + string(path_points[testArrayPoints[arrayPos-1,0],2]));
                            */ 
                            
                            
                            
                }
                else
                {
                    //print("Could not find unique")
                    
                    //eliminate path that cause problem
                    if (arrayPos>0)
                    {
                    var elimIndex = testArray[arrayPos-1]
                    var elim = false;
                    for (var d = 0;d<array_length_2d(meet_paths,elimIndex)&&!elim;d++)
                        {
                            if(meet_paths[elimIndex,d] == testArray[arrayPos])
                            {
                                elim = true;
                                meet_paths[elimIndex,d] = -1;
                                //print("Eliminated");
                            }
                        }
                        //reset test array
                        //print("Reset Test");
                        testArray = noone;
                        testArray[0] = pathDestination[4];
                        testArrayPoints = noone;
                        testArrayPoints[0,0] = pathDestination[5];
                        testArrayPoints[0,1] = -1; 
                        pathLengthTest = 0;
                        foundPath = false;
                        arrayPos = 0;
                    }
                    else
                    {
                        print("All possibles paths exhausted")
                        break;
                    }
                    
                }
                if(array_length_1d(testArray)>1000)
                {
                    print("INFINITE LOOP FAILSAFE TRIGGERED")
                    break;   
                }
            }
        }
    
    print(testArray);
    
    
}

print(possiblePaths);
print("Test Array Points");
print(testArrayPoints);
print("test array paths")

for (var a = 0;a< array_height_2d(instructionPath);a++)
{
    for (var b = 0;b<array_length_2d(instructionPath,a);b++)
    {
        if (instructionPath[a,b]>-1)
        {
        
            
            //print(path_points[instructionPath[a,b],4])
            
            
        
        }
    }
    
}

print("instructionPath")
print(instructionPath)
for (var a = 0;a< array_height_2d(instructionPath);a++)
{

    var left = "-1";
    var right = "-1";
    if (instructionPath[a,0]!=-1)
    {
        left = string(path_points[instructionPath[a,0],4])
        left = left + " "+string(path_points[instructionPath[a,0],0])+","+string(path_points[instructionPath[a,0],1])
    }
    if (instructionPath[a,1]!=-1)
    {
        right = string(path_points[instructionPath[a,1],4])
        right = right + " "+string(path_points[instructionPath[a,1],0])+","+string(path_points[instructionPath[a,1],1])
    }
    
    
    print("Left: "+left+" Right: "+right)
}


followingPathStep = array_height_2d(instructionPath);
midPoint = noone;

//cancels route if no match is found;
if (invalidPath)
{
    pathDestination = noone;
    nearestPath = noone
    destination[0] = noone;
    print("path Cancelled");
}

//set nearest path and next path point to the following paths. 

followingPathStep -=1;

if (nearestPath[4] == path_points[instructionPath[followingPathStep,0],4])
            {
                for (var a =0; a< 5;a++){pathDestination[a] = path_points[instructionPath[followingPathStep,0],a]}
            }
            else
            {
                for (var a =0; a< 5;a++){pathDestination[a] = path_points[instructionPath[followingPathStep,1],a]}            
            }

//check if the the second point in the instruction list is close
nearestPathDist = point_distance(x,y,nearestPath[0],nearestPath[1]);
nearestPointDist = point_distance(x,y,path_points[instructionPath[followingPathStep-1,0],0],path_points[instructionPath[followingPathStep-1,0],1])




/*
print("Go to close?");

if (validateGotoPath(x,y
,path_points[instructionPath[followingPathStep,0],0]
,path_points[instructionPath[followingPathStep,0],1],size))
{
//
for (var a =0; a< 5;a++){nearestPath[a] = path_points[instructionPath[followingPathStep,1],a]}
print("Go to closer Path")
followingPathStep -=1;
}
*/
/*

print("Path3 info")


//find the possible paths that can be taken from the starting path
transferPaths = "";
print("Current Path = "+ startPathName)



pathLength = path_get_length(nearestPath[3]);
    for (j = 0;j<array_length_2d(meet_paths,startPathID);j++)
    {
        var pathID = paths[meet_paths[startPathID,j]];
        transferPaths = transferPaths + path_get_name(pathID) +" "
        + string(pathDistance(nearestPath[3],
        nearestPath[2],
        path_points[meet_points[startPathID,j],2])
        )+" ";
        
        //print("Array Position: "+string(startPathID)+", "+string(j)+" v: "
        //+string(meet_points[startPathID,j]))
    }

print("Possible Transfer Paths: " +transferPaths)

//find the possible paths that can be taken from the ending path
transferPaths = "";
print("Target Path = "+ endPathName)

for (j = 0;j<array_length_2d(meet_paths,endPathID);j++)
    {
        transferPaths = transferPaths + path_get_name(paths[meet_paths[endPathID,j]]) +" "
    }

print("Possible Transfer Paths: " +transferPaths)



*/


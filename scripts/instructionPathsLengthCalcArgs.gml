//calculate path length. 
                            
                            //First find the paths of the previous values
                            previousPaths[0] = path_points[argument0[argument1-1,0],4]
                            if ( argument0[argument1-1,1] !=-1)
                            {
                                previousPaths[1] = path_points[argument0[argument1-1,1],4]
                            }
                            else
                            {
                                previousPaths[1] = -1
                            }
                            currentPaths[0] = path_points[argument0[argument1,0],4]
                            currentPaths[1] = path_points[argument0[argument1,1],4]
                            
                            //test which is the same as the current paths 
                            previousMatch = -1;
                            currentMatch = -1;
                            
                            for (var c = 0; c< array_length_1d(previousPaths);c++)
                            {
                                for (var d = 0; d< array_length_1d(currentPaths);d++)
                                {
                                    if (currentPaths[d] == previousPaths[c])
                                    {
                                        previousMatch = c;
                                        currentMatch = d;
                                    }
                                }
                            }
                            //if no match found end now
                            if (previousMatch == -1)
                            {
                                return 0;
                            }
                            //calculate the distance between the two points. 
                            else
                            {
                                return pathDistance(path_points[argument0[argument1,0],3],
                                path_points[argument0[argument1-1,previousMatch],2],
                                path_points[argument0[argument1,currentMatch],2])
                            }

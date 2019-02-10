//print choices
        

         
        
        var pathToFind = argument0[array_length_1d(argument0)-1]
        
        var pathFound = false;
        var cantFindPath = false;
        pathChoices[0] = 0;
        getMeetPathChoices(pathToFind)
        //check if any paths that can be accessed match the destination
    
        for (i = 0;i<array_length_1d(pathChoices)&&!pathFound;i++)
        {
            if (pathChoices[i] == startPathID)
            {
            print("found a match");
        
            pathFound = true;
            }
        }
        
        if (pathFound)//if it found a match then we can add the new path to the list
        {
            argument0[array_length_1d(argument0)]= path_get_name(paths[pathMatch]);
            print (argument0)
            return argument0;
        }
        else 
        
        {
            //if no match found pick a path from the end path and check if that one has any matches
            //check to see if any paths  match any on the current stack 
            //if all paths are on the stack then it is an invalid path
            for (var c = 0;c<array_length_1d(pathChoices);c++)
            {
                for(var d = 0; d<array_length_1d(argument0);d++)
                {
                    if (pathChoices[c] !=argument0[d])
                    {
                        argument0[array_length_1d(argument0)]
                        = path_get_name(paths[pathChoices[c]]);
                        print(argument0);
                        return calculatePath(argument0);
                    }
                }
            }
            cantFindPath = true;
            return -1;
             
        }

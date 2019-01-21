//For use only in pathfinding scripts
pathChoices= noone
pathChoices[0] = 0;
for (i = 0;i<array_length_2d(meet_paths,argument0);i++)
    {
    pathChoices[i] = meet_paths[argument0,i]
    }
print (pathChoices);

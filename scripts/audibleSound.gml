///audibleSound(x,y,volume)
//volume is the distance that the sound can be heard 
//it will be multiplied by the listeners hearing to check if they can hear


//first find all listeners
var i;
for (i = 0; i < instance_number(obj_listener); i += 1)
   {
        l = instance_find(obj_listener,i);
        distToSound = point_distance(argument0, argument1, l.x, l.y);
        //Check if the listener is within range
        if (distToSound < argument2*l.hearing)
        {
            l.lastHeardSound[0] = argument0
            l.lastHeardSound[1] = argument1
            //activate an event when sound is heard
            with (l)
            {
                event_user(0);
                
            }
        
        }
        
   }

var event_ID = argument0;

switch(event_ID){
    case 0:
    
    break;
    
    case 1:
        with(instance_create(7 * 32, 13 * 32, obj_dialogueEvent)){
            on_collision = false;
            repeatable = true;
            
            message[0] = "A small book has slipped through the space in the wall.";
            message[1] = chr(34) + "." + chr(34);
        }
    break;
}

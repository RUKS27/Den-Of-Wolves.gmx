var event_ID = argument0;

switch(event_ID){
    case 0:
        with(inst_doortoswitch){
            open = true;
        }
    break;
    
    case 1:
        instance_create(864, 1390, par_enemy);
        with(inst_doortostairs){
            open = true;
        }
    break;
}

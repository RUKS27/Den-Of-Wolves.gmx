var item_ID = argument0;

switch(item_ID){
    case 55:
        if(Health <= MaxHealth - 25) {
            Health += 25;
            return "successful"   
        }
        show_debug_message(Health);
    break;
}

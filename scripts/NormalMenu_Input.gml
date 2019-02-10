// Menu Selections
if(menu_item != 1){
    if(global.Down_Press){
        menu_item++;
    }
}
if(menu_item != 0){
    if(global.Up_Press){
        menu_item--;
    }
}
    
if(global.Confirm_Pressed) event_user(0);

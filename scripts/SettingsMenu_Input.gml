// Menu Selections

var BGMV = global.BGMVolume;
var SFXV = global.SFXVolume;

if(menu_item != 2){
    if(global.Down_Press){
        menu_item++;
    }
}
if(menu_item != 0){
    if(global.Up_Press){
        menu_item--;
    }
}

switch(menu_item){
    case 0:
        if(global.Left_Press && BGMV != 0) BGMV-=10;
        else if (global.Right_Press && BGMV != 100) BGMV+=10;
        
        global.BGMVolume = BGMV;
    break;
    
    case 1:
        if(global.Left_Press && SFXV != 0) SFXV-=10;
        else if (global.Right_Press && SFXV != 100) SFXV+=10;
        
        global.SFXVolume = SFXV;
    break;
}
    
if(global.Confirm_Pressed) event_user(0);

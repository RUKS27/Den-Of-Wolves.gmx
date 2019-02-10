// Menu Selections

var BGMV = global.BGMVolume;
var SFXV = global.SFXVolume;

if(global.Cancel_Pressed){
    m_screen = 0;
}

if(menu_item != 0){
    if(global.Up_Pressed){
    menu_item--;
    }
}

if(window_get_fullscreen()){
    if(menu_item != 2){
        if(global.Down_Pressed){
            menu_item++;
        }
    }
} else {
    if(menu_item != 5){
        if(global.Down_Pressed){
            menu_item++;
        }
    }
}

switch(menu_item){
    case 0:
        if(global.Left_Pressed && BGMV != 0) BGMV-=10;
        else if (global.Right_Pressed && BGMV != 100) BGMV+=10;
        
        global.BGMVolume = BGMV;
    break;
    
    case 1:
        if(global.Left_Pressed && SFXV != 0) SFXV-=10;
        else if (global.Right_Pressed && SFXV != 100) SFXV+=10;
        
        global.SFXVolume = SFXV;
    break;
}
    
if(global.Confirm_Pressed) event_user(0);

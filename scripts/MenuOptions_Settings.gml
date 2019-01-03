var hlS = argument0;

var mw = global.view_midw;
var mh = global.view_midh;

// Two sliders, BGM and SFX
draw_set_color(c_black);
draw_rectangle(mw - 128, mh - 32, mw + 128, mh, false);
draw_set_color(make_colour_rgb(150, 0, 0));
draw_rectangle(mw - 126, mh - 30, (mw - 126) + (global.BGMVolume * 2.52), mh - 2, false);

draw_set_color(c_black);
draw_rectangle(mw - 128, mh + 32, mw + 128, mh + 64, false);
draw_set_color(make_colour_rgb(150, 0, 0));
draw_rectangle(mw - 126, mh + 34, (mw - 126) + (global.SFXVolume * 2.52), mh + 62, false);

// Draw one button: Return
if(menu_item = 0){
    draw_set_color(c_white);
    draw_text(mw - 192, mh - 32, "BGM");
    
    draw_set_color(c_dkgray);
    draw_text(mw - 192, mh + 32, "SFX");
    draw_text(mw - 64, mh + 96, "Return");
} else if (menu_item = 1){
    draw_set_color(c_white);
    draw_text(mw - 192, mh + 32, "SFX");

    draw_set_color(c_dkgray);
    draw_text(mw - 192, mh - 32, "BGM");
    draw_text(mw - 64, mh + 96, "Return");
} else if (menu_item = 2){
    draw_set_color(c_dkgray);
    draw_text(mw - 192, mh - 32, "BGM");
    draw_text(mw - 192, mh + 32, "SFX");
    
    draw_set_color(c_white);
    draw_text(mw - 64, mh + 96, "Return");
}

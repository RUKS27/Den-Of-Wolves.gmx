// Highlighted selection
var hlS = argument0;

var mw = global.view_midw;
var mh = global.view_midh;

var newGame = "New Game";
var settings = "Settings";

draw_set_font(f_menu);

if(hlS = 0) {
    draw_set_color(c_white);
    draw_text(mw - 64, mh - 64, newGame);
    draw_set_color(c_dkgray);
    draw_text(mw - 64, mh, settings);
} else if(hlS = 1) {
    draw_set_color(c_dkgray);
    draw_text(mw - 64, mh - 64, newGame);
    draw_set_color(c_white);
    draw_text(mw - 64, mh, settings);
}

draw_set_color(c_white);

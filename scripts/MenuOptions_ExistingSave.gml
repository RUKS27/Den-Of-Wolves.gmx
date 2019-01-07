// Highlighted selection
var hlS = argument0;

var mw = global.view_midw;
var mh = global.view_midh;

var cont = "Continue";
var delete = "delete";

draw_set_font(f_menu);

if(hlS = 0) {
    draw_set_color(c_white);
    draw_text(mw - 64, mh - 64, cont);
    draw_set_color(c_dkgray);
    draw_text(mw - 64, mh, delete);
} else if(hlS = 1) {
    draw_set_color(c_dkgray);
    draw_text(mw - 64, mh - 64, cont);
    draw_set_color(c_white);
    draw_text(mw - 64, mh, delete);
}

draw_set_color(c_white);

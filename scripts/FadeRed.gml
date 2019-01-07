var color = make_colour_rgb(200, 0, 0);

if(global.FadeR) {
    if(Attack) a = delay / 100;
} else if(a > 0) a-=0.1;

draw_set_alpha(a);
draw_set_color(color);
draw_rectangle(view_xport, view_yport, view_wport, view_hport, false);
draw_set_alpha(1);
draw_set_color(c_white);

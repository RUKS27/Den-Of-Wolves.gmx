var enemy = argument0;

var mw = global.view_midw;
var mh = global.view_midh;

draw_set_color(c_black);
draw_rectangle(mw - 176, mh + 64, mw + 160, mh - 32, false);

draw_set_color(c_dkgray);
draw_rectangle(mw - 32, mh + 64, mw, mh - 32, false);

pos = clamp(pos + 10, -160, 160);

draw_set_color(c_red);
draw_rectangle(mw - pos, mh + 64, mw - (pos + 16), mh - 32, false);

var stop = false;
var inRange = false;

var retVal = "";

if(!stop){
    if(pos >= -16 && pos <= 32){
        show_debug_message("Press X");
        inRange = true;
    } else if(pos = 160){
        stop = true;
        retVal = "botched";
    } else {
        inRange = false;
    }
    
    if(global.Attack_Press){
        if(inRange){
            retVal = "success";
        } else {
            retVal = "failure";
        }
        
        stop = true;
    }
}

if(stop){ 
    p_state = p_states.normal;
    return retVal;
}

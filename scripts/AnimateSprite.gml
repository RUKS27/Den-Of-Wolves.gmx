var animation_start = argument0;
var animation_end = argument1;
var timer = argument2;

if(a_sub <= animation_end){
    a_delay++;    

    if(a_delay >= timer){
        a_sub++;
        a_delay = 0;
    }    
} else {
    a_sub = animation_start;
}

show_debug_message(a_delay);
show_debug_message(a_sub);
return a_sub;

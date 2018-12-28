var m_array = argument0;

with(instance_create(x, y, obj_dialogue)){
    for(l = 0; l < array_length_1d(m_array); l++){
        message[l] = m_array[l];
    }
    
    if(message = m_array){
        message_current = 0;
        message_end = array_length_1d(message);
        message_draw = "";
        increase = 0.5;
        characters = 0;
        hold = 0;
        
        message_length = string_length(message[message_current]);
    }
}

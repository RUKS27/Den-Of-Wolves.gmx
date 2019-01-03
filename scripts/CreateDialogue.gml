var m_array = argument0;

with(instance_create(x, y, obj_dialogue)){
    for(l = 0; l < array_length_1d(m_array); l++){
        message[l] = m_array[l];
    }
}

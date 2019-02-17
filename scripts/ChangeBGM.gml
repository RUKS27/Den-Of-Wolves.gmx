var track = argument0;

if(global.BGM != track){
    if(audio_sound_get_gain(global.BGM) > 0){
        audio_sound_gain(global.BGM, 0, 5);
    }
    
    if(audio_sound_get_gain(global.BGM) = 0){
        global.BGM = track;
    }
}

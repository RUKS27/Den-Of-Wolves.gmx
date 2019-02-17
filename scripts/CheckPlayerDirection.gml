var object = argument0 

var player = obj_player;

var xRange_l = (object.x);
var xRange_r = (object.x);

var yRange_u = (object.y);
var yRange_d = (object.y);

if(player.x >= xRange_r && player.p_dir = p_dirs.left) || 
  (player.x <= xRange_l && player.p_dir = p_dirs.right) {
    return true;
} else if(player.y >= yRange_d && player.p_dir = p_dirs.forward) || 
         (player.y <= yRange_u && player.p_dir = p_dirs.down){
    return true;
} else {
    return false;
}

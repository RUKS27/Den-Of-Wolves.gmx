mSpd = 3;

xSpd = (RightMove - LeftMove) * mSpd; 
ySpd = 0;

if(!noClip){
    // Collision Detection
    if place_meeting(x+xSpd, y, par_wall)
    {
        repeat(abs(xSpd)){
            if !place_meeting(x+sign(xSpd),y,par_wall)
            {
                   x+=sign(xSpd);
            } else {
                break;
            }
        }
        
        xSpd=0;
    }
    
    if place_meeting(x, y+ySpd, par_wall)
    {
        repeat(abs(ySpd)){
            if !place_meeting(x,y+sign(ySpd),par_wall)
            {
                y+=sign(ySpd);
            } else {
                break;
            }
        }
        ySpd=0;
    }
}

// Move Player Along The Axes
x += xSpd;
y += ySpd;

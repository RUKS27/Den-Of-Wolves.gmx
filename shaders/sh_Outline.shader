//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;
void main()
{
    vec2 offsetx = vec2(pixelW, 0);
    vec2 offsety = vec2(0, pixelH);
 
    float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
 
    alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a);
    alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a);
    alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord + offsety).a);
    alpha = max(alpha, texture2D(gm_BaseTexture, v_vTexcoord - offsety).a);
    
    float Red = 1.0;
    float Green = 0.0;
    float Blue = 0.0;
    
    vec4 Color = vec4(Red, Green, Blue, alpha);   
    
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor.a = alpha;
    gl_FragColor.r = Red;
    gl_FragColor.g = Green;
    gl_FragColor.b = Blue;
}

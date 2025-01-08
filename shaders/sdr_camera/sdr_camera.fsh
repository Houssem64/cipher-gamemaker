// Fragment shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float brightness;     // -1.0 to 1.0
uniform float contrast;       // 0.0 to 2.0
uniform vec3 tint;           // RGB color
uniform float tint_strength; // 0.0 to 1.0

void main()
{
    vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
    
    // Apply effects
    vec3 color = base_col.rgb;
    
    // Brightness
    color += brightness;
    
    // Contrast
    color = (color - 0.5) * contrast + 0.5;
    
    // Tint
    color = mix(color, color * tint, tint_strength);
    
    // Clamp values
    color = clamp(color, 0.0, 1.0);
    
    gl_FragColor = vec4(color, base_col.a);
}
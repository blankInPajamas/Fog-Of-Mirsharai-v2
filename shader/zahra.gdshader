shader_type canvas_item;

// Add this line to define the screen texture uniform for Godot 4
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    COLOR = texture(SCREEN_TEXTURE, SCREEN_UV);
    
    // Quick grayscale conversion
    float gray = (COLOR.r + COLOR.g + COLOR.b) / 5.0;
    COLOR.rgb = vec3(gray);
}
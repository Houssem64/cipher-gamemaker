draw_set_font(fnt_avatar) 

current_pulse += pulse_speed;
var pulse = lerp(pulse_min, pulse_max, (sin(0.02) + 1) / 2);

// Calculate dimensions with smaller sizes
var panel_padding = 10;  // Reduced padding
var avatar_scale = 0.07;  // Smaller avatar
var scaled_width = sprite_get_width(spr_ai_companion) * avatar_scale;
var scaled_height = sprite_get_height(spr_ai_companion) * avatar_scale;
var text_width = 150;  // Smaller text area
var total_width = scaled_width + panel_padding * 3 + text_width;

// Draw background panel
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(
    x, 
    y, 
    x + total_width, 
    y + scaled_height + panel_padding * 2, 
    false
);

// Calculate avatar position
var avatar_x = x + panel_padding;
var avatar_y = y + panel_padding;

// Draw glow effect
gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_ai_companion, 0, avatar_x, avatar_y, 
                avatar_scale, avatar_scale, 0, c_aqua, glow_alpha * pulse);
gpu_set_blendmode(bm_normal);

// Draw main sprite
draw_sprite_ext(spr_ai_companion, 0, avatar_x, avatar_y, 
                avatar_scale, avatar_scale, 0, c_white, 1);

// Draw message if talking
if (current_message != "") {
    var msg_x = x + scaled_width + panel_padding * 2;
    var msg_y = y + panel_padding;
    
    draw_set_alpha(text_alpha);
    draw_set_color(c_aqua);
    var displayed_text = string_copy(current_message, 1, char_index);
    draw_text_ext(msg_x, msg_y, displayed_text, 15, text_width);  // Smaller line height
}

draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
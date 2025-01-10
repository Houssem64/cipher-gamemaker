// Draw main keypad background
draw_set_font(fnt_keypad)
draw_set_color(c_black);
draw_rectangle(x, y, x + keypad_width, y + keypad_height, false);

// Draw screen background
draw_set_color(c_aqua);
draw_rectangle(x + 5, y + 5, x + keypad_width - 5, y + 25, false);

// Draw input on screen
draw_set_color(c_black);
var display_text = "";
for(var i = 0; i < array_length(input); i++) {
    display_text += "*";
}
draw_text(x + 5, y+5 , display_text);
draw_set_color(c_white)
// Draw feedback message if timer is active
if (message_timer > 0) {
    draw_text(x -15, y - 30, _message);
    message_timer--;
}

// Draw number buttons
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for(var i = 0; i < 9; i++) {
    var row = i div 3;
    var col = i mod 3;
    
    var btn_x = x + 5 + col * (button_width + padding);
    var btn_y = y + 30 + row * (button_height + padding);
    
    // Button background
    draw_set_color(c_gray);
    draw_rectangle(btn_x, btn_y, btn_x + button_width, btn_y + button_height, false);
    
    // Button border
    draw_set_color(c_black);
    draw_rectangle(btn_x, btn_y, btn_x + button_width, btn_y + button_height, true);
    
    // Number
    draw_set_color(c_white);
    draw_text(btn_x + button_width/2, btn_y + button_height/2, string(i + 1));
}

// Draw Submit button
var submit_x = x + 5;
var submit_y = y + keypad_height - button_height - 5;
draw_set_color(c_green);
draw_rectangle(submit_x, submit_y, submit_x + button_width, submit_y + button_height, false);
draw_set_color(c_black);
draw_rectangle(submit_x, submit_y, submit_x + button_width, submit_y + button_height, true);
draw_set_color(c_white);
draw_text(submit_x + button_width/2, submit_y + button_height/2, "✓");

// Draw Reset button
var reset_x = x + keypad_width - button_width - 5;
var reset_y = y + keypad_height - button_height - 5;
draw_set_color(c_red);
draw_rectangle(reset_x, reset_y, reset_x + button_width, reset_y + button_height, false);
draw_set_color(c_black);
draw_rectangle(reset_x, reset_y, reset_x + button_width, reset_y + button_height, true);
draw_set_color(c_white);
draw_text(reset_x + button_width/2, reset_y + button_height/2, "X");

// Reset text alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Debug visualization
if (debug) {
    draw_set_alpha(0.3);
    draw_set_color(c_lime);
    draw_rectangle(x, y, x + keypad_width, y + keypad_height, true);
    draw_set_alpha(1);
}
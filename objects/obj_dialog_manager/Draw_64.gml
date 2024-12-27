// Draw box
draw_set_color(c_lime);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);

// Draw background
draw_set_color(c_black);
draw_rectangle(box_x + 1, box_y + 1, box_x + box_width - 1, box_y + box_height - 1, false);

draw_sprite_ext(
    spr_space,           // sprite
    image_index,         // image index
    box_x + box_width -100, // x position
    box_y + box_height -50, // y position
    2,                   // x scale (2 = twice as big)
    2,                   // y scale (2 = twice as big)
    0,                   // rotation
    c_white,            // color
    1                   // alpha
);
// Draw text
draw_set_color(c_lime);
draw_set_font(font_dialog);
draw_text_ext(
    box_x + padding,
    box_y + padding,
    text_current,
    string_height("M") * 1.5,
    box_width - (padding * 2)
);
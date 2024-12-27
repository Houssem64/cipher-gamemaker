// Draw box
draw_set_color(c_lime);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);

// Draw background
draw_set_color(c_black);
draw_rectangle(box_x + 1, box_y + 1, box_x + box_width - 1, box_y + box_height - 1, false);

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
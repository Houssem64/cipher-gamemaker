// Draw the guard
draw_self();

// Draw the detection cone (for debugging)
draw_set_color(c_red);
draw_line(x, y, x + lengthdir_x(detection_range, direction - detection_angle / 2), y + lengthdir_y(detection_range, direction - detection_angle / 2));
draw_line(x, y, x + lengthdir_x(detection_range, direction + detection_angle / 2), y + lengthdir_y(detection_range, direction + detection_angle / 2));
draw_set_color(c_white);
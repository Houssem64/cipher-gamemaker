if (debug) {
    draw_set_alpha(0.2);
    draw_set_color(c_red);
    draw_circle(x, y, detection_range, false);
    
    var cone_dir1 = direction - detection_angle/2;
    var cone_dir2 = direction + detection_angle/2;
    draw_line(x, y, x + lengthdir_x(detection_range, cone_dir1), 
              y + lengthdir_y(detection_range, cone_dir1));
    draw_line(x, y, x + lengthdir_x(detection_range, cone_dir2), 
              y + lengthdir_y(detection_range, cone_dir2));
    
    draw_set_alpha(1);
}
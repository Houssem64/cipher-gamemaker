draw_self();

// Always show debug visuals for testing
draw_set_color(c_red);
draw_circle(x, y, detection_range, true);

// Draw patrol path
draw_set_color(c_yellow);
for (var i = 0; i < array_length(patrol_points); i++) {
    // Draw point
    draw_circle(patrol_points[i].x, patrol_points[i].y, 5, false);
    
    // Draw line to next point
    var next = (i + 1) % array_length(patrol_points);
    draw_line(
        patrol_points[i].x, 
        patrol_points[i].y, 
        patrol_points[next].x, 
        patrol_points[next].y
    );
}

// Draw current target point
draw_set_color(c_lime);
draw_circle(patrol_points[current_point].x, patrol_points[current_point].y, 8, true);

// Draw debug info
draw_set_color(c_white);
draw_text(x, y - 40, 
    "State: " + string(state) + "\n" +
    "Point: " + string(current_point) + "\n" +
    "Speed: " + string(spd)
);
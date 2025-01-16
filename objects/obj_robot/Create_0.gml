// Movement and detection
spd = 0.5;
detection_range = 150;
detection_angle = 90;
projectile_speed = 1;

xspd = 0
yspd = 0

// Patrol points (manually set coordinates)
patrol_points = [
    {x: x + 50, y: y},      // Right
    {x: x + 50, y: y - 100},// Down-right
    {x: x, y: y - 100},      // Down
    {x: x, y: y}             // Back to start
];
current_point = 0;
point_threshold = 5;

// State
enum RobotState {
    PATROL,
    ALERT
}
state = RobotState.PATROL;

// Combat
detection_timer = 0;
shoot_delay = room_speed / 6;

// Animation
sprite_index = spr_robot_idle;

// Debug
show_debug_message("Robot created at: " + string(x) + ", " + string(y));
show_debug_message("Number of patrol points: " + string(array_length(patrol_points)));
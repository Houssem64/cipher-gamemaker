// Guard properties
path = path_guard;
patrol_speed = 0.7;
chase_speed = patrol_speed * 2; // Double speed when chasing
detection_range = 100;
detection_angle = 45;
detection_timer = 0;
alarm_sound = snd_alarm;

move_speed = 2; // Or whatever speed value you want
move_direction = 0; // Make sure this is initialized too
// State machine
enum GuardState {
    PATROLLING,
    ALERT
   
}
projectile_speed = 8; // Set this to whatever speed you want the projectiles to move at

state = GuardState.PATROLLING;
path_speed = patrol_speed;


// Start patrolling
path_start(path, patrol_speed, path_action_restart, true);
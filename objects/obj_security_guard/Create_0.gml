//// Guard properties
//path = path_guard; // Assign a predefined path (create this in the path editor)
//speed = 1; // Movement speed along the path
//detection_range = 100; // Length of the detection cone
//detection_angle = 45; // Angle of the detection cone (in degrees)
//detection_timer = 0; // Tracks how long the player has been spotted
//player_spotted = false; // Tracks if the player is currently spotted
//alarm_sound = snd_alarm; // Sound to play when the player is spotted

//// Start the guard on the path
//path_start(path, speed, path_action_continue, true);

// Guard properties
path = path_guard; // Assign a predefined path (create this in the path editor)
speed = 0.7; // Movement speed along the path
detection_range = 100; // Length of the detection cone
detection_angle = 45; // Angle of the detection cone (in degrees)
detection_timer = 0; // Tracks how long the player has been spotted
alarm_sound = snd_alarm; // Sound to play when the player is spotted

// State machine
enum GuardState {
    PATROLLING,
    ALERT,
    CHASING
}
state = GuardState.PATROLLING; // Start in the patrolling state

// Start the guard on the path
// Start the guard on the path (loop continuously)
path_start(path, speed, path_action_restart, true);
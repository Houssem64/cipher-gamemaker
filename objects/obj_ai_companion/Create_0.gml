// Position and size
margin = 5;
width = sprite_get_width(spr_ai_companion);  // Your neon avatar sprite
height = sprite_get_height(spr_ai_companion);
// Add this to your existing Create Event
text_scale = 0.5;  // Scale for text size
// Message system
current_message = "";
message_queue = ds_queue_create();
is_talking = false;
char_index = 0;
char_speed = 0.5;
text_alpha = 1;

// Glow effect
glow_alpha = 0.2;
pulse_speed = 0.02;
pulse_min = 0.8;
pulse_max = 1;
current_pulse = 0;

// Add these functions to the Create event
function add_messages(msg) {
    ds_queue_enqueue(message_queue, msg);
}

function add_hint(hint) {
    current_state = AI_STATE.THINKING;
    add_messages("HINT: " + hint);
}

function add_mission(mission) {
    current_state = AI_STATE.ALERT;
    add_messages("NEW MISSION: " + mission);
}


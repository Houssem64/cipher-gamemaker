// Check number buttons
for(var i = 0; i < 9; i++) {
    var row = i div 3;
    var col = i mod 3;
    
    var btn_x = x + 5 + col * (button_width + padding);
    var btn_y = y + 30 + row * (button_height + padding);
    
    if (point_in_rectangle(mouse_x, mouse_y, 
        btn_x, btn_y, 
        btn_x + button_width, btn_y + button_height)) {
        if (array_length(input) < max_digits) {
            array_push(input, i + 1);
        }
        exit;
    }
}

// Check Submit button
var submit_x = x + 5;
var submit_y = y + keypad_height - button_height - 5;
if (point_in_rectangle(mouse_x, mouse_y,
    submit_x, submit_y,
    submit_x + button_width, submit_y + button_height)) {
    
    if (array_length(input) == max_digits) {
        // Check combination
        var correct = true;
        for(var i = 0; i < max_digits; i++) {
            if (input[i] != current_combination[i]) {
                correct = false;
                break;
            }
        }
        
        if (correct) {
            _message = "CORRECT!";
            message_timer = message_duration;
            
            // Open the door
            if (instance_exists(obj_double_door)) {
                obj_double_door.openable = true;
            }
            
            // Optional: Play success sound
             audio_play_sound(snd_success, 1, false);
        } else {
            _message = "WRONG!";
            message_timer = message_duration;
            input = [];
            
            // Optional: Play error sound
            audio_play_sound(snd_keypad_wrong, 1, false);
        }
    } else {
        _message = "INCOMPLETE";
        message_timer = message_duration;
		 audio_play_sound(snd_keypad_wrong, 1, false);
    }
    exit;
}

// Check Reset button
var reset_x = x + keypad_width - button_width - 5;
var reset_y = y + keypad_height - button_height - 5;
if (point_in_rectangle(mouse_x, mouse_y,
    reset_x, reset_y,
    reset_x + button_width, reset_y + button_height)) {
    input = [];
    exit;
}
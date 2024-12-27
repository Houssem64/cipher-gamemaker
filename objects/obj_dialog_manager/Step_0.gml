

// Update text display

//if (char_current < text_length + 1) {
//    char_current += char_speed;
//    text_current = string_copy(text, 1, floor(char_current));
    
//    // Create effect for new character
//    if (floor(char_current) != floor(char_current - char_speed)) {
//        var latest_char_x = string_width(string_copy(text_current, 1, string_length(text_current) - 1));
//        var effect = instance_create_layer(
//            box_x + padding + latest_char_x,
//            box_y + padding,
//            "Effects",
//            obj_text_effect
//        );
//        effect.text = string_char_at(text_current, string_length(text_current));
//    }
//} else {
//    text_finished = true;
	
	
//}

if (char_current < text_length + 1) {
    char_current += char_speed;
    text_current = string_copy(text, 1, floor(char_current));
    
    if (floor(char_current) != floor(char_current - char_speed)) {
        var latest_char_x = string_width(string_copy(text_current, 1, string_length(text_current) - 1));
        var effect = instance_create_layer(
            box_x + padding + latest_char_x,
            box_y + padding,
            "Effects",
            obj_text_effect
        );
        effect.text = string_char_at(text_current, string_length(text_current));
		audio_play_sound(dialog_sound, 1, false);
    }
} else {
    text_finished = true;
}

if (keyboard_check_pressed(vk_space)) {
    if (text_finished) {
        text_array_pos++;
        load_next_text();
    } else {
        // Skip to end of current text
        char_current = text_length;
        text_current = text;
        text_finished = true;
    }
}

//// Input handling
//if (keyboard_check_pressed(vk_space)) {
//    show_debug_message("Space pressed: " + string(text_current)); // Debug message
//    if (text_finished) {
//        text_array_pos++;
//		  load_next_text(); // Use the load_next_text function here
//      if (text_array_pos < array_length(text_array)) {
//    text = text_array[text_array_pos];
//    text_length = string_length(text);
//    text_current = "";
//    char_current = 1;
//    text_finished = false;
//} else {
//    // Execute callback before destroying
//    if (callback_object != noone && instance_exists(callback_object)) {
//        if (callback_script != noone) {
//            with (callback_object) {
//                method(id, other.callback_script)();
//            }
//        }
//    }
//    instance_destroy();
//}
//    } else {
//        char_current = text_length;
//        text_current = text;
//        text_finished = true;
//    }
//}

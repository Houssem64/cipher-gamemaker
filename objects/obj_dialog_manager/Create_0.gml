// In Create Event of obj_dialog_manager
font_dialog = font_add("cour.ttf",20, false, false, 32, 128);
text = "";
text_current = "";
text_length = 0;
char_current = 1;
char_speed = 0.25;
text_array = [];
text_array_pos =0;
text_finished = false;
padding = 20;

box_width = display_get_gui_width() * 0.7;
box_height = display_get_gui_height() * 0.2;
box_x = (display_get_gui_width() - box_width) / 2;
box_y = display_get_gui_height() - box_height - padding;




// Create the popup/sprite



text_length = string_length(text);

callback_object = noone;  // Object to notify when dialog ends
callback_script = noone;  // Script to run when dialog ends


// Function for starting dialog
function start_dialog(dialog_array) {
    text_array = dialog_array;
    text_array_pos = 0; 
    text_finished = false;
	
   
    load_next_text();     // Load first message
}
function load_next_text() {
	if (string_length(text_current) > 0) {
    var latest_char_x = string_width(string_copy(text_current, 1, string_length(text_current) - 1));
} else {
    var latest_char_x = 0;
}

	
    if (text_array_pos < array_length(text_array)) {
        text = text_array[text_array_pos];
        text_length = string_length(text);
        text_current = "";
        char_current = 1;
        text_finished = false;
    } else {
        // Execute callback before destroying
        if (callback_object != noone && instance_exists(callback_object)) {
            if (callback_script != noone) {
                with (callback_object) {
                    script_execute(other.callback_script);
                }
            }
        }
        instance_destroy();
    }
}








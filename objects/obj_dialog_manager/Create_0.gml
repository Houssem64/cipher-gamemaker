// In Create Event of obj_dialog_manager
font_dialog = font_add("cour.ttf",20, false, false, 32, 128);
text = "";
text_current = "";
text_length = 0;
char_current = 1;
char_speed = 0.25;
text_array = [];
text_array_pos = 0;
text_finished = false;
padding = 20;
box_width = display_get_gui_width() * 0.7;
box_height = display_get_gui_height() * 0.2;
box_x = (display_get_gui_width() - box_width) / 2;
box_y = display_get_gui_height() - box_height - padding;


text = "First message test"; // Debug message to verify system
text_length = string_length(text);








// Function for starting dialog
function start_dialog(dialog_array) {
    text_array = dialog_array;
    text_array_pos = 0;
    // Initialize the first text immediately
    text = text_array[0];
    text_length = string_length(text);
    text_current = "";
    char_current = 1;
    text_finished = false;
}

// Function for loading next text
function load_next_text() {
    if (text_array_pos < array_length(text_array)) {
        text = text_array[text_array_pos];
        text_length = string_length(text);
        text_current = "";
        char_current = 1;
        text_finished = false;
    } else {
        instance_destroy();
    }
}
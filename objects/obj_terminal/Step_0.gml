var current_time1 = get_timer();
var elapsed_microseconds = current_time1 - global.terminal_start_time;
var elapsed_seconds = floor(elapsed_microseconds / 1000000);

global.hours = floor(elapsed_seconds / 3600);
global.minutes = floor((elapsed_seconds % 3600) / 60);
global.seconds = elapsed_seconds

//scrollbar

// Set the custom font
draw_set_font(font);

// Calculate total height of text with current font
total_height = string_height_ext(outputBuffer + inputBuffer, -1, room_width - 20 - scrollbar_width);

// Determine content height (maximum of total height or room height)
content_height = max(total_height, room_height);

// Calculate visible ratio (how much of the content is visible)
visible_ratio = min(1, room_height / content_height);

// Calculate scrollbar height based on visible ratio
scrollbar_height = max(30, room_height * visible_ratio);

// Calculate maximum scrollable distance
max_scroll = max(0, total_height - room_height + 20);

// Calculate scrollbar position based on current scroll position
scrollbar_y = (scroll_position / max_scroll) * (room_height - scrollbar_height);
if (max_scroll == 0) scrollbar_y = 0; // Ensure scrollbar_y is 0 if there's no scrollable content


// Mouse interaction with scrollbar
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var scrollbar_area = (mx >= room_width - scrollbar_width && mx <= room_width);

if (scrollbar_area) {
    scrollbar_hover = true;
    if (mouse_check_button_pressed(mb_left)) {
        scrollbar_dragging = true;
    }
} else {
    scrollbar_hover = false;
}

if (mouse_check_button_released(mb_left)) {
    scrollbar_dragging = false;
}

if (scrollbar_dragging && max_scroll > 0) {
    var new_y = clamp(my - scrollbar_height/2, 0, room_height - scrollbar_height);
    scroll_position = (new_y / (room_height - scrollbar_height)) * max_scroll;
    scroll_position = clamp(scroll_position, 0, max_scroll);
}

// Mouse wheel scrolling
if (mouse_wheel_up()) {
    scroll_position = max(scroll_position - scroll_speed, 0);
}
if (mouse_wheel_down()) {
    scroll_position = min(scroll_position + scroll_speed, max_scroll);
}

// Keyboard scrolling (preserved from previous version)
if (keyboard_check_pressed(vk_pageup)) {
    scroll_position = max(scroll_position - max_lines_visible * line_height, 0);
}
if (keyboard_check_pressed(vk_pagedown)) {
    scroll_position = min(scroll_position + max_lines_visible * line_height, max_scroll);
}
if (keyboard_check_pressed(vk_up)) {
    scroll_position = max(scroll_position - scroll_speed, 0);
}
if (keyboard_check_pressed(vk_down)) {
    scroll_position = min(scroll_position + scroll_speed, max_scroll);
}






if (!bootComplete && alarm[1] <= 0) {
    if (bootIndex < ds_list_size(bootMessages)) {
        outputBuffer += bootMessages[|bootIndex] + "\n";
        bootIndex++;
        alarm[1] = bootDelay;
    } else {
        bootComplete = true;
        outputBuffer = promptSymbol;
        keyboard_string = "";
        cursorPosition = 0;
        inputBuffer = "";
    }
}


if (keyboard_check_pressed(vk_enter)) {
    var cmd = string_trim(inputBuffer);
    if (cmd != "") {
        ds_list_add(commandHistory, cmd);
        historyPosition = ds_list_size(commandHistory);
        processCommand(cmd);
    }
    inputBuffer = "";
    cursorPosition = 0;
    outputBuffer += "\n" + promptSymbol;
}

// Sound to play on keypress

if (keyboard_check_pressed(vk_anykey)) {
    audio_play_sound(key_sound, 1, false);
}




// Variables to track backspace timing
if (!variable_global_exists("backspaceTimer")) {
    global.backspaceTimer = 0;
}
if (!variable_global_exists("backspaceDelay")) {
    global.backspaceDelay = 5; // Adjust this value for delay between deletions
}

// Handle backspace
if (keyboard_check(vk_backspace) && cursorPosition > 0) {
    // Decrease the timer if it's greater than 0
    if (global.backspaceTimer > 0) {
        global.backspaceTimer--;
    } else {
        // Perform deletion
        inputBuffer = string_delete(inputBuffer, cursorPosition, 1);
        cursorPosition--;
        // Reset the timer
        global.backspaceTimer = global.backspaceDelay;
    }
} else {
    // Reset the timer if backspace is not held
    global.backspaceTimer = 0;
}


//// Handle backspace
//if (keyboard_check_pressed(vk_backspace)  && cursorPosition > 0) {
//    inputBuffer = string_delete(inputBuffer, cursorPosition, 1);
//    cursorPosition--;
//}

// Handle arrow keys for history
if (keyboard_check_pressed(vk_up) && historyPosition > 0) {
    historyPosition--;
    inputBuffer = commandHistory[|historyPosition];
    cursorPosition = string_length(inputBuffer);
}

if (keyboard_check_pressed(vk_down)) {
    if (historyPosition < ds_list_size(commandHistory) - 1) {
        historyPosition++;
        inputBuffer = commandHistory[|historyPosition];
    } else {
        historyPosition = ds_list_size(commandHistory);
        inputBuffer = "";
    }
    cursorPosition = string_length(inputBuffer);
}

// Handle text input
if (keyboard_string != "") {
    inputBuffer = string_insert(keyboard_string, inputBuffer, cursorPosition + 1);
    cursorPosition += string_length(keyboard_string);
    keyboard_string = "";
}
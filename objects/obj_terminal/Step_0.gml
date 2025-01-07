// Inherit the window's step event
event_inherited();

// Terminal-specific logic
var default_font = draw_get_font();

// Calculate elapsed time since terminal started
var current_time1 = get_timer();
var elapsed_microseconds = current_time1 - global.terminal_start_time;
var elapsed_seconds = floor(elapsed_microseconds / 1000000);
global.hours = floor(elapsed_seconds / 3600);
global.minutes = floor((elapsed_seconds % 3600) / 60);
global.seconds = elapsed_seconds;


// Calculate text dimensions
var line_height = string_height("M");  // Height of a single line
var display_text = outputBuffer + (bootComplete ? inputBuffer : "");
var num_lines = string_count("\n", display_text) + 1;

// Calculate total content height
total_height = num_lines * line_height;

// Calculate visible area
var visible_height = height - 40;  // Subtract padding/margins
max_lines_visible = floor(visible_height / line_height);

// Calculate maximum scroll
max_scroll = max(0, total_height - visible_height);

// Ensure scroll position stays within bounds
scroll_position = clamp(scroll_position, 0, max_scroll);

// Scrollbar calculations
var min_scrollbar_height = 30;  // Minimum scrollbar height in pixels
if (total_height > visible_height) {
    // Calculate scrollbar proportions
    var visible_ratio = visible_height / total_height;
    scrollbar_height = max(min_scrollbar_height, visible_height * visible_ratio);
    
    // Calculate scrollbar position
    var available_scroll_space = visible_height - scrollbar_height;
    scrollbar_y = (scroll_position / max_scroll) * available_scroll_space;
} else {
    // Content fits within view
    scrollbar_height = visible_height;
    scrollbar_y = 0;
}

// Mouse interaction with scrollbar
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var scrollbar_x = x + width - scrollbar_width;
var scrollbar_area = (mx >= scrollbar_x && mx <= x + width);

// Handle scrollbar hover and dragging
if (scrollbar_area && my >= y + 30 && my <= y + height - 10) {
    scrollbar_hover = true;
    if (mouse_check_button_pressed(mb_left)) {
        scrollbar_dragging = true;
        drag_offset = my - (y + 30 + scrollbar_y);
    }
} else {
    scrollbar_hover = false;
}

if (mouse_check_button_released(mb_left)) {
    scrollbar_dragging = false;
}

// Update scroll position when dragging
if (scrollbar_dragging && max_scroll > 0) {
    var available_scroll_space = visible_height - scrollbar_height;
    var mouse_y_relative = my - (y + 30) - drag_offset;
    var scroll_ratio = clamp(mouse_y_relative / available_scroll_space, 0, 1);
    scroll_position = scroll_ratio * max_scroll;
    scroll_position = clamp(scroll_position, 0, max_scroll);
}

// Mouse wheel scrolling
if (mouse_wheel_up()) {
    scroll_position = max(0, scroll_position - line_height);
}
if (mouse_wheel_down()) {
    scroll_position = min(max_scroll, scroll_position + line_height);
}

// Keyboard scrolling
if (keyboard_check_pressed(vk_pageup)) {
    scroll_position = max(scroll_position - max_lines_visible * line_height, 0);
}
if (keyboard_check_pressed(vk_pagedown)) {
    scroll_position = min(scroll_position + max_lines_visible * line_height, max_scroll);
}

// Boot sequence logic
if (!bootComplete && alarm[1] <= 0) {
    if (bootIndex < ds_list_size(bootMessages)) {
        outputBuffer += bootMessages[| bootIndex] + "\n";
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

// Handle Enter key press
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

// Play sound on keypress
if (keyboard_check_pressed(vk_anykey)) {
    audio_play_sound(key_sound, 1, false);
}

// Handle backspace with timing
if (!variable_global_exists("backspaceTimer")) {
    global.backspaceTimer = 0;
}
if (!variable_global_exists("backspaceDelay")) {
    global.backspaceDelay = 5; // Adjust this value for delay between deletions
}

if (keyboard_check(vk_backspace) && cursorPosition > 0) {
    if (global.backspaceTimer > 0) {
        global.backspaceTimer--;
    } else {
        inputBuffer = string_delete(inputBuffer, cursorPosition, 1);
        cursorPosition--;
        global.backspaceTimer = global.backspaceDelay;
    }
} else {
    global.backspaceTimer = 0;
}

// Handle arrow keys for command history
if (keyboard_check_pressed(vk_up) && historyPosition > 0) {
    historyPosition--;
    inputBuffer = commandHistory[| historyPosition];
    cursorPosition = string_length(inputBuffer);
}

if (keyboard_check_pressed(vk_down)) {
    if (historyPosition < ds_list_size(commandHistory) - 1) {
        historyPosition++;
        inputBuffer = commandHistory[| historyPosition];
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
draw_set_font(default_font);
// obj_window_terminal Step Event
event_inherited(); // Handle basic window functionality

// Only process terminal input when window is focused
if (is_focused) {
    // Timer calculations
    var current_time1 = get_timer();
    var elapsed_microseconds = current_time1 - global.terminal_start_time;
    var elapsed_seconds = floor(elapsed_microseconds / 1000000);

    global.hours = floor(elapsed_seconds / 3600);
    global.minutes = floor((elapsed_seconds % 3600) / 60);
    global.seconds = elapsed_seconds;

    // Scrollbar calculations
    draw_set_font(font);

    // Calculate heights relative to window size instead of room size
    total_height = string_height_ext(outputBuffer + inputBuffer, -1, window_width - 20 - scrollbar_width);
    content_height = max(total_height, window_height - window_header_height);
    visible_ratio = min(1, (window_height - window_header_height) / content_height);
    scrollbar_height = max(30, (window_height - window_header_height) * visible_ratio);
    max_scroll = max(0, total_height - (window_height - window_header_height) + 20);
    old_max = max_scroll;
    
    // Calculate scrollbar position
    scrollbar_y = (scroll_position / max_scroll) * ((window_height - window_header_height) - scrollbar_height);
    if (max_scroll == 0) scrollbar_y = 0;

    // Mouse interaction with scrollbar
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    // Adjust scrollbar area check to window position
    var scrollbar_area = (
        mx >= x + window_width - scrollbar_width && 
        mx <= x + window_width &&
        my >= y + window_header_height &&
        my <= y + window_height
    );

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
        var rel_my = my - (y + window_header_height);
        var new_y = clamp(rel_my - scrollbar_height/2, 0, window_height - window_header_height - scrollbar_height);
        scroll_position = (new_y / (window_height - window_header_height - scrollbar_height)) * max_scroll;
        scroll_position = clamp(scroll_position, 0, max_scroll);
    }

    // Mouse wheel scrolling (when mouse is over window)
    if (point_in_rectangle(mx, my, x, y + window_header_height, x + window_width, y + window_height)) {
        if (mouse_wheel_up()) {
            scroll_position = max(scroll_position - scroll_speed, 0);
        }
        if (mouse_wheel_down()) {
            scroll_position = min(scroll_position + scroll_speed, max_scroll);
        }
    }

    // Keyboard scrolling
    if (keyboard_check_pressed(vk_pageup)) {
        scroll_position = max(scroll_position - max_lines_visible * line_height, 0);
    }
    if (keyboard_check_pressed(vk_pagedown)) {
        scroll_position = min(scroll_position + max_lines_visible * line_height, max_scroll);
    }

    // Boot sequence
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

    // Command input handling
    if (bootComplete) {
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

        // Key sound
        if (keyboard_check_pressed(vk_anykey)) {
            audio_play_sound(key_sound, 1, false);
        }

        // Backspace handling
        if (!variable_global_exists("backspaceTimer")) {
            global.backspaceTimer = 0;
        }
        if (!variable_global_exists("backspaceDelay")) {
            global.backspaceDelay = 5;
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

        // Command history navigation
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

        // Text input
        if (keyboard_string != "") {
            inputBuffer = string_insert(keyboard_string, inputBuffer, cursorPosition + 1);
            cursorPosition += string_length(keyboard_string);
            keyboard_string = "";
        }
    }
}
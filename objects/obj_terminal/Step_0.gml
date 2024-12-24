

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

// Handle backspace
if (keyboard_check_pressed(vk_backspace) && cursorPosition > 0) {
    inputBuffer = string_delete(inputBuffer, cursorPosition, 1);
    cursorPosition--;
}

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
function processCommand(cmd) {
    var parts = string_split(cmd, " ");
    var command = parts[0];
    
    switch(command) {
        case "ls":
            outputBuffer += "\nDocuments  Downloads  Pictures  Music";
            break;
            
        case "cd":
            if (array_length(parts) > 1) {
                var newDir = parts[1];
                if (newDir == "..") {
                    // Move up one directory
                    var lastSlash = string_last_pos("/", currentDirectory);
                    if (lastSlash > 1) {
                        currentDirectory = string_copy(currentDirectory, 1, lastSlash - 1);
                    }
                } else if (string_char_at(newDir, 1) == "/") {
                    currentDirectory = newDir;
                } else {
                    currentDirectory += "/" + newDir;
                }
            }
            outputBuffer += "\n" + currentDirectory;
            break;
            
        case "pwd":
            outputBuffer += "\n" + currentDirectory;
            break;
            
        case "clear":
            outputBuffer = "";
            break;
            
        case "help":
            outputBuffer += "\nAvailable commands:\n";
            outputBuffer += "ls - List directory contents\n";
            outputBuffer += "cd - Change directory\n";
            outputBuffer += "pwd - Print working directory\n";
            outputBuffer += "clear - Clear screen\n";
            outputBuffer += "help - Show this help";
            break;
            
        default:
            outputBuffer += "\nCommand not found: " + command;
    }
}
function string_split(str, delimiter) {
    var result = [];
    var pos = string_pos(delimiter, str);
    
    while (pos > 0) {
        array_push(result, string_copy(str, 1, pos - 1));
        str = string_delete(str, 1, pos);
        pos = string_pos(delimiter, str);
    }
    
    if (str != "") {
        array_push(result, str);
    }
    
    return result;
}
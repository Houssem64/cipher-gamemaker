




function processCommand(cmd) {
    var parts = string_split(cmd, " ");
    var command = parts[0];
    
    switch(command) {
		case "ftp:test" :
			outputBuffer = "connected"
			global.activate_next_mission();
			break
        case "ls":
            // Check if -l flag is present for long listing
            var use_long_format = false;
            if (array_length(parts) > 1 && parts[1] == "-l") {
                use_long_format = true;
            }
            
            if (use_long_format) {
                // Long format with details
                outputBuffer += "\ntype  size   modified    name\n";
                outputBuffer += "d     4.1K   Dec 24      Documents\n";
                outputBuffer += "d     8.2K   Dec 23      Downloads\n";
                outputBuffer += "d     12.4K  Dec 24      Pictures\n";
                outputBuffer += "d     15.7K  Dec 23      Music";
            } else {
                // Simple format (original behavior)
                outputBuffer += "\nDocuments  Downloads  Pictures  Music";
            }
            break;
        
        case "cd":
            if (array_length(parts) > 1) {
                var newDir = parts[1];
                
                // Handle home directory
                if (newDir == "~" || newDir == "") {
                    currentDirectory = "/home/kali";
                } 
                // Handle root directory
                else if (newDir == "/") {
                    currentDirectory = "/";
                }
                // Handle parent directory
                else if (newDir == "..") {
                    var lastSlash = string_last_pos("/", currentDirectory);
                    if (lastSlash > 1) {
                        currentDirectory = string_copy(currentDirectory, 1, lastSlash - 1);
                    }
                }
                // Handle current directory
                else if (newDir == ".") {
                    // Do nothing, stay in current directory
                }
                // Handle absolute paths
                else if (string_char_at(newDir, 1) == "/") {
                    // Only change if it's a valid directory
                    if (string_pos("Documents", newDir) > 0 || 
                        string_pos("Downloads", newDir) > 0 || 
                        string_pos("Pictures", newDir) > 0 || 
                        string_pos("Music", newDir) > 0) {
                        currentDirectory = newDir;
                    } else {
                        outputBuffer += "\ncd: no such directory: " + newDir;
                    }
                }
                // Handle relative paths
                else {
                    // Only change if it's a valid directory
                    if (newDir == "Documents" || 
                        newDir == "Downloads" || 
                        newDir == "Pictures" || 
                        newDir == "Music") {
                        currentDirectory += "/" + newDir;
                    } else {
                        outputBuffer += "\ncd: no such directory: " + newDir;
                    }
                }
            } else {
                // cd with no arguments goes to home
                currentDirectory = "/home/kali";
            }
            outputBuffer += "\n" + currentDirectory;
            promptSymbol = "kali@kali:" + currentDirectory + "$ ";
            break;
            
        case "pwd":
            outputBuffer += "\n" + currentDirectory;
            break;
			
        case "test":
			outputBuffer += "connected"
			 
			 break
		case "neofetch" :
    outputBuffer+="                   \n"
    outputBuffer+="       ..,\n"
    outputBuffer+="    ....  ..);\n"
    outputBuffer+="  .,,      ,,);\n"
    outputBuffer+=".,,          ,,.       kali@kali\n"
    outputBuffer+=",,,          .,,       -----------\n"
    outputBuffer+=" ,,.        ,,         OS: Kali Linux\n"
    outputBuffer+="  ,,,    .,,           Host: Virtual Machine\n"
    outputBuffer+="    ,,,,,,             Kernel: 6.5.0-kali3-amd64\n"
    outputBuffer+=string("    ,,                 Uptime: " + string(global.hours) + " hour" +", " + string(global.minutes) + " min" +", "+ string(global.seconds)+  " s" + "\n");
    outputBuffer+="     ,,                Packages: 4378 (dpkg)\n"
    outputBuffer+="     ,,                Shell: zsh 5.9);\n"
    outputBuffer+="      ,,               Resolution: 1920x1080\n"
    outputBuffer+="     ,,                DE: Xfce 4.18\n"
    outputBuffer+="      ,,               WM: Xfwm4\n"
    outputBuffer+="      ,,               CPU: Intel i7-12700K\n"
    outputBuffer+="      ,,               Memory: 2948MiB / 16384MiB\n"
    outputBuffer+="												"
			break;

        case "clear":
            outputBuffer = "";
			obj_terminal.scroll_position = 0;
            break;
		case "exit":
			 obj_terminal_controller.close_terminal_and_restore()
			 break
            
        case "help":
            outputBuffer += "\nAvailable commands:\n";
            outputBuffer += "ls [-l] - List directory contents (use -l for long format)\n";
            outputBuffer += "cd [dir] - Change directory (use ~, ., .., or directory name)\n";
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
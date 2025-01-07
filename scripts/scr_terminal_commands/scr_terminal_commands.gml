
function processCommand(cmd) {
    var parts = string_split(cmd, " ");
    var command = parts[0];
    
  // Handle FTP authentication if waiting for password
    if (global.ftp_waiting_for_password) {
        processAuthCommand(cmd);
        return;
    }
    
    // Handle FTP commands if authenticated
    if (global.ftp_authenticated) {
        processFTPCommand(parts);
        return;
    }
    
    // Handle FTP username if connected but not authenticated
    if (global.ftp_connected && !global.ftp_authenticated && !global.ftp_waiting_for_password) {
        global.ftp_username = cmd;
        global.ftp_waiting_for_password = true;
        outputBuffer += "\nPassword: ";
        return;
    }
    
    switch(command) {
       
            
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
                // Simple format
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
            outputBuffer += "connected";
            break;
            
        case "neofetch":
            outputBuffer += "                   \n";
            outputBuffer += "       ..,\n";
            outputBuffer += "    ....  ..);\n";
            outputBuffer += "  .,,      ,,);\n";
            outputBuffer += ".,,          ,,.       kali@kali\n";
            outputBuffer += ",,,          .,,       -----------\n";
            outputBuffer += " ,,.        ,,         OS: Kali Linux\n";
            outputBuffer += "  ,,,    .,,           Host: Virtual Machine\n";
            outputBuffer += "    ,,,,,,             Kernel: 6.5.0-kali3-amd64\n";
            outputBuffer += string("    ,,                 Uptime: " + string(global.hours) + " hour" + ", " + string(global.minutes) + " min" + ", " + string(global.seconds) + " s\n");
            outputBuffer += "     ,,                Packages: 4378 (dpkg)\n";
            outputBuffer += "     ,,                Shell: zsh 5.9);\n";
            outputBuffer += "      ,,               Resolution: 1920x1080\n";
            outputBuffer += "     ,,                DE: Xfce 4.18\n";
            outputBuffer += "      ,,               WM: Xfwm4\n";
            outputBuffer += "      ,,               CPU: Intel i7-12700K\n";
            outputBuffer += "      ,,               Memory: 2948MiB / 16384MiB\n";
            outputBuffer += "                                                ";
            //obj_mission_manager.update_mission_progress("basic_access", 1, 1);
            break;

        case "clear":
            outputBuffer = "";
           
            break;
            
        case "exit":
            instance_destroy()
            break;

        case "ftp":
            if (array_length(parts) >= 2) {
                // Format: ftp ip_address [port]
                var ip_address = parts[1];
                var port = (array_length(parts) >= 3) ? parts[2] : "21"; // Default FTP port is 21
                
                // Initialize FTP connection
                global.ftp_connected = false;
                global.ftp_authenticated = false;
                global.ftp_username = "";
                global.ftp_ip = ip_address;
                global.ftp_port = port;
                global.ftp_waiting_for_password = false;
                
                outputBuffer += "\nTrying to connect to " + ip_address + ":" + port + "...";
                
                // Simulate connection attempt
                if (ip_address == "10.10.10.1") { // Example valid IP
                    global.ftp_connected = true;
                    outputBuffer += "\nConnected to " + ip_address;
                    outputBuffer += "\nUsername: ";
                    promptSymbol = "";
                } else {
                    outputBuffer += "\nConnection failed: Could not connect to " + ip_address;
                   
                }
            } else {
                outputBuffer += "\nUsage: ftp <ip_address> [port]";
            }
            break;
            

        case "help":
            outputBuffer += "\nAvailable commands:\n";
            outputBuffer += "ls [-l] - List directory contents (use -l for long format)\n";
            outputBuffer += "cd [dir] - Change directory (use ~, ., .., or directory name)\n";
            outputBuffer += "pwd - Print working directory\n";
            outputBuffer += "clear - Clear screen\n";
            outputBuffer += "help - Show this help\n";
            outputBuffer += "exit - Exit Terminal\n";
            outputBuffer += "ftp <ip_address> [port] - Connect to FTP server\n";
            //obj_mission_manager.update_mission_progress("basic_access", 2, 1);
            break;
            
        default:
            outputBuffer += "\nCommand not found: " + command;
    }
}

function processAuthCommand(password) {
    // Clear the password prompt flag
    global.ftp_waiting_for_password = false;
    
    // Check credentials (you can modify these values)
    if (global.ftp_username == "admin" && password == "admin") {
        global.ftp_authenticated = true;
        outputBuffer += "\nLogin successful.";
        promptSymbol = "ftp> ";
        outputBuffer += "\nType 'help' for available commands.";
    } else {
        outputBuffer += "\nLogin failed.";
        global.ftp_connected = false;
        global.ftp_authenticated = false;
        global.ftp_username = "";
        promptSymbol = "kali@kali:" + currentDirectory + "$ ";
    }
}



// Function to handle FTP-specific commands
function processFTPCommand(parts) {
    if (array_length(parts) == 0) return;
    
    var command = parts[0];
    
    switch(command) {
        case "help":
            outputBuffer += "\nFTP Commands Available:\n";
            outputBuffer += "ls        - List files in current directory\n";
            outputBuffer += "cd        - Change directory\n";
            outputBuffer += "pwd       - Print working directory\n";
            outputBuffer += "get       - Download file\n";
            outputBuffer += "put       - Upload file\n";
            outputBuffer += "binary    - Set binary transfer mode\n";
            outputBuffer += "ascii     - Set ASCII transfer mode\n";
            outputBuffer += "status    - Show current FTP status\n";
            outputBuffer += "quit      - Exit FTP mode";
            break;
            
        case "quit":
        case "bye":
        case "exit":
            promptSymbol = "kali@kali:" + currentDirectory + "$ ";
            outputBuffer += "\nLeaving FTP mode.";
            global.ftp_connected = false;
            global.ftp_authenticated = false;
            global.ftp_username = "";
            break;
            
        case "ls":
            outputBuffer += "\ndrwxr-xr-x    2 ftp      ftp          4096 Dec 24 flag.txt\n";
            outputBuffer += "drwxr-xr-x    2 ftp      ftp          4096 Dec 24 secret.dat\n";
            outputBuffer += "drwxr-xr-x    2 ftp      ftp          4096 Dec 24 readme.md";
            break;
            
        case "cd":
            if (array_length(parts) > 1) {
                var newDir = parts[1];
                outputBuffer += "\nChanged to directory: " + newDir;
            } else {
                outputBuffer += "\nUsage: cd <directory>";
            }
            break;
            
        case "get":
            if (array_length(parts) > 1) {
                var filename = parts[1];
                outputBuffer += "\nDownloading " + filename + "...";
                outputBuffer += "\nTransfer complete.";
                
                // If it's the flag file, trigger mission progress
                if (filename == "flag.txt") {
                    //obj_mission_manager.update_mission_progress("basic_access", 3, 1);
					
                }
            } else {
                outputBuffer += "\nUsage: get <filename>";
            }
            break;
            
        case "put":
            if (array_length(parts) > 1) {
                outputBuffer += "\nPermission denied.";
            } else {
                outputBuffer += "\nUsage: put <filename>";
            }
            break;
            
        case "binary":
            outputBuffer += "\nSwitching to binary mode.";
            break;
            
        case "ascii":
            outputBuffer += "\nSwitching to ASCII mode.";
            break;
            
        case "status":
            outputBuffer += "\nConnected to: ftp.target.com";
            outputBuffer += "\nMode: binary";
            outputBuffer += "\nCurrent directory: /";
            break;
            
        case "pwd":
            outputBuffer += "\n/";
            break;
            
        default:
            outputBuffer += "\nInvalid FTP command: " + command;
            outputBuffer += "\nType 'help' for available commands.";
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





//function processCommand(cmd) {
//    var parts = string_split(cmd, " ");
//    var command = parts[0];
    
//    switch(command) {
//		case "ftp:test" :
//			outputBuffer = "connected"
			
//			break
//        case "ls":
//            // Check if -l flag is present for long listing
//            var use_long_format = false;
//            if (array_length(parts) > 1 && parts[1] == "-l") {
//                use_long_format = true;
//            }
            
//            if (use_long_format) {
//                // Long format with details
//                outputBuffer += "\ntype  size   modified    name\n";
//                outputBuffer += "d     4.1K   Dec 24      Documents\n";
//                outputBuffer += "d     8.2K   Dec 23      Downloads\n";
//                outputBuffer += "d     12.4K  Dec 24      Pictures\n";
//                outputBuffer += "d     15.7K  Dec 23      Music";
//            } else {
//                // Simple format (original behavior)
//                outputBuffer += "\nDocuments  Downloads  Pictures  Music";
//            }
//            break;
        
//        case "cd":
//            if (array_length(parts) > 1) {
//                var newDir = parts[1];
                
//                // Handle home directory
//                if (newDir == "~" || newDir == "") {
//                    currentDirectory = "/home/kali";
//                } 
//                // Handle root directory
//                else if (newDir == "/") {
//                    currentDirectory = "/";
//                }
//                // Handle parent directory
//                else if (newDir == "..") {
//                    var lastSlash = string_last_pos("/", currentDirectory);
//                    if (lastSlash > 1) {
//                        currentDirectory = string_copy(currentDirectory, 1, lastSlash - 1);
//                    }
//                }
//                // Handle current directory
//                else if (newDir == ".") {
//                    // Do nothing, stay in current directory
//                }
//                // Handle absolute paths
//                else if (string_char_at(newDir, 1) == "/") {
//                    // Only change if it's a valid directory
//                    if (string_pos("Documents", newDir) > 0 || 
//                        string_pos("Downloads", newDir) > 0 || 
//                        string_pos("Pictures", newDir) > 0 || 
//                        string_pos("Music", newDir) > 0) {
//                        currentDirectory = newDir;
//                    } else {
//                        outputBuffer += "\ncd: no such directory: " + newDir;
//                    }
//                }
//                // Handle relative paths
//                else {
//                    // Only change if it's a valid directory
//                    if (newDir == "Documents" || 
//                        newDir == "Downloads" || 
//                        newDir == "Pictures" || 
//                        newDir == "Music") {
//                        currentDirectory += "/" + newDir;
//                    } else {
//                        outputBuffer += "\ncd: no such directory: " + newDir;
//                    }
//                }
//            } else {
//                // cd with no arguments goes to home
//                currentDirectory = "/home/kali";
//            }
//            outputBuffer += "\n" + currentDirectory;
//            promptSymbol = "kali@kali:" + currentDirectory + "$ ";
//            break;
            
//        case "pwd":
//            outputBuffer += "\n" + currentDirectory;
//            break;
			
//        case "test":
//			outputBuffer += "connected"
			 
//			 break
//		case "neofetch" :
//    outputBuffer+="                   \n"
//    outputBuffer+="       ..,\n"
//    outputBuffer+="    ....  ..);\n"
//    outputBuffer+="  .,,      ,,);\n"
//    outputBuffer+=".,,          ,,.       kali@kali\n"
//    outputBuffer+=",,,          .,,       -----------\n"
//    outputBuffer+=" ,,.        ,,         OS: Kali Linux\n"
//    outputBuffer+="  ,,,    .,,           Host: Virtual Machine\n"
//    outputBuffer+="    ,,,,,,             Kernel: 6.5.0-kali3-amd64\n"
//    outputBuffer+=string("    ,,                 Uptime: " + string(global.hours) + " hour" +", " + string(global.minutes) + " min" +", "+ string(global.seconds)+  " s" + "\n");
//    outputBuffer+="     ,,                Packages: 4378 (dpkg)\n"
//    outputBuffer+="     ,,                Shell: zsh 5.9);\n"
//    outputBuffer+="      ,,               Resolution: 1920x1080\n"
//    outputBuffer+="     ,,                DE: Xfce 4.18\n"
//    outputBuffer+="      ,,               WM: Xfwm4\n"
//    outputBuffer+="      ,,               CPU: Intel i7-12700K\n"
//    outputBuffer+="      ,,               Memory: 2948MiB / 16384MiB\n"
//    outputBuffer+="												"
//	obj_mission_manager.update_mission_progress("basic_access", 1, 1);
//			break;

//        case "clear":
//            outputBuffer = "";
//			obj_terminal.scroll_position = 0;
//            break;
//		case "exit":
//			 obj_terminal_controller.close_terminal_and_restore()
//			 break

//		case "ftp":
//		 promptSymbol = "ftp"  + "> ";
//         currentDirectory = ""
//		 case promptSymbol = "ftp":
		 
//        case "help":
//            outputBuffer += "\nAvailable commands:\n";
//            outputBuffer += "ls [-l] - List directory contents (use -l for long format)\n";
//            outputBuffer += "cd [dir] - Change directory (use ~, ., .., or directory name)\n";
//            outputBuffer += "pwd - Print working directory\n";
//            outputBuffer += "clear - Clear screen\n";
//            outputBuffer += "help - Show this help";
//			 outputBuffer += "exit - Exit Terminal";
//			 outputBuffer += "ftp  - Connect to an FTP server"
			
//			obj_mission_manager.update_mission_progress("basic_access", 2, 1);
			
//            break;
            
//        default:
//            outputBuffer += "\nCommand not found: " + command;
//    }
//}

//function string_split(str, delimiter) {
//    var result = [];
//    var pos = string_pos(delimiter, str);
    
//    while (pos > 0) {
//        array_push(result, string_copy(str, 1, pos - 1));
//        str = string_delete(str, 1, pos);
//        pos = string_pos(delimiter, str);
//    }
    
//    if (str != "") {
//        array_push(result, str);
//    }
    
//    return result;
//}
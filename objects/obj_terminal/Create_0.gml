currentDirectory = "/home/user";
commandHistory = ds_list_create();
historyPosition = -1;
cursorPosition = 0;
inputBuffer = "";
outputBuffer = "";
cursorBlink = true;
persistent = true; 
alarm[0] = room_speed/2; // Cursor blink timer

// Create Event
keyboard_string = "";
terminalWidth = 50;  // Characters per line
terminalHeight = 20; // Number of lines
promptSymbol = "$ ";
font = font_add("Courier New", 12, false, false, 32, 128);

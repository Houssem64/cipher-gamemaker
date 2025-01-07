// Window properties
window_width = 800;
window_height = 600;
window_title = "Terminal";
is_focused = false;

// Terminal specific variables
global.terminal_open = true;
global.ftp_connected = false;
global.ftp_authenticated = false;
global.ftp_username = "";
global.ftp_ip = "";
global.ftp_port = "";
global.ftp_waiting_for_password = false;

// Boot sequence
bootComplete = false;
bootMessages = ds_list_create();
ds_list_add(bootMessages,
    "[    0.000000] Linux version 6.1.0-kali5-amd64",
    "[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-6.1.0-kali5-amd64",
    // ... (rest of your boot messages)
    "root@kali:~#"
);
bootIndex = 0;
bootDelay = room_speed * 0.1;
alarm[1] = 1;
global.terminal_start_time = get_timer();

// Terminal interface
scroll_position = 0;
line_height = 20;
scroll_speed = line_height;
max_lines_visible = floor((window_height - 20) / line_height);
scrollbar_width = 20;
scrollbar_dragging = false;
scrollbar_hover = false;
drag_offset = 0;
currentDirectory = "/home/user";
window_header_height = 30;
commandHistory = ds_list_create();
historyPosition = -1;
cursorPosition = 0;
inputBuffer = "";
promptSymbol = "kali@kali $> ";
outputBuffer = "" + promptSymbol;
cursorBlink = true;
alarm[0] = room_speed / 2;

// Font setup
font = font_add("cour.ttf", 20, false, false, 32, 128);
keyboard_string = "";

// Create the terminal surface
terminal_surface = surface_create(window_width - scrollbar_width, window_height - window_header_height);
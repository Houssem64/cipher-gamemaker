//boot sequence 

global.terminal_open = true
bootComplete = false;
bootMessages = ds_list_create();
ds_list_add(bootMessages,
    "[    0.000000] Linux version 6.1.0-kali5-amd64",
    "[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-6.1.0-kali5-amd64",
    "[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'",
    "[    0.004000] Initializing cgroup subsys cpuset",
    "[    0.008000] Initializing cgroup subsys cpu",
    "[    0.012000] Initializing cgroup subsys cpuacct",
    "[    0.016000] systemd[1]: System time before build time, advancing clock.",
    "[    0.020000] systemd[1]: systemd 252.6-1 running in system mode.",
    "[    0.024000] systemd[1]: Detected architecture x86-64.",
    "[    0.028000] systemd[1]: Running in initial RAM disk.",
    "[    0.032000] Starting version 252.6-1",
    "[    0.036000] Begin: Loading essential drivers ... done.",
    "[    0.040000] Begin: Running /scripts/init-premount ... done.",
    "[    0.044000] Begin: Mounting root file system ... done.",
    "[    0.048000] Begin: Running /scripts/init-bottom ... done.",
    "Kali GNU/Linux Rolling kali tty1",
    "kali login: root",
    "Password: **********",
    "Last login: Wed Dec 25 00:00:00 2024 from localhost",
    "root@kali:~#"
);

bootIndex = 0;
bootDelay = room_speed * 0.1; // Delay between messages
alarm[1] = 1; // Start boot sequence

global.terminal_start_time = get_timer();


//scrollbar: 
scroll_position = 0;
line_height = 20;
scroll_speed = line_height;
max_lines_visible = floor((room_height - 20) / line_height);
scrollbar_width = 20;
scrollbar_dragging = false;
scrollbar_hover = false;
drag_offset = 0;



currentDirectory = "/home/user";
commandHistory = ds_list_create();
historyPosition = -1;
cursorPosition = 0;
inputBuffer = "";
promptSymbol = "kali@kali $> ";
outputBuffer = "" + promptSymbol;
cursorBlink = true;
persistent = true; 
alarm[0] = room_speed/2; // Cursor blink timer

// Create Event
keyboard_string = "";
terminalWidth = 50;  // Characters per line
terminalHeight = 20; // Number of lines

font = font_add("cour.ttf",20, false, false, 32, 128);

global.keyboardSoundRanges = [
    [1.765, 1.907],
    [2.237, 2.265],
    [2.634, 2.649],
    [3.042, 3.064],
    [3.42, 3.449],
    [3.824, 3.843],
    [4.171, 4.192],
    [4.586, 4.592],
    [4.933, 4.953],
    [5.324, 5.345],
    [5.691, 5.727],
    [6.08, 6.098],
    [6.447, 6.483],
    [6.839, 6.968],
    [7.203, 7.253],
    [7.605, 7.708],
    [9.773, 9.793],
    [10.168, 10.186],
    [10.596, 10.627],
    [10.985, 11.014],
    [11.352, 11.372],
    [11.735, 11.753],
    [12.116, 12.148],
    [12.499, 12.52],
    [12.896, 13.032],
    [13.256, 13.415],
    [13.652, 13.682],
    [13.994, 14.036],
    [14.381, 14.414],
    [14.772, 14.914],
    [15.179, 15.197],
    [15.559, 15.573],
    [15.916, 15.99],
    [16.98, 16.99],
    [17.35, 17.362],
    [17.712, 17.735],
    [18.076, 18.096],
    [18.426, 18.446],
    [18.767, 18.808],
    [19.141, 19.176],
    [19.521, 19.544],
    [19.881, 19.93],
    [20.253, 20.368],
    [20.619, 20.662],
    [20.985, 21.053],
    [21.373, 21.392],
    [21.728, 21.758],
    [22.138, 22.259],
    [22.544, 22.57],
    [22.885, 22.912],
    [23.953, 23.98],
    [24.362, 24.38],
    [24.725, 24.744],
    [25.099, 25.119],
    [25.449, 25.856],
    [26.163, 26.316],
    [26.545, 26.674],
    [26.942, 27.082],
    [27.354, 27.41],
    [27.758, 27.783],
    [28.179, 28.2],
    [28.565, 28.684],
    [29.642, 29.778],
    [30.061, 30.08],
    [30.407, 30.428],
    [30.784, 30.913],
    [31.147, 31.228],
    [31.492, 31.646],
    [31.898, 32.03],
    [32.347, 32.487],
    [33.03, 33.121],
    [33.453, 33.505],
    [33.856, 33.879],
    [34.238, 34.259],
    [34.729, 34.746],
    [35.735, 35.763],
    [36.134, 36.151],
    [36.49, 37.005],
    [37.736, 37.889],
    [38.142, 38.165],
    [38.502, 38.517],
    [38.838, 38.865],
    [39.236, 39.266],
    [39.613, 39.628],
    [39.981, 40.005]
];

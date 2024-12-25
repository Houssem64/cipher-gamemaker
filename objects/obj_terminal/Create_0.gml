//boot sequence 
bootComplete = false;
bootMessages = ds_list_create();
bootIndex = 0;
bootDelay = room_speed * 0.1; // Delay between messages
alarm[1] = 1; // Start boot sequence
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

font = font_add("Courier New", 12, false, false, 32, 128);

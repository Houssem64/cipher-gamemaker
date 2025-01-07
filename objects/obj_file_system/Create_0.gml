//// Inherit from obj_window
//event_inherited();

//// File system properties
//current_directory = "/"; // Start at the root directory
//files = []; // Array to store files and directories
//selected_file = -1; // Index of the selected file/directory

//// File system window dimensions
//file_system_x = x + 10; // X position of the file system content
//file_system_y = y + 30; // Y position of the file system content
//file_system_width = width - 20; // Width of the file system content
//file_system_height = height - 40; // Height of the file system content

//// Scrollbar properties
//scroll_position = 0; // Current scroll position
//scrollbar_width = 10; // Width of the scrollbar
//scrollbar_visible = false; // Whether the scrollbar is visible
//total_height = 0; // Total height of the file system content

//// Load initial directory contents
//load_directory(current_directory);


event_inherited(); // Inherit from obj_window

// Window properties
window_title = "File System";
width = 400;
height = 300;
min_width = 200;
min_height = 150;

// File system specific variables
current_path = working_directory;
selected_file = "";
scroll_offset = 0;
max_items_visible = floor((height - 60) / 20); // Account for header and padding

// File system content
file_list = ds_list_create();
UpdateFileList();
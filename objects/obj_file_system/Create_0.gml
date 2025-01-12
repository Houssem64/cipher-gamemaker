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
window_title = "File Explorer";
width = 600;
height = 400;
min_width = 300;
min_height = 200;

// File explorer specific variables
workingdirectory = "";
current_path = string_replace_all(workingdirectory, "\\", "/");
if (string_char_at(current_path, string_length(current_path)) != "/") {
    current_path += "/";
}
selected_file = "";
scroll_offset = 0;
max_items_visible = floor((height - 80) / 20); // Account for header and address bar

// Navigation history
nav_history = ds_list_create();
nav_position = -1;
ds_list_add(nav_history, current_path);
nav_position = 0;

// Column widths
name_column_width = 250;
size_column_width = 100;
date_column_width = 150;

// Address bar variables
typing_path = false;
temp_path = "";

// File system content
file_list = ds_list_create();
file_details = ds_map_create(); // Stores size and date for each file
UpdateFileList();
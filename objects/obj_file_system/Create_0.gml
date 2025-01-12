event_inherited();

// Window properties
window_title = "File Explorer";
width = 600;
height = 400;
min_width = 300;
min_height = 200;

// Define root directory structure
root_directory = {
    name: "C:",
    type: "DIR",
    content: {
        "System": {
            type: "DIR",
            content: {
                "Windows": { type: "DIR", content: {} },
                "System32": { type: "DIR", content: {} }
            }
        },
        "Program Files": {
            type: "DIR",
            content: {
                "Steam": { 
                    type: "DIR", 
                    content: {
                        "steamapps.exe": { type: "FILE", size: 1024576, date: date_current_datetime() }
                    }
                }
            }
        },
        "Users": {
            type: "DIR",
            content: {
                "Admin": { 
                    type: "DIR", 
                    content: {
                        "Documents": { 
                            type: "DIR", 
                            content: {
                                "readme.txt": { type: "FILE", size: 1024, date: date_current_datetime() },
                                "notes.txt": { type: "FILE", size: 2048, date: date_current_datetime() }
                            }
                        },
                        "Desktop": { type: "DIR", content: {} },
                        "Downloads": { type: "DIR", content: {} }
                    }
                }
            }
        }
    }
};

// File explorer specific variables
current_path = "C:/";
selected_file = "";
scroll_offset = 0;
max_items_visible = floor((height - 80) / 20);

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
file_details = ds_map_create();
// Add these if you don't have them already
item_height = 20;  // Height of each item in the list
list_start_y = 70; // Y offset where the file list starts
// Initialize the file list
UpdateFileList();
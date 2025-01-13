event_inherited();
window_title = "Email App";
width = 800;
height = 500;
min_width = 600;
min_height = 300;

// Initialize variables
selected_email = -1;
composing_email = false;
new_email = {
    to: "",
    subject: "",
    body: ""
};

// Initialize emails array
emails = [];

// Load saved emails
var filename = "email_data.json";
if (file_exists(filename)) {
    var buffer = buffer_load(filename);
    var json_string = buffer_read(buffer, buffer_string);
    buffer_delete(buffer);
    
    emails = json_parse(json_string);
    show_debug_message("Emails loaded: " + string(array_length(emails)));
} else {
    // Add default welcome email if no save exists
    emails[0] = {
        subject: "Welcome to the Email App!",
        sender: "support@emailapp.com",
        date: "2024-01-06",
        body: "Thank you for using our email app. We hope you enjoy it!"
    };
}
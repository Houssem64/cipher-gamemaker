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
delete_button_hover = false;


showing_delete_confirm = false;  // Controls if confirmation dialog is visible
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
if (selected_email >= 0 && !composing_email) {
    var button_y = y + 35;
    
    // Draw delete button with hover effect
    draw_set_color(delete_button_hover ? c_maroon : c_red);
    draw_rectangle(
        x + width - 90,
        button_y,
        x + width - 20,
        button_y + 25,
        false
    );
    
    // Draw button text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(
        x + width - 55,
        button_y + 5,
        "Delete"
    );
    draw_set_halign(fa_left);
}
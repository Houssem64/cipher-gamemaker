// Initialize the messages app
app_name = "Messages";
messages = [];
scroll_y = 0;
drag_start_y = 0;
is_dragging = false;

// Add some sample messages
add_message("Alice", "Hey! How are you?");
add_message("Bob", "Don't forget about the meeting tomorrow.");
add_message("Charlie", "Can you send me the report?");
add_message("Alice", "Sure, I'll send it shortly.");
add_message("Bob", "Looking forward to it!");
add_message("Charlie", "Thanks!");

// Function to add a message
function add_message(sender, content) {
    var msg = {
        sender: sender,
        content: content,
        timestamp: string(current_hour) + ":" + string_format(current_minute, 2, 0)
    };
    array_push(messages, msg);
}
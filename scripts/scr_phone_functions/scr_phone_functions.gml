function current_time_string() {
    var hour = current_hour;
    var minute = current_minute;
    var am_pm = hour >= 12 ? "PM" : "AM";
    
    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;
    
    return string(hour) + ":" + 
           (minute < 10 ? "0" : "") + string(minute) + 
           " " + am_pm;
}

// Create function to add new message
function add_message(sender, text) {
    array_push(messages, {
        sender: sender,
        text: text,
        time: current_time_string(),
        read: false
    });
    has_new_message = true;
}

// Create function to toggle phone visibility
function toggle_phone() {
    visible = !visible;
    if (visible) {
        // Mark all messages as read when phone is opened
        for (var i = 0; i < array_length(messages); i++) {
            messages[i].read = true;
        }
        has_new_message = false;
    }
}
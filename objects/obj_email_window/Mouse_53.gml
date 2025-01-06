// Call the parent Global Left Pressed Event (handles close button, fit-to-screen button, dragging, etc.)
event_inherited();

// Check if an email is clicked
for (var i = 0; i < array_length(emails); i++) {
    var email_y = y + 30 + i * 20; // Position of each email in the list
    if (mouse_x >= x + 10 && mouse_x <= x + width - 10 &&
        mouse_y >= email_y - 2 && mouse_y <= email_y + 18) {
        selected_email = i; // Select the clicked email
        break;
    }
}
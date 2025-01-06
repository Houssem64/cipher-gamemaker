// Call the parent Draw Event (draws the window background, title bar, buttons, etc.)
event_inherited();

// Draw the email list
draw_set_color(c_black);
for (var i = 0; i < array_length(emails); i++) {
    var email = emails[i];
    var email_y = y + 30 + i * 20; // Position of each email in the list
    draw_text(x + 10, email_y, email.sender + ": " + email.subject);

    // Highlight the selected email
    if (i == selected_email) {
        draw_set_color(c_blue);
        draw_rectangle(x + 5, email_y - 2, x + width - 5, email_y + 18, false);
        draw_set_color(c_white);
        draw_text(x + 10, email_y, email.sender + ": " + email.subject);
    }
}

// Draw the selected email's content
if (selected_email != -1) {
    var email = emails[selected_email];
    draw_set_color(c_black);
    draw_text(x + 10, y + height - 100, "From: " + email.sender);
    draw_text(x + 10, y + height - 80, "Subject: " + email.subject);
    draw_text(x + 10, y + height - 60, "Body: " + email.body);
}
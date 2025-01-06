// Inherit from obj_window
event_inherited();

// Email-specific variables
emails = []; // List of emails
selected_email = -1; // Index of the selected email

// Example emails
emails[0] = {
    subject: "Welcome to the Email App!",
    sender: "support@emailapp.com",
    body: "Thank you for using our email app. We hope you enjoy it!"
};
emails[1] = {
    subject: "Reminder: Meeting Tomorrow",
    sender: "boss@company.com",
    body: "Don't forget the meeting at 10 AM tomorrow."
};
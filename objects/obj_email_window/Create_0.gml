// Create Event of obj_email_window
event_inherited();
emails = [];
selected_email = -1;
window_title = "Email App";

// Set wider default size for email app
width = 800;
height = 500;
min_width = 600;
min_height = 300;

// Add some example emails
emails[0] = {
    subject: "Welcome to the Email App!",
    sender: "support@emailapp.com",
    date: "2024-01-06",
    body: "Thank you for using our email app. We hope you enjoy it!"
};

emails[1] = {
    subject: "Reminder: Meeting Tomorrow",
    sender: "boss@company.com",
    date: "2024-01-05",
    body: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32."
};
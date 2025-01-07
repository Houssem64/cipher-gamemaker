event_inherited();
emails = [];
selected_email = -1;
window_title = "Email App";
composing_email = false;
new_email = {
    to: "",
    subject: "",
    body: ""
};

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
    body: "Contrary to popular belief, Lorem Ipsum is not simply random text..."
};

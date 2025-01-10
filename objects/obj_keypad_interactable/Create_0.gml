// Array of possible combinations
possible_combinations = [
    [1, 2, 3, 4],
    [4, 5, 6, 7],
    [9, 8, 7, 6],
    [1, 1, 1, 1]
];

// Choose a random combination
var random_index = irandom(array_length(possible_combinations) - 1);
current_combination = possible_combinations[random_index];

// Player's input
input = [];
max_digits = 4;

// Keypad dimensions
keypad_width = 69;
keypad_height = 120;

// Button dimensions
button_width = 18;
button_height = 18;
padding = 2;  // Space between buttons

// Feedback message
_message = "";
message_timer = 0;
message_duration = 60; // 1 second at 60fps

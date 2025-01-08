// Step Event of rm_GameOver

if (keyboard_check_pressed(ord("R"))) {
   room_goto(global.currentRoom)
}
if (keyboard_check_pressed(ord("Q"))) {
    room_goto(rm_MainMenu); // Go to the main menu (replace with your menu room)
}
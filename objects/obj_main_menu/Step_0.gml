// Step Event
alpha += fade_speed * fade_direction;

// Reverse the fade direction when alpha reaches 0 or 1
if (alpha >= 1) {
    fade_direction = -1; // Start fading out
} else if (alpha <= 0) {
    fade_direction = 1; // Start fading in
}

// Step Event (Optional)
if (keyboard_check_pressed(vk_anykey)) {
	
    room_goto_next()
}
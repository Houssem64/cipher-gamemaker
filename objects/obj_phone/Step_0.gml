if keyboard_check_pressed(ord("P")) {
    state.visible = !state.visible;
}

if (!state.visible) exit;

if (current_time mod 1000 < 16) {
    update_time();
}

if (state.battery > 0 && irandom(1000) == 0) {
    state.battery--;
}

// Add back button check
if (keyboard_check_pressed(vk_escape)) {
    return_to_home();
}
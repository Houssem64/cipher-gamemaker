if (has_new_message) {
    notification_alpha += 0.05;
    if (notification_alpha > 1) notification_alpha = 1;
} else {
    notification_alpha -= 0.05;
    if (notification_alpha < 0) notification_alpha = 0;
}
if keyboard_check_pressed(ord("P")) {
    toggle_phone();
}
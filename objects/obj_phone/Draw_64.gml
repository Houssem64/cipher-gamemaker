if (visible) {
    // Calculate center of the screen
    var center_x = view_wport[0] / 2;
    var center_y = view_hport[0] / 2;

    // Dimensions of the phone
    var phone_width = 280; // 300 - 20
    var phone_height = 500; // 550 - 50

    // Top-left corner of the phone
    var phone_x1 = center_x - phone_width / 2;
    var phone_x2 = center_x + phone_width / 2;
    var phone_y1 = center_y - phone_height / 2;
    var phone_y2 = center_y + phone_height / 2;

    // Draw phone background
    draw_set_color(c_black);
    draw_rectangle(phone_x1, phone_y1, phone_x2, phone_y2, false);

    // Draw phone header
    var header_height = 40; // 90 - 50
    draw_set_color(c_lime);
    draw_rectangle(phone_x1, phone_y1, phone_x2, phone_y1 + header_height, false);

    // Draw time
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_text((phone_x1 + phone_x2) / 2, phone_y1 + header_height / 2, current_time_string());

    // Draw messages
    draw_set_halign(fa_left);
    var y_pos = phone_y1 + header_height + 10;
    for (var i = 0; i < array_length(messages); i++) {
        var msg = messages[i];

        // Draw message background
        draw_set_color(msg.read ? c_dkgray : c_blue);
        draw_rectangle(phone_x1 + 10, y_pos, phone_x2 - 10, y_pos + 100, false);

        // Draw message content
        draw_set_color(c_white);
        draw_text(phone_x1 + 20, y_pos + 5, msg.sender);
        draw_text(phone_x1 + 20, y_pos + 25, msg.text);
        draw_set_halign(fa_right);
        draw_text(phone_x2 - 20, y_pos + 45, msg.time);
        draw_set_halign(fa_left);

        y_pos += 70;
    }
} else if (notification_alpha > 0) {
    // Draw notification when phone is hidden
    draw_set_alpha(notification_alpha);
    draw_set_color(c_black);

    // Notification dimensions
    var notif_width = 180; // 200 - 20
    var notif_height = 50; // 60 - 10
    var notif_x1 = view_wport[0] / 2 - notif_width / 2;
    var notif_y1 = 10;
    var notif_x2 = notif_x1 + notif_width;
    var notif_y2 = notif_y1 + notif_height;

    draw_rectangle(notif_x1, notif_y1, notif_x2, notif_y2, false);
    draw_set_color(c_white);
    draw_text(notif_x1 + 10, notif_y1 + 10, "New Message!");
    draw_set_alpha(1);
}

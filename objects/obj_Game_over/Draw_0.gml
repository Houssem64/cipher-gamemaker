// Draw Event of rm_GameOver
var default_font = draw_get_font()
draw_set_color(c_white);
draw_set_font(fnt_monospace); // Replace with your font
draw_text(room_width / 2-100, room_height / 2 - 50, "GAME OVER");
draw_text(room_width / 2-100, room_height / 2, "Press R to Retry");
draw_text(room_width / 2-100, room_height / 2 + 50, "Press Q to Quit");
draw_set_font(default_font)
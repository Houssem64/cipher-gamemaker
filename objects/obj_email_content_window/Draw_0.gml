// Modified Email Content Window Draw Event (obj_email_content_window)
draw_set_alpha(0.5);
draw_set_color(make_color_rgb(0, 0, 0));
draw_rectangle(x + 5, y + 5, x + width + 5, y + height + 5, false);
draw_set_alpha(1);
event_inherited();
draw_set_color(c_black);
draw_text_ext(x + 10, y + 30, email_content, 20, width - 20);
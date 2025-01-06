// Draw Event
draw_set_color(color_background);
draw_rectangle(20, 50, 400, 300, false);

draw_set_color(color_text);
draw_set_font(fnt_monospace);

draw_text(30, 60, "CPU Usage:");
for (var i = 0; i < array_length(cpu_usage); i++) {
    draw_set_color(color_text);
    draw_text(30, 80 + i * 20, "CPU" + string(i) + ": ");
    draw_set_color(color_highlight);
    draw_text(30 + string_width("CPU" + string(i) + ": "), 80 + i * 20, string(cpu_usage[i]) + "%");
}

draw_set_color(color_text);
draw_text(30, 160, "Memory Usage:");
draw_set_color(color_highlight);
draw_text(30 + string_width("Memory Usage: "), 160, string(memory_used) + " GB / " + string(memory_total) + " GB");

draw_set_color(color_text);


draw_set_color(color_background);
draw_rectangle(30, 320, 120, 350, false);

draw_set_color(color_text);
draw_text(40, 330, "Open App");

if (mouse_x >= 30 && mouse_x <= 120 && mouse_y >= 320 && mouse_y <= 350) {
    draw_set_color(color_highlight);
    draw_rectangle(30, 320, 120, 350, false);
    draw_set_color(color_background);
    draw_text(40, 330, "Open App");
}
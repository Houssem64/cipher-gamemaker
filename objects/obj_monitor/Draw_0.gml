// Draw Event of obj_monitor
draw_set_color(c_white);
draw_set_font(fnt_monospace); // Use a monospace font for alignment

// Draw CPU Usage
draw_text(20, 20, "CPU Usage:");
for (var i = 0; i < array_length(cpu_usage); i++) {
    draw_text(20, 40 + i * 20, "CPU" + string(i) + ": " + string(cpu_usage[i]) + "%");
}

// Draw Memory Usage
draw_text(20, 140, "Memory Usage:");
draw_text(20, 160, "Used: " + string(memory_used) + " GB / " + string(memory_total) + " GB");

// Draw Temperatures
draw_text(20, 200, "Temperatures:");
draw_text(20, 220, "soc_dts0: " + string(temperatures[0]) + "°C");
draw_text(20, 240, "soc_dts1: " + string(temperatures[1]) + "°C");
draw_text(20, 260, "acpitz: " + string(temperatures[2]) + "°C");
draw_text(20, 280, "acpitz: " + string(temperatures[3]) + "°C");

// Draw Network Usage
draw_text(20, 320, "Network Usage:");
draw_text(20, 340, "Rx/s: " + string(network_rx) + " KiB/s");
draw_text(20, 360, "Tx/s: " + string(network_tx) + " KiB/s");



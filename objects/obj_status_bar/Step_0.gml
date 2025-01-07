// Update timer logic
if (!variable_global_exists("update_counter")) {
    global.update_counter = 0;
    global.update_interval = 60;
}
global.update_counter += 1;
if (global.update_counter >= global.update_interval) {
    global.update_counter = 0;
    time = date_time_string(date_current_datetime());
    cpu_usage = string(irandom_range(10, 20)) + "%";
    memory_usage = "1.19GB /16GB";
    network_rx = string(irandom_range(100, 200)) + " KiB/s";
    network_tx = string(irandom_range(10, 20)) + " KiB/s";
}
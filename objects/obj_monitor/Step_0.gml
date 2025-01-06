// Step Event of obj_monitor
// Simulate changing CPU usage
for (var i = 0; i < array_length(cpu_usage); i++) {
    cpu_usage[i] = clamp(cpu_usage[i] + irandom_range(-1, 1), 0, 100);
}

// Simulate changing memory usage
memory_used = clamp(memory_used + random_range(-0.1, 0.1), 0, memory_total);

// Simulate changing temperatures
for (var i = 0; i < array_length(temperatures); i++) {
    temperatures[i] = clamp(temperatures[i] + irandom_range(-1, 1), 20, 80);
}

// Simulate changing network usage
network_rx = clamp(network_rx + irandom_range(-5, 5), 0, 1000);
network_tx = clamp(network_tx + irandom_range(-1, 1), 0, 100);
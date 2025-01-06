
// Step Event of obj_system_monitor
for (var i = 0; i < array_length(cpu_usage); i++) {
    cpu_usage[i] = irandom_range(10, 20);
}
memory_used = 1.19; // Simulated memory usage
for (var i = 0; i < array_length(temperatures); i++) {
    temperatures[i] = irandom_range(20, 80);
}
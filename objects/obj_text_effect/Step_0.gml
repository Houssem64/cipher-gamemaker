/// obj_text_effect Step Event
alpha -= fade_speed;
y_offset -= float_speed;

if (alpha <= 0) {
    instance_destroy();
}

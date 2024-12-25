draw_set_font(font);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_lime);
var displayText = outputBuffer;
if (bootComplete) {
    displayText = outputBuffer + inputBuffer;
    if (cursorBlink) {
        displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
    }
}
draw_text_ext(10, 10, displayText, -1, room_width - 20);

//var displayText = outputBuffer + inputBuffer;
//if (cursorBlink) {
//    displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
//}
//draw_text_ext(10, 10, displayText, -1, room_width - 20);
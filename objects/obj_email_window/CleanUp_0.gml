// Save emails when closing
var json_string = json_stringify(emails);
var buffer = buffer_create(string_byte_length(json_string) + 1, buffer_fixed, 1);
buffer_write(buffer, buffer_string, json_string);
buffer_save(buffer, "email_data.json");
buffer_delete(buffer);
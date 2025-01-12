function FormatFileSize(_size) {
    if (_size < 1024) return string(_size) + " B";
    if (_size < 1048576) return string(floor(_size/1024)) + " KB";
    if (_size < 1073741824) return string_format(_size/1048576, 0, 2) + " MB";
    return string_format(_size/1073741824, 0, 2) + " GB";
}

function FormatDateString(timestamp) {
    return date_datetime_string(timestamp);
}
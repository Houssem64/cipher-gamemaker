function load_directory(directory) {
    // Clear the current file list
    files = [];

    // Example file system structure
    if (directory == "/") {
        // Root directory
        files = [
            { name: "Documents", type: "directory" },
            { name: "Pictures", type: "directory" },
            { name: "Music", type: "directory" },
            { name: "README.txt", type: "file" }
        ];
    } else if (directory == "/Documents") {
        // Documents directory
        files = [
            { name: "Report.pdf", type: "file" },
            { name: "Notes.txt", type: "file" }
        ];
    } else if (directory == "/Pictures") {
        // Pictures directory
        files = [
            { name: "Photo1.jpg", type: "file" },
            { name: "Photo2.jpg", type: "file" }
        ];
    } else if (directory == "/Music") {
        // Music directory
        files = [
            { name: "Song1.mp3", type: "file" },
            { name: "Song2.mp3", type: "file" }
        ];
    }

    // Reset scroll position
    scroll_position = 0;
}
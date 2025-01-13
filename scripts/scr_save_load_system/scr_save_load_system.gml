//// Basic save function
//function SaveGame(slot_number) {
//    // Create a struct with all the data you want to save
//    var save_data = {
//        // Player data
//        player_health: obj_player.hp,
//        player_x: obj_player.x,
//        player_y: obj_player.y,
//        player_inventory: obj_player.inventory,
//        player_level: obj_player.level,
        
//        // Game state
//        current_room: room_get_name(room),
//        game_time: global.game_time,
//        quests_completed: global.quests_completed,
        
//        // Add any other data you want to save
//        save_date: date_current_datetime()
//    };
    
//    // Convert to JSON string
//    var json_string = json_stringify(save_data);
    
//    // Create save file
//    var file = file_text_open_write("save_slot_" + string(slot_number) + ".sav");
//    file_text_write_string(file, json_string);
//    file_text_close(file);
    
//    show_debug_message("Game saved to slot " + string(slot_number));
//    return true;
//}

//// Basic load function
//function LoadGame(slot_number) {
//    var filename = "save_slot_" + string(slot_number) + ".sav";
    
//    if (!file_exists(filename)) {
//        show_debug_message("Save file doesn't exist!");
//        return false;
//    }
    
//    var file = file_text_open_read(filename);
//    var json_string = file_text_read_string(file);
//    file_text_close(file);
    
//    var save_data = json_parse(json_string);
    
//    // Load player data
//    with(obj_player) {
//        hp = save_data.player_health;
//        x = save_data.player_x;
//        y = save_data.player_y;
//        inventory = save_data.player_inventory;
//        level = save_data.player_level;
//    }
    
//    // Load game state
//    room_goto(asset_get_index(save_data.current_room));
//    global.game_time = save_data.game_time;
//    global.quests_completed = save_data.quests_completed;
    
//    show_debug_message("Game loaded from slot " + string(slot_number));
//    return true;
//}

//// Check if save exists
//function DoesSaveExist(slot_number) {
//    return file_exists("save_slot_" + string(slot_number) + ".sav");
//}

//// Get save info (for save slot selection screen)
//function GetSaveInfo(slot_number) {
//    var filename = "save_slot_" + string(slot_number) + ".sav";
    
//    if (!file_exists(filename)) {
//        return {
//            exists: false,
//            save_date: "Empty Slot",
//            player_level: 0,
//            location: "None"
//        };
//    }
    
//    var file = file_text_open_read(filename);
//    var json_string = file_text_read_string(file);
//    file_text_close(file);
    
//    var save_data = json_parse(json_string);
    
//    return {
//        exists: true,
//        save_date: date_datetime_string(save_data.save_date),
//        player_level: save_data.player_level,
//        location: save_data.current_room
//    };
//}

function SaveEmails() {
    with(obj_email_window) {
        var json_string = json_stringify(emails);
        var buffer = buffer_create(string_byte_length(json_string) + 1, buffer_fixed, 1);
        buffer_write(buffer, buffer_string, json_string);
        buffer_save(buffer, "email_data.json");
        buffer_delete(buffer);
        show_debug_message("Emails saved successfully");
    }
}

function LoadEmails() {
    var filename = "email_data.json";
    if (!file_exists(filename)) {
        show_debug_message("No saved emails found");
        return false;
    }
    
    var buffer = buffer_load(filename);
    var json_string = buffer_read(buffer, buffer_string);
    buffer_delete(buffer);
    
    with(obj_email_window) {
        emails = json_parse(json_string);
        show_debug_message("Emails loaded: " + string(array_length(emails)));
    }
    return true;
}

function current_date_string() {
    var current_date = date_current_datetime();
    return string(date_get_year(current_date)) + "-" + 
           string(date_get_month(current_date)) + "-" + 
           string(date_get_day(current_date));
}
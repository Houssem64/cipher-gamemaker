//missions = ds_list_create();
//active_missions = ds_list_create();
//completed_missions = ds_list_create();
//current_mission_index = 0;
global.completed_missions = ds_list_create();
global.missions = ds_list_create();
global.active_missions = ds_list_create();
global.current_mission_index = 0;
if (instance_number(object_index) > 1) {
    instance_destroy();
    exit;
}
global.timestarted = current_time;
persistent = true;
mission_complete_alpha = 0;
show_completion_message = false;
completion_message = "";
completion_timer = 0;
completion_display_time = 180; // 3 seconds at 60fps

//missions = ds_list_create();
//active_missions = ds_list_create();
//completed_missions = ds_list_create();
//current_mission_index = 0;

//// Mission creation functions
//function create_mission(_id, _title, _description, _objectives) {
//    var mission = {
//        id: _id,
//        title: _title,
//        description: _description,
//        objectives: _objectives,
//        progress: array_create(array_length(_objectives), 0),
//        required: array_create(array_length(_objectives), 1),
//        is_completed: false,
//        is_active: false,
//        time_started: -1
//    };
    
//    ds_list_add(missions, mission);
//    return mission;
//}

//function initialize_mission_sequence() {
//    // Tutorial Mission
//    create_mission(
//        "tutorial",
//        "System Tutorial",
//        "Learn basic system operations",
//        ["Open terminal", "Type 'help' command"]
//    );
    
//    // Basic Access Mission
//    create_mission(
//        "basic_access",
//        "System Access",
//        "Gain basic access to the system",
//        ["Log into terminal", "Check system status"]
//    );
    
//    // Firewall Mission
//    create_mission(
//        "hack_firewall",
//        "Firewall Breach",
//        "Break through the security firewall",
//        ["Locate firewall", "Find vulnerabilities", "Breach firewall"]
//    );
    
//    // Credentials Mission
//    create_mission(
//        "get_credentials",
//        "Admin Access",
//        "Obtain administrator credentials",
//        ["Find user list", "Crack admin password", "Elevate privileges"]
//    );
    
//    // Data Theft Mission
//    create_mission(
//        "steal_data",
//        "Data Extraction",
//        "Download sensitive information",
//        ["Locate data", "Copy files", "Cover tracks"]
//    );
    
//    // Start first mission
//    activate_next_mission();
//}

//// Mission management functions
//function activate_next_mission() {
//    if (current_mission_index < ds_list_size(missions)) {
//        var mission = missions[|current_mission_index];
//        mission.is_active = true;
//        mission.time_started = current_time;
//        ds_list_clear(active_missions);
//        ds_list_add(active_missions, mission);
//        current_mission_index++;
//        return true;
//    }
//    return false;
//}

//function find_mission(_mission_id) {
//    for (var i = 0; i < ds_list_size(missions); i++) {
//        var mission = missions[|i];
//        if (mission.id == _mission_id) return mission;
//    }
//    return noone;
//}

//function update_mission_progress(_mission_id, _objective_index, _progress) {
//    var mission = find_mission(_mission_id);
//    if (mission != noone && _objective_index < array_length(mission.objectives)) {
//        mission.progress[_objective_index] = _progress;
//        check_mission_completion(mission);
//    }
//}

//function check_mission_completion(_mission) {
//    if (_mission.is_completed) return true;
    
//    var all_complete = true;
//    for (var i = 0; i < array_length(_mission.objectives); i++) {
//        if (_mission.progress[i] < _mission.required[i]) {
//            all_complete = false;
//            break;
//        }
//    }
    
//    if (all_complete && !_mission.is_completed) {
//        _mission.is_completed = true;
//        ds_list_add(completed_missions, _mission);
        
//        // Show completion message
//        show_completion_message = true;
//        completion_message = $"Mission Complete: {_mission.title}\nNext Mission: ";
        
//        if (current_mission_index < ds_list_size(missions)) {
//            var next_mission = missions[|current_mission_index];
//            completion_message += next_mission.title;
//        } else {
//            completion_message += "None - All missions complete!";
//        }
        
//        activate_next_mission();
//        return true;
//    }
//    return false;
//}

//function get_current_mission() {
//    if (ds_list_size(active_missions) > 0) {
//        return active_missions[|0];
//    }
//    return noone;
//}

//function get_mission_progress(_mission) {
//    if (_mission == noone) return 0;
    
//    var total_objectives = array_length(_mission.objectives);
//    var completed_objectives = 0;
    
//    for (var i = 0; i < total_objectives; i++) {
//        if (_mission.progress[i] >= _mission.required[i]) {
//            completed_objectives++;
//        }
//    }
    
//    return (completed_objectives / total_objectives) * 100;
//}

//// Initialize missions

//initialize_mission_sequence();


dialog = instance_create_layer(0, 0, "Instances", obj_dialog_manager);
dialog.start_dialog(["First message", "Second message", "Third message"]);
dialog.callback_object = id;

dialog.callback_script = function() {
    show_message("Dialog ended!");
    // Put your code here
};


// Create all missions in sequence
function initialize_mission_sequence() {
    // Mission 1
    create_mission(
        "basic_access",
        "System Access",
        "Gain basic access to the system",
        ["Log into terminal", "Check system status"]
    );
    
    // Mission 2
    create_mission(
        "hack_firewall",
        "Firewall Breach",
        "Break through the security firewall",
        ["Locate firewall", "Find vulnerabilities", "Breach firewall"]
    );
    
    // Mission 3
    create_mission(
        "get_credentials",
        "Admin Access",
        "Obtain administrator credentials",
        ["Find user list", "Crack admin password", "Elevate privileges"]
    );
    
    // Mission 4
    create_mission(
        "steal_data",
        "Data Extraction",
        "Download sensitive information",
        ["Locate data", "Copy files", "Cover tracks"]
    );
    
    // Start first mission
     global.activate_next_mission(); 
}

// Function to create a new mission
function create_mission(_id, _title, _description, _objectives) {
    var mission = {
        id: _id,
        title: _title,
        description: _description,
        objectives: _objectives,
        progress: array_create(array_length(_objectives), 0),
        required: array_create(array_length(_objectives), 1),
        is_completed: false,
        is_active: false,
        time_started: -1
    };
    ds_list_add(global.missions, mission); // Use global.missions
    return mission;
}

// Function to activate next mission in sequence
global.activate_next_mission = function() {
    // Check if there are remaining missions
    if (global.current_mission_index < ds_list_size(global.missions)) {
        // Get the next mission
        var mission = global.missions[|global.current_mission_index];
        
        // Ensure mission data is valid
        if (is_undefined(mission)) {
            show_debug_message("Error: Mission data is undefined!");
            return false;
        }

        // Activate the mission
        mission.is_active = true;
        mission.time_started = current_time;

        // Update active missions list
        ds_list_clear(global.active_missions); // Clear previous active missions
        ds_list_add(global.active_missions, mission);

        // Increment to the next mission index
        global.current_mission_index++;

        // Debugging information
        show_debug_message("Activated Mission: " + mission.title);
        return true;
    }

    // No more missions available
    show_debug_message("No more missions to activate.");
    return false;
};



// Function to find a mission by ID
function find_mission(_mission_id) {
    for (var i = 0; i < ds_list_size(global.missions); i++) {
        var mission = global.missions[|i];
        if (mission.id == _mission_id) return mission;
    }
    return noone;
}

// Function to update objective progress
function update_mission_progress(_mission_id, _objective_index, _progress) {
    var mission = find_mission(_mission_id);
    if (mission != noone && _objective_index < array_length(mission.objectives)) {
        mission.progress[_objective_index] = _progress;
        check_mission_completion(mission);
    }
}

// Function to check mission completion
function check_mission_completion(_mission) {
    if (_mission.is_completed) return true;
    
    var all_complete = true;
    for (var i = 0; i < array_length(_mission.objectives); i++) {
        if (_mission.progress[i] < _mission.required[i]) {
            all_complete = false;
            break;
        }
    }
    
    if (all_complete && !_mission.is_completed) {
        _mission.is_completed = true;
        ds_list_add(completed_missions, _mission);
        activate_next_mission(); // Start next mission automatically
        return true;
    }
    return false;
}

// Initialize the mission sequence
initialize_mission_sequence();
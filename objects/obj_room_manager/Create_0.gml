room_states = ds_map_create();


function save_room_state() {
    var room_data = ds_map_create();
    
    // Get all instances in the room
    with (all) {
        // Skip persistent objects and the room manager itself
        if (!persistent && id != obj_room_manager) {
            // Create an instance data structure
            var inst_data = ds_map_create();
            
            // Save basic instance properties
            ds_map_add(inst_data, "x", x);
            ds_map_add(inst_data, "y", y);
            ds_map_add(inst_data, "object_index", object_index);
            ds_map_add(inst_data, "image_angle", image_angle);
            ds_map_add(inst_data, "image_xscale", image_xscale);
            ds_map_add(inst_data, "image_yscale", image_yscale);
            ds_map_add(inst_data, "sprite_index", sprite_index);
            ds_map_add(inst_data, "image_index", image_index);
            ds_map_add(inst_data, "visible", visible);
            
            // Save custom variables (add your own here)
            // Example: ds_map_add(inst_data, "hp", hp);
            
            // Add instance data to room data
            ds_map_add_map(room_data, string(id), inst_data);
        }
    }
    
    // Store room data in room states
    ds_map_add_map(room_states, string(room), room_data);
}

// Function to restore room state
function restore_room_state() {
    // Check if we have saved state for this room
    if (!ds_map_exists(room_states, string(room))) {
        return;
    }
    
    // Get room data
    var room_data = room_states[? string(room)];
    
    // Delete all non-persistent instances except room manager
    with (all) {
        if (!persistent && id != obj_room_manager) {
            instance_destroy();
        }
    }
    
    // Restore instances from saved data
    var key = ds_map_find_first(room_data);
    while (!is_undefined(key)) {
        var inst_data = room_data[? key];
        
        // Create instance
        var inst = instance_create_layer(
            inst_data[? "x"],
            inst_data[? "y"],
            "Instances",  // Change this to match your layer name
            inst_data[? "object_index"]
        );
        
        // Restore basic properties
        with (inst) {
            image_angle = inst_data[? "image_angle"];
            image_xscale = inst_data[? "image_xscale"];
            image_yscale = inst_data[? "image_yscale"];
            sprite_index = inst_data[? "sprite_index"];
            image_index = inst_data[? "image_index"];
            visible = inst_data[? "visible"];
            
            // Restore custom variables (add your own here)
            // Example: hp = inst_data[? "hp"];
        }
        
        key = ds_map_find_next(room_data, key);
    }
}

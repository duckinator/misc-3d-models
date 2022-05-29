// Measurements in mm
PSU_WIDTH = 184;
PSU_HEIGHT = 64;

RADIO_WIDTH = 160;
RADIO_HEIGHT = 25;

WALL_THICKNESS = 6;
TOTAL_DEPTH = 127;
TOTAL_WIDTH = PSU_WIDTH + WALL_THICKNESS + WALL_THICKNESS;
TOTAL_HEIGHT = PSU_HEIGHT + WALL_THICKNESS + RADIO_HEIGHT;

RADIO_LEFT_OFFSET = ((PSU_WIDTH - RADIO_WIDTH) / 2) + WALL_THICKNESS;


module psu_vent_slots() {
    translate([-12, 24, 31])
        rotate([45, 0, 0])
            cube([24, 12, 12]);
    
    translate([-12, 101, 31])
        rotate([45, 0, 0])
            cube([24, 12, 12]);
    
    translate([-12, 24, 31])
        cube([24, 77, 17]);
}

difference() {
    // Main shape.
    difference() {
        cube([TOTAL_WIDTH, TOTAL_DEPTH, TOTAL_HEIGHT]);
        translate([-WALL_THICKNESS, -1, PSU_HEIGHT + WALL_THICKNESS])
            cube([RADIO_LEFT_OFFSET, TOTAL_DEPTH + 2, RADIO_HEIGHT + 1]);
        translate([TOTAL_WIDTH - RADIO_LEFT_OFFSET + WALL_THICKNESS, -1, PSU_HEIGHT + WALL_THICKNESS])
            cube([RADIO_LEFT_OFFSET, TOTAL_DEPTH + 2, RADIO_HEIGHT + 1]);
    }

    // Power supply slot.
    translate([WALL_THICKNESS, -1, -1])
        cube([PSU_WIDTH, TOTAL_DEPTH + 2, PSU_HEIGHT]);

    // Radio slot.
    translate([RADIO_LEFT_OFFSET, -1, PSU_HEIGHT + WALL_THICKNESS])
        cube([RADIO_WIDTH, TOTAL_DEPTH + 2, RADIO_HEIGHT + 1]);

    // Power supply ventilation slots.
    psu_vent_slots();
    translate([PSU_WIDTH + 1, 0, 0])
        psu_vent_slots();

    // Truncate to 2*WALL_THICKNESS
    /*translate([-1, WALL_THICKNESS * 2, -1])
        cube([TOTAL_WIDTH + 2, TOTAL_DEPTH, TOTAL_HEIGHT + 2]);*/
}
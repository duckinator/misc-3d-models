module psu_vent_slots() {
    translate([-0.5, 0.5, 0.25])
        cube([1, 2.25, 2.5]);
    translate([-0.5, 3.25, 0.25])
        cube([1, 2.25, 2.5]);
}

difference() {
    // Main shape.
    hull() {
        translate([0.375, 6, 5 - 0.375])
            rotate([90, 0, 0])
                cylinder(6, r=0.375, $fn=30);

        translate([7.25, 6, 5 - 0.375])
            rotate([90, 0, 0])
                cylinder(6, r=0.375, $fn=30);

        cube([7.125 + 0.25 + 0.25, 6, 5 - 0.375]);
    }

    // Power supply slot.
    translate([0.25, -0.25, -0.125])
        cube([7.125, 7.5, 3.125]);

    // Radio slot.
    translate([0.75, -0.25, 3.25])
        cube([6.125, 7.5, 3]);

    // Power supply entilation slots.
    psu_vent_slots();
    translate([7.5, 0, 0])
        psu_vent_slots();
}
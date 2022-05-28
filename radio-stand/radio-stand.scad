module psu_vent_slots() {
    translate([-0.5, 0.5, 0.25])
        cube([1, 1.75, 2.5]);
    translate([-0.5, 2.5 + 0.125, 0.25])
        cube([1, 1.75, 2.5]);
    translate([-0.5, 4.75, 0.25])
        cube([1, 1.75, 2.5]);
}

difference() {
    // Main shape.
    cube([7.125 + 0.25 + 0.25, 7, 5]);

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
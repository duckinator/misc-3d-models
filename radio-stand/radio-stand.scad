module psu_vent_slots() {
    /*translate([-0.5, 1.25, 1.25])
        rotate([0, 90, 0])
            cylinder(h=1, r=1, $fn=6);
    
    translate([-0.5, 3.75, 1.25])
        rotate([0, 90, 0])
            cylinder(h=1, r=1, $fn=6);
    */

    /*for (x = [0.5 : 1 : 4.5]) {
        translate([-0.5, x, 1.25])
            rotate([45, 0, 0])
                cube([1, 0.5, 0.5]);
*/
        /*translate([-0.5, x, 0.5])
            rotate([45, 0, 0])
                cube([1, 0.5, 0.5]);*/
    //}
    
    translate([-0.5, 1, 1.25])
        rotate([45, 0, 0])
            cube([1, 0.5, 0.5]);
    
    translate([-0.5, 4, 1.25])
        rotate([45, 0, 0])
            cube([1, 0.5, 0.5]);
    
    translate([-0.5, 1, 1.25])
        cube([1, 3, 0.7]);
}

difference() {
    // Main shape.
    //hull() {
        /*translate([0.375, 6, 5 - 0.375])
            rotate([90, 0, 0])
                cylinder(6, r=0.375, $fn=30);

        translate([7.25, 6, 5 - 0.375])
            rotate([90, 0, 0])
                cylinder(6, r=0.375, $fn=30);*/

        difference() {
            cube([7.125 + 0.25 + 0.25, 5, 3.5/*5 - 0.375*/]);
            translate([-0.25, -0.25, 2.75])
                cube([0.75, 6.5, 1.5]);
            translate([7.125, -0.25, 2.75])
                cube([0.75, 6.5, 1.5]);
        }
    //}

    // Power supply slot.
    translate([0.25, -0.25, -0.125])
        cube([7.125, 7.5, 2.5 + 0.125]);

    // Radio slot.
    translate([0.75, -0.25, 2.75])
        cube([6.125, 7.5, 3]);

    // Power supply entilation slots.
    psu_vent_slots();
    translate([7.5, 0, 0])
        psu_vent_slots();
}
//globals


//sip_ indicates value for the basket
sip_radius = 27.5;
sip_height = 55;
sip_lip_radius = 42.5;
sip_wick_radius = 3;

sip_wall_thickness = 2;
sip_floor_thickness = 3;
sip_lip_thickness = sip_floor_thickness;


module yogurtCup_SIP() {

	difference(){

		//add here
		union() {
			cylinder(r=sip_radius, h=sip_height+sip_lip_thickness);
			translate([0,0,sip_height]) {
				cylinder(r=sip_lip_radius, h=sip_lip_thickness);	
			}		
		}
		
		//take away here
		union() {
			translate([0,0,sip_floor_thickness]) {
				cylinder(r=sip_radius-sip_wall_thickness, h=sip_height+sip_lip_thickness);
			}
			translate([0,0,-sip_floor_thickness]) {
				cylinder(r=sip_wick_radius, h=sip_floor_thickness*3);
			}

		}
	}

}




yogurtCup_SIP();
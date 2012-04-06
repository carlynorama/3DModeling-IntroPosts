//---------------------------------------------------------------- GLOBALS

//-------------------------------------------------- Yogurt Container
//these are the values for the container itself
yc_bottom_e_radius = 56/2; 
yc_top_e_radius = 80/2;
yc_wall_thickness = 0.5;
yc_floor_thickness = yc_wall_thickness;
yc_bottom_i_radius = yc_bottom_e_radius-yc_wall_thickness; 
yc_top_i_radius = yc_top_e_radius-yc_wall_thickness;
yc_height = 82.5+yc_floor_thickness;  // 55/82.5 = 2/3

//---------------------------------------------------- Basket Insert
////these are the values for the basket that turns it into a SIP
sip_bottom_radius = yc_bottom_i_radius;

//exchange these two lines to give the cup a canted side
//sip_top_radius = sip_bottom_radius;
sip_top_radius = yc_top_i_radius;

sip_height = ((yc_height-yc_floor_thickness)/3)*2;
sip_lip_radius = yc_top_i_radius + 5;
sip_wick_radius = 3;
sip_wall_thickness = 2;
sip_floor_thickness = 3;
sip_lip_thickness = sip_floor_thickness;

//-------------------------------------------------- START yogurtCup_SIP()
module yogurtCup_SIP() {

	difference(){

		//add here
		union() {
			cylinder(r1=sip_bottom_radius, r2=sip_top_radius, h=sip_height+sip_lip_thickness);
			translate([0,0,sip_height]) {
				cylinder(r=sip_lip_radius, h=sip_lip_thickness);	
			}		
		}
		
		//take away here
		union() {
			translate([0,0,sip_floor_thickness]) {
				cylinder(r=sip_bottom_radius-sip_wall_thickness, r2=sip_top_radius-sip_wall_thickness, h=sip_height+sip_lip_thickness);
			}
			translate([0,0,-sip_floor_thickness]) {
				cylinder(r=sip_wick_radius, h=sip_floor_thickness*3);
			}

		}
	}

}
//---------------------------------------------------- END yogurtCup_SIP()



yogurtCup_SIP();
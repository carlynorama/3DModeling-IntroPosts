// Based on the code
// 2011.0219 Interactive Parametrics Workshop 
// Marius Watz with Studio Mode and MakerBot
// http://modelab.nu/?p=4152
// http://workshop.evolutionzone.com
//
// Shared under Creative Commons "share-alike non-commercial use 
// only" license.
/* 
 * Adapted by Carlyn Maw 
 * Abortive attempt to model a Yogurt Cup Self Irrigating Planter
 * Collection of cylinders
 * 2012 04 14
 *
 */

//the required libraries
import unlekker.util.*;
import unlekker.modelbuilder.*;

//lets the camera be moved by mouse, similart to PeasyCam?
MouseNav3D nav;
//where the library holds the model it 
//displays and then will output as STL
UGeometry model;

//---------------------------------------------------------------- START setup()
void setup() {
  size(400,400, P3D);

  // add MouseNav3D navigation
  nav=new MouseNav3D(this);
  nav.trans.set(width/2,height/2,0);
  smooth();
  
  //function puts primatives into a model
  buildModel();
}
//---------------------------------------------------------------- START draw()
void draw() {
  background(100);

  lights();
  
  // call MouseNav3D transforms
  nav.doTransforms();
  fill(255,100,0);

  model.draw(this);
}

//---------------------------------------------------------------- START mouseDragged
public void mouseDragged() {
  nav.mouseDragged();
}
	
//---------------------------------------------------------------- START keyPressed
public void keyPressed() {
  nav.keyPressed();

  if(key=='s') {
    model.writeSTL(this, "yogurtcup_sip_v0_1h_procs_mb.stl");
  }
}

//---------------------------------------------------------------- START buildModel
void buildModel() {
  float x,y,z;
  
  // Create cylinder geometry
  // Parameters: w,h,detail, capped
  
  model=Primitive.cylinder(55,55,24, false);
  //model=add(oBasket);
  

  UGeometry ibskt=Primitive.cylinder(52.5,55,24, false);
  // note that Geometry.add() copies the faces rather than 
  // keep a reference to the original Geometry object
  ibskt.translate(0,-6,0);
  model.add(ibskt);
  
   UGeometry drain=Primitive.cylinder(6,3,24, false);
  // note that Geometry.add() copies the faces rather than 
  // keep a reference to the original Geometry object
  drain.translate(0,55,0);
  model.add(drain);
    
  UGeometry lip=Primitive.cylinder(85,3,24, false);
  // note that Geometry.add() copies the faces rather than 
  // keep a reference to the original Geometry object
  lip.translate(0,-55,0);
  model.add(lip);
  
}


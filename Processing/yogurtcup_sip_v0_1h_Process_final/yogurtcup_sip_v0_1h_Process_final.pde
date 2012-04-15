// Using library & example codeby
// Marius Watz, 2011
// http://workshop.evolutionzone.com

//
// buildDrainCupWithLip() by Carlyn Maw 
// 2012 04 14
//


import unlekker.util.*;
import unlekker.modelbuilder.*;

MouseNav3D nav;

UGeometry model;

void setup() {
  size(400,400, P3D);

  // add MouseNav3D navigation
  nav=new MouseNav3D(this);
  //third number is the zoom
  nav.trans.set(width/2,height/2,200);
  

  buildDrainCupWithLip(30, 30, 27.5, 55, 3, 3, 42.5);
}

void draw() {
  background(100);

  lights();
  
  // call MouseNav3D transforms
  nav.doTransforms();
  fill(255);

  model.draw(this);
}

public void mouseDragged() {
  nav.mouseDragged();
}
	
public void keyPressed() {
  nav.keyPressed();

  if(key=='s') {
    model.writeSTL(this, "yogurtcup_sip_v0_1h_Process_final.stl");
  }
}

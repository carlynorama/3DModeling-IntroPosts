/*
 * Based on example code of how to make cylinders by Jan Vantomme
 * http://vormplus.be/blog/article/drawing-a-cylinder-with-processing
 * 10 December 2010
 *
 * Adapted by Carlyn Maw 
 * Made 4 primatives with wall thicknesses and various features
 * 2012 04 14
 *
 * Primatives live in second file called primatives
 *
 * number of facets, top, bottom height, thickness
 * void drawThickCylinder( int sides, float r1, float r2, float h, float t) 
 *
 * number of facets, top, bottom height, thickness
 * void drawCup( int sides, float r1, float r2, float h, float t)
 *
 * number of facets, top, bottom height, thickness, drain hole radius
 * void drawDrainCup( int sides, float r1, float r2, float h, float t, float d)
 *
 * number of facets, top, bottom height, thickness, drain hole radius, lip radius (from center)
 * void drawDrainCupWithLip( int sides, float r1, float r2, float h, float t, float d, float l)
 
 
 */


import processing.opengl.*;

void setup()
{
  size(450, 450, OPENGL);
}

void draw()
{
  background(0, 128, 255);
  lights();

  fill(255, 128, 0);

  pushMatrix();    
  translate( 120, 120, 0 );
  rotateX( PI/2 );
  rotateY( radians( frameCount ) );
  rotateZ( radians( frameCount ) );
  drawThickCylinder( 30, 50, 50, 100, 20 );
  popMatrix();

  pushMatrix();    
  translate( 330, 120, 0 );
  rotateX( PI/4 );
  rotateY( radians( frameCount ) );
  rotateZ( radians( frameCount ) );
  drawCup(10, 50, 30,50, 10 );
  popMatrix();

  pushMatrix();    
  translate( 120, 330, 0 );
  rotateX( PI/6 );
  rotateY( radians( frameCount ) );
  rotateZ( radians( frameCount ) );
  drawDrainCup(10, 50, 30, 40, 10, 6);
  popMatrix();
  
  pushMatrix();    
  translate( 330, 330, 0 );
  rotateX( PI/6 );
  rotateY( radians( frameCount ) );
  rotateZ( radians( frameCount ) );
  drawDrainCupWithLip(10, 50, 30, 40, 10, 6, 60);
  popMatrix();
}



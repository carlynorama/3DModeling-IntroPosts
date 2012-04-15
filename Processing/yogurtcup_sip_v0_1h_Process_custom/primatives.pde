
// ---------------------------------------------------------------------------START drawThickCylinder
//number of facets, top, bottom height, thickness
void drawThickCylinder( int sides, float r1, float r2, float h, float t)
{
  float thickness = t;  
  float angle = 360 / sides;
  float halfHeight = h / 2;

  float ir1 = r1 - thickness; 
  float ir2 = r2 - thickness;

  // draw outside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x2, y2, halfHeight);
    vertex( x1, y1, -halfHeight);
  }
  endShape(CLOSE);

  //draw inside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir1;
    float y1 = sin( radians( i * angle ) ) * ir1;
    float x2 = cos( radians( i * angle ) ) * ir2;
    float y2 = sin( radians( i * angle ) ) * ir2;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, halfHeight-thickness);
  }
  endShape(CLOSE);

  //draw r1 side
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * ir1;
    float y2 = sin( radians( i * angle ) ) * ir1;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, -halfHeight);
  }
  endShape(CLOSE);


  //draw r2 side ouside (floor outside)
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir2;
    float y1 = sin( radians( i * angle ) ) * ir2;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x1, y1, halfHeight);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);
}
// ---------------------------------------------------------------------------- END drawThickCylinder

// ------------------------------------------------------------------------------------ START drawCup
// number of facets, top, bottom height, thickness
void drawCup( int sides, float r1, float r2, float h, float t)
{
  float thickness = t;  
  float angle = 360 / sides;
  float halfHeight = h / 2;

  float ir1 = r1 - thickness; 
  float ir2 = r2 - thickness;

  // draw outside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x2, y2, halfHeight);
    vertex( x1, y1, -halfHeight);
  }
  endShape(CLOSE);

  //draw inside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir1;
    float y1 = sin( radians( i * angle ) ) * ir1;
    float x2 = cos( radians( i * angle ) ) * ir2;
    float y2 = sin( radians( i * angle ) ) * ir2;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, halfHeight-thickness);
  }
  endShape(CLOSE);

  //draw r1 side
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * ir1;
    float y2 = sin( radians( i * angle ) ) * ir1;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, -halfHeight);
  }
  endShape(CLOSE);


  //draw r2 side ouside (floor outside)
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * 0;
    float y1 = sin( radians( i * angle ) ) * 0;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x1, y1, halfHeight);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);


  //draw r2 side inside (floor inside)
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir2;
    float y1 = sin( radians( i * angle ) ) * ir2;
    float x2 = cos( radians( i * angle ) ) * 0;
    float y2 = sin( radians( i * angle ) ) * 0;
    vertex( x1, y1, halfHeight-thickness);
    vertex( x2, y2, halfHeight-thickness);
  }
  endShape(CLOSE);

  /* Can't port to STL model maker
   //draw r2 side (floor)
   
   // draw outside bottom of the tube
   beginShape();
   for (int i = 0; i < sides; i++) {
   float x = cos( radians( i * angle ) ) * r2;
   float y = sin( radians( i * angle ) ) * r2;
   vertex( x, y, halfHeight);
   }
   endShape(CLOSE);
   
   // draw inside bottom of the tube
   beginShape();
   for (int i = 0; i < sides; i++) {
   float x = cos( radians( i * angle ) ) * ir2;
   float y = sin( radians( i * angle ) ) * ir2;
   vertex( x, y, halfHeight-thickness);
   }
   endShape(CLOSE);
   */
}
// -------------------------------------------------------------------------------------- END drawCup

// ------------------------------------------------------------------------------- START drawDrainCup
// number of facets, top, bottom height, thickness, drain hole radius
void drawDrainCup( int sides, float r1, float r2, float h, float t, float d)
{
  float thickness = t;  
  float angle = 360 / sides;
  float halfHeight = h / 2;

  float ir1 = r1 - thickness; 
  float ir2 = r2 - thickness;

  float dr = d;

  // draw outside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x2, y2, halfHeight);
    vertex( x1, y1, -halfHeight);
  }
  endShape(CLOSE);

  //draw inside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir1;
    float y1 = sin( radians( i * angle ) ) * ir1;
    float x2 = cos( radians( i * angle ) ) * ir2;
    float y2 = sin( radians( i * angle ) ) * ir2;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, halfHeight-thickness);
  }
  endShape(CLOSE);

  //draw r1 side
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * ir1;
    float y2 = sin( radians( i * angle ) ) * ir1;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, -halfHeight);
  }
  endShape(CLOSE);


  //draw r2 side ouside (floor outside)
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * dr;
    float y1 = sin( radians( i * angle ) ) * dr;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x1, y1, halfHeight);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);


  //draw r2 side inside (floor inside)
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir2;
    float y1 = sin( radians( i * angle ) ) * ir2;
    float x2 = cos( radians( i * angle ) ) * dr;
    float y2 = sin( radians( i * angle ) ) * dr;
    vertex( x1, y1, halfHeight-thickness);
    vertex( x2, y2, halfHeight-thickness);
  }
  endShape(CLOSE);

  //draw drain walls
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * dr;
    float y1 = sin( radians( i * angle ) ) * dr;
    float x2 = cos( radians( i * angle ) ) * dr;
    float y2 = sin( radians( i * angle ) ) * dr;
    vertex( x1, y1, halfHeight-thickness);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);
}
// --------------------------------------------------------------------------------- END drawDrainCup

// ------------------------------------------------------------------------ START drawDrainCupWithLip
// number of facets, top, bottom height, thickness, drain hole radius, lip radius (from center)
void drawDrainCupWithLip( int sides, float r1, float r2, float h, float t, float d, float l)
{


  float thickness = t;  
  float angle = 360 / sides;
  float halfHeight = h / 2;

  float ir1 = r1 - thickness; 
  float ir2 = r2 - thickness;

  float dr = d;
  float lor = l;

  // draw outside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x2, y2, halfHeight);
    vertex( x1, y1, -halfHeight);
  }
  endShape(CLOSE);

  //draw inside
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir1;
    float y1 = sin( radians( i * angle ) ) * ir1;
    float x2 = cos( radians( i * angle ) ) * ir2;
    float y2 = sin( radians( i * angle ) ) * ir2;
    vertex( x1, y1, -halfHeight-thickness);
    vertex( x2, y2, halfHeight-thickness);
  }
  endShape(CLOSE);

  //draw lip walls
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * lor;
    float y1 = sin( radians( i * angle ) ) * lor;
    float x2 = cos( radians( i * angle ) ) * lor;
    float y2 = sin( radians( i * angle ) ) * lor;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, -halfHeight-thickness);
  }
  endShape(CLOSE);  

  //draw lip bottom
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * lor;
    float y2 = sin( radians( i * angle ) ) * lor;
    vertex( x1, y1, -halfHeight);
    vertex( x2, y2, -halfHeight);
  }
  endShape(CLOSE);

  //draw lip top
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * lor;
    float y1 = sin( radians( i * angle ) ) * lor;
    float x2 = cos( radians( i * angle ) ) * ir1;
    float y2 = sin( radians( i * angle ) ) * ir1;
    vertex( x1, y1, -halfHeight-thickness);
    vertex( x2, y2, -halfHeight-thickness);
  }
  endShape(CLOSE);

  //draw r2 side ouside (floor outside)
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * dr;
    float y1 = sin( radians( i * angle ) ) * dr;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    vertex( x1, y1, halfHeight);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);

  //draw r2 side inside (floor inside)
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir2;
    float y1 = sin( radians( i * angle ) ) * ir2;
    float x2 = cos( radians( i * angle ) ) * dr;
    float y2 = sin( radians( i * angle ) ) * dr;
    vertex( x1, y1, halfHeight-thickness);
    vertex( x2, y2, halfHeight-thickness);
  }
  endShape(CLOSE);

  //draw drain walls
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * dr;
    float y1 = sin( radians( i * angle ) ) * dr;
    float x2 = cos( radians( i * angle ) ) * dr;
    float y2 = sin( radians( i * angle ) ) * dr;
    vertex( x1, y1, halfHeight-thickness);
    vertex( x2, y2, halfHeight);
  }
  endShape(CLOSE);
}


// ---------------------------------------------------------------------- END drawDrainCupWithLip


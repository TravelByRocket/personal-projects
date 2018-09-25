int pointCount = 5;

float anchorPointsX[] = new float[pointCount];
float anchorPointsY[] = new float[pointCount];
float controlPointsXl[] = new float[pointCount];
float controlPointsYl[] = new float[pointCount];
float controlPointsXr[] = new float[pointCount];
float controlPointsYr[] = new float[pointCount];
float controlAngles[] = new float[pointCount];

// every bezier has two anchors and two control points
// every anchor will have an angle going through it that control the anchors connected to it
// there are n anchor points and n control points
// it goes a0,c0,c1l,a1 repeating again as a1,c1r,c2l,a2    where c1 and c2 

void setup() {
 size(1000,1000);
  fill(#FFFFFF);
  rect(0, 0, width, height);
  for (int i = 0; i < pointCount; i++) {
    
  }
}

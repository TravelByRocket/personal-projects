// In progress. Updating notation for an arbitrary number of anchor points.

// Bryan Costanza
// Processing 3
// inspired by and typo of https://github.com/inconvergent/sand-spline

int pointCount = 5;

float noiseScale = 0.01;
float motionScale = 500;

float anchorPoints[][] = new float[pointCount][pointCount];
float controlPointsL[][] = new float[pointCount][pointCount];
float controlPointsR[][] = new float[pointCount][pointCount];
float controlAngles[] = new float[pointCount];

// every bezier has two anchors and two control points
// every anchor will have an angle going through it that control the anchors connected to it
// there are n anchor points and n control points
// it goes a0,c0,c1l,a1 repeating again as a1,c1r,c2l,a2    where c1 and c2 

void setup() {
  size(1000, 1000);
  fill(#FFFFFF);
  rect(0, 0, width, height);
  for (int i = 0; i < pointCount; i++) {
    anchorPoints[i][0] = width*(i+1)/(pointCount+1);
    anchorPoints[i][1] = height/2;
    controlPointsL[i][0] = anchorPoints[i][0] - width/(pointCount+1)/2; // offset left control points 1/2 the distance to previous anchor
    controlPointsL[i][1] = height/2;
    controlPointsR[i][0] = anchorPoints[i][0] + width/(pointCount+1)/2; // offset right control points 1/2 the distance to next anchor
    controlPointsR[i][1] = height/2;
  }
}

void draw() {
  
  // draw the moving lines
  stroke(#0C7489);
  noFill();
  
  for (int j = 0; j < pointCount; j++) {
    
  }
  
  
  beginShape();
  vertex(anchorPoints[0][0], anchorPoints[0][1]);
  for (int i = 0; i < pointCount; i++) {
    bezierVertex(
    controlPointsR[i][0], controlPointsR[i][1], // right-side control point for previous anchor point
    controlPointsL[i][0], controlPointsL[i][1], // left-side control point for next anchor point
    anchorPoints[i][0], anchorPoints[i][1]); // the next anchor point
  }
  endShape();
  
}

// In progress. Updating notation for an arbitrary number of anchor points.

// Bryan Costanza
// Processing 3
// inspired by and typo of https://github.com/inconvergent/sand-spline

int pointCount = 5;
int n = 400; // number of iterations
int counter = 0;

float noiseScale = 0.01;
float motionScale = 1000;

float anchorPoints[][] = new float[pointCount][pointCount];
float controlPointsL[][] = new float[pointCount][pointCount];
float controlPointsR[][] = new float[pointCount][pointCount];
float armLengthL[] = new float[pointCount];
float armLengthR[] = new float[pointCount];
float controlAngles[] = new float[pointCount];

//float addNoise[] = new float[pointCount];

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
    armLengthL[i] = 50;
    armLengthR[i] = 50;
  }
  //background(#FFFFFF);
}

void draw() {
  background(#FFFFFF);
  // draw the moving lines
  stroke(#0C7489);
  noFill();

  for (int j = 0; j < pointCount; j++) {
    // sample from Perlin noise at x location set by the anchor points (scaled) and then travel 
    // "forward" (vertically? through noise field. Map the noise to -1/2 pi tp +1/2 pi.
    controlAngles[j] = map(noise(anchorPoints[j][0]*noiseScale, counter*noiseScale), 0, 1, -HALF_PI, HALF_PI);
    armLengthL[j] = map(noise(j*noiseScale, counter*noiseScale), 0, 1, 5, 100);
    armLengthR[j] = map(noise(j*noiseScale+1, counter*noiseScale), 0, 1, 5, 100);
    //println(height/2 - sin(controlAngles[j]));
    //println(controlAngles[j]);
    //println(noise(anchorPoints[j][0]*noiseScale, counter*noiseScale));
    controlPointsL[j][0] = anchorPoints[j][0] - armLengthL[j]*cos(controlAngles[j]); // offset left control points 1/2 the distance to previous anchor
    controlPointsL[j][1] = height/2 + armLengthL[j]*sin(controlAngles[j]); // this was correct but wanting to calc along the control angle
    controlPointsR[j][0] = anchorPoints[j][0] + armLengthR[j]*cos(controlAngles[j]); // offset right control points 1/2 the distance to next anchor
    controlPointsR[j][1] = height/2 - armLengthR[j]*sin(controlAngles[j]); // this was correct but wanting to calc along the control angle
  }


  beginShape();
  vertex(anchorPoints[0][0], anchorPoints[0][1]); // first anchor point
  for (int i = 0; i < pointCount-1; i++) { //once for each segment, which is 1 less than the number of points
    bezierVertex(
      controlPointsR[i][0], controlPointsR[i][1], // right-side control point for previous anchor point
      controlPointsL[i+1][0], controlPointsL[i+1][1], // left-side control point for next anchor point
      anchorPoints[i+1][0], anchorPoints[i+1][1]); // thxe next anchor point
  }
  endShape();

  for (int k = 0; k < pointCount; k++) {
    line(controlPointsR[k][0], controlPointsR[k][1], anchorPoints[k][0], anchorPoints[k][1]);
    line(controlPointsL[k][0], controlPointsL[k][1], anchorPoints[k][0], anchorPoints[k][1]);
    ellipse(controlPointsR[k][0], controlPointsR[k][1], 3, 3); // right-side control point for previous anchor point
    ellipse(controlPointsL[k][0], controlPointsL[k][1], 3, 3); // left-side control point for next anchor point
    //ellipse(anchorPoints[k][0], anchorPoints[k][1], 5*k, 3); // the next anchor point
  }

  if (counter == n) {
    noLoop();
  }
  counter++;
  println(counter);
}

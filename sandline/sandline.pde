int i = 0; // count initializer
int n = 2000; // number of iterations

float noiseScale = .01;
float motionScaleX = 0;
float motionScaleY = 500;

float xa1;
float ya1;
float xc1;
float yc1;

float xa2;
float ya2;
float xc2;
float yc2;

float xa3;
float ya3;
float xc3;
float yc3;

float xa4;
float ya4;
float xc4;
float yc4;

float xa5;
float ya5;

float xa1i;
float ya1i;
float xc1i;
float yc1i;

float xa2i;
float ya2i;
float xc2i;
float yc2i;

float xa3i;
float ya3i;
float xc3i;
float yc3i;

float xa4i;
float ya4i;
float xc4i;
float yc4i;

float xa5i;
float ya5i;

float xa1o = random(1);
float ya1o = random(1);
float xc1o = random(1);
float yc1o = random(1);

float xa2o = random(1);
float ya2o = random(1);
float xc2o = random(1);
float yc2o = random(1);

float xa3o = random(1);
float ya3o = random(1);
float xc3o = random(1);
float yc3o = random(1);

float xa4o = random(1);
float ya4o = random(1);
float xc4o = random(1);
float yc4o = random(1);

float xa5o = random(1);
float ya5o = random(1);


void setup() {
  size(1000, 1000);
  fill(#FFFFFF);
  rect(0, 0, width, height);
  //frameRate(10);
  xa1i = width*1/6;
  ya1i = height/2;
  xc1i = width*1/6 + width*1/12;
  yc1i = height/2;

  xa2i = width*2/6;
  ya2i = height/2;
  xc2i = width*2/6 + width*1/12;
  yc2i = height/2;

  xa3i = width*3/6;
  ya3i = height/2;
  xc3i = width*3/6 + width*1/12;
  yc3i = height/2;

  xa4i = width*4/6;
  ya4i = height/2;
  xc4i = width*4/6 + width*1/12;
  yc4i = height/2;

  xa5i = width*5/6;
  ya5i = height/2;
}

void draw () {
  // draw the fading background
  fill(255, 2);
  rect(0, 0, width, height);

  //bump points around
  xa1 = xa1i+noise(xa1o+i*noiseScale)*motionScaleX-motionScaleX/2;
  ya1 = ya1i+noise(ya1o+i*noiseScale)*motionScaleY-motionScaleY/2;
  xc1 = xc1i+noise(xc1o+i*noiseScale)*motionScaleX-motionScaleX/2;
  yc1 = yc1i+noise(yc1o+i*noiseScale)*motionScaleY-motionScaleY/2;

  xa2 = xa2i+noise(xa2o+i*noiseScale)*motionScaleX-motionScaleX/2;
  ya2 = ya2i+noise(ya2o+i*noiseScale)*motionScaleY-motionScaleY/2;
  xc2 = xc2i+noise(xc2o+i*noiseScale)*motionScaleX-motionScaleX/2;
  yc2 = yc2i+noise(yc2o+i*noiseScale)*motionScaleY-motionScaleY/2;

  xa3 = xa3i+noise(xa3o+i*noiseScale)*motionScaleX-motionScaleX/2;
  ya3 = ya3i+noise(ya3o+i*noiseScale)*motionScaleY-motionScaleY/2;
  xc3 = xc3i+noise(xc3o+i*noiseScale)*motionScaleX-motionScaleX/2;
  yc3 = yc3i+noise(yc3o+i*noiseScale)*motionScaleY-motionScaleY/2;

  xa4 = xa4i+noise(xa4o+i*noiseScale)*motionScaleX-motionScaleX/2;
  ya4 = ya4i+noise(ya4o+i*noiseScale)*motionScaleY-motionScaleY/2;
  xc4 = xc4i+noise(xc4o+i*noiseScale)*motionScaleX-motionScaleX/2;
  yc4 = yc4i+noise(yc4o+i*noiseScale)*motionScaleY-motionScaleY/2;

  xa5 = xa5i+noise(xa5o+i*noiseScale)*motionScaleX-motionScaleX/2;
  ya5 = ya5i+noise(ya5o+i*noiseScale)*motionScaleY-motionScaleY/2;

  // draw the moving lines
  stroke(#0C7489);
  noFill();
  beginShape();
  vertex(xa1, ya1);
  bezierVertex(xc1, yc1, xc1, yc1, xa2, ya2);
  bezierVertex(xc2, yc2, xc2, yc2, xa3, ya3);
  bezierVertex(xc3, yc3, xc3, yc3, xa4, ya4);
  bezierVertex(xc4, yc4, xc4, yc4, xa5, ya5);
  endShape();

  // draw the control lines
  stroke(0, 0, 0, 50);
  //ellipse(x1,y1,3,3);
  //ellipse(x4,y4,3,3);
  //line(xa1,ya1,xc1,yc1);
  //line(xa2,ya2,xc1,yc1);
  //line(xa2,ya2,xc2,yc2);
  //line(xa3,ya3,xc2,yc2);
  //line(xa3,ya3,xc3,yc3);
  //line(xa3,ya3,xc3,yc3);

  i++;
  if (i==n) {
    noLoop();
  }
  //println(xa5i);
}

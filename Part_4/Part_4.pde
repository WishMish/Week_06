// Code 1 FA_18
// Bryan Ma

// 2d arrays part 3

// this sketch uses a 2d array of floats, used to store values that will be used as 
//  angles for matrix transformations. it creates the array with random angles, 
//  then draws lines at those angles in the draw loop.

// change the sketch so that the angles in setup are mapped somehow to the value of 
//  i and/or j. then in the draw loop, change the value of the angle at every position
//  in the 2d array by some amount, to make each line rotate. (see the gif in this folder for an example)
// experiment with sizes, shapes, colors, and adding additional 2d arrays to create 
// more values to store, draw with, and modify at runtime. 

int gridW = 20;
int gridH = 20;

float[][] angles = new float[gridW][gridH];
float[][] spin = new float[gridW][gridH];
float[][] colors = new float[gridW][gridH];

void setup() {
  size(800, 800);
  for (int i = 0; i < gridW; i++) {
    for (int j = 0; j < gridH; j++) {
      float r = map(i,0,20,0,360);
      angles[i][j] = r;
    }
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < gridW; i++) {
    for (int j = 0; j < gridH; j++) {
      spin[i][j] += random(1,10);
      //couldn't figure out how to do this with a 2d array
      float r= colors[i][j]=map(i,0,20,100,255); 
      float b= colors[i][j]=map(j,0,20,150,255);  
      stroke(r,0,b);
      float sW = map(mouseX, 0, 800, 2, 10);
      strokeWeight(sW);
      pushMatrix();
      translate(i * width/gridW, j * height/gridH);
      rotate(radians(spin[i][j]));
      line(-width/gridW*0.5, 0, width/gridW*0.5, 0);
      popMatrix();
    }
  }
}

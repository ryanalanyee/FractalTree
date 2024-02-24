private double fractionLength = 0.8;
private int smallestBranch = 9;
private double branchAngle = 0.6; // Increased angle for more curvature

void setup() {
  size(600, 600);    
  noLoop();
}

void draw() {
  background(255, 255, 255);  
  stroke(0, 255, 0); // Green color for branches
  line(320, 480, 320, 380);  
  drawBranches(320, 380, 100, 3 * Math.PI / 2);
}

void drawBranches(int x, int y, double branchLength, double angle) {  
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  
  int endX1 = (int)(branchLength * Math.cos(angle1) + x);
  int endY1 = (int)(branchLength * Math.sin(angle1) + y);

  int endX2 = (int)(branchLength * Math.cos(angle2) + x);
  int endY2 = (int)(branchLength * Math.sin(angle2) + y);

  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength * 0.9, angle1); // Reducing branch length
    drawBranches(endX2, endY2, branchLength * 0.9, angle2); // Reducing branch length
  }
}

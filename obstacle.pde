
int OBSTACLE_SPEED = 5;
int OBSTACLE_WIDTH = 200;
int OBSTACLE_HEIGHT = 200;
float t = 0.0;  
class Obstacle {
  
  PImage im_Obstacle; // Declare PImage variable to store the obstacle image
  float x, y;
   float s;
  Obstacle(float x, float y) {
    im_Obstacle = loadImage("obstacle.png"); // Load obstacle image
    im_Obstacle.resize(OBSTACLE_WIDTH,OBSTACLE_HEIGHT); // Resize obstacle image
    this.x = x;
    this.y = y;
  }
  
  void update() {
   t+=0.04;
   s = OBSTACLE_SPEED*t;
   
    y += s;  // Move obstacle vertically
  }
  
  void display() {
    imageMode(CORNER);
    image(im_Obstacle, x, y); // Display obstacle image
  }
  
  boolean hits(int cx1, int cx2, int cy1,int cy2) {
    
    print("y= "+(y+OBSTACLE_HEIGHT) + "\n" + "cy1 = " + cy1);
    
    if(y+OBSTACLE_HEIGHT>=525 && y+OBSTACLE_HEIGHT <=700 && cx1>x && cx1<=(x+OBSTACLE_WIDTH))
     { print("\nGame over 1\n");
       print(y+OBSTACLE_HEIGHT + " " + cx1 + ">" + x + "," +cx1+ "<=" + (x+OBSTACLE_WIDTH )+ "\n");
      return true;}
      
      
      
     else if(y+OBSTACLE_HEIGHT>=525 && y+OBSTACLE_HEIGHT<=700 && cx2>x && cx2<=(x+OBSTACLE_WIDTH))
     {   print("\nGame over 2\n");
       print(y+OBSTACLE_HEIGHT + " " + cx2 + ">" + x + "," +cx2+ "<=" + (x+OBSTACLE_WIDTH)+ "\n");
       return true;}
      
     else
      return false;
  }
}

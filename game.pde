Cat []c = new Cat[1];
int px= frameWidth/2;
int py = 600;
int bgSpeed = 20;
int x = width/2;
boolean gameOver = false;
int speed = 15; 
int position_catX1 = 700;
int position_catX2= 800;
int position_catY1 = 485;
int position_catY2= 715;
int heightscore;
float tscore;
float t2 = 0;
void drawGame() {
 
 //looping backgroung  
  image(im_Sky, 0, frameCount * bgSpeed);
  image(im_Sky, 0, frameCount * bgSpeed - height);
   
  // Check if the background has scrolled off the screen
  if (frameCount * bgSpeed >= height) {
    // Reset the frameCount to create a continuous loop
    frameCount = 0;
  }





    CatImages c_im = new CatImages();
   for(int i = 0; i < 1; i++){
        c[i] = new Cat(c_im,px,py);
        c[i].display_cat();
      }
        
     
       
   
   
//////////////////////////////////////////////////////////////   
   if (frameCount % 10 == 0 && !gameOver) {
    obstacles.add(new Obstacle(random(width - OBSTACLE_WIDTH), -OBSTACLE_HEIGHT));
  }
  
  // Update and draw obstacles
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle obs = obstacles.get(i);
    obs.update();
    obs.display();
    
    
    // Check collision
    
    if (obs.hits(position_catX1,position_catX2,position_catY1,position_catY2)) {
      gameOver();
    }
    
    // Remove off-screen obstacles
    if (obs.y > height) {
      obstacles.remove(i);
      
    }
    if (!gameOver) {
        t2+=0.01;
       tscore = bgSpeed*t2;
       score = (int)tscore;
      }
}

    HeightScore(); 
  /////////////////////////////////////////////////////////
  if(score%100==0){
      bgSpeed += 2;
      OBSTACLE_SPEED+=2;
  }
  // Display score
  fill(0);
  textSize(20);
  text("Score: " + score, 400, 40);
  text("Heigh Score: " + heightscore, 600, 40);
  

  text(" P : Pause     M : Menu" ,1300, 40);
  

}
 void keyPressed() {
    
    
    if (keyCode == LEFT || keyCode == 'A' || keyCode == 'a') {
    // Move  to the left
        px -= speed;
        position_catX1 -= speed;
        position_catX2 -= speed;
         print("px=" +px + "catx1,catx2 =" + position_catX1 +" " +position_catX2 );
        print("\n");;
        if(px<=75){
            px = 75;
            position_catX1 = 20;
            position_catX2 =130;
            
        }
          
   
  } else if (keyCode == RIGHT|| keyCode == 'D' || keyCode == 'd') {
    // Move to the right
        px += speed;
        position_catX1 += speed;
        position_catX2 += speed;
       
       if(px>=1425){
           px=1425;
            position_catX1 = 1370;
            position_catX2 =1480;
           
       }
         print("px=" +px + "catx1,catx2 =" + position_catX1 +" " +position_catX2 );
        print("\n");
        
  
  }
  
  else if(keyCode == 'M' || keyCode == 'm'){
       restartGame();
       currentState = MenuState.MAIN_MENU;
  }
    else if(keyCode == 'P' || keyCode == 'p'){
      textSize(40);
      textAlign(CENTER, CENTER);
      text("Press C to continue", width/2, height/2);
       noLoop();
  }
    else if(keyCode == 'C' || keyCode == 'c'){
      
       loop();
  }
   else if(keyCode == 'S' || keyCode == 's'){
      restartGame();
  }
 }

void gameOver() {
  noLoop(); // Stop the game loop
  textSize(40);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text("Game Over", width/2, height/2);
  textSize(20);
  text("Press S to restart", width/2, height/2+50);
 
  gameOver = true;
  
}
void restartGame() {
  score = 0; // Reset score to 0
  px = frameWidth / 2; // Reset player position
  py = 600;
  position_catX1 = 695;
  position_catX2= 805;
  position_catY1 = 485;
  position_catY2= 715;
  bgSpeed = 25;
  OBSTACLE_SPEED = 15;
  tscore = 0;
  t=0;
  
  
     for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle obs = obstacles.get(i);
    obs.update();
    obstacles.remove(i);
    obs.display();
  
}
gameOver = false;
  loop();
  
}
int Hscore;
int j =0;

void HeightScore(){

  
 BufferedReader br = null;   
try {
      br = createReader("score.txt"); 
      String s = null;
      while ( (s = br.readLine ()) != null) { 
           Hscore = int(s);
          
         }
          
           
} catch (IOException e) {
      e.printStackTrace();
} finally {
  try {
    br.close();
  } catch(IOException ex) {
    ex.printStackTrace();
  }
}
    heightscore = Hscore;
    if (score > Hscore)
      heightscore = score;
    
  PrintWriter pw = createWriter("score.txt");  
  pw.println(heightscore);                
  pw.close();  






}

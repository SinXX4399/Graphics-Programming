<<<<<<< HEAD
PImage im_Background;
PImage im_Button1;
PImage im_Sky;


ArrayList<Obstacle> obstacles;

int score = 0;
int catSize = 200;
int cat;

int frameWidth = 1500;
int frameHeight = 900;
int i=0;

enum MenuState {
  MAIN_MENU,
  INSTRUCTIONS,
  CREDITS
}

MenuState currentState = MenuState.MAIN_MENU;

void setup() {
  
  size(1500,900);

  im_Background = loadImage("1.png");
  im_Background.resize(width, height);
 
  
  im_Sky = loadImage("sky2.png");
  // Resize the background image to fit the canvas size
  im_Sky.resize(width*2, height);

  obstacles = new ArrayList<Obstacle>();
}

void draw() { 
  switch (currentState) {
    case MAIN_MENU:
      drawMainMenu();
      break;
    case INSTRUCTIONS:
       drawGame();
       break;
    
  }
}


void drawMainMenu() {
  background(im_Background);
  im_Button1 = loadImage("button1.png"); 
  im_Button1.resize(200, 200);
  
  image(im_Button1,width-220, height-300);
}


void mousePressed() {
  if (currentState == MenuState.MAIN_MENU && mouseX > width-220 && mouseX < width-20 && mouseY > height-300 && mouseY < height-100) {
    currentState = MenuState.INSTRUCTIONS;
  } else if (currentState == MenuState.CREDITS && mouseX > 100 && mouseX < 300 && mouseY > 200 && mouseY < 300) {
    currentState = MenuState.MAIN_MENU;
  }
}
=======
PImage im_Background;
PImage im_Button1;
PImage im_Sky;


ArrayList<Obstacle> obstacles;

int score = 0;
int catSize = 200;
int cat;

int frameWidth = 1500;
int frameHeight = 900;
int i=0;

enum MenuState {
  MAIN_MENU,
  INSTRUCTIONS,
  CREDITS
}

MenuState currentState = MenuState.MAIN_MENU;

void setup() {
  
  size(1500,900);

  im_Background = loadImage("1.png");
  im_Background.resize(width, height);
 
  
  im_Sky = loadImage("sky2.png");
  // Resize the background image to fit the canvas size
  im_Sky.resize(width*2, height);

  obstacles = new ArrayList<Obstacle>();
}

void draw() { 
  switch (currentState) {
    case MAIN_MENU:
      drawMainMenu();
      break;
    case INSTRUCTIONS:
       drawGame();
       break;
    
  }
}


void drawMainMenu() {
  background(im_Background);
  im_Button1 = loadImage("button1.png"); 
  im_Button1.resize(200, 200);
  
  image(im_Button1,width-220, height-300);
}


void mousePressed() {
  if (currentState == MenuState.MAIN_MENU && mouseX > width-220 && mouseX < width-20 && mouseY > height-300 && mouseY < height-100) {
    currentState = MenuState.INSTRUCTIONS;
  } else if (currentState == MenuState.CREDITS && mouseX > 100 && mouseX < 300 && mouseY > 200 && mouseY < 300) {
    currentState = MenuState.MAIN_MENU;
  }
}
>>>>>>> 61c46f5e68a74fce2bd461dd51bff22dada93499

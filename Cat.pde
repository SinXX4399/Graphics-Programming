class CatImages {
  PImage []im = new PImage[4];
  
  //constructor
  CatImages() {
    im[0] = loadImage("3ballons/3balloons1.png");
    im[1] = loadImage("3ballons/3balloons2.png");
    im[2] = loadImage("3ballons/3balloons3.png");    
    im[3] = im[1];
    
    for(int i=0;i<4;i++){
      im[i].resize(300,300);
    }
  }
}

class Cat {
  CatImages ci = new CatImages();
  int  rx, ry;
  //constructor
  Cat(CatImages ci ,int rx, int ry) {
    this.ci = ci;
    this.rx = rx; 
    this.ry = ry;
    
  }
  
  void display_cat(){
    imageMode(CENTER);
    image(ci.im[i++ % 4], rx, ry);
    frameRate(5);
  
  }
 
  }

class UFO extends GameObject {
  //SHOULD USE PVECTORS, NOT VX, VY
  //1. spawns on edge of screen and goes across screen
  //2. aims and shoots at spaceship
  //3. will respawn once in a while - random/timer 
  //crashing into asteroid will lose a life
  
   //1. instance variables
  //float x, y;
  PVector direction;
  PImage ufo;
  int shotTimer, threshold;
  int timer;
  
  
  //2. constructor
  UFO() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(1, 0.5);
    direction = new PVector(0.1, 0);
    size = 50;
    lives = 1;
    
    shotTimer = 0;
    threshold = 30;
    timer = 0;
    
    ufo = loadImage("ufo3.png");
    
    PVector direction = new PVector(myShip.location.x - location.x, myShip.location.y - location.y);
    direction.setMag(4);
    velocity.x = direction.x;
    velocity.y = direction.y;
    
    location.x = location.x + velocity.x;
    

  }
  
  //3. behaviour functions - show and act
  void show() {
    pushMatrix();
    image(ufo, location.x, location.y, 100, 100);
    popMatrix();
  }
  
  void act() {
   super.act();
   
     shotTimer = shotTimer + 1;
     
     timer = timer + 1;
     
    
    
    //COLLISION WITH BULLET
    if (timer >= 200) {
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        //if bullet is overlapping ufo
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) { 
          obj.lives = 0;
          lives = 0;
        }
      }
      i = i + 1;
    }
      if (shotTimer >= threshold) {
        shotTimer = 0;
        myObjects.add(new UFObullet(location.x, location.y));
      }
    }
    
    
    

  
    //TELEPORTS WHEN OFFSCREEN
    while (timer >= 100) {
    if (location.x < -50) location.x = 850; 
    if (location.x > 850) location.x = -50;
    if (location.y < -50) location.y = 850;
    if (location.y > 850) location.y = -50;
    }
  }
  
}

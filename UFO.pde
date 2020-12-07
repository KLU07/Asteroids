class UFO extends GameObject {
  //1. instance variables
  PVector direction;
  PImage ufo;
  int shotTimer, threshold;
  int spawnTimer;
  boolean spawn;
  int spawnTracker;
  float x, y;
  
  
  //2. constructor
  UFO() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(2.5, 2.5); 
    direction = new PVector(myShip.location.x - location.x, myShip.location.y - location.y);
    direction.setMag(5);    
    size = 50;
    lives = 1;
    
    shotTimer = 0;
    threshold = 30;
    spawnTimer = 0;
   
    ufo = loadImage("ufo.png");
  }
  
  UFO(float x, float y) {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(2.5, 2.5); 
    direction = new PVector(myShip.location.x - location.x, myShip.location.y - location.y);
    direction.setMag(5);    
    size = 50;
    lives = 1;
    
    shotTimer = 0;
    threshold = 30;
    spawnTimer = 0;
   
    ufo = loadImage("ufo.png");
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
     spawnTimer = spawnTimer + 1;
         
    //COLLISION WITH BULLET
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
      

     if (lives == 0 ) {
       if (spawnTimer > 200) {
      myObjects.add (new UFO(location.x, location.y));
      myUFO.act();  
      spawnTimer = 0;
       }
     }

     
      //TELEPORT WHEN OFFSCREEN
      if (location.x < -50) location.x = 850; 
      if (location.x > 850) location.x = -50;
      if (location.y < -50) location.y = 850;
      if (location.y > 850) location.y = -50;  
  }
  
  
}

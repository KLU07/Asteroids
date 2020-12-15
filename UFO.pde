class UFO extends GameObject {
  //1. instance variables
  PVector direction;
  PImage ufo;
  int shotTimer, threshold;
  int x, y;
  float rng;


  //2. constructor
  UFO() {
    rng = random(1, 4);    
    if (rng == 1) {
      x = 0;
      y = 0;
      velocity = new PVector(2.5, 2.5); 
    } else if (rng > 1 && rng < 2) {
      x = 0; 
      y = 800;
      velocity = new PVector(2.5, -2.5); 
    } else if (rng > 2 && rng < 3) {
      x = 800;
      y = 0;
      velocity = new PVector(-2.5, 2.5); 
    } else {
      x = 800;
      y = 800;
      velocity = new PVector(-2.5, -2.5); 
    } 
    
    location = new PVector (x, y);
    direction = new PVector(myShip.location.x - location.x, myShip.location.y - location.y);
    direction.setMag(5);    
    size = 50;
    lives = 1;

    shotTimer = 0;
    threshold = 30;

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

    //TELEPORT WHEN OFFSCREEN
    if (location.x < -50) location.x = 850; 
    if (location.x > 850) location.x = -50;
    if (location.y < -50) location.y = 850;
    if (location.y > 850) location.y = -50;
  }
}

//classes are used to make many copies of one thing
class Spaceship extends GameObject{
  
  //1. instance variables - variables that every spaceship has
  PVector direction;
  int shotTimer, threshold;
  int score;
  int invincible;
  
  PImage ship;

  
  //2. constructor - setup for spaceship: name must match class
  Spaceship() {
    location = new PVector(width/2, height/2);
    direction = new PVector(0.1, 0);
    velocity = new PVector(0, 0); 
    size = 50;
    lives = 3;
    shotTimer = 0;
    threshold = 40;
    score = 0;
    invincible = 0;
   
    ship = loadImage("ship.png");

    
  }
  
  //3. behaviour functions - show and act
  void show() {
    if (invincible >= 0) {
      stroke(255);
      noFill();
      ellipse(location.x, location.y, 2*size, 2*size);
    }
     pushMatrix();
     translate(location.x, location.y);
     rotate(direction.heading());
     image(ship, 0, 0, 80, 40);
     popMatrix();
     
    textSize(30);
    fill(255);
    strokeWeight(1);
    text("Lives:" + lives, 80, 40);

     
  }
  
  void act() {
   super.act();
   shotTimer = shotTimer + 1;
   invincible = invincible - 1;

  
  //ROTATE WHEN PRESSING A OR D KEYS 
  if (akey) direction.rotate(-radians(5) );
  if (dkey) direction.rotate(radians(5) );
  //GO FORWARD/BACKWARDS WHEN PRESSING W OR S KEYS
  if (wkey) { 
    velocity.add(direction);
    myObjects.add(new Fire());
    myObjects.add(new Fire());
  }
  if (skey) velocity.sub(direction);
  //SHOOT BULLETS WHEN PRESSING SPACE KEY
  if (spacekey && shotTimer >= threshold) {
    myObjects.add(new Bullet());
    shotTimer = 0;
  }
  
    //COLLISION WITH ASTEROID
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Asteroid) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { 
          lives = lives - 1;
          location.x = width/2;
          location.y = height/2;
          velocity.x = 0;
          velocity.y = 0;         
        }
      }
      i = i + 1;
    }
    
    //COLLISION WITH UFO
    int l = 0;
    while (l < myObjects.size()) {
      GameObject obj = myObjects.get(l);
      if (obj instanceof UFO) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { 
          lives = lives - 1;
          location.x = width/2;
          location.y = height/2;
          velocity.x = 0;
          velocity.y = 0;
        }
      }
      l = l + 1;
    }
    
    //COLLISION WITH UFO BULLET
    int u = 0;
    while (u < myObjects.size()) {
      GameObject obj = myObjects.get(u);
      if (obj instanceof UFObullet) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { 
          lives = lives - 1;
          location.x = width/2;
          location.y = height/2;
          velocity.x = 0;
          velocity.y = 0;

        }
      }
      u = u + 1;
    }    

    
    if (lives <= 0) { 
      mode = GAMEOVER;
      lives = 3;
      score = 0; 
    }
    
  //TELEPORTS WHEN OFFSCREEN
  if (location.x < -50) location.x = 850;
  if (location.x > 850) location.x = -50;
  if (location.y < -50) location.y = 850;
  if (location.y > 850) location.y = -50;
  }
  
}

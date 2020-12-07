//classes are used to make many copies of one thing
class Spaceship extends GameObject{
  
  //1. instance variables - variables that every spaceship has
  PVector direction;
  int shotTimer, threshold;
  int score;
  
  boolean invincible;
  int invincibleTimer;
  
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
    
    invincibleTimer = 250;
    invincible = false;
   
    ship = loadImage("ship.png");   
  }
  
  //3. behaviour functions - show and act
  void show() {
    //INVINCIBLE BUBBLE
    if (invincible == true) {
      stroke(255);
      noFill();
      strokeWeight(4);
      ellipse(location.x, location.y, 90, 90);
    }
    
     pushMatrix();
     translate(location.x, location.y);
     rotate(direction.heading());
     image(ship, 0, 0, 80, 40);
     popMatrix();
     
    textSize(30);
    fill(255);
    strokeWeight(2);
    text("Lives: " + lives, 90, 40);  
  }
  
  void act() {
   super.act();
   
   shotTimer = shotTimer + 1;
   
   invincibleTimer = invincibleTimer - 1;
   
    if (invincibleTimer <= 0) {
      invincibleTimer = 250;
      invincible = false;
    }

    //COLLISION WITH ASTEROID/UFO/UFOBULLET
    if (invincible == false) {
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
          invincible = true;
        }
      } else if (obj instanceof UFO) {
          if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { 
            lives = lives - 1;
             location.x = width/2;
            location.y = height/2;
            velocity.x = 0;
            velocity.y = 0;
            invincible = true;    
          }
      } else if (obj instanceof UFObullet) {
          if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { 
            lives = lives - 1;
            location.x = width/2;
            location.y = height/2;
            velocity.x = 0;
            velocity.y = 0;
            invincible = true;
          }      
      }
      i = i + 1;
    }
   }

    if (lives <= 0) { 
      mode = GAMEOVER;
      lives = 3;
      score = 0; 
    }

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
  
  //TELEPORTS WHEN OFFSCREEN
  if (location.x < -50) location.x = 850;
  if (location.x > 850) location.x = -50;
  if (location.y < -50) location.y = 850;
  if (location.y > 850) location.y = -50;
  }
  
}

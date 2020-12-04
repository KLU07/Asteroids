class Asteroid extends GameObject {
            //exetnds = gets information from GameObject class


  Asteroid() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(1, 0);
    velocity.rotate(random(TWO_PI));
    size = 100;
    lives = 1;
  }
  
  Asteroid(int s, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(1, 0);    
    velocity.rotate(random(TWO_PI));
    size = s;
    lives = 1;  
  }
     
  void show() {
    strokeWeight(1);
    stroke(0);
    fill(grey);
    ellipse(location.x, location.y, size, size);
    
    textSize(30);
    fill(255);    
    strokeWeight(1);
    text("Score:" + myShip.score, 80, 90);
  }
  
  
  void act() {
    super.act();
    
    //ASTEROID TELEPORTS WHEN OFFSCREEN
    if (location.x < -50) location.x = 850;
    if (location.x > 850) location.x = -50;
    if (location.y < -50) location.y = 850;
    if (location.y > 850) location.y = -50;  
    
    //COLLISION WITH BULLET
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        //if bullet is overlapping asteroid
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { 
          obj.lives = 0;
          lives = 0;
          myShip.score = myShip.score + 1;
          
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));
          myObjects.add(new Particle(location.x, location.y));          
          
          if (size > 50) {
            //MAKING TWO MEDIUM ASTEROIDS
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
          }

        }
      } 
      i = i + 1;
                
    }
    
    
    
    if (myShip.score == 15) {
      mode = WIN;
    }
    
    
  }
}

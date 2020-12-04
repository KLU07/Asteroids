class Particle extends GameObject {
  float size;
  int t; //transparency

    Particle() {
    location = myAsteroid.location.copy();
    velocity = new PVector (random(-1, 1), random(-1, 1));
    velocity.rotate(random(TWO_PI)); 
    velocity.setMag(5);
    size = 1;
    lives = 1;
    t = 255;    
  }
  
    Particle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector (random(-1, 1), random(-1, 1));
    velocity.rotate(random(TWO_PI)); 
    velocity.setMag(5);
    size = 1;
    lives = 1;
    t = 255;    
  }
  
  
  void show() {
    strokeWeight(2);
    stroke(grey, t);
    fill(grey, t);
    t = t - 3;
    ellipse(location.x, location.y, size, size);  
  }
  
  
  void act() {
    super.act();
    
    //DISAPPEARS WHEN OFFSCREEN
    if (offScreen()) {
      lives = 0;
    }  
    
    if (t <= 0) {
      lives = 0;
    }
  }
}

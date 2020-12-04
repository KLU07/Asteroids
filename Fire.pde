class Fire extends GameObject {
  
  int t; // t for transparency
  
  color myColor;
  
  
  Fire() {
    location = myShip.location.copy();
    velocity = myShip.direction.copy(); 
    velocity.rotate(radians(180) + random(-0.5, 0.5)); 
    velocity.setMag(5);
    size = 1;
    lives = 1;
    t = 255;
    //COLOR
    float rng = random(0,3);
    if (rng < 1) {
      myColor = r;
    } else if (rng > 1 && rng < 2) {
      myColor = o; 
    } else {
      myColor = y;
    }
  }
  
  
  void show() {
    strokeWeight(3);
    stroke(myColor, t);
    fill(myColor, t);
    t = t - 3; //decrease transparency until it disappears
    ellipse(location.x, location.y, size, size);
  }
  
  
  void act() {
    super.act();
    
    //FIRE DISAPPEARS WHEN OFFSCREEN
    if (offScreen()) {
      lives = 0;
    }
  }
  
}

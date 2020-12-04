class UFObullet extends GameObject {
  

  PVector aim;
  PVector direction;
  
  UFObullet(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(myShip.location.x - x, myShip.location.y - y);
    velocity.setMag(10);
        //UFObullets not shooting from UFO's location?? <===============================
    size = 8;
    lives = 1;
    
  }
  
  
  void show() {
    strokeWeight(2);
    stroke(t);
    fill(t);
    ellipse(location.x, location.y, size, size);    
  }
  
  
  void act() {
    super.act();
          
    //BULLET DISAPPEARS WHEN OFFSCREEN
    if (offScreen()) {
      lives = 0;
    }
  }
}

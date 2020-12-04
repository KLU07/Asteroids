class Bullet extends GameObject {
  

  Bullet() {
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(5);    
    size = 8;
    lives = 1;
    
  }
  
  
  void show() {
    strokeWeight(2);
    stroke(255);
    fill(255);
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

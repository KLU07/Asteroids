//superclass - contains information found in every class 
class GameObject {
  PVector location;
  PVector velocity;
  int size;
  int lives;

  

  GameObject() {
  }
  
  
  void show() {
    strokeWeight(3);
    stroke(255);
    fill(0);
  }
  
  void act() {
    location.add(velocity);
    
    
  }
  
  //BULLET LOSES A LIFE WHEN OFFSCREEN
  boolean offScreen() {
    if (location.x < 0 || location.x > width || location.y < 0 || location.y > height) {
      return true;
    } else {
      return false;
    }
  }
  
   boolean isDead() {
     if (lives <= 0) {
       return true;
     }
     else {
       return false;
     }
   }  
  
  
  
}

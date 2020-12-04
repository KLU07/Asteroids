//BUTTON 
void button(int x, int y, int w, int h, String label) {
   //MAKE START BUTTON TACTILE - CHECK IF MOUSE IS WITHIN BUTTON PERAMETERS
  if(mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    stroke(0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  
  //DRAWING BUTTON
  fill(255);
  rect(x, y, w, h);
  //INSERT TEXT
  fill(0);
  textSize(50);
  text(label, x, y);
}


//BUTTON WITH DIFFERENT SIZE TEXT
void button(int x, int y, int w, int h, int size, String label) {
   //MAKE START BUTTON TACTILE - CHECK IF MOUSE IS WITHIN BUTTON PERAMETERS
  if(touchingMouse(x, y, w, h)) {
    stroke(lightblue);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  
  //DRAWING BUTTON
  fill(255);
  rect(x, y, w, h);
  //INSERT TEXT
  fill(0);
  textSize(size);
  text(label, x, y);
}


//CHECK IF TOUCHING MOUSE
boolean touchingMouse(int x, int y, int w, int h) {
  if(mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    return true;
  } else {
    return false;  
  }
}

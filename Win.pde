PImage nebula;

void Win() {
  nebula = loadImage("nebula.jpg");
  image(nebula, width/2, height/2, 1000, height);  
  
  //INSERT RESTART BUTTON
  button(400, 600, 260, 100, 30, "RESTART");  
  
  //INSERT X BUTTON
  button(770, 30, 40, 40, 20, "X");
  
  //TEXT
  fill(255);
  textSize(100);
  text("YOU WIN!", width/2, height/3);
}


void WinClicks() {
  //IF CLICKING RESTART BUTTON, GO TO GAME SCREEN
  if (touchingMouse(400, 600, 200, 100)) {
    mode = INTRO;
    setup();
  }
  
  //IF CLICKING X BUTTON, EXIT PROGRAM
   if (touchingMouse(760, 40, 50, 50)) {
    exit();
  }  
}

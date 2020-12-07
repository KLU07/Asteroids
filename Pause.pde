PImage asteroid;


void Pause() {
  asteroid = loadImage("asteroidbg.jpg");
  image(asteroid, width/2, height/2, 1000, 1000);
  
  //INSERT CONTINUE BUTTON
  button(400, 600, 260, 100, 40, "CONTINUE");
  
  //PAUSED
  fill(255);
  textSize(100);
  text("PAUSED", width/2, height/3);  
}


void PauseClicks() {
  //IF CLICKING CONTINUE BUTTON, GO BACK TO GAME SCREEN
  if (touchingMouse(400, 600, 260, 100)) {
    mode = GAME;
  }
}

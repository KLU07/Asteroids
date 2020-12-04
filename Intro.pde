PImage bg;


void Intro() {
  bg = loadImage("spacebg.jpg");
  image(bg, width/2, height/2, width, height);
  
  //INSERT START BUTTON
  noFill();
  button(400, 600, 200, 100, 50, "START");
  
  //ASTEROIDS
  fill(255);
  textSize(100);
  text("ASTEROIDS", width/2, height/4);
  
}


void IntroClicks() {
  //IF CLICKING START BUTTON, GO TO GAME SCREEN
  if (touchingMouse(400, 600, 200, 100)) {
    mode = GAME;
  }
}

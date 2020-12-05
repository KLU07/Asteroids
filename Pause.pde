void Pause() {
  background(0);
  
  //INSERT CONTINUE BUTTON
  button(400, 600, 260, 100, 30, "CONTINUE");
}


void PauseClicks() {
  //IF CLICKING CONTINUE BUTTON, GO BACK TO GAME SCREEN
  if (touchingMouse(400, 600, 260, 100)) {
    mode = GAME;
  }
}

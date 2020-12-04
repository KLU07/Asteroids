void GameOver() {
  background(255, 0, 0);
  
  //INSERT RESTART BUTTON
  button(400, 600, 200, 100, 40, "RESTART");  
  
  //INSERT X BUTTON
  button(770, 30, 40, 40, 20, "X");
  
  //TEXT
  fill(255);
  textSize(90);
  text("OOPS!", width/2, height/4);
  text("YOU DIED", width/2, 300);
}


void GameOverClicks() {
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

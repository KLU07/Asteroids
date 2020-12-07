void mouseReleased() {
  if (mode == INTRO) {
    IntroClicks();
  } else if (mode == GAME) {
    GameClicks();
  } else if (mode == PAUSE) {
    PauseClicks();
  } else if (mode == GAMEOVER) {
    GameOverClicks();
  } else if (mode == WIN) {
    WinClicks();
  } else {
    println("ERROR: Mode =" + mode);
  }  

}

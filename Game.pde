int lives = 3;


void Game() {
  background(0);
  
  //INSERT PAUSE BUTTON
  button(740, 40, 90, 50, 20, "PAUSE");  
  
  
  //SPACESHIP ACTIONS
  myShip.show();
  myShip.act();
  //SHOWS AMOUNT OF OBJECTS ON SCREEN
  println(myObjects.size());
  
   //LOOP THAT GOES THROUGH THE ARRAYLIST OF OBJECTS
  int i = 0;
  while(i < myObjects.size()) {
    //processing each object individually
    GameObject obj = myObjects.get(i); //get the current object
    if (obj.lives > 0) {
      obj.show(); //tells current object to draw itself
      obj.act(); // tells current object to update itself - moving, checking coordinates, etc
      i = i + 1; //going to next object
      
    } else { //remove object if lives < 0
      myObjects.remove(i);
    }
  }

}


void GameClicks() {
  //IF PAUSE BUTTON CLICKED, GO TO PAUSE SCREEN
  if (touchingMouse(757, 24, 80, 40)) {
    mode = PAUSE;
  }
  

}

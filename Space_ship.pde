//spaceship = type (class) myShip = variable
Spaceship myShip;
UFO myUFO;
Asteroid myAsteroid;

ArrayList<GameObject> myObjects;

boolean wkey, akey, skey, dkey, spacekey;

color r = #CB1925; //red
color o = #FF8207; //orange
color y = #FAC40A; //yellow
color myColor;
  
color t = #98D9B6; //teal
color w = #FFFFFF; //white
  
color lightblue = #68B2F8; //light blue
color grey = #AAB3AB; //grey


final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;
int mode = INTRO;


void setup() {
  size(800, 800);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  
  myShip = new Spaceship();
  myAsteroid = new Asteroid();
  myUFO = new UFO();
  wkey=skey=akey=dkey=spacekey=false;
  myObjects = new ArrayList<GameObject>();
  
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  
  myObjects.add(new UFO());
  
}


void draw() {
  background(0);
 

  
  if (mode == INTRO) {
    Intro();
  } else if (mode == GAME) {
    Game();
  } else if (mode == PAUSE) {
    Pause();
  } else if (mode == GAMEOVER) {
    GameOver();
  } else if (mode == WIN) {
    Win();
  } else {
    println("ERROR: Mode =" + mode);
  }  
  
}

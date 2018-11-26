
import ddf.minim.*;
Minim minim;
AudioPlayer mySound;
AudioPlayer mySounda;
PFont mono;
int Score = 0;

int radius = 12;
float xpos;
float ypos;   
float xspeed = 3;
float yspeed = 2.5;
int xdirection = 1;
int ydirection = 1;


void setup() {
  minim = new Minim(this);
  mySound = minim.loadFile("gameover.wav");
  mySounda = minim.loadFile("win.wav");
  mono = createFont("Chunkfive.ttf", 100);
  size(500, 500);
  xpos = 0 + radius;
  ypos = 0 + radius;
}

void draw() {
  background(229, 226, 64);
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width - radius || xpos < radius) {
    xdirection = xdirection * -1;
  }
  if (ypos > height - radius || ypos < radius) {
    ydirection = ydirection * -1;
  }

  //ball
  fill(random(255), random(255), random(255));
  ellipse(xpos, ypos, radius*2, radius*2);
  
  
  //obstacle
  fill(255);
  stroke(255, 255, 0);
  rect(400, mouseY, 10, 100);
  
  if (xpos > 400 && ypos - radius > mouseY && ypos < mouseY + 100) {
    xdirection *= -1;
    mySounda.play();
    mySounda.rewind();
    Score++;
  }
   textFont(mono);
   text("  " + Score, -40, 495);
  
  if (xpos > 420){
    background(255, 0, 0);
    textFont(mono);
    text("YOU LOSE", 0, 275);
    mySound.play();
    noLoop();
  }

}

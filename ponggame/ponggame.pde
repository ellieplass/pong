
import ddf.minim.*;
Minim minim;
AudioPlayer mySound;
AudioPlayer mySounda;
PFont mono;
PFont sourcecode;
int Score = 0;
int Score1 = 0;

int radius = 12;
float xpos;
float ypos;   
float xspeed = 3;
float yspeed = 2.5;
int xdirection = 1;
int ydirection = 1;
int recty=150;


void setup() {
  minim = new Minim(this);
  mySound = minim.loadFile("gameover.wav");
  mySounda = minim.loadFile("win.wav");
  mono = createFont("Chunkfive.ttf", 100);
  sourcecode = createFont("SourceCode.ttf", 20);
  size(500, 500);
  xpos = width/2;
  ypos = height/2;
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


  fill(random(255), random(255), random(255));
  ellipse(xpos, ypos, radius*2, radius*2);
  
  fill(255);
  stroke(255, 255, 0);
  rect(400, recty, 10, 100);
  
  fill(0);
  stroke(255, 255, 0);
  rect(100, mouseY, 10, 100);
  
  if(xpos < 100 && ypos - radius > mouseY && ypos < mouseY +100){
    xdirection *= -1;
    mySounda.play();
    mySounda.rewind();
    Score1++;
  }
  
  if (xpos > 400 && ypos - radius > recty && ypos < recty + 100) {
    xdirection *= -1;
    mySounda.play();
    mySounda.rewind();
    Score++;
  }
   textFont(mono);
   text("  " + Score1, -40, 495);
   fill(255);
   text(" " + Score, 360, 495);
   
  if (xpos > 420 || xpos < 80){
    background(255, 0, 0);
    textFont(mono);
    text("YOU LOSE", 0, 275);
    textFont(sourcecode);
    fill(0);
    text("Player 1 Score:" + " " + Score1, 150, 400);
    fill(255);
    text("Player 2 Score:" + " " + Score, 150, 450);
    mySound.play();
    noLoop();
  } 
  
  if(Score > 5){
    xspeed = 4;
    yspeed = 3.5;
  }
  if (Score > 9){
   xspeed = 5;
   yspeed = 4.5;
  }

}
void keyPressed(){
    if(keyCode == UP){
      recty = recty-40;
    } else if (keyCode == DOWN){
      recty = recty+40;
    }
  
  }

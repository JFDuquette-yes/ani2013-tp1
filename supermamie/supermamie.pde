// Supermamie.pde
// Travail pratique 1

import processing.sound.*;
import ddf.minim.*;

// variables
Amplitude amp;
AudioIn in;
Environnement environnement;
Gameover gameover;
Gamestart gamestart;
Gamewin gamewin;
Mamie mamie;
SoundFile jump_sound;
SoundFile hit_sound;
SoundFile gameover_sound;
SoundFile gamestart_sound;
Scoreboard scoreboard;
Minim minim;
AudioPlayer player;

// paramètres
int gameStatus;
int score;
int life;
float framePositionX;
PImage life_icon;
PImage supermamie;
PImage spritesheet;
PFont typo;


void setup()
{
   size(800, 600);
   //Déclaration des valeurs
   framePositionX = 0;
   gameStatus = 0;
   life = 3;
   score = 0;
   
   //Instanciation de la capture du microphone
   amp = new Amplitude(this);
   in = new AudioIn(this, 0);
   in.start();
   amp.input(in);
   //Instanciation de l'environnement
   environnement = new Environnement();
    //Instanciation de GameStart
   gamestart = new Gamestart();
   //Instanciation de Gameover
   gameover = new Gameover();
    //Instanciation de GameWin
   gamewin = new Gamewin();
   
   //Instanciation de Mamie
   mamie = new Mamie();
   //Instanciation des bruits
   jump_sound = new SoundFile(this,"../data/sounds/jump.wav"); 
   hit_sound = new SoundFile(this,"../data/sounds/hit.wav");
   gameover_sound = new SoundFile (this, "../data/sounds/gameover.wav");
   minim = new Minim(this);
   player = minim.loadFile("../data/sounds/fanfare2.wav");
   // Instanciation de la font
   typo = createFont ("LLPIXEL3.ttf",80); 
   //Instanciation du score
   scoreboard = new Scoreboard();
  
   
   // Image GIF animé pour mamie
   supermamie = loadImage("../data/img/supermamie_dummy.png");
   // Image pour les vies
   life_icon = loadImage("../data/img/life_icon.png");   
  
}
void draw()
{
  background(51);
  
  switch (gameStatus)
    {
      case 0:
        gameStart();
        break;
      case 1:
        gameOn();
        break;
      case 2:
        gameOver();
        break;
      case 3:
        gameWin();
        break;
    }
  

}
void keyPressed(){
 if(key ==' ')
 {
   if(mamie.position.y == height)
   {
     mamie.jump();
     jump_sound.play();
   }
 }
}
//fonction pour le menu de départ
void gameStart()
{
  gamestart.showGameStart();
}
//fonction pour partir le jeu
void gameOn()
{   
  gameStatus = 1;
  //Variable utiliser pour retrouver le position du frame
  framePositionX = mamie.position.x + mamie.startPositionX;
  
  translate(-mamie.position.x + mamie.startPositionX,-100);    
  //Générer et mettre à jour l'environnement
  environnement.ground(mamie.position);
  environnement.backgroundBuildings(mamie);
  
  //Générer et mettre à jour Mamie
  PVector gravity = new PVector(0,0.2);
  mamie.applyForce(gravity);
  mamie.update();
  mamie.display();
  mamie.edges();
  //Générer et mettre à jour les cellules
  environnement.generateCells(mamie);
  
  //Générer et afficher le score
  scoreboard.showDisplay();
  scoreboard.updateDisplay();
  
  //Faire sauter mamie par clappement des mains
  float vol = amp.analyze();
  if(vol >0.1)
  {
    if(mamie.position.y == height)
    {
       mamie.jump();
    }
  }
  if(score == 10000)
  {
    gameStatus = 3;
  }
  else
  {
    score++;
  }
}
//fonction lorsque le joueur a perdu ces 3 vies
void gameOver(){
  gameover.showGameOver();
}
//fonction lorsque le joueur a atteind le score mettant fin au jeu
void gameWin(){
 gamewin.showGameWin();
}
void mousePressed() {
  if (gameStatus == 0) {
    if(mouseX > 270 || mouseX < 330 || mouseY > 394 || mouseY > 425){   
      gameOn();
    }
    if(mouseX > 460 || mouseX < 540 || mouseY > 394 || mouseY > 425){     
      //scoreboard
    }
  } 
}

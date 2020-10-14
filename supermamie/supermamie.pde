// Supermamie.pde
// Travail pratique 1

import processing.sound.*;
import ddf.minim.*;
//Importation de la librairie vidéo de processing.
import processing.video.*;

// variables
Amplitude amp;
AudioIn in;
Environnement environnement;
Gameover gameover;
Gamestart gamestart;
Gamewin gamewin;
Demo demo;
Scoreboard scoreboard;
Mamie mamie;
SoundFile jump_sound;
SoundFile hit_sound;
SoundFile gameover_sound;
SoundFile gamestart_sound;
Display display;
Minim minim;
AudioPlayer player;
Movie DemoVideo;

// paramètres
int gameStatus;
int score;
int life;
int contact;
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
   contact=0;
   
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
   //Instanciation de Démo
   demo = new Demo();
   //Instanciation du scoreboard
   scoreboard = new Scoreboard();
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
   display = new Display();
   //Instanciation de la vidéo pour le démo.
   DemoVideo = new Movie(this, "../data/videos/penguin_dance.mp4");
  
   
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
      case 4:
        demo();
        break;  
      case 5:
        scoreBoard();
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
  environnement.generateEnvironnement(mamie);
  
  //Générer et mettre à jour Mamie
  PVector gravity = new PVector(0,0.2);
  mamie.applyForce(gravity);
  mamie.update();
  mamie.display();
  mamie.edges();
  //Générer et mettre à jour les cellules
  environnement.generateCells(mamie);
  
  //Générer et afficher le score
  display.showDisplay();
  display.updateDisplay();
  
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
//fonction pour partir le jeu
void demo()
{
   demo.showDemo();
   DemoVideo.play();

   image(DemoVideo, width/2, height/2, 800, 600);
   //Retour au menu à la fin de la vidéo du tutorial.
   if(DemoVideo.time() >= 24){
     println("Vidéo démo terminée.");
     gameStart();
   }
   
}

void movieEvent(Movie m){
    m.read();
  }
  
void mousePressed() {
  println("Mouse x "+mouseX);
  println("Mouse y "+mouseY);
  
  if (gameStatus == 0) {
    if(mouseX > 340 && mouseX < 460 && mouseY > 290 && mouseY < 315){
      gameStatus = 1;
    }
    if(mouseX > 340 && mouseX < 460 && mouseY > 330 && mouseY < 355){     
      gameStatus = 4;
    }
    if(mouseX > 340 && mouseX < 460 && mouseY > 370 && mouseY < 400){     
      gameStatus = 5;
    }
  } 
  if (gameStatus == 2) {
    println("gameStatus 2 ");
    if(mouseX > 340 && mouseX < 460 && mouseY > 400 && mouseY < 415){
      gameStatus = 1;
    }
  } 
}
//fonction lorsque le joueur a perdu ces 3 vies
void scoreBoard(){
  scoreboard.showScoreboard();
}

// Supermamie.pde
// Travail pratique 1

//Importation de la librairie vidéo de processing.
import processing.video.*;
import ddf.minim.*;
import processing.sound.*;

// variables
Amplitude amp;
AudioIn in;
Environnement environnement;
Gameover gameover;
Gamestart gamestart;
Gamewin gamewin;
Scoreboard scoreboard;
Mamie mamie;
Minim minim;
SoundFile jump_sound;
SoundFile hit_sound;
SoundFile win_sound;
AudioPlayer intro;
AudioPlayer main_theme;
AudioPlayer gameover_sound; 
Display display;
Movie DemoVideo;
ParticleSystem ps;

// paramètres
int gameStatus;
int lastGameStatus;
int score;
int scoreToWin = 10000;
int life;
int contact;
int numSounds = 4;
int last_choice;
float framePositionX;
PImage life_icon;
PImage supermamie;
PImage spritesheet;
PFont typo;
PFont typo2;
PImage virus;

AudioPlayer [] music_list = new AudioPlayer[numSounds];

void setup()
{
  size(800, 600);
  //Déclaration des valeurs
  framePositionX = 0;
  gameStatus = 0;
  life = 3;
  score = 0;
  contact=0;
  strokeWeight(1);

  //Instanciation de la capture du microphone
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  //Instanciation de Mamie
  mamie = new Mamie();
  //Instanciation de l'environnement
  environnement = new Environnement();
  //Instanciation de GameStart
  gamestart = new Gamestart();
  //Instanciation de GameWin
  gamewin = new Gamewin();
  //Instanciation de Gameover
  gameover = new Gameover();
  //Instanciation du scoreboard
  scoreboard = new Scoreboard();

  // Instanciation des musiques
  minim = new Minim(this);
  jump_sound = new SoundFile(this, "/data/sounds/jump.wav"); 
  hit_sound =  new SoundFile(this, "/data/sounds/hit.wav");

  music_list[0] = minim.loadFile("/data/sounds/intro_jungle.mp3");
  music_list[1] = minim.loadFile("/data/sounds/main_theme.mp3");
  music_list[2] = minim.loadFile("/data/sounds/death_theme.mp3");
  music_list[3] = minim.loadFile("/data/sounds/win.mp3");

  // Instanciation de la font
  typo = createFont ("LLPIXEL3.ttf", 80); 
  typo2 = createFont ("04B_30_.ttf", 50);
  //Instanciation du score
  display = new Display();
  //Instanciation de la vidéo pour le démo.
  DemoVideo = new Movie(this, "../data/videos/supermamieDemo.mp4");
  //Instanciation du système de particules.
  ps = new ParticleSystem();
  //Instanciation de l'image de virus.
  virus = loadImage("../data/img/virus.png");
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
    showDemo();
    break;  
  case 5:
    scoreBoard();
    break;
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
  playMusic(music_list, 1);
  //Variable utiliser pour retrouver le position du frame
  framePositionX = mamie.position.x + mamie.startPositionX;

  translate(-mamie.position.x + mamie.startPositionX, -100);    
  //Générer et mettre à jour l'environnement
  environnement.generateEnvironnement(mamie);

  //Générer et mettre à jour Mamie
  PVector gravity = new PVector(0, 0.2);
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
  if (vol >0.1)
  {
    if (mamie.position.y == height)
    {
      mamie.jump();
    }
  }
  if (score == scoreToWin)
  {
    gameStatus = 3;
  } else
  {
    score++;
  }
}
//fonction lorsque le joueur a perdu ces 3 vies
void gameOver() {
  gameover.showGameOver();
}
//fonction lorsque le joueur a atteind le score mettant fin au jeu
void gameWin() {
  gamewin.showGameWin();
  mamie.display();
}
//fonction pour partir le jeu
void showDemo()
{
  DemoVideo.play();
  image(DemoVideo, width/2, height/2, 800, 600);
  //Retour au menu à la fin de la vidéo du tutorial.
  if (DemoVideo.time() >= 28) {
    reset();
  }       
  //Button menu
  fill(0);
  stroke (#47C9C8);
  strokeWeight(8);
  rect (30, 515, 150, 50);
  fill(#F60404);
  textAlign(CENTER, CENTER);
  textFont(typo);
  textSize (28);
  text("< MENU", 95, 535);
}
//fonction lorsque le joueur a perdu ces 3 vies
void scoreBoard() {
  scoreboard.showScoreboard();
}
void playMusic( AudioPlayer[] list, int choice) { 

  println("CHOICE "+choice);
  for (int idx = list.length-1; idx >=0; --idx) {
    if (idx == choice) {
      if (list[idx].position() == list[idx].length() -50)
      {
        list[idx].rewind();
      }
      list[idx].play();
    } else {
      list[idx].pause();
    }
  }
}
void stopVideo() {
  if (DemoVideo.time() > 0)
  {
    DemoVideo.stop();
    DemoVideo.jump(1);
  }
}
void stopMusic() {
  for (int idx = music_list.length-1; idx >=0; --idx) {
    music_list[idx].pause();
  }
}
void reset()
{
  stopMusic();
  stopVideo();
  frameCount = -1;
}
//Events
void movieEvent(Movie m) {
  m.read();
}
void keyPressed() {
  if (key ==' ')
  {  
    if (mamie.position.y == height)
    {
      mamie.jump();
    }
  }
}
void mousePressed() {

  switch (gameStatus)
  {
  case 0:
    if (mouseX > 340 && mouseX < 460 && mouseY > 290 && mouseY < 315) {
      gameStatus = 1;
    }
    if (mouseX > 340 && mouseX < 460 && mouseY > 330 && mouseY < 355) {     
      stopMusic();
      gameStatus = 4;
    }
    if (mouseX > 340 && mouseX < 460 && mouseY > 370 && mouseY < 400) {   
      stopMusic();
      gameStatus = 5;
    }
    break;
  case 2:
    if (mouseX > 300 && mouseX < 450 && mouseY > 390 && mouseY < 440)
    { 
      reset();
    }
    break;
  case 3:
    if (mouseX >300 && mouseX < 460 && mouseY > 390 && mouseY < 440)
    { 
      reset();
    }
    break;
  case 4:
    if (mouseX >30 && mouseX < 180 && mouseY > 515 && mouseY < 565)
    { 
      reset();
    }
    break;
  case 5:
    if (mouseX >30 && mouseX < 180 && mouseY > 515 && mouseY < 565)
    { 
      reset();
    }
    break;
  }
}

// Supermamie.pde
// Travail pratique 1

import processing.sound.*;

// variables
Amplitude amp;
AudioIn in;
Environnement environnement;
Gameover gameover;
Mamie mamie;
SoundFile jump_sound;
SoundFile hit_sound;
Scoreboard scoreboard;

// paramètres
int gameStatus;
int score;
int life;
float framePositionX;
PImage life_icon;
PImage supermamie;
PImage spritesheet;
JSONObject spritedata;
ArrayList<PImage> animation;
ArrayList<Sprite> mamies;

void setup()
{
   size(800, 600);
   //Déclaration des valeurs
   framePositionX = 0;
   gameStatus = 1;
   life = 3;
   score = 0;
   
   //Instanciation de la capture du microphone
   amp = new Amplitude(this);
   in = new AudioIn(this, 0);
   in.start();
   amp.input(in);
   //Instanciation de l'environnement
   environnement = new Environnement();
   //Instanciation de Gameover
   gameover = new Gameover();
   //Instanciation de Mamie
   mamie = new Mamie();
   //Instanciation des bruits
   jump_sound = new SoundFile(this,"../assets/sounds/jump.wav"); 
   hit_sound = new SoundFile(this,"../assets/sounds/hit.wav");
   //Instanciation du score
   scoreboard = new Scoreboard();
  
   
   // Image GIF animé pour mamie
   supermamie = loadImage("../assets/img/supermamie_dummy.png");
   // Image pour les vies
   life_icon = loadImage("../assets/img/life_icon.png");   
   //Création du array pour l'animation de la mamie.
   animation = new ArrayList<PImage>();
   //Création du array pour les sprites de la mamie.
   mamies = new ArrayList<Sprite>();
   //Chargement du JSON et du PNG.
   spritedata = loadJSONObject("mamie.json");
   spritesheet = loadImage("mamie.png");
   //Localisation des frames de la mamie dans le fichier JSON.
   JSONArray frames = spritedata.getJSONArray("mamieFrames");
   for (int i = 0; i < frames.size(); i++) {
      JSONObject frame = frames.getJSONObject(i);
      //Va chercher les valeurs de position dans le array.
      JSONObject pos = frame.getJSONObject("position");
      //Plus spécifiquement, les valeurs du X, du Y, du W et du H.
      int x = pos.getInt("x");
      int y = pos.getInt("y");
      int w = pos.getInt("w");
      int h = pos.getInt("h");
      //Création de la variable img dans laquelle ont mets les informations de la spritesheet.
      PImage img = spritesheet.get(x, y, w, h);
      //On ajoute les valeurs à l'aimation.
      animation.add(img);
    }
    imageMode(CENTER);
    
   
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
  
}
//fonction pour partir le jeu
void gameOn()
{   
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
  for (Sprite mamie: mamies) {
    mamie.show();
    mamie.animate();
  }
  //Générer et mettre à jour les cellules
  environnement.generateCells(mamie);
  
  //Générer et afficher le score
  scoreboard.showDisplay();
  scoreboard.updateDisplay();
  
  //Faire sauter mamie par clappement des mains
  float vol = amp.analyze();
  if(vol >0.05)
  {
    if(mamie.position.y == height)
    {
       mamie.jump();
    }
  }
  score++;
}
//fonction lorsque le joueur a perdu ces 3 vies
void gameOver(){
  gameover.showGameOver();
}
//fonction lorsque le joueur a atteind le score mettant fin au jeu
void gameWin(){

}

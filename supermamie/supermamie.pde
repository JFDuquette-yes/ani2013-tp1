// Supermamie.pde
// Travail pratique 1

import processing.sound.*;
Amplitude amp;
AudioIn in;

// Environnement
Environnement environnement;

//Mamie
Mamie mamie;

PImage spritesheet;
JSONObject spritedata;
ArrayList<PImage> animation;
ArrayList<Sprite> mamies;

int life;
SoundFile jump_sound;
SoundFile hit_sound;

//Scoreboard
Display display;
int score;

void setup()
{
   size(800, 600);
   
   //Initialisation de la capture du microphone
   amp = new Amplitude(this);
   in = new AudioIn(this, 0);
   in.start();
   amp.input(in);
   //Initialisation de l'environnement
   environnement = new Environnement();
   //Initialisation de Mamie
   mamie = new Mamie();
   life = 3;
   //Initialisation des bruits
   jump_sound = new SoundFile(this,"../assets/sounds/jump.wav"); 
   hit_sound = new SoundFile(this,"../assets/sounds/hit.wav");
   //Initialisation du score
   display = new Display();
   score = 0;
}
void draw()
{
  background(51);
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
  display.showDisplay();
  display.updateDisplay();
  
  //Faire sauter mamie par clappement des mains
  float vol = amp.analyze();
  if(vol >0.01)
  {
    if(mamie.position.y == height)
    {
       mamie.jump();
    }
  }
  score++;
  println("Score " + score);
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

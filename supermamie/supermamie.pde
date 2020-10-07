import processing.sound.*;

// Supermamie.pde
// Travail pratique 1

import processing.sound.*;
Amplitude amp;
AudioIn in;
// variables
Environnement environnement;
Mamie mamie;
Cellules cellules;

void setup()
{
   size(800, 600);
   
   //Initialisation de la capture du microphone
   amp = new Amplitude(this);
   in = new AudioIn(this, 0);
   in.start();
   amp.input(in);
   
   environnement = new Environnement();
   mamie = new Mamie();
   cellules = new Cellules();
}

void draw()
{
  background(51);
  translate(-mamie.position.x + mamie.startPosition,0);
  
  
  //Générer et mettre à jour Mamie
  PVector gravity = new PVector(0,0.1);
  mamie.applyForce(gravity);
  mamie.update();
  mamie.display();
  mamie.edges();
  
  //Générer et mettre à jour l'environnement
  environnement.ground(mamie.position);
  environnement.background(mamie.position);
  
  
  //Obstacles tempo
  rect(350,height -50,50,50);
  
  
  //Faire sauter mamie par clappement des mains
  float vol = amp.analyze();
  if(vol >0.01)
  {
    if(mamie.position.y == height)
    {
       mamie.jump();
    }
  }
}
void keyPressed(){
 if(key ==' ')
 {
   if(mamie.position.y == height)
   {
     mamie.jump();
   }
 }

}

//PImage img;
int count = 1500;

float boidRadius = 3.0f;

float boidMaxspeed = 5.0f;
float boidMaxforce = 0.03f;

float boidThresholdSeparation = 50.0f;
float boidThresholdCohesion = 50.0f;
float boidThresholdAligment = 50.0f;

float boidWeightSeparation = 5.00f;
float boidWeightCohesion = 1.00f;
float boidWeightAligment = 0.75f;

// variables
Crowd crowd;
Boid boid;

void setup()
{
  size(500, 500);
  frameRate(90);
  //img = loadImage("SUPERMAMIE.jpg");

  rectMode(CORNER);

  // instanciation du groupe de boids
  crowd = new Crowd();
 

  // initialisation du groupe de boids
  for (int i = 0; i < count; ++i)
  {
    // instanciation d'un nouveau boid
    boid = new Boid(width / 2.0f, height / 2.0f);

    // configuration du nouveau boid
    configuration(boid);

    // ajouter le nouveau boid au groupe de boids
    crowd.add(boid);
  }
}

void draw()
{
 
  //image(img,0, 0);


  fade(1);

  // mise à jour du système de boids
  crowd.update();

  // rendu du système de boids
  crowd.render();
}



// fonction de configuration d'un nouveau boid selon les paramètres du programme
void configuration(Boid b)
{
  // propriétés
  b.radius = boidRadius;
  b.maxspeed = boidMaxspeed;
  b.maxforce = boidMaxforce;

  // valeurs des seuils des différents comportements
  b.thresholdCohesion = boidThresholdCohesion;
  b.thresholdAligment = boidThresholdAligment;
  b.thresholdSeparation = boidThresholdSeparation;

  // valeurs de pondération des différents comportements
  b.weightSeparation = boidWeightSeparation;
  b.weightCohesion = boidWeightCohesion;
  b.weightAligment = boidWeightAligment;
}

void fade(float decay)
{
  fill(0, decay);
  rect(0, 0, width, height);

}

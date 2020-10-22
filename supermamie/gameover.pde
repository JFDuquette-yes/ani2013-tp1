class Gameover {

  //params
  int nb_boid = 500;
  int duration = 100;
  int y = 0;

  float boidRadius = 3.0f;

  float boidMaxspeed = 20.0f;
  float boidMaxforce = 0.03f;

  float boidThresholdSeparation = 50.0f;
  float boidThresholdCohesion = 50.0f;
  float boidThresholdAligment = 50.0f;

  float boidWeightSeparation = 5.00f;
  float boidWeightCohesion = 1.00f;
  float boidWeightAligment = 0.75f;

  boolean sonLoopGameOver;
  boolean explosionSequenceEnd;
  boolean screenShot;

  PImage img;

  PVector positionGameOverTitle;

  // variables
  Crowd crowd;
  Boid boid;

  Gameover()
  {
    init();
  }
  void init()
  {
    this.positionGameOverTitle = new PVector(width/2, height/2);
    sonLoopGameOver = true;
    explosionSequenceEnd = false;
    screenShot = false;
    // instanciation du groupe de boids
    crowd = new Crowd();   
    // initialisation du groupe de boids
    for (int i = 0; i < nb_boid; i++)
    {
      // instanciation d'un nouveau boid
      boid = new Boid(width / 2.0f, height / 2.0f);

      // configuration du nouveau boid
      configuration(boid);

      // ajouter le nouveau boid au groupe de boids
      crowd.add(boid);
    }
  }
  void showGameOver()
  {       
    if (!explosionSequenceEnd)
    {
      if (y != duration)
      {

        //Load le screen du dernier frame
        img = loadImage("/data/img/screenshot.jpg");
        image(img, width/2, height/2, 800, 600);
        tint(255, 126); 
        
        rectMode(CORNER);       
        //Génération du Boid par dessus le screenshot
        fade(1);        
        // mise à jour du système de boids
        crowd.update();  
        // rendu du système de boids
        crowd.render();
        y++;
      } else
      {
        explosionSequenceEnd =true;
        y=0;
      }
    }
    if (explosionSequenceEnd)
    {
      background (#AAF604);
      fill(0);
      ps.run();
      stroke(#47C9C8);
      strokeWeight(8);
      rect(150, 250, 500, 125);
      fill(#F60404);
      textSize(32);
      textAlign(CENTER, CENTER);
      textFont (typo);
      text("GAME OVER", this.positionGameOverTitle.x, this.positionGameOverTitle.y);
      // Faire jouer le son game over qu'une seule fois.
      if (sonLoopGameOver == true) {
        playMusic(music_list, 2);
        sonLoopGameOver = false;
      }
      //Button rejouer
      fill(0);
      stroke (#47C9C8);
      strokeWeight(8);
      rect (300, 390, 150, 50);
      fill(#F60404);
      textFont(typo);
      textSize (28);
      text("REJOUER", 375, 410);
    }
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
}

class PVirus {
  PVector pos;
  float d;
  float fall;

  PVirus(PVector pos_) {
    pos = pos_;
    //Taille des virus 
    d = 25;
    //Vitesse à laquelle les virus tombent.
    fall = 1;
  }

  void run() {
    update();
    isDead();
    display();
  }

  void display() {
    image(virus, pos.x, pos.y, d, d);
  }

  void update() {
    pos.y += fall;
  }

  boolean isDead() {
    if (pos.y + d/2 > height) return true;
    else return false;
  }
}

class ParticleSystem {
  ArrayList<PVirus> viruses;

  float tx;
  float ty;

  ParticleSystem() {
    viruses = new ArrayList<PVirus>();
    PVector pos = new PVector(random(width), random(height));
    viruses.add(new PVirus(pos));
    tx += .5;
    ty += .5;
  }

  void run() {
    for (int i = 0; i < viruses.size(); i++) {
      PVirus pvirus = viruses.get(i);
      pvirus.run();
    }

    if (viruses.size() < 100) {
      PVector pos = new PVector(random(width), random(height));
      viruses.add(new PVirus(pos));
    }

    for (int i = viruses.size() - 1; i > 0; i--) {
      PVirus pvirus = viruses.get(i);
      if (pvirus.isDead()) {
        viruses.remove(pvirus);
      }
    }
  }
}

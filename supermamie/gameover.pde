class Gameover{

//params
PVector positionGameOverTitle;
PVector velocity;
//
boolean sonLoop = true;

// variable
Mamie mamie;

Gameover()
{
  init();
}
Gameover(Mamie h_mamie)
{
    mamie = h_mamie;
    
    init();
}
void init()
{
    println("Frame position X: "+ framePositionX);
    this.positionGameOverTitle = new PVector(width/2, height/2);
    this.velocity = new PVector(2, 0);
    sonLoop = true;
   
}
 void showGameOver()
 { 
    background (#AAF604);
    fill(0);
    ps.run();
    stroke(#47C9C8);
    strokeWeight(8);
    rect(150, 250, 500,125);
    fill(#F60404);
    textSize(32);
    textAlign(CENTER, CENTER);
    textFont (typo);
    text("GAME OVER", this.positionGameOverTitle.x, this.positionGameOverTitle.y);
    // Faire jouer le son game over qu'une seule fois.
    if(sonLoop == true){
      gameover_sound.play();
      sonLoop = false;
    }
     //Button jouer
    textSize(30);
    //text("REJOUER",width/2,400);
 }
 
 void updateTitle()
 {
   this.positionGameOverTitle.add(this.velocity); 
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

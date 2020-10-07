class Cellules{
//params
float variantY;

// Déclaration d'un ArrayList
//ArrayList<Particle> particles = new ArrayList<Particle>();
Cellules()
  {
    init();
  }
  void init()
 {
   this.variantY= random(-50,50);
 }
 void display()
 {
   // Ajout d'une particle au ArrayList
   /*
   particles.add(new Particle());
   Particle part = particles.get(0);
   part.display();
   */
 }

}

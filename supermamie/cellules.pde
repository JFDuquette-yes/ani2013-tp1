import processing.sound.*;
class Cellules
{
  Mamie mamie;
  
  PVector position;
  PVector size;
  PVector vitesse;
  
  int type;
  int nb = 10;
  
  Cellules()
  {   
    init();
  }
  Cellules(Mamie h_mamie)
  {   
    mamie = h_mamie;
    init();
  }
  void init()
  {
     float positionXCal = mamie.position.x + width;
     this.position = new PVector(positionXCal, height - random(100,150));
     this.vitesse = new PVector(-0.5,0);
     this.size = new PVector(50,50);
  }
  void show(){
    fill(125);
    ellipse(this.position.x, this.position.y, this.size.x,this.size.y);
  }
  void update(){
    
    this.position.add(this.vitesse);
  }
  //fonction pour capturer le contact des cellules sur mamie
  boolean contact()
  {
    if(this.position.x > mamie.position.x && this.position.x < mamie.position.x + mamie.size.x - 50 && this.position.y < mamie.position.y && this.position.y > mamie.position.y - mamie.size.y)
    {
      hit_sound.play();
      life--;
      return true;
    }
    else
    {
      return false;
    }    
  }
  boolean offscreen()
  {
    if(this.position.x < mamie.position.x - 250 )
    {
      println("Atteint edges");
      return true;
    }
    else
    {
      return false;
    }
  }
}

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
     this.position = new PVector(positionXCal, height - random(50,150));
     this.vitesse = new PVector(-0.5,0);
     this.size = new PVector(50,50);
     println("À la création la position de mamie "+mamie.position.x);
  }
  void show(){
    fill(125);
    ellipse(this.position.x, this.position.y, this.size.x,this.size.y);
  }
  void update(){
    
    this.position.add(this.vitesse);
  }
  boolean contact()
  {
    
    println("CELL "+ this.position.x+ " "+this.position.y);
    println("Mamie "+ mamie.position.x+ " "+mamie.position.y);
    if(this.position.x > mamie.position.x && this.position.x < mamie.position.x + mamie.size.x && this.position.y < mamie.position.y && this.position.y > mamie.position.y - mamie.size.y)
    {
      println("CONTACT");
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

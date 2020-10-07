// Buildings.pde
// Classe qui s'occupe des batiments


class Buildings
{
  final static int TYPE_BUILDING_DEFAULT = 0;
  final static int TYPE_BUILDING_1 = 1;
  final static int TYPE_BUILDING_2 = 2;
  final static int TYPE_BUILDING_3 = 3;
  final static int TYPE_BUILDING_4 = 4;
  final static int TYPE_BUILDING_5 = 5;
  
  Mamie mamie;
  
  PVector position;
  PVector size;
  PVector vitesse;
  
  int type;
 
  
  Buildings()
  {   
    init();
  }
  Buildings(Mamie h_mamie)
  {   
    mamie = h_mamie;
    init();
  }
  void init()
  {
     float positionXCal = mamie.position.x + width;
     this.position = new PVector(positionXCal, height -400);
     this.vitesse = new PVector(0,0);
     this.size = new PVector(75,150);
     println("À la création la position de mamie "+mamie.position.x);
  }
  void show(){
    fill(125);
    rect(this.position.x, this.position.y, this.size.x,this.size.y);
  }
  boolean offscreen()
  {
    if(this.position.x == 600 )
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

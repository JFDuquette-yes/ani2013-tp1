// Buildings.pde
// Classe qui s'occupe des batiments


class Buildings
{
  // paramètres
  int type;
  float positionXCal;
  float first_rect_x;
  PVector position;
  PVector size; 
  
  // variables
  Mamie mamie;
  
  Buildings()
  {   
    init();
  }
  Buildings(Mamie h_mamie, int type_)
  { 
    
    mamie = h_mamie;
    type = type_;
    init();
  }
  void init()
  {
     this.positionXCal = mamie.position.x + width;  
  }
  void show(){
     switch (this.type)
      {
        case 1:
          building1();
          break;
        case 2:
          building2();
          break;
        case 3:
          building3();
          break;
        case 4:
          building4();
          break;
        case 5:
          building5();
          break;
      }
  }
  void building1()
  {
    this.first_rect_x = 100;
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+80, 150, 200, 300);
    
   // Base de toit batiment 1
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+130, 140, 100, 10);
    
    // toit batiment 1
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+155, 130, 50, 10);
    
    // toit batiment 1
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+170, 120, 20, 10);
    
    // Batiment 1 fenetre 1 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+100, 180, 10, 10);
    
    // Batiment 1 fenetre 2 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+140, 180, 10, 10);
    
    // Batiment 1 fenetre 3 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+175, 180, 10, 10);
    
    // Batiment 1 fenetre 4 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+210, 180, 10, 10);
    
    // Batiment 1 fenetre 5 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+250, 180, 10, 10);
    
    
    // Batiment 1 fenetre 1 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+100, 220, 10, 10);
    
    // Batiment 1 fenetre 2 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+130, 220, 10, 10);
    
    // Batiment 1 fenetre 3 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+175, 220, 10, 10);
    
    // Batiment 1 fenetre 4 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+210, 220, 10, 10);
    
    // Batiment 1 fenetre 5 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+250, 220, 10, 10);
    
     // Batiment 1 fenetre 1 rangee 3
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+100, 260, 10, 10);
    
    // Batiment 1 fenetre 2 rangee 3
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+130, 260, 10, 10);
    
    // Batiment 1 fenetre 3 rangee 3
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+175, 260, 10, 10);
    
    // Batiment 1 fenetre 4 rangee 3
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+210, 260, 10, 10);
    
    // Batiment 1 fenetre 5 rangee 3
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+250, 260, 10, 10);
     
     // Batiment 1 PP
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal, 300, 230, 150);
    
     // Batiment 1 PP toit
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal, 290, 50, 10);
    
    // Batiment 1 PP toit 2 
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+90, 290, 50, 10);
    
    // Batiment 1 PP toit 3
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+180, 290, 50, 10);
  }
  void building2()
  {
      // Batiment 2 
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+50, 120, 120, 330);
   
    // Batiment 2 fenetre 1 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+90, 150, 10, 10);
    
      // Batiment 2 fenetre 2 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+70, 150, 10, 10);
   
   // Batiment 2 fenetre 1 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+90, 200, 10, 10);
    
    // Batiment 2 fenetre 2 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+110, 200, 10, 10);
    
    
    // Batiment 2 PP
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal, 300, 200, 150);
  
  }
  void building3()
  {
      // Batiment 3 
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 200, 120, 250);
    
    // Batiment 3 toit
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 190, 100, 10);
    
    // Batiment 3 toit 1
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 180, 80, 10);
    
    // Batiment 3 toit 2
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 170, 60, 10);
    
    // Batiment 3 toit 3
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 160, 40, 10);
    
    // Batiment 3 toit 4
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 150, 20, 10);
    
    // Batiment 3 fenetre 1 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+10, 250, 10, 10);
    
    // Batiment 3 fenetre 2 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+40, 250, 10, 10);
    
    // Batiment 3 fenetre 1 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+10, 200, 10, 10);
    
    // Batiment 3 fenetre 2 rangee 2
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+40, 200, 10, 10);
    
    // Batiment 3 PP
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+50, 400, 100, 50); 
    
    // Batiment 3 PP toit
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+75, 390, 50, 10);
    
  }
   void building4()
  {
    // Batiment 4 
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 110, 120, 340);
  
    // Batiment 4 PP
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+55, 200, 100, 250);
    
    // Batiment 4 PP toit 1 
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+55, 190, 10, 10);
    
    // Batiment 4 PP toit 2 
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+70, 190, 10, 10);
    
    // Batiment 4 PP toit 3 
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+100, 190, 10, 10);
    
    // Batiment 4 PP toit 4
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+130, 190, 10, 10);
    
    // Batiment 4 PP toit 5 
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+145, 190, 10, 10);
  }
  void building5()
  {
    // Batiment 5 
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 160, 300, 290);
    
    // Batiment 5 base toit
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal, 150, 30, 10);
    
    // Batiment 5 toit 2
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+50, 150, 30, 10);
    
    // Batiment 5 toit 2
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+140, 150, 30, 10);
    
     // Batiment 5 toit 2
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+220, 150, 30, 10);
    
    // Batiment 5 toit 2
    stroke(#AAF604);
    strokeWeight(1);
    fill(#AAF604);
    rect(positionXCal+270, 150, 30, 10);
    
    // Batiment 5 fenetre 1 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+70, 190, 10, 10);
    
    // Batiment 5 fenetre 2 rangee 1
    stroke(#FFFFFF);
    strokeWeight(1);
    fill(#FFFFFF);
    rect(positionXCal+230, 190, 10, 10);
    
    // Batiment 5 PP
    stroke(#2AAD09);
    strokeWeight(1);
    fill(#2AAD09);
    rect(positionXCal+30, 210, 100, 240);
    
     // Batiment 6 PP
      stroke(#2AAD09);
      strokeWeight(1);
      fill(#2AAD09);
      rect(positionXCal+180, 300, 100, 150);
      
      // Batiment 6 PP toit
      stroke(#2AAD09);
      strokeWeight(1);
      fill(#2AAD09);
      rect(positionXCal+180, 290, 50, 10);
  }
  boolean offscreen()
  {
    if(this.positionXCal < mamie.position.x - 400 )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}

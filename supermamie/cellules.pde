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
     this.size = new PVector(0,0);
  }
  void show(){
    //Dessin de la cellule de covid.
    rectMode(CORNER);
    noStroke();
    fill(0);
    //Cercle contour noir.
    rect(position.x + 9, position.y + 9, size.x + 21, size.y + 21);
    rect(position.x + 8, position.y + 10, size.x + 23, size.y + 19);
    rect(position.x + 10, position.y + 8, size.x + 19, size.y + 23);
    rect(position.x + 7, position.y + 12, size.x + 25, size.y + 15);
    rect(position.x + 12, position.y + 7, size.x + 15, size.y + 25);
    rect(position.x + 6, position.y + 13, size.x + 27, size.y + 13);
    rect(position.x + 13, position.y + 6, size.x + 13, size.y + 27);
    rect(position.x + 5, position.y + 16, size.x + 29, size.y + 7);
    rect(position.x + 16, position.y + 5, size.x + 7, size.y + 29);
    //Couronne 1 noir.
    rect(position.x + 15, position.y + 0, size.x + 9, size.y + 3);
    rect(position.x + 16, position.y + 3, size.x + 7, size.y + 1);
    rect(position.x + 17, position.y + 3, size.x + 5, size.y + 2);
    //Couronne 2 noir.
    rect(position.x + 36, position.y + 15, size.x + 3, size.y + 9);
    rect(position.x + 35, position.y + 16, size.x + 1, size.y + 7);
    rect(position.x + 34, position.y + 17, size.x + 2, size.y + 5);
    //Couronne 3 noir.
    rect(position.x + 15, position.y + 36, size.x + 9, size.y + 3);
    rect(position.x + 16, position.y + 35, size.x + 7, size.y + 1);
    rect(position.x + 17, position.y + 34, size.x + 5, size.y + 2);
    //Couronne 4 noir.
    rect(position.x + 0, position.y + 15, size.x + 3, size.y + 9);
    rect(position.x + 3, position.y + 16, size.x + 1, size.y + 7);
    rect(position.x + 3, position.y + 17, size.x + 2, size.y + 5);
    //Couronne 5 noir.
    rect(position.x + 3, position.y + 8, size.x + 8, size.y + 2);
    rect(position.x + 8, position.y + 3, size.x + 2, size.y + 8);
    rect(position.x + 6, position.y + 5, size.x + 5, size.y + 6);
    rect(position.x + 5, position.y + 6, size.x + 6, size.y + 5);
    rect(position.x + 7, position.y + 4, size.x + 4, size.y + 7);
    rect(position.x + 4, position.y + 7, size.x + 7, size.y + 4);
    //Couronne 6 noir.
    rect(position.x + 29, position.y + 3, size.x + 2, size.y + 8);
    rect(position.x + 28, position.y + 8, size.x + 8, size.y + 2);
    rect(position.x + 28, position.y + 6, size.x + 6, size.y + 5);
    rect(position.x + 28, position.y + 5, size.x + 5, size.y + 6);
    rect(position.x + 28, position.y + 7, size.x + 7, size.y + 4);
    rect(position.x + 28, position.y + 4, size.x + 4, size.y + 7);
    //Couronne 7 noir. 
    rect(position.x + 28, position.y + 29, size.x + 8, size.y + 2);
    rect(position.x + 29, position.y + 28, size.x + 2, size.y + 8);
    rect(position.x + 28, position.y + 28, size.x + 5, size.y + 6);
    rect(position.x + 28, position.y + 28, size.x + 6, size.y + 5);
    rect(position.x + 28, position.y + 28, size.x + 4, size.y + 7);
    rect(position.x + 28, position.y + 28, size.x + 7, size.y + 4);
    //Couronne 8 noir.
    rect(position.x + 8, position.y + 28, size.x + 2, size.y + 8);
    rect(position.x + 3, position.y + 29, size.x + 8, size.y + 2);
    rect(position.x + 5, position.y + 28, size.x + 6, size.y + 5);
    rect(position.x + 6, position.y + 28, size.x + 5, size.y + 6);
    rect(position.x + 4, position.y + 28, size.x + 7, size.y + 4);
    rect(position.x + 7, position.y + 28, size.x + 4, size.y + 7);
    //Cercle bleu.
    fill(#47C9C8);
    rect(position.x + 9, position.y + 10, size.x + 21, size.y + 19);
    rect(position.x + 10, position.y + 9, size.x + 19, size.y + 21);
    rect(position.x + 8, position.y + 12, size.x + 23, size.y + 15);
    rect(position.x + 12, position.y + 8, size.x + 15, size.y + 23);
    rect(position.x + 7, position.y + 13, size.x + 25, size.y + 13);
    rect(position.x + 13, position.y + 7, size.x + 13, size.y + 25);
    rect(position.x + 6, position.y + 16, size.x + 27, size.y + 7);
    rect(position.x + 16, position.y + 6, size.x + 7, size.y + 27);
    //Couronne 1 rouge.
    fill(#F60404);
    rect(position.x + 16, position.y + 1, size.x + 7, size.y + 2);
    rect(position.x + 17, position.y + 3, size.x + 5, size.y + 1);
    rect(position.x + 18, position.y + 3, size.x + 3, size.y + 2);
    //Couronne 2 rouge.
    rect(position.x + 36, position.y + 16, size.x + 2, size.y + 7);
    rect(position.x + 35, position.y + 17, size.x + 1, size.y + 5);
    rect(position.x + 34, position.y + 18, size.x + 2, size.y + 3);
    //Couronne 3 rouge.
    rect(position.x + 16, position.y + 36, size.x + 7, size.y + 2);
    rect(position.x + 3, position.y + 17, size.x + 1, size.y + 5);
    rect(position.x + 3, position.y + 18, size.x + 2, size.y + 3); //
    //Couronne 4 rouge.
    rect(position.x + 1, position.y + 16, size.x + 2, size.y + 7);
    rect(position.x + 17, position.y + 35, size.x + 5, size.y + 1);
    rect(position.x + 18, position.y + 34, size.x + 3, size.y + 2);
    //Couronne 5 rouge.
    rect(position.x + 6, position.y + 6, size.x + 4, size.y + 4);
    rect(position.x + 7, position.y + 5, size.x + 3, size.y + 5);
    rect(position.x + 5, position.y + 7, size.x + 5, size.y + 3);
    rect(position.x + 8, position.y + 4, size.x + 2, size.y + 6);
    rect(position.x + 4, position.y + 8, size.x + 6, size.y + 2);
    //Couronne 6 rouge.
    rect(position.x + 29, position.y + 6, size.x + 4, size.y + 4);
    rect(position.x + 29, position.y + 7, size.x + 5, size.y + 3);
    rect(position.x + 29, position.y + 5, size.x + 3, size.y + 5);
    rect(position.x + 29, position.y + 8, size.x + 6, size.y + 2);
    rect(position.x + 29, position.y + 4, size.x + 2, size.y + 6);
    //Couronne 7 rouge.
    rect(position.x + 29, position.y + 29, size.x + 4, size.y + 4);
    rect(position.x + 29, position.y + 29, size.x + 3, size.y + 5);
    rect(position.x + 29, position.y + 29, size.x + 5, size.y + 3);
    rect(position.x + 29, position.y + 29, size.x + 2, size.y + 6);
    rect(position.x + 29, position.y + 29, size.x + 6, size.y + 2);
    //Couronne 8 rouge.
    rect(position.x + 6, position.y + 29, size.x + 4, size.y + 4);
    rect(position.x + 5, position.y + 29, size.x + 5, size.y + 3);
    rect(position.x + 7, position.y + 29, size.x + 3, size.y + 5);
    rect(position.x + 4, position.y + 29, size.x + 6, size.y + 2);
    rect(position.x + 8, position.y + 29, size.x + 2, size.y + 6);
    //Couronne 9 noir.
    fill(0);
    rect(position.x + 16, position.y + 16, size.x + 7, size.y + 7);
    rect(position.x + 15, position.y + 17, size.x + 9, size.y + 5);
    rect(position.x + 17, position.y + 15, size.x + 5, size.y + 9);
    //Couronne 8 rouge.
    fill(#F60404);
    rect(position.x + 18, position.y + 16, size.x + 3, size.y + 7);
    rect(position.x + 16, position.y + 18, size.x + 7, size.y + 3);
    rect(position.x + 17, position.y + 17, size.x + 5, size.y + 5);
    
    
  }
  void update(){
    
    this.position.add(this.vitesse);
  }
  //fonction pour capturer le contact des cellules sur mamie
  boolean contact()
  {
    if(this.position.x > mamie.position.x && this.position.x < mamie.position.x + mamie.size.x - 50 && this.position.y < mamie.position.y && this.position.y > mamie.position.y - mamie.size.y)
    {
      contact = 1;
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

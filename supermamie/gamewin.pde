class Gamewin{

//params
PVector positionGameWinTitle;
PVector velocity;

// variable
Mamie mamie;

Gamewin()
{
  init();
}
Gamewin(Mamie h_mamie)
{
    mamie = h_mamie;
    init();
}
void init()
{
    println("Frame position X: "+ framePositionX);
    this.positionGameWinTitle = new PVector(width/2, height/2);
    this.velocity = new PVector(2, 0);
}
 void showGameWin()
 { 
    fill(0);
    stroke(255);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("FÉLICITATIONS", this.positionGameWinTitle.x, this.positionGameWinTitle.y);
    //GENEVIÈVE Faire jouer le son game over
 }
 void updateTitle()
 {
   this.positionGameWinTitle.add(this.velocity); 
 }
}

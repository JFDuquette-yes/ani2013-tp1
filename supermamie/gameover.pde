class Gameover{

//params
PVector positionGameOverTitle;
PVector velocity;

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
}
 void showGameOver()
 { 
    fill(0);
    stroke(255);
    rect(this.positionGameOverTitle.x, this.positionGameOverTitle.y, 200,50);
    fill(255);
    textSize(32);
    textAlign(LEFT, CENTER);
    text("GAME OVER", this.positionGameOverTitle.x, this.positionGameOverTitle.y);
    //GENEVIÈVE Faire jouer le son game over
 }
 void updateTitle()
 {
   this.positionGameOverTitle.add(this.velocity); 
 }
}

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
    background (#AAF604);
    fill(0);
    stroke(#47C9C8);
    strokeWeight(8);
    rect(150, 250, 500,125);
    fill(#F60404);
    textSize(32);
    textAlign(CENTER, CENTER);
    textFont (typo);
    text("GAME OVER", this.positionGameOverTitle.x, this.positionGameOverTitle.y);
    // Faire jouer le son game over
    gameover_sound.play();
     //Button jouer
    textSize(30);
    //text("REJOUER",width/2,400);
    noLoop();
 }
 void updateTitle()
 {
   this.positionGameOverTitle.add(this.velocity); 
 }
}

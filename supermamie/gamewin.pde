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
    background (#AAF604);
    stroke(#47C9C8);
    strokeWeight(8);
    rect(85,250, 625,125);
    fill(#F60404);
    textSize(50);
    textAlign(CENTER, CENTER);
    textFont(typo);
    text("FÉLICITATIONS", this.positionGameWinTitle.x, this.positionGameWinTitle.y);
    win_sound.play ();
    noLoop();
 }
 void updateTitle()
 {
   this.positionGameWinTitle.add(this.velocity); 
 }
}

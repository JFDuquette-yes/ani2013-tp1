class Display{

//params
PVector positionScore;
PVector positionLife;
PVector velocity;

Display()
{
  init();
}
void init()
{
    this.positionScore = new PVector(10, 110);
    this.positionLife = new PVector(width - 140, 140);
    this.velocity = new PVector(2, 0);
}
void showDisplay()
{
  this.showScore();
  this.showLife();

}
void showScore()
{ 
    fill(#47C9C8);
    stroke(#FFFFFF);
    rect(this.positionScore.x, this.positionScore.y, 250,50);
    fill(#F24E15);
    textAlign(LEFT, CENTER);
    textFont (typo);
    textSize(32);
    text(score, this.positionScore.x + 20, this.positionScore.y +20);
 }
 void showLife()
 { 
   float x = this.positionLife.x + 100;
   float y = this.positionLife.y;
   for (int i=0; i < life; i++)
   {
     image(life_icon, x, y); 
     x -= 50;
   }  
 }
 void updateDisplay()
 {
   this.positionScore.add(this.velocity); 
   this.positionLife.add(this.velocity);
 }
}

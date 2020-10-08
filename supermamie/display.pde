class Scoreboard{

//params
PVector positionScore;
PVector positionLife;
PVector velocity;

Scoreboard()
{
  init();
}
void init()
{
    this.positionScore = new PVector(10, 100);
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
    fill(0);
    stroke(255);
    rect(this.positionScore.x, this.positionScore.y, 200,50);
    fill(255);
    textSize(32);
    textAlign(LEFT, CENTER);
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

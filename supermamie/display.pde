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
    this.positionScore = new PVector(10, 100);
    this.positionLife = new PVector(width - 220, 100);
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
    fill(0);
    stroke(255);
    rect(this.positionLife.x, this.positionLife.y, 200,50);
    fill(255);
    textSize(32);
    textAlign(LEFT, CENTER);
    text(life, this.positionLife.x +20, this.positionLife.y +20);
      
 }
 void updateDisplay()
 {
   this.positionScore.add(this.velocity); 
   this.positionLife.add(this.velocity);
 }
}

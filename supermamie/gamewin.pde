class Gamewin{

//params
PVector positionGameWinTitle;
PVector velocity;
String message = "FELICITATIONS !!!";

boolean sonLoopWin = true;
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
    sonLoopWin = true;
}
 void showGameWin()
 { 
    background (#AAF604);
    
    fill(#F24E15);
    stroke(#47C9C8);
    strokeWeight(8);
    rect(50,220, 700,125);
    
    fill (random(50,255));
    textFont(typo2);
    int x = 72;
    for (int i = 0; i < message.length(); i++){
    textSize(random (45,50));
    text(message.charAt (i), x, height/2);
    x += textWidth (message.charAt (i));

    }
    // Faire jouer le son win qu'une seule fois.
    if(sonLoopWin == true){
      win_sound.play ();
      sonLoopWin = false;
    }
    
   }
    
 void updateTitle()
 {
   this.positionGameWinTitle.add(this.velocity); 
 }
}

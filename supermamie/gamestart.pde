class Gamestart{

Gamestart()
{
  init();
}
void init()
{
 
}
 void showGameStart()
 { 
    player.play();
    background(0); 
    fill(13,255,0);
    textFont(typo,40);
    textSize(60);
    textAlign(CENTER,CENTER);
    text("SUPERMAMIE",width/2,250);
    
    textSize(30);
    text("play",width/2 - 100,400);
    fill(255,0,0);
    text("score",width/2 + 100,400);
    
    for(int i = 0; i < width; i = i + 15){
      ellipse(i,10,10,10);
      ellipse(i,height -10,10,10);
    }
 }
}

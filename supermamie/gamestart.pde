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
    text("SUPERMAMIE",width/2,200);
    
    fill(#FFFFFF);
    textSize(30);
    //Button jouer
    text("JOUER",width/2,300);
    //Button démo
    text("DÉMO",width/2,340);
    //Button score
    text("TOP 10",width/2,380);
    
    fill(#F60404);
    for(int i = 0; i < width; i = i + 15){
      ellipse(i,10,10,10);
      ellipse(i,height -10,10,10);
    }
 }
}

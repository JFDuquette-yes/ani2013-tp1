class Gamewin {

  //params
  PVector positionGameWinTitle;
  String message = "BRAVO!!!";

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
    this.positionGameWinTitle = new PVector(width/2, height/2);
    sonLoopWin = true;
  }
  void showGameWin()
  { 
    background (#AAF604);

    //bouton rejouer
    fill(#F24E15);
    stroke (#47C9C8);
    strokeWeight(8);
    rect (300, 390, 160, 50);
    fill(#FFFFFF);
    textFont(typo);
    textSize (28);
    text("REJOUER", 312, 410);


    //Rectangle Et Texte animé
    fill(#F24E15);
    stroke(#47C9C8);
    strokeWeight(8);
    rect(50, 200, 700, 140);

    fill (#F24E15);
    textFont(typo);
    textSize(30);
    text ("vous avez survécu!", 200, 100);

    fill (random(175, 255));
    textFont(typo2);
    int x = 125;
    for (int i = 0; i < message.length(); i++) {
      textSize(random (85, 90));
      text(message.charAt (i), x, height/2 -35);
      x += textWidth (message.charAt (i));
    }
    // Faire jouer le son win qu'une seule fois.
    if (sonLoopWin == true) {
      playMusic(music_list, 3);
      sonLoopWin = false;
    }
  }
}

void updateTitle()
{
  //  this.positionGameWinTitle.add(this.velocity);
}

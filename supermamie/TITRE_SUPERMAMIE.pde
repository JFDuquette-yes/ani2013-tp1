/*import ddf.minim.*;
Minim minim;
AudioPlayer player;
PFont font;

void setup()
{
size(500,500);
String[] fontList = PFont.list();
printArray(fontList);
font = createFont("LLPIXEL3.ttf", 100);


minim = new Minim(this);
player = minim.loadFile("fanfare2.wav");
player.play();
player.shiftGain(-50,0,2000);
}

void draw()
{
background(0); 
fill(13,255,0);
textFont(font,40);
textSize(60);
textAlign(CENTER,CENTER);
text("SUPERMAMIE",250,250);

{
textSize(30);
text("play",150,400);
fill(255,0,0);
text("score",350,400);
}

for(int i = 0; i < width; i = i + 15){
  ellipse(i,10,10,10);
  ellipse(i,490,10,10);
  }
}
  
void mousePressed(){
  saveFrame("render.####.jpg");
}*/

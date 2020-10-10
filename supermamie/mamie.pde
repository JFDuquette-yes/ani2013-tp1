class Mamie{
  
//params
PVector position;
PVector velocity;
PVector acceleration;
PVector size;

int startPositionX;
int startPositionY;
int index;
int len, speed;

ArrayList<PImage> animation;
JSONObject spritedata;
JSONArray frames;

Mamie()
  {
    this.startPositionX = 100;
    this.startPositionY = 400;
    init();
  }
  void init()
 {
   this.position = new PVector(this.startPositionX,startPositionY);
   this.velocity = new PVector(2,0);
   this.acceleration = new PVector(0,0);
   this.size = new PVector(89,150);
  
   
   //Création du array pour l'animation de la mamie.
   animation = new ArrayList<PImage>();
   //Chargement du JSON et du PNG.
   spritedata = loadJSONObject("mamie.json");
   spritesheet = loadImage("mamie.png");
   //Localisation des frames de la mamie dans le fichier JSON.
   frames = spritedata.getJSONArray("mamieFrames");
   speed = 1;
   len = frames.size() - 1;
   imageMode(CENTER);
   for (int i = 0; i < frames.size(); i++) {
      JSONObject frame = frames.getJSONObject(i);
      //Va chercher les valeurs de position dans le array.
      JSONObject pos = frame.getJSONObject("position");
      //Plus spécifiquement, les valeurs du X, du Y, du W et du H.
      int x = pos.getInt("x");
      int y = pos.getInt("y");
      int w = pos.getInt("w");
      int h = pos.getInt("h");
      //Création de la variable img dans laquelle ont mets les informations de la spritesheet.
      PImage img = spritesheet.get(x, y, w, h);
      //On ajoute les valeurs à l'aimation.
      animation.add(img);
    }
 }
 void update()
 {
   println("Index "+index);
   if(frameCount % 12 == 0)
   {
     if(index < len)
     {
       index += speed;
     }
     else
     {
       index = 0;
     }
   }
   this.velocity.add(this.acceleration);
   this.position.add(this.velocity);
   this.acceleration.set(0,0);
  
 }
 void applyForce(PVector force)
 {
   this.acceleration.add(force);
 }
 void jump()
 { 
   PVector jumpY = new PVector(0,-10);
   applyForce(jumpY);
   jump_sound.play();
 }
 void display()
 {
   fill(255);
   stroke(255);
   println("IMAGE "+ animation.get(index));
   image(animation.get(index), this.position.x, this.position.y-this.size.y,this.size.x, this.size.y);
   //rect(this.position.x, this.position.y - this.size.y, this.size.x, this.size.y);
   //image(animation.get(index), this.position.x, this.position.y-this.size.y,this.size.x, this.size.y); 
 }
 void edges()
 {
   if(this.position.y > height)
   {
     this.velocity.y *=0;
     this.position.y =height;
   }
 
 }

}

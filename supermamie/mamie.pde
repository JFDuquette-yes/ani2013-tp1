class Mamie{

//params
PVector position;
PVector velocity;
PVector acceleration;
float startPosition;
Mamie()
  {
    this.startPosition = 100;
    init();
  }
  void init()
 {
  
   this.position = new PVector(this.startPosition,height);
   this.velocity = new PVector(1,0);
   this.acceleration = new PVector(0,0);
 }
 void update()
 {
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
   PVector jumpY = new PVector(0,-5);
   applyForce(jumpY);
 }
 void display()
 {
   fill(255);
   stroke(255);
   rect(this.position.x, this.position.y -155, 75,150);
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

class Mamie{

//params
PVector position;
PVector velocity;
PVector acceleration;
PVector size;

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
   this.size = new PVector(75,150);
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
   rect(this.position.x, this.position.y - this.size.y, this.size.x,this.size.y);
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

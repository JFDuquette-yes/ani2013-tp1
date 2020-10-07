class Environnement{

//params
ArrayList<Buildings> buildings;
Buildings[][] grid;
Buildings building;

int index;
int count;

Environnement()
  {
    init();
  }
  void init()
 {
   
   buildings = new ArrayList<Buildings>();
 }
 void ground(PVector mamiePosition)
 {
   fill(255);
   stroke(255);
   line(0, height -5, mamiePosition.x + width, height -5);
 }
 void background(PVector mamiePosition)
 {
   fill(255);
   stroke(255);
   line(0, height -400, mamiePosition.x + width, height -400);
   if(frameCount % 40 ==0)
   {
     building = new Buildings();
     buildings.add(building);      
   }
   for (index = 0; index < count; ++index)
   {
     building = buildings.get(index);
     //building.render();
     //building.update();
   }
 }
}

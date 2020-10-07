class Environnement{

//params
ArrayList<Buildings> buildings;
Buildings[][] list;
Buildings building;
Mamie mamie;

int index;
int count;

Environnement()
{
  init();
}
void init()
{
   buildings = new ArrayList<Buildings>();
   mamie= new Mamie();
}
 void ground(PVector mamiePosition)
 {
   fill(255);
   stroke(255);
   line(0, height -5, mamiePosition.x + width, height -5);
 }
 void backgroundBuildings(Mamie mamie)
 {
   count = buildings.size();
   fill(255);
   stroke(255);
   line(0, height -250, mamie.position.x + width, height -250);
   if(frameCount % 100 == 0)
   {
     building = new Buildings(mamie);
     buildings.add(building);  
   }
   for (index = count-1; index >=0; --index)
   {
     building = buildings.get(index);
     building.show();
     if(building.offscreen())
     {
       buildings.remove(building);
     }
   }
 }
}

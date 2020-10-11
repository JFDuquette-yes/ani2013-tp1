class Environnement{

//params
ArrayList<Buildings> buildings;
ArrayList<Cellules> cellules;
Buildings building;
Cellules cellule;

Mamie mamie;


int index;
int count;
int type;

Environnement()
{
  init();
}
void init()
{
   buildings = new ArrayList<Buildings>();
   cellules = new ArrayList<Cellules>();
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
   line(0, height -150, mamie.position.x + width, height -150);
   if(frameCount % 200 == 0)
   {
     //Génération aléatoire du type de bâtiment à afficher avec un fonction récursive
     generateType();
     building = new Buildings(mamie, type);
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
 void generateCells(Mamie mamie)
 {
   count = cellules.size();
   fill(255);
   stroke(255);
   if(frameCount % int(random (200,250)) == 0)
   {
     cellule = new Cellules(mamie);
     cellules.add(cellule);  
   }
   for (index = count-1; index >=0; --index)
   {
     cellule = cellules.get(index);
     cellule.show();    
     if(cellule.contact() || cellule.offscreen())
     {
       cellules.remove(cellule);
       if(life == 0)
      {
        gameStatus = 2;
      }
     }
   }
 } 
 void generateType()
 {
   int g_type = int(random(1,5));  
   if(g_type == type)
   {
       generateType();
   }
   else
   {
     type = g_type;
   }
 }
}

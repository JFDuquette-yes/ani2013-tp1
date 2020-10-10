/*PImage spritesheet;
JSONObject spritedata;

ArrayList<PImage> animation;

ArrayList<Sprite> mamies;*/

/*void setup() {
  //La taille du canvas
  size(1024, 768);
  
  frameRate(12);
  
  //Création du array pour l'animation de la mamie.
  animation = new ArrayList<PImage>();
  //Création du array pour les sprites de la mamie.
  mamies = new ArrayList<Sprite>();
  //Chargement du JSON et du PNG.
  spritedata = loadJSONObject("mamie.json");
  spritesheet = loadImage("mamie.png");
  //Localisation des frames de la mamie dans le fichier JSON.
  JSONArray frames = spritedata.getJSONArray("mamieFrames");
  
}

void draw() {
  background(0);

  for (Sprite mamie: mamies) {
    mamie.show();
    mamie.animate();
  }

  // image(animation[frameCount % animation.length], 0, 0);
}*/

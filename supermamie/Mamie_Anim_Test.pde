PImage spritesheet;
JSONObject spritedata;

ArrayList<PImage> animation;

ArrayList<Sprite> mamies;

void setup() {
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
    imageMode(CENTER);
    mamies.add(new Sprite(animation, width / 2, height / 2, 0));
}

void draw() {
  background(0);

  for (Sprite mamie: mamies) {
    mamie.show();
    mamie.animate();
  }

  // image(animation[frameCount % animation.length], 0, 0);
}

class Demo{
  
  Movie DemoVideo;
  Demo()
  {
    init();
  }
  void init()
  {
   //DemoVideo.play();
   
  }
  
  void draw(){
    //image(DemoVideo, 0, 0);
  }
  
  void movieEvent(Movie m){
    m.read();
  }
  
  
  void showDemo()
  { 

  }
}

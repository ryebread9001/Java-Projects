

    PImage birdImg;
    PImage grassImg;
    int grassX = 10;  
    int score = 0;
    bird flappythangg = new bird();
    pillar[] p = new pillar[3];
    boolean end=false;
    
    //int score=0; maybe I'll do score later
    
    void setup(){
      size(500,800);
      for(int i = 0;i<3;i++){
          p[i]=new pillar(i);
      }
      String url2 = "http://66.media.tumblr.com/avatar_72fdaeff448f_128.png";
      //Load image
      birdImg = loadImage(url2, "png");
      String grassurl = "http://www.clipartbest.com/cliparts/MTL/jg7/MTLjg7aTa.png";
      grassImg = loadImage(grassurl, "png");
    }
    
    void draw(){
      background(200);
      
      grassX += 4;
      flappythangg.drawGrass();
      if(end){
      flappythangg.move();
      }
      flappythangg.drawBird();
      if(end){
      flappythangg.gravity();
      }
      for(int i = 0;i<3;i++){
        p[i].drawPillar();
        p[i].checkPosition();
      }
      flappythangg.checkForPillarz();
      fill(0);
      stroke(255);
      textSize(36);
      text(score, 20,200);
     
      
      
      }
    
   
      
      
    //I define everything here yo
    class bird{
    float xPos,yPos,ySpeed;//initializing my vars like we learned in class
    bird(){
    xPos = 200;
    yPos = 400;
    
    //centerish of screen
    
    }
    void drawBird(){
      
      //what else goes here, ask future me?
      
      image(birdImg,xPos-50,yPos-100,100,100);
      
    }
    void jump(){
     ySpeed=-10; 
    }
    void gravity(){
     ySpeed+=0.6; //above 0.6 is too difficult to play... for noobs
    }
    void move(){
     yPos+=ySpeed; 

    }
    
    void checkForPillarz() {
        for(int i = 0; i < 3; i++){
          if((xPos < p[i].xPos+10  &&  xPos > p[i].xPos-10)  &&  (yPos < p[i].opening-100  ||  yPos > p[i].opening+100)){
             xPos -= 900;
             
          }
        }
    }  
      
    public void drawGrass() {
        int p;
        for(p = 0; p <= 1000; p+=100) {
            image(grassImg,p-grassX,700); 
            text("Flappy Bird",(p*2)-(grassX),30);
            if (p < -100) {
              p+=600;  
            }
        } 
          
        
      } 
      

   
    }
    
    class pillar{
      
      float xPos, opening;
      boolean cashed = false;
      pillar(int i){
          xPos = 100+(i*200);
          opening = random(600)+100;
      
       }
     void drawPillar(){
       stroke(10);
       strokeWeight(10);
       line(xPos,0,xPos,opening-100);  
       line(xPos,opening+100,xPos,800);
       xPos -= 2.5;
     }
     
     void checkPosition(){
       
       
      if (xPos<0) {
       xPos+=(200*3);
       opening = random(600)+100;
       cashed=false;
       
      } 
      if(xPos<250&&cashed==false){
        
        
       cashed=true;
        
      }
     }   
    } 

    void mousePressed(){
      
     flappythangg.jump();
     score++;
     end = true; // allows my draw function to run
     
    }
    
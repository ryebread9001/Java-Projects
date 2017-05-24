PImage img;

void setup() 
{
    size(700,821);
    
    
    String url = "http://www.vangogh.net/images/paintings/self-portrait.jpg";
    //Load image
    img = loadImage(url, "png");
    
    width=20;
    height=20;    
    for(int x=0;x<100;x++)
      {
        for(int y=0;y<100;y++)
        {
        fill(200);
        rect(x*width,y*height,width,height,50);
        }
    }
    
    image(img,0,0);
      
    
    
}  



/*
void draw() {
    //image(img,0,0);
    fill(0);
    rect(90,80,40,60);
    fill(255);
    text(mouseX,100,100);
    text(mouseY,100,120);
     
    
    if(mousePressed) {
      noStroke();
      fill(random(0,50),random(0,100),random(0,255), 100);
      rect(mouseX+(random(-30,30))-50,mouseY+(random(-30,30))-50,100,100, 50);  
      
      
    }  
    
    noStroke();
    //background Face
    fill(260,213,123);
    beginShape();
    vertex(293,453);
    vertex(240,331);
    vertex(243,280);
    vertex(256,182);
    vertex(282,149);
    vertex(357,122);
    vertex(478,190);
    vertex(466,306);
    vertex(369,436);
    endShape();
    
    beginShape();
    fill(220,181,103);
    vertex(483,293);
    vertex(458,434);
    vertex(350,498);
    vertex(292,467);
    vertex(384,412);
    vertex(465,305);
    vertex(485,274);
    endShape();
    
    //background Shirt
    beginShape();
    fill(55,97,146);
    vertex(76,818);
    vertex(130,553);
    vertex(278,457);
    vertex(351,496);
    vertex(472,413);
    vertex(480,414);
    vertex(651,554);
    vertex(700,604);
    vertex(700,821);
    endShape();
    
    //background undershirt 
    fill(209,224,232);
    beginShape();
    vertex(292,460);
    vertex(293,497);
    vertex(310,526);
    vertex(341,536);
    vertex(398,494);
    vertex(453,423);
    vertex(351,493);
    endShape();
    
    
    //eyes
    fill(12,39,74);
    ellipse(361,272,20,20);
    ellipse(270,273,20,20);
    //nose + green face features... IDK 
    fill(216,213,123);
    triangle(290,270,260,340,315,345);
    ellipse(280,340,38,30);
    ellipse(301,339,28,24);
    triangle(331,279,356,293,379,278);
    triangle(247,280,263,295,284,279);
    quad(474,297,501,275,483,355,471,364);
    quad(357,315,351,333,398,322,415,313);
    
    
    
    //beard
    fill(199,80,21);
    rect(232,244,60,10);
    rect(325,247,60,10);
    quad(258,375,263,393,329,360,330,361);
    rect(261,360,70,14);
    triangle(331,359,285,380,387,425);
    quad(246,401,270,365,290,414,292,468);
    rect(256,372,20,20);
    rect(290,414,78,50);
    quad(350,380,369,467,465,364,464,302);
    quad(465,304,512,264,490,145,414,148);
    quad(355,82,359,148,416,157,490,145);
    quad(277,136,288,158,360,148,356,82);
    triangle(255,178,289,159,278,136);
    quad(250,181,240,237,243,275,257,180);
    quad(243,275,230,303,239,327,242,276);
    triangle(239,327,252,394,264,367);
    quad(278,387,277,391,319,387,319,381);
    quad(474,359,452,427,473,412,490,354);
    quad(253,383,307,372,396,424,294,459);
    
    //more Face
    fill(260,213,123);
    beginShape();
    vertex(290,417);
    vertex(269,394);
    vertex(276,385);
    vertex(310,382);
    vertex(343,399);
    endShape();
    triangle(307,410,332,422,343,399);
    
    //jacket... idk
    fill(78,135,201);
    quad(480,405,417,471,398,549,435,556);
    quad(417,473,305,616,295,641,394,583);
    quad(267,430,226,522,260,592,291,463);
    triangle(273,538,208,578,224,724);
    quad(291,645,300,634,326,820,316,820);
    quad(218,665,188,820,203,820,227,707);
    quad(478,410,602,499,598,485,494,426);
    quad(494,426,598,485,700,612,700,595);
    quad(257,461,131,545,127,555,266,462);
    quad(131,545,80,820,72,820,127,555);
    quad(627,535,511,614,505,659,651,554);
    quad(506,661,526,820,541,705,524,638);
    
    
    
    
    

}  
*/
int aX;
int b;
int cX;
int d;
int eX;
int f;
int gX;
int h;

int playX = 200;
int playY = 200;
float randomX;
float randomY;
//void keyPressed() 
void draw()
{
     //frameRate(1);
     
     frameRate(20);
     fill(255);
     background(0);
     rect(playX,playY,20,20);
     randomX = random(0,700);
     randomY = random(0,821);
     rect(randomX,randomY,5,5);
     
     
     
        
     if (keyCode == UP) {
        aX = mouseX;
        b = mouseY;
     }
      if (keyCode == DOWN) {

        cX = mouseX;
        d = mouseY;
      }
     if (keyCode == RIGHT) {

      eX = mouseX;
      f = mouseY;
     }
     if (keyCode == LEFT) {

      gX = mouseX;
      h = mouseY;
     }
     if (keyCode == ENTER) {
      //quad(aX,b,cX,d,eX,f,gX,h);
      text(aX,aX,b);
      text(b,aX,b+10);
     }
     if (keyCode == SHIFT) {
      image(img,0,0);
     }
     if (keyCode == 'A') {
         playX -= 20;
         rect(playX,playY,20,20);
     }
     if (keyCode == 'D') {
         playX += 20;
         rect(playX,playY,20,20);
     }  
     if (keyCode == 'W') {
         playY -= 20;
         rect(playX,playY,20,20);
     }  
     if (keyCode == 'S') {
         playY += 20;
         rect(playX,playY,20,20);
     } 
     if (playX>700) {
         playX -= 700;  
     } 
     if (playY>821) {
         playY -= 821;
     }
     if (playX < 0) {
         playX += 700;
     }
     if (playY < 0) {
         playY += 821; 
     }  

}
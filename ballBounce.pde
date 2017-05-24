
ball b = new ball();


void setup() {
  background(255);
  size(1000,900);
  frameRate(60);
   
}


  

void draw() {
  fill(0);
  background(255);
  b.ballMove();
  b.ballDraw(pmouseX);
  
}  

class ball {
    
    float ballY;
    float ballYSpeed;
    float gravity = 1;
   
  void ballMove() {
      
    if (mousePressed) {
      ballYSpeed += 100;  
      
    }  
      ballY += ballYSpeed;
      ballYSpeed += gravity;
    if (ballY >= height - 50){
      ballYSpeed *= -1; 
      ballYSpeed += (ballYSpeed*-1)/20;
    
    }  
  
  } 
  void ballDraw(float ballX) {
    noStroke();
    fill(-ballY+250);
    ellipse(ballX,ballY,40,40);  
    
  }  
  
  
  
}  
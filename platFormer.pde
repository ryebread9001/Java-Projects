int gravity = 2;
cube player = new cube();
coin gold = new coin();
boolean gameState = false;
void setup() {
  frameRate(60);
  size(600,600);  
  
}  

void draw() {
  
  if (gameState) {
    background(100);
    rect(-1,500,601,101);
    gold.show();
    player.update();
    player.show();
    player.gravity();
    fill(232, 206, 9);
    textSize(20);
    text(player.score,20,40);
    if(player.ySpeed <= 0) {
      player.ySpeed += 0.01;
    } else if (player.ySpeed >= 0) {
      player.ySpeed -= 0.001;
    }
    if (player.xSpeed >= 0) {
      player.xSpeed -= 0.1;
    } else if (player.ySpeed <= 0) {
      player.xSpeed += 0.1;
    } 
  } else {
      background(100);
      fill(232, 206, 9);
      rect(-1,500,601,101);
      textSize(50);
      text("Coin Jump",170,100);
      textSize(30);
      text("START",250,240);
      if (mouseX > 200 && mouseX < 300 && mouseY > 200 && mouseY < 280) {
        fill(255);
        text("START",250,240);
        if (mousePressed) {
          gameState = true;
        }  
      } 
  }  
}

void keyPressed() {
  if (keyCode == UP) {
    player.jump();
  }  
  else if (keyCode == RIGHT) {
    player.moveRight();
  } 
  else if (keyCode == LEFT) {
    player.moveLeft();
  }  
  
}  


class cube {
  public int x = 300;
  public int y = 300;
  public int xSpeed = 0;
  public int ySpeed = 0;
  public int score = 0;
    void jump(){
     ySpeed=-20; 
    }
    void gravity(){
     if (y < height - 150) {
       ySpeed+=2; //above 0.6 is too difficult to play... for noobs
     } else {
       ySpeed*=-1;  
     }  
     x = constrain(x,0,width-50);
     y = constrain(y,0,height-100);
     xSpeed -= 0.1;
    }
    void moveRight(){
     xSpeed = 20; 
    }
    void moveLeft() {
     xSpeed = -20;  
    }  
  
  void update() {
    x += xSpeed;
    y += ySpeed;
  }  
  
  void show() {
    fill(200,20,20);
    noStroke();
    rect(x,y,50,50);
    
    
  }  
  
}  

class coin {
  float coinX=300;
  float coinY=300;
  
  void show() {
    if (player.x > coinX - 40 && player.x < coinX + 40 && player.y > coinY - 40 && player.y < coinY +40) {
      coinX = random(50,width-50);
      coinY = random(50,height-150);
      player.score ++;
      println("TOUCHED");
    }
      fill(232, 206, 9);
      ellipse(coinX,coinY,20,20);
  }  
  
}  
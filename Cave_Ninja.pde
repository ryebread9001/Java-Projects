 PImage ninja; PImage cave; PImage coinGold; PImage bat; PImage death; PImage spikes; PImage hp; PImage star; PImage bat2;


int gravity = 2;
int caveX = 0;
boolean right = false;
boolean left = false;
cube player = new cube();
coin gold = new coin();
bat batman = new bat();
spike spikey = new spike();
health healthpack = new health();
int gameState = 1;
void setup() {
  frameRate(60);
  size(600,600);  
  bat = loadImage("bat down.png");
  ninja = loadImage("ninja remasteredx.png");
  cave = loadImage("full cave.png");
  coinGold = loadImage("coin.png");
  death = loadImage("death .png");
  spikes = loadImage("spikes.png");
  hp = loadImage("health.png");
  star= loadImage("shuriken.png");
  bat2 = loadImage("Untitled-1.png");
  
}  

void draw() {
  
  if (gameState == 2) {
    for (int i = 0; i < 100000; i += 600) {
      image(cave,caveX+ i,0);
    }
    spikey.show();
    spikey.gravity();
    fill(0);
    rect(300,20,100,20);
    fill(200,56,108);
    rect(300,20,player.health,20);
    if (left == true) {
    image(star,player.starX-40,player.starY,50,50);
    }
    if (right == true) {
    image(star,player.starX+40,player.starY,50,50);
    }
    player.starX = player.x;
    player.starY = player.y;
    batman.show();
    batman.show2();
    batman.move();
    healthpack.move();
    healthpack.show();
    caveX -= 1;
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
      player.xSpeed -= 0.05;
    } else if (player.ySpeed <= 0) {
      player.xSpeed += 0.05;
    } 
     if (player.health <= 0) {
      gameState = 3;
      
    } 
  } else if (gameState == 1) {
      background(100);
      fill(232, 206, 9);
      
      textSize(50);
      text("Ninja Jump",170,100);
      textSize(30);
      text("START",250,240);
      text("CONTROLS",250,300);
      if (mouseX > 240 && mouseX < 350 && mouseY > 210 && mouseY < 250) {
        //rect(240,210,110,40);
        fill(255);
        text("START",250,240);
        if (mousePressed) {
          gameState = 2;
        }  
      } 
      if (mouseX > 240 && mouseX < 350 && mouseY > 260 && mouseY < 310) {
        
        fill(255);
        text("CONTROLS",250,300);
        if (mousePressed) {
          gameState = 4;
        }  
      } 
  }  else if (gameState == 3) {
    background(200,56,108);  
    fill(0);
    textSize(60);
    text("GAME OVER",150,100);
    textSize(40);
    text(player.score,290,350);
    textSize(30);
    text("RESTART",250,240);
    image(death, 40,40);
      if (mouseX > 240 && mouseX < 350 && mouseY > 210 && mouseY < 250) {
        //rect(240,210,110,40);
        fill(255);
        text("RESTART",250,240);
        if (mousePressed) {
          gameState = 1;
          player.score = 0;
        }  
      } 
      player.health = 100;
      
  } 
  else if (gameState == 4) {
      background(100);
      fill(232, 206, 9);
      textSize(15);
      text("CONTROLS: ARROW KEYS TO MOVE",40,40);
      text("HEALTH: START WITH 100 HEALTH",40,80);
      text("BATS: -30 HEALTH, SPIKES: -50 HEALTH",40,120);
      image(bat,350,120); image(spikes,380,120);
      text("COLLECT COINS AND AVOID TRAPS", 40, 160);
      text("COLLECT HEARTS TO GAIN BACK HEALTH", 40, 200);
      text("BACK",250,220);
      if (mouseX > 240 && mouseX < 350 && mouseY > 210 && mouseY < 250) {
        //rect(240,210,110,40);
        fill(255);
        text("BACK",250,240);
        if (mousePressed) {
          gameState = 1;
        }  
      } 
  }  
}

void keyPressed() {
  player.xSpeed = 0;
  if (keyCode == UP) {
    player.jump();
  }  
  if (keyCode == RIGHT) {
    player.moveRight();
    player.jump();
    right = true;
    left = false;
    
  } 
  if (keyCode == LEFT) {
    player.moveLeft();
    player.jump();
    right = false;
    left = true;
    
  }  
  if (keyCode == CONTROL) {
   
      
    
  }  
}  


class cube {
  public int x = 300;
  public int y = 0;
  public int xSpeed = 0;
  public int ySpeed = 0;
  public int score = 0;
  public int health = 100;
  public int starX = x+10;
  public int starY = y;
    void jump(){
     ySpeed=-20; 
    }
    void gravity(){
     if (y < height - 100) {
       ySpeed+=2; //above 2 is too difficult to play... for noobs
     } else {
       ySpeed*=-1;  
     }  
     x = constrain(x,0,width-50);
     y = constrain(y,0,height);
     
    }
    void moveRight(){
     xSpeed += 10;
    }
    void moveLeft() {
     xSpeed -= 10;
    }  
  
  void update() {
    x += xSpeed;
    y += ySpeed;
    
  }  
  
  void show() {
    fill(200,20,20);
    noStroke();
    image(ninja,x,y,50,50);
    
    
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
      image(coinGold,coinX,coinY,100,100);
  }  
  
}  

class bat {
  float batX=450;
  float batY=random(50,350);
  float batX2=450;
  float batY2=random(50,350);
  void show() {
    if (player.x > batX - 40 && player.x < batX + 40 && player.y > batY - 40 && player.y < batY +40) {
      
      
      player.health -= 15;
      batX = 2000;
      batY = random(50,height-150);
      println("TOUCHED");
    }
    if (player.starX + 40 > batX - 40 && player.starX +40 < batX + 40 && player.starY > batY - 40 && player.starY < batY +40 || player.starX - 40 > batX + 40 && player.starX - 40 < batX + 40 && player.starY> batY - 40 && player.starY < batY +40) {
      
      batX = 3000;
      batY = random(50,height-150);
      println("TOUCHED");
    }
      
      image(bat,batX,batY,75,75);
      
  }  
    void show2() {
    if (player.x > batX2 - 40 && player.x < batX2 + 40 && player.y > batY2 - 40 && player.y < batY2 +40) {
      
      
      player.health -= 15;
      batX2 = 2000;
      batY2 = random(50,height-150);
      println("TOUCHED");
    }
    if (player.starX + 40 > batX2 - 40 && player.starX +40 < batX2 + 40 && player.starY > batY2 - 40 && player.starY < batY2 +40 || player.starX - 40 > batX2 + 40 && player.starX - 40 < batX2 + 40 && player.starY> batY2 - 40 && player.starY < batY +40) {
      
      batX2 = 3000;
      batY2 = random(50,height-150);
      println("TOUCHED");
    }
      
      image(bat2,batX2,batY2,75,75);
      
  }
  void move() {
    batX -= 3+(player.score/10);  
    if (batX < 0) {
      batX += 550;
      batY = random(50,height-150);
      
    }  
    batX2 -= 3+(player.score/10);
    if (batX2 < 0) {
      batX2 += 550;
      batY2 = random(50,height-150);
    }  
  }
}  

class spike {
  float spikeX=random(50,350);
  float spikeY=-50;
  
  public int xSpikeSpeed = 0;
  public int ySpikeSpeed = 0;
  void show() {
    
    if (player.x > spikeX + 65 && player.x < spikeX + 95 && player.y > spikeY +30 && player.y < spikeY +140) {
      
      
      player.health -= 40;
      spikeY = -50;
      spikeX = random(50,width-150);
      println("TOUCHED");
    }
      fill(232, 206, 9);
      image(spikes,spikeX,spikeY,200,200);
  }  
  
  void gravity(){     
     ySpikeSpeed+=1+(player.score/10);
     if (ySpikeSpeed >= 10) {
       ySpikeSpeed = 10;  
     }  
    if (spikeY > 500) {
      spikeY -= 550;
      spikeX = random(50,height-150);
      ySpikeSpeed = 0;
    } 
    spikeY += ySpikeSpeed;
  }
  
}  
class health {
  float hpX=450;
  float hpY=random(50,350);
  
  void show() {
    
    if (player.starX + 40 > hpX - 40 && player.starX +40 < hpX + 40 && player.starY > hpY - 40 && player.starY < hpY +40 || player.starX - 40 > hpX + 40 && player.starX - 40 < hpX + 40 && player.starY> hpY - 40 && player.starY < hpY +40) {
      
      hpX +=3;
      println("TOUCHED");
    }
    if (player.x > hpX - 40 && player.x < hpX + 40 && player.y > hpY - 40 && player.y < hpY +40) {
      
      
      player.health += 100-player.health;
      hpX = 5000;
      hpY = random(50,height-150);
      println("TOUCHED");
    }
      fill(232, 206, 9);
      image(hp,hpX,hpY,100,100);
  }  
  void move() {
    hpX -= 3;  
    if (hpX < 0) {
      hpX += 4050;
      hpY = random(50,height-150);
      
    }  
  }
}  
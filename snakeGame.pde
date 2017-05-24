snake snak = new snake();

int scl = 10;
float food = random(width/scl);
void setup() {
  size(600,600);  
  
}  

void newLocation() {
   frameRate(30);
   fill(30,100,70);
   stroke(30,100,70);
   rect(food,food,scl,scl); 
}  

void draw() {
  
  
  snak.update();
  snak.show();
}

void keyPressed() {
  if (keyCode == UP) {
    snak.direction(0,-1);
  }  
  else if (keyCode == DOWN) {
    snak.direction(0,1);
  } 
  else if (keyCode == RIGHT) {
    snak.direction(1,0);
  } 
  else if (keyCode == LEFT) {
    snak.direction(-1,0);
  } 
  
  
}  


class snake {
  public int snakeX = 0;
  public int snakeY = 0;
  public int snakeXSpeed = 0;
  public int snakeYSpeed = 0;
  
  
  void update() {
    snakeX = snakeX + snakeXSpeed * scl;
    snakeY = snakeY + snakeYSpeed * scl;
    
    snakeX = constrain(snakeX,0,width-scl);
    snakeY = constrain(snakeY,0,height-scl);
    
    if ((snakeX >= food && snakeY >= food && snakeX <= food +scl && snakeY <= food +scl) || snakeX < 10) {
      newLocation();  
    }  
  }  
  
  void direction(int x,int y) {
      snakeXSpeed = x;
      snakeYSpeed = y;
  
  }  
  
  void show() {
    rect(snakeX,snakeY,scl,scl);  
  }  
  
}  
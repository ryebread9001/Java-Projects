rain[] drop = new rain[1000];

void setup() {
  for (int i = 0; i < drop.length; i++) {
    drop[i] = new rain();
  }  
  size(500,500);
  
}

void draw() {
  background(254,200,240);
  
  for (int i = 0; i < drop.length; i++) {
    if (drop[i].distance >2.5) {
      drop[i].show(6);
    }  
    drop[i].move();
    
    drop[i].show(5);
  }
  
} 

class rain {
  float xpos = random(0,500);
  float ypos = random(-500, 0);
  float yspeed= random(2,3);
  float distance = yspeed;
  void move() {
    
    ypos += yspeed;
    yspeed += 0.01;
    if (ypos > 500) {
      ypos -= 510;
      yspeed = random(2,3);
    }
    
  }
  
  void show(int stroke) {
      strokeWeight(stroke);
      stroke(150,100,140);
      line(xpos,ypos,xpos,ypos+10); 
  }
  
  
}  
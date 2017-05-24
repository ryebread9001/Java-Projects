void setup() {
  
  size(700,700);  
}  

void draw() {
  if (mousePressed) {
    int i;
    for(i = 0; i< 10; i += 5) {
     line(pmouseX,pmouseY+=i,mouseX,mouseY+=i);  
      
    }
    
  }  
  
}  
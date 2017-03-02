float x = 0;
float y = 0;
float diameter = 0;
float speed = 10;
float rcolor = 0;
float gcolor = 0;
float bcolor = 0;
int howMany = 2;
float rotAngle = 0;
float gravity = 1;
float linestartx = 0;
float linestarty = 0;
float setxspeed = 0;
float setyspeed = 0;
float diametermagnitudes = 0;
float distancebetweencircles = 0;
float linedistance = 0;
Circles[] circles = new Circles[howMany];


void setup(){
  size(1000,1000);

  //noStroke();
  
  for (int i = 0; i<circles.length; i++){
    circles[i] = new Circles(random(100,width-100),random(100,height-100),random(200.500), random(-10,10), random(-10,10), random(255),random(255),random(255), gravity);
  }
  
}

void draw(){
  
  background(255);
  for (int i = 0; i < circles.length; i++) {

    circles[i].display();
    
    for (int j = 0; j < circles.length; j++){
      if (i!=j){
        circles[i].colliding(circles[j]);
      }
    }
    
    
    circles[i].speed();
    circles[i].gravity();
    circles[i].update();
   

  }
  
  if (linestartx != 0 && linestarty != 0){
    line(linestartx,linestarty, mouseX,mouseY);
    //have to add arrow to line
    //or add rotation with a rect box
    
  //  pushMatrix();
  //    rotate(atan2(mouseY-linestarty, mouseX-linestartx));
  //    translate(mouseX, mouseY);
  //    line(0, 0, -10, -10);
  //    line(0, 0, 10, -10);
  //  popMatrix();
  }
    
    
}

class Circles {
  
  float x,y,diameter,xspeed,yspeed,rcolor,gcolor,bcolor;
  
  Circles(float _x, float _y, float _diameter, float _xspeed,float _yspeed, float _rcolor, float _gcolor, float _bcolor, float _gravity){
    x = _x;
    y = _y;
    diameter = _diameter;
    xspeed = _xspeed;
    yspeed = _yspeed;
    rcolor = _rcolor;
    gcolor = _gcolor;
    bcolor = _bcolor;
    gravity = _gravity;
  }
  
  void colliding(Circles other){
    
    distancebetweencircles = sqrt((x-other.x)*(x-other.x)+(y-other.y)*(y-other.y));
    //diametermagnitudes = sqrt((other.diameter-diameter)*(other.diameter-diameter));
    if (distancebetweencircles < ((other.diameter/2)+(diameter/2))){
      
      xspeed = -xspeed;
      yspeed = -yspeed;
      
    //  if (diameter > other.diameter){
    //    xspeed = -xspeed*((diameter-other.diameter)/diametermagnitudes);
    //    yspeed = -yspeed*((diameter-other.diameter)/diametermagnitudes);
    //  }
    //  if (diameter < other.diameter){
    //    xspeed = -xspeed*((other.diameter-diameter)/diametermagnitudes);
    //    yspeed = -yspeed*((other.diameter-diameter)/diametermagnitudes);
    //  }
    }
  }
  
  void update() {
    if (x > width-diameter/2){
      xspeed = -xspeed;
      x = (width-diameter/2);
    }
    if (x<diameter/2){
      xspeed = -xspeed;
      x = (diameter/2);
    }
    
    if (y > height-diameter/2){
      yspeed = -yspeed;
      y = (height-diameter/2);
    }
    if (y < diameter/2){
      yspeed = -yspeed;
      y = (diameter/2);
    }
    
  }
  
  void speed() {
  
    x = x + xspeed;
    y = y + yspeed;
    
  }
  
  void gravity(){
    
      yspeed = yspeed * 0.99 + gravity * .1;
      xspeed = xspeed * 0.99;
    
  
  }
  

  
  void display(){
    fill(rcolor,gcolor,bcolor);
    ellipse(x,y,diameter,diameter);
  }
}


void mousePressed() {
  if (linestartx == 0){
    linestartx = mouseX;
  }
  if (linestarty == 0){
    linestarty = mouseY;
  }
}


void mouseReleased() {

  linedistance = sqrt((linestartx-mouseX)*(linestartx-mouseX)+(linestarty-mouseY)*(linestarty-mouseY));
  setxspeed = (linedistance/10)*(mouseX-linestartx)/linedistance;
  setyspeed = (linedistance/10)*(mouseY-linestarty)/linedistance;
  
  Circles mousecircle = new Circles(mouseX, mouseY, random(200.500), setxspeed, setyspeed, random(255),random(255),random(255), gravity);
  circles = (Circles[]) append(circles,mousecircle);
  
  linestartx = 0;
  linestarty = 0;
 
}
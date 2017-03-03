float x = random(1000);
float y = random(1000);
float yspeeddummy = 0;
float xspeeddummy = 0;
float accelerationy = -.1;
float accelerationx = -.2;
float xspeed = 50;
float yspeed = 50;
float r = random(255);
float g = random(255);
float b = random(255);
float a = random(255);

void setup() {
  size(1000, 1000);
  background(255);
  frameRate(120);
}

void draw() {
  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;

  // Remember, || means "or."
  if ((x >= width) || (x <= 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xspeeddummy = xspeed;
    xspeed = xspeed * (-1);
    //if (xspeed == 0){
    //  xspeed = xspeeddummy*-1;
    //}
    r = r+x/100;
    g = g+2*x/100;
    b = b+3*x/100;
    a = random(255);
  }
  
  if ((y >= height) || (y <= 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    yspeeddummy = yspeed;
    yspeed = yspeed * (-1);
    //if (yspeed == 0){
    //  yspeed = yspeeddummy*-1;
    //}
    r = r+3*y/100;
    g = g+2*y/100;
    b = b+y/100;
    a = random(255);
  }
  

    if (r>255){
      r = 0;
    }
    if (g>255){
      g = 0;
    }
    if (b>255){
      b = 0;
    }

    
  // Display circle at x location
  stroke(r,g,b,a);
  fill(r,g,b,a);
  ellipse(x,y,32,32);
  
  yspeed = yspeed - accelerationy;
  xspeed = xspeed - accelerationx;
  
}
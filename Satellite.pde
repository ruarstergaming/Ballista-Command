class Satellite{
  float x,y;
  float velocity;

  //Basic Constructor
  Satellite(){
    this.x = 0;
    this.y = random(40, height/2);
    this.velocity = random(2,5);
  }
  
  //Move the satellite across the screen
  void update(){
    this.x += this.velocity;
  }
  
  //Draw a small ellispse across the screen
  void draw(){
      fill(100, 100, 255);
      ellipse(this.x, this.y, 20, 10);
  }
  
  //Check if the satellite is onscreen
  boolean isOffScreen(){
    return (this.x > width);
  }
}

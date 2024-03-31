class City {
  float x, y;     //City position
  int health;     //City health
  float barWidth; //Width of the health bar

  //Basic Constructor
  City(float x, float y) {
    this.x = x;
    this.y = y;
    this.health = 100;
    this.barWidth = 40;
  }
  
  //Render the city
  void draw() {
    
    //If its destroyed colour it red, if not, colour it purple
    if(this.isDestroyed()) fill(255, 0, 0);
    else  fill(70, 0, 200);
    
    //Draw the city
    rect(this.x, this.y, 40, 20);
    
    //Draw the health bar
    float barHeight = 5;
    float remainingWidth = map(this.health, 0, 100, 0, this.barWidth);
    noStroke();
    fill(255, 0, 0);
    rect(this.x - this.barWidth + 80 / 2, y + 30, this.barWidth, barHeight);
    fill(0, 255, 0);
    
    //If its not destroyed draw the remaining health on top of the bar
    if(!this.isDestroyed()) rect(this.x - this.barWidth + 80 / 2, y + 30, remainingWidth, barHeight);
    
    fill(255);
  }

  //Reduce the health with the current multiplier
  void takeDamage(int damageMultiplier) {
    this.health -= 10*damageMultiplier;
  }

  //Check if the city is out of health
  boolean isDestroyed() {
    return health <= 0;
  }
  
}

class Bomb {
  float x, y;       //Bomb position
  float angle;      //Bomb angle
  float velocity;   //Bomb velocity
  float gravity;    //Gravity effect
  float drag;       //Drag effect

  //Simple constructor
  Bomb(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.velocity = 50;
    this.gravity = 0.9;
    this.drag = 0.06;
  }
  
  //Update the bombs position, velocity, drag, ect.
  void update(boolean exploded) {
    if(!exploded) {

      float vx = cos(angle) * this.velocity;
      float vy = sin(angle) * this.velocity;

      // Apply gravity
      vy += this.gravity;

      //Apply drag
      vx *= (1 - this.drag);
      vy *= (1 - this.drag); 

      this.x += vx;
      this.y += vy;
      this.velocity = dist(0, 0, vx, vy);  //Update velocity
    }
  }

  //
  void draw(boolean exploded) {
    if(!exploded) {  
      ellipse(this.x, this.y, 20, 20);
    }
  }

  boolean isOffscreen() {
    return (this.x < 0 || this.x > width || this.y > height);
  }
  
  void explode() {
    //Simulate explosion effect 
    fill(232, 91, 2);
    circle(this.x, this.y, 80);
  }
  
  //Check the distance between this and a given meteor
  boolean collidesMeteor(Meteor meteor) {
    return dist(this.x, this.y, meteor.x, meteor.y) <= 75;
  }
  
  //Check the distance between this and a given satellite
  boolean collidesSatellite(Satellite satellite) {
    return dist(this.x, this.y, satellite.x, satellite.y) <= 75;
  }
  
}

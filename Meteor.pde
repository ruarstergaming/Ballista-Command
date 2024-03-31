class Meteor {
  float x, y;          //Meteor position
  float velocity;      //Meteor velocity
  float gravity;       //Gravity effect
  float drag;          //Drag effect
  
  //basic constructor randomises elements
  Meteor(int difficultyMultiplier) {
    this.x = random(width);
    this.y = 0;
    this.velocity = random(3, 8) * difficultyMultiplier;
    this.gravity = 0.1;
    this.drag = 0.07;
  }

  //Update the velocity, add drag, calculate new position.
  void update() {
      float vy = this.velocity;

      //Apply gravity
      vy += this.gravity;

      //Apply drag
      vy *= (1 - this.drag);

      this.y += vy;

      //Update velocity
      this.velocity = vy;
  }

  //draw the meteor at the current position
  void draw() {
      fill(150);
      ellipse(this.x, this.y, 20, 20);
  }

  //Returns if the meteor hits the ground
  boolean isOffscreen() {
    return (this.y > height-45);
  }
}

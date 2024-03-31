class Effect {
  float x, y;      //Position of the effect
  String text;     //Text of the effect
  int lifespan;    //Lifespan of the effect
  int fadeSpeed;   //Fade speed of the effect

  //Basic Constructor
  Effect(float x, float y, String text) {
    this.x = x;
    this.y = y;
    this.text = text;
    this.lifespan = 60;    //Lifespan of 60 frames
    this.fadeSpeed = 2;    //Fade speed of 2 per frame
  }

  //Reduce the lifespan and move the effect 1 upwards
  void update() {
    this.lifespan--;
    this.y -= 1; //Move the effect upwards
  }

  //Display the text with a constantly fading opacity
  void display() {
    fill(255, this.lifespan * this.fadeSpeed);
    textSize(20);
    textAlign(CENTER);
    text(this.text, this.x, this.y);
  }
  
  //If the effect is finished
  boolean isFinished() {
    return this.lifespan <= 0;
  }
}


class Turret{
  float x, y;       //Turret position
  float angle;      //Turret angle
  boolean shooting; //Flag to check if shooting
  int ammo;         //Counter for the amount of bombs a turret can fire
 
  //Basic constructor
  Turret(int x, int y){
    this.x = x;
    this.y = y;
    this.angle = 0;
    this.shooting = false;
    this.ammo = 10;
  }
    
    //Update the turrets angle and shoot a new bomb if needed
    void update() {
    //Update turret angle based on mouse position
    float dx = mouseX - this.x;
    float dy = mouseY - this.y;
    angle = atan2(dy, dx);

    //If the shooting flag is on shoot a bomb
    if (shooting) {
      bombs.add(new Bomb(x, y, angle));
      this.shooting = false;
      this.ammo--;
    }
  }

  void draw(){
    
    //Draw the turret itself
    pushMatrix();
    translate(this.x, this.y);
    stroke(255);
    rotate(angle);
    circle(-10, 0, 30);
    rect(-20, -10, 40, 20);
    popMatrix();
    
    
    //Draw the ammo count
    fill(0); 
    textSize(10);
    textAlign(CENTER);
    textFont(monocraft);
    text(this.ammo, this.x, this.y + 50);
    
    stroke(255);
    fill(255); 
  }
  
  void drawSelected(){
    
    //Draw the turret itself but blue
    pushMatrix();
    translate(this.x, this.y);
    stroke(0, 0, 255);
    fill(0, 0, 255);
    rotate(this.angle);
    circle(-10, 0, 30);
    rect(-20, -10, 40, 20);
    popMatrix();
    stroke(255);
    fill(255);
    
    //Draw the ammo count
    fill(0); 
    textSize(10);
    textAlign(CENTER);
    textFont(monocraft);
    text(this.ammo, this.x, this.y + 50);
    
    stroke(255);
    fill(255); 
  }
  
  //Set the shooting flag to true
  void startShooting() {
      this.shooting = true;
  }
}

class Car {  
  //Bil - indeholder position & hastighed & "tegning"
  PVector pos = new PVector(60, 232);
  PVector vel = new PVector(0, 2);
  
  void turnCar(float turnAngle){
    vel.rotate(turnAngle);
  }

  void displayCar() {
    stroke(100);
    fill(100);
    ellipse(pos.x, pos.y, 10, 10);
  }
  
  void displayCar(int index) {
    displayCar();
    textSize(8);
    textAlign(CENTER);
    text(index, pos.x, pos.y);
  }
  
  void update() {
    pos.add(vel);
  }
  
}

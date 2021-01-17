class CarController {
  //Forbinder - Sensorer & Hjerne & Bil
  float varians             = 2; //hvor stor er variansen på de tilfældige vægte og bias
  Car bil                    = new Car();
  NeuralNetwork hjerne;   // Now handled in constructor
  SensorSystem  sensorSystem = new SensorSystem();
  
  // For creating completely new 
  CarController() {
    hjerne = new NeuralNetwork(varians);
  }
  
  // For creating new generations
  CarController (DNA genes) {
    hjerne = new NeuralNetwork(genes);
  }
      
  void update() {
    //1.)opdtarer bil 
    bil.update();
    //2.)opdaterer sensorer    
    sensorSystem.updateSensorsignals(bil.pos, bil.vel);
    //3.)hjernen beregner hvor meget der skal drejes
    float turnAngle = 0;
    float x1 = (float)int(sensorSystem.leftSensorSignal);
    float x2 = (float)int(sensorSystem.frontSensorSignal);
    float x3 = (float)int(sensorSystem.rightSensorSignal);    
    turnAngle = hjerne.getOutput(x1, x2, x3);    
    //4.)bilen drejes
    bil.turnCar(turnAngle);
  }
  
  void display(){
    bil.displayCar();
    sensorSystem.displaySensors();
  }
  
  void display(int index) {
    bil.displayCar(index);
    sensorSystem.displaySensors();
  }
}

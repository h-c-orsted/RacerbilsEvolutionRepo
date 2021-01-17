class CarSystem {
  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser
  
  ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();

  CarSystem(int populationSize) {
    for (int i=0; i<populationSize; i++) { 
      CarController controller = new CarController();
      CarControllerList.add(controller);
    }
  }

  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner
    for (CarController controller : CarControllerList) {
      controller.update();
    }

    //2.) Tegner tilsidst - så sensorer kun ser banen og ikke andre biler!
    for (CarController controller : CarControllerList) {
      controller.display();
    }
  }
  
  
  // Display function when the model is stopped
  void display() {
    for (CarController controller : CarControllerList) {
      controller.display();
    }
  }
  
  
  
  void meiose() {
  // Build mating pool
  ArrayList<DNA> matingPool = new ArrayList<DNA>();

  for (int i=0; i<carSystem.CarControllerList.size(); i++) {          // Each car
    NeuralNetwork n = carSystem.CarControllerList.get(i).hjerne;
    SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
    DNA genes = new DNA(n.weights, n.biases);
    
    int fitness;
    if (s.lapTimeInFrames < 400) {
      fitness = int(10000 - s.lapTimeInFrames);
    } else {
      fitness = 0;
    }
    println(fitness);

    // Add each gene set n times according to its fitness score.
    for (int j=0; j<fitness; j++) {
      matingPool.add(genes);
    }
  }


  // Reproduction
  carSystem.CarControllerList = new ArrayList<CarController>();
  for (int i=0; i<populationSize; i++) {
    int a = int(random(matingPool.size()));
    int b = int(random(matingPool.size()));
    DNA partnerA = matingPool.get(a);
    DNA partnerB = matingPool.get(b);
    DNA child = partnerA.crossover(partnerB);
    child.mutate(mutationRate);
    
    carSystem.CarControllerList.add(new CarController(child));
  }
  countGenerations++;
  println("Generation #" + countGenerations);
}


}

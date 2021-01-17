class DNA {
  float[] weights = new float[8];
  float[] biases = new float[3];
  
  DNA() {
    
  }
  
  DNA(float[] weights, float[] biases) {
    this.weights = weights; 
    this.biases = biases;
  }
  
  
  DNA crossover(DNA partner) {
    DNA child = new DNA();
    
    int midpointWeights = int(random(weights.length));
    for (int i=0; i<weights.length; i++) {
      if (i<midpointWeights) {
        child.weights[i] = weights[i];
      } else {
        child.weights[i] = partner.weights[i];
      }
    }
    
    int midpointBiases = int(random(biases.length));
    for (int i=0; i<biases.length; i++) {
      if (i<midpointBiases) {
        child.biases[i] = biases[i];
      } else {
        child.biases[i] = partner.biases[i];
      }
    }

    return child;
  }
  
  
  
  void mutate(float mutationRate) {
    for (int i=0; i<weights.length; i++) {
      if (random(1) < mutationRate) {
        weights[i] += 0.001 * (random(1) < 0.5 ? (-1) : 1);
      }
    }
    for (int i=0; i<biases.length; i++) {
      if (random(1) < mutationRate) {
        biases[i] += 0.001 * (random(1) < 0.5 ? (-1) : 1);
      }
    }
  }
  
  
}

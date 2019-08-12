import peasy.PeasyCam;
PeasyCam cam;
ArrayList<Particle> particle = new ArrayList();
//how many points in the array
int numOfLines = 200;
//not yet used
  //float phiA = (sqrt(5)+1)/2;
  //float phiB = (sqrt(5)-1)/2;
  //float time = 0;

void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 400);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2500);
  for (int i = 0; i < numOfLines; ++i) {
  Particle tempP = new Particle();
  particle.add(tempP);
  }
}

void draw() {
  background(123);
  strokeWeight(2);
  int s = particle.size();
  for (int i = 0; i < s; i++) {
  particle.get(i).update();
  //lines.update();
  }
  if (record) {
    beginRaw(DXF, "output-#####.dxf"); // Start recording to the file
  }
  noFill();
  beginShape();
  //loop over the particles in the array -1 
  for(int i = 0; i < particle.size()-1;i++){
      //gets the location of verts
    PVector p = particle.get(i).location[i];
    //draw the curve
    curveVertex(p.x, p.y, p.z);   
    //loops over at teh notmal postition in the array but doesnt draw anything 
    for(int j = 0; j < particle.size();j++){
        //gets the location of verts
      PVector q = particle.get(j).location[j];
      rotate(PI);
      //create new PVectors for each location - 
      //I think this is just each point in the line, so not cross-referencing all the points?
      PVector a = particle.get(i).location[i];
      PVector b = particle.get(j).location[j];
      //is this a thing?
      float d = PVector.dist(a,b);
      }
  }

  endShape();
    
  if (record) {
    endRaw();
    record = false; // Stop recording to the file
  }
  time += 0.01;
}


void mousePressed() {
  //not used
}
void keyPressed() {
  if (key == 'R' || key == 'r') { // Press R to save the file
    record = true;
  }
}

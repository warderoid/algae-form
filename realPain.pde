import peasy.PeasyCam;
PeasyCam cam;
PGraphics pg;
ArrayList<Particle> particle = new ArrayList();
int numOfLines = 200;
float phiA = (sqrt(5)+1)/2;
float phiB = (sqrt(5)-1)/2;

float time = 0;

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
      for(int i = 0; i < particle.size();i++){
          PVector p = particle.get(i).location[i];
          curveVertex(p.x, p.y, p.z);   
         for(int j = 0; j < particle.size()-1;j++){
    
          PVector q = particle.get(j).location[j];
         rotate(PI);
         PVector a = particle.get(i).location[i];
         PVector b = particle.get(j).location[j];
         //float d = particle.get(i).location[i].dist(particle.get(j).location[j]);
         float d = PVector.dist(a,b);
        //  curveVertex(p.x, p.y, p.z);
        // curveVertex(q.x, q.y, q.z);

        //println("d: "+d);
        // if(d<= 16){
        //   p.x = p.x*-1;
        //   p.y =p.y *-1;
        //   }
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
}
void keyPressed() {
if (key == 'R' || key == 'r') { // Press R to save the file
record = true;
}
}

boolean record;
import processing.dxf.*;
class Particle {

//create PVectors
PVector[] location= new PVector[numOfLines];
PVector[] velocity= new PVector[numOfLines];

Particle() {

    //create points at 0,0,0
    for (int i = 0; i < numOfLines; ++i) {
        float x = (i*2)*sin(i/5.0);
        float y = (i*2)*cos(i/5.0);
        float z = 0;
        location[i] = new PVector(x,y,z);
    }
    //  create velocities for each point
    for (int i = 0; i < numOfLines; ++i) {
        float x = random(-0.05,0.05);
        float y = random(-0.05,0.05);
        float z = random(-0.05,0.05);
        velocity[i] = new PVector(x, y,z);
    }

}

void update() {
    //add the velocity to each point every frame
    for (int i = 0; i < numOfLines; ++i) {
        location[i].x = location[i].x += velocity[i].x;
        location[i].y = location[i].y += velocity[i].y;
        location[i].z = location[i].z += velocity[i].z;
        float x = location[i].x;
        float y = location[i].y;
        float z = location[i].z;
    }
        
    draw();
}

void draw(){
    //add a random value to the velocity each frame
    // for (int i = 0; i < numOfLines; ++i) {
    //     float x = random(-0.05,0.05);
    //     float y = random(-0.05,0.05);
    //     float z = random(-0.05,0.05);
    //     velocity[i].x = velocity[i].x += x *0.01;
    //     velocity[i].y = velocity[i].y += y *0.01;
    //     velocity[i].z = velocity[i].z += z *0.1;
    // }

}
 
}

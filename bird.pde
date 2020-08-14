


class Bird{
  
  //========data members of the bird last==========
  PVector pos;
  PVector vel;
  PVector acc;
  float r=16;
 
  //==========constructor===============
  Bird(){
    pos = new PVector(50, height/2);
    vel = new PVector(50,50);
    acc = new PVector();
    
  }
  
  void applyForce(PVector force){
    acc.add(force);//increment the acceleration
  }
  
  
  void update(){
    //for every frame
    applyForce(gravity); //The bird object is acted upon by a gravitational force that pulls it down
    pos.add(vel); //The position of the bird is incremented by the distance travelled per unit time
    vel.add(acc); //The velocity of the bird is incremented by the change of speed per unit tiime
    vel.limit(4); //The maximum speed of the bird is given a threshold of 4 ( Note here it is related to the pixels)
    acc.mult(0);
    
    if(pos.y>height)//if the bird tends to escape our screen
    {
      pos.y=height; //stop it at the edge
      vel.mult(0); //make velocity 0
    }
    
  }
  
  void show(){
    stroke(255); //outline of the bird object
    fill(255); //color of the bird object
    ellipse(pos.x, pos.y, r, r); //shape of the bird object
  }
}

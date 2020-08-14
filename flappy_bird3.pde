
PImage mountain; //declare an image object for the background

Bird b;//create an object b of class bird
int score=0; //initialize the score
PVector gravity = new PVector(0, 1);
ArrayList<Pipe> pipes=new ArrayList<Pipe>();//declare an array object of type pipe (for the pipes being generated sequentially in the game)

//this function run only once
void setup(){
  
  
  size(400,533); //create a canvas
  b=new Bird(); //initialize the bird object
  pipes.add(new Pipe());//add a pipe object to the list of pipes
  
}


void draw(){
  mountain=loadImage("mountain.jpg"); //fetch the mountain image using the relative path    
  
  background(mountain);//now we put our background image
  
  if(frameCount%75==0){
    pipes.add(new Pipe());
  }
  
  
  if(keyPressed){
    PVector up=new PVector(0, -5); //variable for displacement of bird object
    b.applyForce(up); //displace the bird object up by 5 pixels
  }
  
  b.update();
  b.show();
  boolean safe=true; //a true flag variable to indicate if our bird collided with the pipe
  for(int i=pipes.size()-1;i>=0;i--){
    Pipe p=pipes.get(i);
    p.update();
    
    if(p.hits(b))//if the bird collides with the pipe
    {
      p.show(true);
      safe=false;
    }else {
      p.show(false);
    }
    
    if(p.x < -p.w){
      pipes.remove(i);
    }
    
  }
    if (safe) // no collision
    {
      score++; //increment the score
    }
    else{
      score-=50;//decrement the score with a penalty of 50 
      }
    
    
    fill(0,0,0); //color of the text displaying the score
    textSize(30); //size of the text 
    textAlign(CENTER);
    text(score, width-80, 50); //display the score
    score=constrain(score,0,score);



}

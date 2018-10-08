class Square
{
  int xpos; 
  int ypos;
  int originX; 
  int originY;

  Square(int tempXpos, int tempYpos)
  {
    originX = tempXpos;
    originY = tempYpos;
    xpos = tempXpos;
    ypos = tempYpos;
  }
  
  void reset(){
    xpos = originX; 
    ypos = originY;
  }

  void update(int size, int seed, color terrain) //reminder, have two if statements. one with no seed and one without
  {
    int choice = seed;
    
    fill(terrain);

    if (choice == 0)
    {
      xpos+=size;
    } else if (choice == 1) 
    {
      xpos-=size;
    } else if (choice == 2) 
    {
      ypos+=size;
    } else if (choice == 3)
    {
      ypos-=size;
    }
  }

  void display(float r, int size)
  {
    rectMode(CENTER);
    rect(xpos*r, ypos*r, size, size);
  }
  
  void conSquares(float r, int size, color terrain)
  {
    fill(terrain);
    xpos = constrain(xpos, 220, 790);
    ypos = constrain(ypos, 10, 790);
  rectMode(CENTER);
  rect(xpos*r, ypos*r, size, size);
  }
}
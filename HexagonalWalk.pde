class Hex
{
float x;
float y;

Hex()
{
  x = width/2;
  y = height/2;
}

  void update()
  {
 int choice = int(random(5));
 
if (choice == 0)
 {
      x++;
    } 
    else if (choice == 1) 
    {
      x--;
    } 
    else if (choice == 2) 
    {
      y++;
    } 
    else 
    {
      y--;
    }
  }

  void Draw()
  {
drawHex(x, y, 5);
  }
  
  void drawHex(float x, float y, float radius)
  {
    pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    float angle = PI*i/3;
    vertex(cos(angle) * radius, sin(angle) * radius);
    popMatrix();
  }
  endShape(CLOSE);
  popMatrix();
}
}
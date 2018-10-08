import controlP5.*;
import java.util.Map;

//objects
ControlP5 cp5;
Square s;
DropdownList d1, d2;
Textlabel myTextlabelA;
Textlabel myTextlabelB;
Textlabel myTextlabelC;
Textlabel myTextlabelD;
PVector v1;
color c1 = color(160, 126, 84);
color c2 = color(143, 170, 64);
color c3 = color(134, 134, 134);
color c4 = color(255, 255, 255);

//start button
boolean displayWalk = false;
boolean Squares = false;

//toggle
boolean constrainSteps = false;
boolean useStroke = false;
boolean simulateTerrain = false;
boolean useRandomSeed = false;


//sliders
int maximumSteps = 100;
int stepCount = 1;
int count = 0;
int stepSize = 10;
int stepRate = 0;
float stepScale = 1.0;

//hash
HashMap<PVector, Integer> hm = new HashMap<PVector, Integer>();
int xLoc;
int yLoc;
int tr;

void setup() 
{
  size(800, 800);
  background(#63A7D1); 
  fill(0);
  rect(0, 0, 200, 800); 
  xLoc = width/2;
  yLoc = height/2;
  cp5 = new ControlP5(this);
  s = new Square(xLoc, yLoc);

  //PVector and hashmap
  v1 = new PVector(xLoc, yLoc);

  hm.put(v1, count);


  //Text Labels
  myTextlabelA = cp5.addTextlabel("A")
    .setText("Maximum Steps")
    .setPosition(10, 290)
    .setColorValue(255)
    ;
  myTextlabelA = cp5.addTextlabel("B")
    .setText("Step Rate")
    .setPosition(10, 340)
    .setColorValue(255)
    ;
  myTextlabelA = cp5.addTextlabel("C")
    .setText("Step Size")
    .setPosition(10, 390)
    .setColorValue(255)
    ;
  myTextlabelA = cp5.addTextlabel("D")
    .setText("Step Scale")
    .setPosition(10, 440)
    .setColorValue(255)
    ;

  //start button
  cp5.addButton("Start")
    .setPosition(10, 10)
    .setSize(70, 25)
    .setColorBackground(#59E03F);
  ;

  // DropdownList
  d1 = cp5.addDropdownList("")
    .setPosition(10, 50)
    ;
  customize(d1); // customize list

  //Toggle buttons
  cp5.addToggle("constrainSteps")
    .setPosition(10, 500)
    .setSize(20, 20)
    ;
  cp5.addToggle("simulateTerrain")
    .setPosition(10, 550)
    .setSize(20, 20)
    ;
  cp5.addToggle("useStroke")
    .setPosition(10, 600)
    .setSize(20, 20)
    ;
  cp5.addToggle("useRandomSeed")
    .setPosition(10, 650)
    .setSize(20, 20)
    ;

  //sliders
  cp5.addSlider("maximumSteps")
    .setPosition(10, 300)
    .setRange(100, 50000)
    .setSize(180, 20)
    .getCaptionLabel().setVisible(false)
    ;

  cp5.addSlider("stepRate")
    .setPosition(10, 350)
    .setRange(1, 1000)
    .setSize(180, 20)
    .getCaptionLabel().setVisible(false)
    ;
  cp5.addSlider("stepSize")
    .setPosition(10, 400)
    .setRange(10, 30)
    .setSize(90, 20)
    .getCaptionLabel().setVisible(false)
    ;

  cp5.addSlider("stepScale")
    .setPosition(10, 450)
    .setRange(1.0, 1.5)
    .setSize(90, 20)
    .getCaptionLabel().setVisible(false)
    ;

  //textfield
  cp5.addTextfield("seedValue")
    .setPosition(100, 650)
    .setSize(50, 20)
    .setFocus(true)
    .setColor(255)
    .setInputFilter(ControlP5.INTEGER)
    ;
}


void customize(DropdownList ddl) 
{
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(160));
  ddl.setItemHeight(30);
  ddl.setBarHeight(30);
  ddl.setWidth(160);
  ddl.addItem("Squares", 1);
  ddl.addItem("Hexagons", 1);
}



void keyPressed() 
{
  //
}

void draw() 
{
  if (displayWalk == true)
  {
    if (count <maximumSteps)
    {
      for (int i = 0; i <stepCount; i++)
      {
        for (int k = 1000; k <= stepRate; stepRate++)
          for (float j = 1.5; j <= stepScale; j++)
            for (int m = 30; m < stepSize; stepSize++)
              stepScale++;
        s.display(stepScale, stepSize);
        if (useRandomSeed == true)
        {
          // Textfield txt = ((Textfield)cp5.getController("seedValue"));
          //int seedM = Integer.parseInt(txt);
          // randomSeed(seedM);
          s.update(stepSize, int(random(4)), tr);
        } else
        {
          s.update(stepSize, int(random(4)), tr);
        }
        count +=stepCount;
      }
    }
    if (useStroke == true)
    {
      stroke(10);
    } else 
    {
      noStroke();
    }

    if (constrainSteps == true)
    {
      s.conSquares(stepScale, stepSize, tr);
    }
  }
  loop();
}

void controlEvent(ControlEvent theEvent) 
{
  if (theEvent.isFrom("Start"))
  {
    count = 0;
    stepCount = 1;
    displayWalk = true;

    background(#63A7D1);
    fill(0);
    rect(0, 0, 200, 800);
  }

  if (theEvent.isGroup())
  {
    //if(theEvent.group().equals(""))
    {
      //
    }
  }
}
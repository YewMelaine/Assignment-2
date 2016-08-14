import controlP5.*;

ControlP5 cp5;



boolean hot;

float x;
float y;
float easing = 0.03;
float snow;
float speed=0.3;

ColorPicker cp;

Knob myKnob;
int knobValue=150;

Textarea myTextarea;


boolean toggleValue = false;

void setup() {
  size(800, 500); 
  noStroke();  

  //ColorPicker,change color of background
   cp5 = new ControlP5(this);
  cp = cp5.addColorPicker("picker")
          .setPosition(60, 60)
          .setColorValue(color(255, 200, 200, 28))
          ;

 //Knob,change color of snowman
 myKnob = cp5.addKnob("knobValue")
               .setRange(0,255)
               .setValue(255)
               .setPosition(20,380)
               .setRadius(50)
               .setNumberOfTickMarks(10)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 260, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL)
               ;
               
ControlP5 cp5Checkbox;
CheckBox checkbox;
               
  //Text, add lyrics
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(300,430)
                  .setSize(450,70)
                  .setFont(createFont("arial",15))
                  .setLineHeight(15)
                  .setColor(color(128))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
;
myTextarea.setText(" Do you want to build a snowman?"
+"Come on lets go and play"
+"I never see you anymore"
+"It's like you've gone away..."
+"We used to be best buddies"
+"And now we're not"
+"I wish you would tell me why!"
+"Do you want to build a snowman?"
+"It doesn't have to be a snowman"

+"Do you want to build a snowman?"
+"Or ride our bikes around the halls"
+"I think some company is overdue"
+"I've started talking to"
+"the pictures on the walls"
+"(Hang in there, Joan!)"
+"It gets a little lonely"
+"All these empty rooms"
                    );
 //Toggle                   
cp5.addToggle("toggleValue")
     .setPosition(600,100)
     .setSize(50,20)              
     ;
//Checkbox     
  cp5Checkbox= new ControlP5(this);
  checkbox= cp5.addCheckBox("checkBox")
                .setPosition(580, 30)
                .setSize(30, 30)
                .setItemsPerRow(4)
                .setSpacingColumn(20)
                .addItem("0", 0)
                .addItem("70", 70)
                .addItem("140", 50)
                .addItem("210", 210)
      
                ;    
}


void draw() { 
  
  
  background(cp.getColorValue()); //background color
  
  //original code
/*if ((mouseX > 200) && (mouseX < 600) &&
    (mouseY > 150) && (mouseY < 450)) {
    background(99,252,167);//green
  } else {
    background(252,199,239);//pink
  }*/
  
  //change roof color
   pushMatrix();
  
  if(toggleValue==true) {
    fill(252,33,33);
  } else {
    fill(19,42,185);
  }
   triangle(400,50,100,220,700,220);
   fill(135,149,242);
   rect(150,220,500,200);
  
  
  popMatrix();
 

if ((keyPressed == true) && ((key == 'S') || (key == 's'))){ //when key 's' or 'S' is pressed it will show snow
  fill(255);
  ellipse(100,200,15,15);
  ellipse(450,100,10,10);
  ellipse(600,400,25,25);
  ellipse(350,300,18,18);
  ellipse(200,470,15,15);
  ellipse(550,500,20,20);
  ellipse(150,220,15,15);
  ellipse(250,330,14,14);
 ellipse(50,420,20,20);
  ellipse(720,330,18,18);
}

fill(255); //snow will start to fall
snow=snow+speed;
 fill(255);
  ellipse(100,snow+150,15,15); //each snow falling from different height
  ellipse(450,snow+100,10,10);
  ellipse(600,snow+70,25,25);
  ellipse(350,snow+120,18,18);
  ellipse(200,snow+20,15,15);
  ellipse(550,snow+20,20,20);
  ellipse(150,snow+80,15,15);
  ellipse(250,snow+30,14,14);
 ellipse(50,snow+10,20,20);
  ellipse(720,snow+39,18,18);

if(hot == true){ //showing text 'hot~~'
  textSize(42);
  fill(random(255),random(255),random(255));
  text("Hot~~",600,70);

}


  float ix = width - mouseX; // Inverse X
  float iy = height - mouseY; // Inverse Y
  float targetX = mouseX;  
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY; 
  float dy = targetY - y;
  y += dy * easing;
  if (mouseX < 400) {
  fill(knobValue);
  ellipse(x, y+80, 122, 122); //bottom
  ellipse(x, y, 82, 82); //top
  fill(117,211,149);// green eyes
  }else{
    fill(0);
  ellipse(x, y+80, 122, 122); //bottom
  ellipse(x, y, 82, 82); //top
  fill(255,0,0);//red eyes
  }
ellipse(x-15,y-5,15,15);//left eye
ellipse(x+15,y-5,15,15);//right eye
 
fill(255,198,10);//draw an orange hat
ellipse(ix,y-35,120,20);
rect(ix-27,y-75,56,35);

  if (mouseButton == LEFT) {//three buttons on snowman
    fill(247,232,110);
  ellipse(x,y+50,10,10);
  ellipse(x,y+68,10,10);
  ellipse(x,y+86,10,10);
}
if (mousePressed == true) {
    cursor(HAND); // Draw cursor as hand
  } else {
    cursor(CROSS);
}
}


void keyPressed(){ //when key 'UP' is pressed, the word'hot~~' will appear
  if(key == CODED){
    if (keyCode == UP){
      hot = true;
    }
    

  }
}


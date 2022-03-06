import java.awt.Rectangle;

String fileSource = "Intro_BG.png";
String fileimg1  = "Intro_texte_nobg.png";
String fileimg2  = "Intro_Titre_geo.png";
String fileimg3  = "Intro_titre_texte.png";
String fileimg4 = "Intro_titre_texte.png";
String fileName;
String filePrefix = "ghf2";
String fileExtension = ".png";
String[] words;
String generatedShape = "un cercle";


PFont font;
PFont infoFont;


PImage[] animation;
PImage shapeSelector;
PImage background;
PImage circleDoted;
PImage lineDoted;
PImage triangleDoted;
PImage squareDoted;
PImage pentagoneDoted;
PImage hexagoneDoted;
PImage heptagoneDoted;
PImage octogoneDoted;
PImage textOverlay;
PImage colorPickerOverlay;
PImage interfaceButtonLayer;
PImage curseurCrayon;
PImage curseurEfface;
PImage empty;
PImage imgSource;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;


float timeElapsed;
float timeDelay;
float timeFrame;
float fade=0.0;
float hue;
float[] positionX = {70.0f,70.0f,70.0f,70.0f,70.0f,70.0f,70.0f,70.0f,723,784,847,905,1047};
float[] positionY = {268.0f, 317.0f, 365.0f, 412.0f, 460.0f, 507.0f, 553.0f, 601.0f, 38,38,38,38,38};
float scaleVal=1;
float scaleIncrement=0.04;
float scaleMax = 1.15;
float scaleMin = 1;


int sliderPosY = 360;
int sectionActiveAtStartup = 1;
int sectionActive = sectionActiveAtStartup;
int saturation = 100;
int brightness= 100;
int count = 8;
int buttonWidth = 180;
int buttonHeight = 48;
int index = 0;
int counter = 0;
int challengeIndex;
int textSpotX = 735;
int textSpotY = 625;
int speedFull = 24;
int speedHalf = 12;
int animationFrameCount = 148;
int keyframe;
int infoButtonX, infoButtonY;  
int infoButtonSize = 60;   


final int CONTROL_BOUTON_FORME = 2;
final int CONTROL_BOUTON_ACTION = 1;


int[] type = {
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_FORME,
  CONTROL_BOUTON_ACTION,
  CONTROL_BOUTON_ACTION,
  CONTROL_BOUTON_ACTION,
  CONTROL_BOUTON_ACTION,
  CONTROL_BOUTON_ACTION}; 


boolean mediumPicker = true;
boolean[] stateActive   = {true,  true,  true,  true,  true,  true,  true,  true, true, true, true, true, true};
boolean[] stateOver     = {false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] statePress    = {false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] stateRelease  = {false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean[] stateSelected = {false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean direction;
boolean infoButtonOver = false;

Rectangle rect1, rect2, rect3, rect4, rect5, rect6, rect7, rect8, rect9, rect10, rect11, rect12, rect13;

color colorTransparent = color(1,1,1,0);
color colorSelected  = color(191,150,255,192);
color colorHover = color(191,150,255,128);
color lineColor = color(50,0,255);
color canvaColor = color(144,124,247);
color effaceColor = color(1,1,1,0);
color infoButtonColor, infoButtonBaseColor;
color infoButtonHighlight;



void setup() { 
  size(1280, 720);
  frameRate(25);
  font = createFont("Alvania.ttf", 16);
  infoFont = createFont("Belladonia.ttf", 60);  
  textFont(font);
  
  infoButtonColor = color(255);
  infoButtonHighlight = color(204);
  infoButtonBaseColor = color(102);
  infoButtonX = 500;
  infoButtonY = 105;
  ellipseMode(CENTER);

  background = loadImage("Interaface_Roboto_inactive.png"); 
  circleDoted = loadImage("circle.png");
  lineDoted = loadImage("line.png");
  triangleDoted = loadImage("triangle.png"); 
  squareDoted = loadImage("square.png");
  pentagoneDoted = loadImage("pentagone.png");
  hexagoneDoted = loadImage("hexagone.png");
  heptagoneDoted = loadImage("heptagone.png");
  octogoneDoted = loadImage("octogone.png");
  textOverlay = loadImage("textOverlay.png");
  colorPickerOverlay = loadImage("colorPickerOverlay.png"); 
  interfaceButtonLayer = loadImage("interfaceButtonLayer.png");
  curseurCrayon = loadImage("curseurCrayon.png");
  curseurEfface = loadImage("curseurEfface.png"); 
  empty = loadImage("empty.png");  
  shapeSelector = empty;
  imgSource = loadImage(fileSource);
  img1 = loadImage(fileimg1);
  img2 = loadImage(fileimg2);
  img3 = loadImage(fileimg3);
  img4 = loadImage(fileimg4);
  image(background, 0, 0);  
  
  rect1 = new Rectangle(70,268, buttonWidth, buttonHeight);
  rect2 = new Rectangle(70,317, buttonWidth, buttonHeight);
  rect3 = new Rectangle(70,365, buttonWidth, buttonHeight);
  rect4 = new Rectangle(70,412, buttonWidth, buttonHeight);
  rect5 = new Rectangle(70,460, buttonWidth, buttonHeight);
  rect6 = new Rectangle(70,507, buttonWidth, buttonHeight);
  rect7 = new Rectangle(70,553, buttonWidth, buttonHeight);
  rect8 = new Rectangle(70,601, buttonWidth, buttonHeight);
  rect9 = new Rectangle(723,38, 61, 35);
  rect10 = new Rectangle(784,38, 63, 35);  
  rect11 = new Rectangle(847,38, 59, 35); 
  rect12 = new Rectangle(907,38, 139, 35);
  rect13 = new Rectangle(1047,38, 90, 35);  
   

  challengeGenerator();
  direction = true;
  animation = new PImage[animationFrameCount];
  for (keyframe = 1; keyframe <= animationFrameCount; ++keyframe)
  {
    fileName = filePrefix + nf(keyframe, 5) + fileExtension;
    animation[keyframe - 1] = loadImage(fileName);
  }
  keyframe = 0;
  timeElapsed = 0.0f;
  timeDelay = 0.0f;
  timeFrame = 0.0f;
}



void draw()
{
  switch (sectionActive)
  {
    case 1:
     ChangeSystem();
     break;
     
    case 2:
      bg();
      break;
       
    case 3:
      Dessin();
      break;
   }
 }  



void bg()
 {
  image(background, 0, 0);
  timeDelay();
 }
   
   
   
void Dessin()
 {
  fonctionPalette(); 
  fonctionCouleur();
  fonctionDessin(); 
  noStroke();
  fonctionBoutonCouleur();
  updateInput();
  updateInterface();
  
  if (infoButtonOver == true) {
    if (scaleVal <= scaleMax) {
    scaleVal = scaleVal + scaleIncrement;
    } else {
    scaleVal = scaleVal;
    }
  }
  
  if (infoButtonOver == false) {
    if( scaleVal >= scaleMin) {
    scaleVal = scaleVal - scaleIncrement;
    } else {
      scaleVal = scaleVal;
    }
  }

//Fonction d'ouverture du bouton d'information  
  noStroke();
  update(mouseX, mouseY);
  if (infoButtonOver) {
    fill(#DAC2FF);
    pushMatrix();
    translate(infoButtonX, infoButtonY);
    scale(scaleVal);
    ellipse(0, 0, infoButtonSize, infoButtonSize);
    popMatrix();    
  }
  if (!infoButtonOver) {
    fill(#654ec6);
    ellipse(infoButtonX, infoButtonY, infoButtonSize*scaleMax, infoButtonSize*scaleMax);
    fill(colorSelected);
    pushMatrix();
    translate(infoButtonX, infoButtonY);
    scale(scaleVal);
    ellipse(0, 0, infoButtonSize, infoButtonSize);
    popMatrix(); 
  }
  
  fill(#FFFFFF);
  textSize(65);
  textFont(infoFont);
  text("i", infoButtonX-5, infoButtonY+15);

// Panneau d'information visuel  
  textFont(font);
  if (scaleVal >= scaleMax) {
    fill(colorHover);
    rect(260,65,200,120,10);
    fill(#FFFFFF);
    textSize(16);
    text("Liste des controles", 270, 90);
    text("Sauvegarder  --       S", 270, 115);
    text("Mode Crayon --       C", 270, 135);
    text("Mode Efface   --       E", 270, 155);
    text("Recommencer --       R ", 270, 175);
  }

 
// Dessiner le gabarit de géométrie sélectionné   
if (stateActive[index] == true) {     
   image(shapeSelector, 688, 178, width/4, height/2.3);
   }
// Choix pinceau/efface en fonction de l'affichage  
if(mediumPicker == true) {
   fill(colorSelected);
   noStroke();
   rect(rect9.x, rect9.y, rect9.width, rect9.height);
   cursor(curseurCrayon,0,0);
   }
if(mediumPicker == false) {
   fill(colorSelected);
   noStroke();
   rect(rect10.x, rect10.y, rect10.width, rect10.height);
   cursor(curseurEfface, 0,10);
   }
 
     
// HUD   
  image(colorPickerOverlay,0,0);
  stroke(#c6b9ff);
  strokeWeight(2);
  fill(#654ec6);
  rect(1145,115,7,470,3);  
  sliderSelected();  
  rectMode(CENTER);
  fill(#8777cf);
  rect(1150, sliderPosY, 15,15,3);
  fill(#4d276d);
  rect(1155, sliderPosY, 10,5,3);
  rectMode(CORNER);
  
  image(textOverlay,0,0);   
  
  colorMode(RGB);
  textSize(25);
  fill(#ffffff);
  wordPick(); 
}





//Confirmation de l'inclusion de la souris dans le bouton d'information
void update(int x, int y) {
  if ( overCircle(infoButtonX, infoButtonY, infoButtonSize) ) {
    infoButtonOver = true;
  } else {
    infoButtonOver = false;
  }
}


void mouseReleased()
{
  for (int index = 0; index < count; ++index)
  {
    if (stateActive[index])
    {
      switch (type[index])
      {
        case CONTROL_BOUTON_FORME:
          if (statePress[index])
            callbackRadio(index);
          break;
        default:
          break;
      }
    }
  }
  
    
//Assignation des boutons d'action du haut    
    if (rect9.contains(mouseX, mouseY)) {
      mediumPicker = true;
      print("Crayon");
    }
    if (rect10.contains(mouseX, mouseY)) {
      mediumPicker = false;
      print("Efface");
     } else {
      effaceColor = colorTransparent;
    }  
    if (rect11.contains(mouseX, mouseY)) {
      counter = counter + 1;  
      save("image_"+counter+".jpg");
      print("Sauvegarde complétée");
    }    
    if (rect12.contains(mouseX, mouseY)) {
      challengeGenerator();
      print("Nouveau défi!");      
    }
    if(rect13.contains(mouseX, mouseY)) {
      print("Aurevoir!");
      exit();
    }    
}


boolean isInside(int index, float buttonWidth, float buttonHeight)
{
  if (mouseX >= positionX[index] && mouseX <= positionX[index] + buttonWidth*2.0f &&
     mouseY >= positionY[index] && mouseY <= positionY[index] + buttonHeight*2.0f )
    return true;
  else
    return false;
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


void callbackRadio(int index)
{
  image(background, 0, 0);
  
  stateSelected[index] = !stateSelected[index];
  
  for (int optionIndex = 0; optionIndex < count; ++optionIndex)
  {
    if (optionIndex != index)
    {
      if (type[optionIndex] == CONTROL_BOUTON_FORME)
        stateSelected[optionIndex] = false;
    }
  }
  print(index);
  
// Sélection de la géométrie gabarit  
   if (index == 0) {
     if(stateSelected[index] == true) {
      shapeSelector = circleDoted;
   } else {
     shapeSelector = empty;
     }
   }
   if (index == 1) {
     if(stateSelected[index] == true) { 
       
      shapeSelector = lineDoted;
   } else {
       shapeSelector = empty;
     }
   }
   if (index == 2) {
     if(stateSelected[index] == true) {     
      shapeSelector = triangleDoted;
  } else {
      shapeSelector = empty;
    }
  }
   if (index == 3) {
     if(stateSelected[index] == true) {     
      shapeSelector = squareDoted;
  } else {
      shapeSelector = empty;
    }
  }
   if (index == 4) {
     if(stateSelected[index] == true) {     
      shapeSelector = pentagoneDoted;
  } else {
      shapeSelector = empty;
    }
  }
   if (index == 5) {
     if(stateSelected[index] == true) {     
      shapeSelector = hexagoneDoted;
  } else {
      shapeSelector = empty;
    }
  }
   if (index == 6) {
     if(stateSelected[index] == true) {     
      shapeSelector = heptagoneDoted;
  } else {
      shapeSelector = empty;
    }
  }
   if (index == 7) {
     if(stateSelected[index] == true) {     
      shapeSelector = octogoneDoted;
  } else {
      shapeSelector = empty;
    }
  }  
}


void keyReleased()
{
  if (key == ' ')
    sectionActive = 2;
}  


void timeDelay()
{
  if (timeDelay > 1f)
    sectionActive = 3;
}  


void keyPressed()
{
  if(key == 's'){
    counter = counter + 1;  
    save("image_"+counter+".jpg");
  }
  if(key == 'r') {
    image(background, 0, 0);
  }
  if(key == 'e') {
    mediumPicker = false;
  }
  if(key == 'c') {
  mediumPicker = true;
  }  
}

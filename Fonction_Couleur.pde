void fonctionCouleur()
{
  loadPixels();
  hue = hue(pixels[1160 + sliderPosY * width]);

  if(mousePressed == true) {
    if((mouseX >= 1142 && mouseX <= 1180) && (mouseY >= 125 && mouseY <= 580))
       {
        hue = hue(pixels[mouseX + mouseY * width]);
       } 
  }
  for (int i = 1145; i < 1180; i++) 
  {
    for (int j = 80; j < 110; j++) 
    {
      pixels[i + j * width] = color(hue, saturation, brightness);
    }
  }
// Couleur de l'efface  
  if(mousePressed == true) {
    if((mouseX >= 723 && mouseX <= 784) && (mouseY >= 38 && mouseY <= 70))
    fill(canvaColor);
    rect(1150,80,20,20);
  }
  updatePixels();
}

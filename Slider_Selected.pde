void sliderSelected()
{
//Fonction de drag & drop du glisseur de choix de couleur  
  if (mousePressed == true) {
    if (mouseY <= 125 && mouseX >= 1142 && mouseX <= 1180) {
      sliderPosY = 125;
    }
    if (mouseY >= 125 && mouseY <= 580 && mouseX >= 1142 && mouseX <= 1180) {
    sliderPosY = mouseY;
    }
    if (mouseY >= 580 && mouseX >= 1142 && mouseX <= 1180) {
      sliderPosY = 580;
    }
  }
}

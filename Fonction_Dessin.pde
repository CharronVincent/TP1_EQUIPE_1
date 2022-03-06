void fonctionDessin()
{
//Fonction d'assignation pinceau/efface lors du dessin sur le canva
if (mediumPicker == true) {
  if (mousePressed && (mouseButton == LEFT)) {
    if ((mouseX >= 540 && mouseX <= 1140) && (mouseY >= 70 && mouseY <= 590)) {
    lineColor = get(1160,90);
    stroke(lineColor);
    strokeWeight(5);
    line(pmouseX ,pmouseY ,mouseX ,mouseY);
    }    
  } else {
    noFill();
  }
}

if (mediumPicker == false) {
    if (mousePressed && (mouseButton == LEFT)) {
    if ((mouseX >= 540 && mouseX <= 1140) && (mouseY >= 70 && mouseY <= 590)) {
    lineColor = get(1160,90);
    stroke(canvaColor);
    strokeWeight(15);
    line(pmouseX ,pmouseY ,mouseX ,mouseY);
    }    
  } else {
    noFill();
  }
}
}

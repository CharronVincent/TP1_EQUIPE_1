void updateInterface()
{
  for (int index =  0; index < count; ++index)
  {
    if (stateActive[index])
    {
      switch (type[index])
      {
        case CONTROL_BOUTON_FORME:

            fill(colorTransparent);
            rect(
            positionX[index],
            positionY[index],
            buttonWidth,
            buttonHeight,
            5);
          

          
          if (stateSelected[index]) {
            fill(colorSelected);
            strokeWeight(3);
            stroke(255);
            rect(
            positionX[index],
            positionY[index],
            buttonWidth,
            buttonHeight,
            5);
          }
          break;     
      }
    }
  }
}

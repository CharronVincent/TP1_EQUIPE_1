void updateInput()
{
  for (int index = 0; index < count; ++index)
  {
    if (stateActive[index])
    {
      switch (type[index])
      {
        case CONTROL_BOUTON_FORME:

          stateOver[index] = isInside(index, buttonWidth / 2.0f, buttonHeight / 2.0f);

          if (stateOver[index] && mousePressed == true)
            statePress[index] = true;
          else
            statePress[index] = false;

          break;
      }
    }
  }
}

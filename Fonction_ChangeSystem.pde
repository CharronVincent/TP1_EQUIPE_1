void ChangeSystem()
{
  background(imgSource);
  timeElapsed = (millis() - timeFrame) / 500.0f;
  timeDelay += timeElapsed;
  timeFrame = millis();
  image(imgSource, 0, 0);
  if (timeDelay > 0f)
    {
  imgSource = img1;
   }
    if (timeDelay > 2f)
   {
     imgSource = img2;
   }
    if (timeDelay > 12f)
   {
     imgSource = img3;
   }
    if (timeDelay > 21f)
   {
    fadingfonce();
   }
    if (timeDelay > 26f)
   {
    drawscene();
   }
  } 


void fadingfonce()
  {
   fade++;
   if (fade == 255) {
  }
   tint(255, fade*5);
   fill(54,23, 131,fade*5);
   noStroke();
   rect(0, 0, width, height);
  }


void drawscene()
  {
   background(0);

   if (direction == true)
  {
   if (keyframe < animationFrameCount - 1)
      keyframe++;
   else
  {
       direction = false;
  }
  }
   else // direction arrière
  {
   if (keyframe > 0)
   keyframe--;
   else
  {
   direction = true;
   frameRate(speedFull);
   }
 }
   image(animation[keyframe], 0, 0);
 }

void fonctionPalette()
{
// Arc-en-ciel de sélection des couleurs  
  colorMode(HSB, 100);
  for (int i = 1144; i < 1180; i++) 
  {
    for (int j = 125; j < 580; j++) 
    {
      int h = round(map(j, 0,1000, -25, 180));
      int s = 100;
      int b = 100; 
      stroke(h, s, b);
      point(i, j);
    }
  }
}

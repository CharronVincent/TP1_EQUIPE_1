void challengeGenerator()
{
//Fonction de randomisation des défis  
  String[] words = { "Cercle", "Ligne", "Triangle", "Carre", "Pentagone", "Hexagone", "Heptagone", "Octogone" };
  challengeIndex = int(random(words.length));
  println(words[challengeIndex]);

  
  if (challengeIndex == 0) {
    generatedShape = "un cercle";
  }
  if (challengeIndex == 1) {
    generatedShape = "une ligne";
  }
  if (challengeIndex == 2) {
    generatedShape = "un triangle";
  }  
  if (challengeIndex == 3) {
    generatedShape = "un carre";
  }
  if (challengeIndex == 4) {
    generatedShape = "un pentagone";
  }
  if (challengeIndex == 5) {
    generatedShape = "un hexagone";
  }  
  if (challengeIndex == 6) {
    generatedShape = "un heptagone";
  }
  if (challengeIndex == 7) {
    generatedShape = "un octogone";
  }  
}

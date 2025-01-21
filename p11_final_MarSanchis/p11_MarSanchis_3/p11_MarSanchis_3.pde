void setup() {
  size(500, 500);
  background(0);
  stroke(200); // Color de las líneas
  noFill();
  
  float circleX = width / 2;   // Centro del círculo en X
  float circleY = height / 2;  // Centro del círculo en Y
  float radius = 200;          // Radio del círculo
  float lineSpacing = 10;      // Espaciado entre líneas

  // Dibuja líneas verticales dentro del círculo
  for (float x = circleX - radius; x <= circleX + radius; x += lineSpacing) {
    // Calcula las intersecciones de cada línea con el círculo
    float yTop = circleY - sqrt(sq(radius) - sq(x - circleX));
    float yBottom = circleY + sqrt(sq(radius) - sq(x - circleX));
    line(x, yTop, x, yBottom);
  }
}

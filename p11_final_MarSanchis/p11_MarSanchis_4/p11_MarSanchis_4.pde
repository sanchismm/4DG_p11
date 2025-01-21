void setup() {
  size(800, 400);
  background(0);
  stroke(200); // Color de las líneas
  noFill();
}

void draw() {
  float radius = 200;          // Radio del círculo
  float lineSpacing = 10;      // Espaciado entre líneas

  background(0);

  // Primer dibujo (izquierda)
  float circleX1 = 200;        // Centro del primer círculo en X
  float circleY = height / 2;  // Centro de los círculos en Y
  circulos(circleX1, circleY, radius, lineSpacing);

  // Segundo dibujo (derecha)
  float circleX2 = 600;        // Centro del segundo círculo en X
  circulos(circleX2, circleY, radius, lineSpacing);
}

void circulos(float centerX, float centerY, float radius, float lineSpacing) {
  // Dibuja líneas verticales dentro del círculo
  for (float x = centerX - radius; x <= centerX + radius; x += lineSpacing) {
    // Calcula las intersecciones de cada línea con el círculo
    float yTop = centerY - sqrt(sq(radius) - sq(x - centerX));
    float yBottom = centerY + sqrt(sq(radius) - sq(x - centerX));
    line(x, yTop, x, yBottom);
  }
}

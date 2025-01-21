void setup() {
  size(800, 400);
  stroke(#EDD4BE); // Color de las líneas
  noFill();
}

void draw() {
  background(0); // Fondo negro

  float baseRadius = 200;          // Radio base del círculo
  float baseLineSpacing = 10;      // Espaciado base entre líneas

  // Primer círculo (izquierda)
  float circleX1 = 200;            // Centro del primer círculo en X
  float circleY = height / 2;      // Centro de los círculos en Y
  float dist1 = dist(mouseX, mouseY, circleX1, circleY);
  float radius1 = baseRadius + dist1 / 10;       // Radio se adapta a la distancia del ratón
  float lineSpacing1 = baseLineSpacing + dist1 / 20; // Espaciado también cambia según la distancia
  circulos(circleX1, circleY, radius1, lineSpacing1);

  // Segundo círculo (derecha)
  float circleX2 = 600;            // Centro del segundo círculo en X
  float dist2 = dist(mouseX, mouseY, circleX2, circleY);
  float radius2 = baseRadius + dist2 / 10;       // Radio se adapta a la distancia del ratón
  float lineSpacing2 = baseLineSpacing + dist2 / 20; // Espaciado también cambia según la distancia
  circulos(circleX2, circleY, radius2, lineSpacing2);

  // Revisar la intersección de los círculos y permitir la superposición
  float overlap = dist(circleX1, circleY, circleX2, circleY) - (radius1 + radius2);
  if (overlap < 0) { // Si los círculos se están superponiendo
    // Modificar los radios y espaciados ligeramente para la superposición
    radius1 += overlap / 2;
    radius2 += overlap / 2;
  }
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

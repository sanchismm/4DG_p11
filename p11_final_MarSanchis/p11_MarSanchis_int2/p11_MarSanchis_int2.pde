void setup() {
  size(800, 400);
  background(0);
  stroke(#EDD4BE); // Color de las líneas
  noFill();
}

void draw() {
  background(0);  // Limpiar la pantalla en cada fotograma

  // Radio del primer círculo cambia según la posición del ratón
  float radius1 = map(mouseX, 0, width, 50, 300);  
  // El radio del segundo círculo será el complemento del primero
  float radius2 = 300 - radius1;  // Suma de los radios será 300
  
  float lineSpacing = 10;      // Espaciado entre líneas

  // Primer círculo (izquierda)
  float circleX1 = 200;        // Centro del primer círculo en X
  float circleY = height / 2;  // Centro de los círculos en Y
  circulos(circleX1, circleY, radius1, lineSpacing);

  // Segundo círculo (derecha)
  float circleX2 = 600;        // Centro del segundo círculo en X
  circulos(circleX2, circleY, radius2, lineSpacing);
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

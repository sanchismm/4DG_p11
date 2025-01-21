void setup() {
  size(800, 400);
  stroke(#EDD4BE); 
  noFill();
}

void draw() {
  background(0);  

  
  float baseRadius = 200;          // Radio base para las modificaciones
  float baseLineSpacing = 10;      // Espaciado base entre líneas

  // Primer círculo (izquierda)
  float circleX1 = 200;            // Centro del primer círculo en X
  float circleY = height / 2;      // Centro de los círculos en Y

  // Radio y espaciado basados en la distancia al ratón
  float dist1 = dist(mouseX, mouseY, circleX1, circleY);
  float radius1 = baseRadius + dist1 / 10;       // Radio se adapta a la distancia del ratón
  float lineSpacing1 = baseLineSpacing + dist1 / 20; // Espaciado también cambia según la distancia
  
  // Radio dinámico basado en el mouseX, para el efecto de ser inverso al otro círculo
  radius1 = map(mouseX, 0, width, 50, 300);  

  // Dibuja el primer círculo con sus interacciones
  circulos(circleX1, circleY, radius1, lineSpacing1);

  // Segundo círculo (derecha)
  float circleX2 = 600;            // Centro del segundo círculo en X

  // Distancia del ratón para el segundo círculo
  float dist2 = dist(mouseX, mouseY, circleX2, circleY);
  float radius2_distant = baseRadius + dist2 / 10;       // Radio se adapta a la distancia del ratón
  float lineSpacing2 = baseLineSpacing + dist2 / 20; // Espaciado también cambia según la distancia

  // Dibuja el segundo círculo con sus interacciones
  circulos(circleX2, circleY, radius2_distant, lineSpacing2);
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

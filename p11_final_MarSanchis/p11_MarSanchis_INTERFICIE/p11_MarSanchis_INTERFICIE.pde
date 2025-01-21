import controlP5.*;

ControlP5 cp5;

int kern_esq = 20;
int kern_dre = 20;
int tam_esq = 20;
int tam_dre = 20;
int grossor_tesq = 1;
int grossor_tdre = 1;

DropdownList d1;

int cnt = 0;
String[] acabat = {"ROUND", "SQUARE"};

void setup() {
  size(800, 400);
  stroke(#EDD4BE);
  noFill();
  cp5 = new ControlP5(this);

  cp5.addSlider("kern_esq")
    .setPosition(50, 50)
    .setRange(20, 1000);
  cp5.addSlider("kern_dre")
    .setPosition(600, 50)
    .setRange(20, 1000);

  cp5.addSlider("grossor_tesq")
    .setPosition(50, 70)
    .setNumberOfTickMarks(5)
    .setRange(1, 40);
  cp5.addSlider("grossor_tdre")
    .setPosition(600, 70)
    .setNumberOfTickMarks(5)
    .setRange(1, 40);

  cp5.addSlider("tam_esq")
    .setPosition(50, 90)
    .setRange(20, 800);

  cp5.addSlider("tam_dre")
    .setPosition(600, 90)
    .setRange(20, 800);

  cp5.addButton("Guardar Dibujo")
    .setPosition(width - 150, height - 50)  
    .setSize(120, 30)                      
    .onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        guardarDibujo();
      }
    });

  // Botón para modificar parámetros aleatoriamente
  cp5.addButton("aleatorio")
    .setPosition(20, height - 50)  // Posición en la esquina inferior izquierda
    .setSize(120, 30)             // Tamaño del botón
    .onClick(new CallbackListener() {
      public void controlEvent(CallbackEvent event) {
        asignarValoresAleatorios();
      }
    });
}

void draw() {
  background(0);

  float baseRadius = 200;          // Radio base para las modificaciones
  float baseLineSpacing = 10;      // Espaciado base entre líneas

  // Primer círculo (izquierda)
  float circleX1 = 200;            // Centro del primer círculo en X
  float circleY = height / 2;      // Centro de los círculos en Y

  // Radio y espaciado basados en la distancia al ratón
  float dist1 = dist(kern_esq, 10, circleX1, circleY);
  float radius1 = baseRadius + dist1 / 10;       // Radio se adapta a la distancia del ratón
  float lineSpacing1 = baseLineSpacing + dist1 / 20; // Espaciado también cambia según la distancia

  // Radio dinámico basado en el mouseX, para el efecto de ser inverso al otro círculo
  radius1 = map(tam_esq, 0, width, 50, 300);

  // Dibuja el primer círculo con sus interacciones
  strokeWeight(grossor_tesq);
  strokeCap(ROUND);
  circulos(circleX1, circleY, radius1, lineSpacing1);

  // Segundo círculo (derecha)
  float circleX2 = 600;            // Centro del segundo círculo en X

  // Distancia del ratón para el segundo círculo
  float dist2 = dist(kern_dre, 10, circleX2, circleY);
  float radius2 = map(tam_dre, 0, width, 50, 300); // Radio dinámico basado en tam_dre
  float lineSpacing2 = baseLineSpacing + dist2 / 20; // Espaciado también cambia según la distancia

  // Dibuja el segundo círculo con sus interacciones
  strokeWeight(grossor_tdre);
  strokeCap(ROUND);
  circulos(circleX2, circleY, radius2, lineSpacing2);
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

void guardarDibujo() {
  String filename = "dibujo_" + nf(frameCount, 5) + ".png";
  saveFrame(filename);
  println("Dibujo guardado como: " + filename);
}

void asignarValoresAleatorios() {
  // Asigna valores aleatorios dentro de los rangos de los sliders
  kern_esq = (int)random(20, 1000);
  kern_dre = (int)random(20, 1000);
  grossor_tesq = (int)random(1, 40);
  grossor_tdre = (int)random(1, 40);
  tam_esq = (int)random(20, 800);
  tam_dre = (int)random(20, 800);

  // Actualiza los valores de los sliders
  cp5.getController("kern_esq").setValue(kern_esq);
  cp5.getController("kern_dre").setValue(kern_dre);
  cp5.getController("grossor_tesq").setValue(grossor_tesq);
  cp5.getController("grossor_tdre").setValue(grossor_tdre);
  cp5.getController("tam_esq").setValue(tam_esq);
  cp5.getController("tam_dre").setValue(tam_dre);
}

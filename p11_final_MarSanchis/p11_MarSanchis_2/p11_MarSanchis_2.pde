void setup() {
  size(500, 500);
  background(0);
  //frameRate(2);
}

void draw() {
  stroke(#EDD4BE);
  //Primera mitad.
  float a = 0.0;
  float inc = TWO_PI/25.0;
  for (float posx=20; posx<300; posx=posx+10) {
    for (int i = 0; i < 100; i=i+15) {
    line(posx, 480+cos(a)*16.0, posx, 20+sin(a)*16.0);
    a = a + inc;
    }
  }
  /*
  line(20, 480, 20, 20);
   line(30, 480, 30, 20);
   line(40, 480, 40, 20);
   line(50, 480, 50, 20);
   line(60, 480, 60, 20);
   line(70, 480, 70, 20);
   line(80, 480, 80, 20);
   line(90, 480, 90, 20);
   line(100, 480, 100, 20);
   line(110, 480, 110, 20);
   line(120, 480, 120, 20);
   line(130, 480, 130, 20);
   line(140, 480, 140, 20);
   line(150, 480, 150, 20);
   line(160, 480, 160, 20);
   */
  //Segunda mitad.
  line(170, 480, 170, 20);
  line(180, 480, 180, 20);
  line(190, 480, 190, 20);
  line(200, 480, 200, 20);
  line(210, 480, 210, 20);
  line(220, 480, 220, 20);
  line(230, 480, 230, 20);
  line(240, 480, 240, 20);
  line(250, 480, 250, 20);
  line(260, 480, 260, 20);
  line(270, 480, 270, 20);
  line(280, 480, 280, 20);
}

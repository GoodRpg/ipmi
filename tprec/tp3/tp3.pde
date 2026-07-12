//https://youtu.be/QHZWxoBY-pg
int tamCelda;
int filas;
int columnas;
int colorRandom1;
int colorRandom2;
int colorRandom3;
PImage imagen25;

void setup() {
  size(800, 400);
  imagen25 = loadImage("imagen25.jpg");

  filas = 8;
  columnas = 8;
  tamCelda = 400/columnas;

  colorRandom1 = 0;
  colorRandom2 = 200;
  colorRandom3 = 255;
}

void draw() {
  background(colorRandom1);

  image(imagen25, 0, 0, 400, 400);

  grilla(400, 0, tamCelda, filas, columnas);
}

void grilla(int inicioX, int inicioY, int tam, int filas, int columnas) {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < columnas; j++) {
      patron(inicioX + j * tam, inicioY + i * tam, tam);
    }
  }
}

void patron(float x, float y, float t) {
  push();

  translate(x + t/2, y + t/2);

  float angulo = rotacion(x + t/2, y + t/2);
  rotate(angulo);

  noStroke();

  fill(colorRandom2);
  triangle(-t/2, -t/2, 0, -t/2, -t/2, 0);
  triangle(t/2, t/2, 0, t/2, t/2, 0);

  fill(colorRandom3);
  rect(0, -t/2, t/2, t/2);

  pop();
}

float rotacion(float x, float y) {

  float d = dist(mouseX, mouseY, x, y);

  float angulo = map(mouseX, 0, width, 0, 6.28);

  angulo += map(d, 0, dist(0, 0, width, height), 0.07, 0);

  return angulo;
}

void keyPressed() {
  if (key == ' ') {
    colorRandom1 = int(random(256));
    colorRandom2 = int(random(256));
    colorRandom3 = int(random(256));
  }

  if (key == 'r') {
    reiniciar();
  }
}

void reiniciar() {
  colorRandom1 = 0;
  colorRandom2 = 200;
  colorRandom3 = 255;
}

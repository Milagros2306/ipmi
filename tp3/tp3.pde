// milagros donnantuoni comision 2
// https://youtu.be/pHrDloQpvJk?feature=shared
PImage referencia;
int cols = 20;
int rows = 20;
float maxDiameter = 25;
boolean modoColor = false;
boolean formaCuadrado = false;

void setup() {
  size(800, 400);
  referencia = loadImage("1001746425.jpg"); 
  referencia.resize(400, 400); // 
  noStroke();
}

void draw() {
  background(255);
  image(referencia, 0, 0); // imagen a la izquierda como referencia

  // dibujo del Op Art modificado a la derecha
  translate(400, 0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = map(i, 0, cols - 1, 0, width/2);
      float y = map(j, 0, rows - 1, 0, height);
      float d = calcularDiametro(i, j);
      mostrarForma(x, y, d); // función sin retorno
    }
  }
}

// función que retorna un valor: tamaño del círculo/cuadro según la distancia al centro
float calcularDiametro(int i, int j) {
  float centerX = cols / 2.0;
  float centerY = rows / 2.0;
  float distancia = dist(i, j, centerX, centerY);
  float diametro = map(distancia, 0, dist(0, 0, centerX, centerY), maxDiameter, 2);
  return diametro;
}

// función sin retorno: dibuja forma (círculo o cuadrado)
void mostrarForma(float x, float y, float d) {
  if (modoColor) {
    fill(random(255), random(255), random(255));
  } else {
    fill(0);
  }
  if (formaCuadrado) {
    rectMode(CENTER);
    rect(x, y, d, d);
  } else {
    ellipse(x, y, d, d);
  }
}

// eventos de teclado
void keyPressed() {
  if (key == 'c') {
    modoColor = !modoColor; // cambia modo color
  } else if (key == 'f') {
    formaCuadrado = !formaCuadrado; // cambia forma
  } else if (key == 'r') {
    reset(); // reinicia variables
  }
}

// evento de mouse: cambia número de columnas y filas aleatoriamente
void mousePressed() {
  cols = int(random(10, 30));
  rows = int(random(10, 30));
}

// reiniciar variables
void reset() {
  cols = 20;
  rows = 20;
  maxDiameter = 25;
  modoColor = false;
  formaCuadrado = false;
}

// milagros donnantuoni comision 2
// https://youtu.be/jJf083hsKWw?si=TDt93B7eIU4cnov6

PImage referencia; // la imagen de referencia
int columnas = 20;
int filas = 20;
float maxDiametro = 25;
boolean modoColor = false;
boolean usarCuadrados = false;

void setup() {
  size(800, 400); // el tamaño de la division entre dos pantallas
  referencia = loadImage("1001819471.jpg"); 
  referencia.resize(400, 400);// tamaño fijo para la imagen de la izquierda
  noStroke();// sin borde en la figura
}

void draw() {
  background(0);
  image(referencia, 0, 0); //mi imagen original a la izquierda
  translate(400, 0); // muevo mi dibujo hacia la derecha
  
  for (int i = 0; i < columnas; i++) { // columnas
    for (int j = 0; j < filas; j++) { // filas
      float x = map(i, 0, columnas - 1, 0, width / 2);
      float y = map(j, 0, filas - 1, 0, height);
      float d = calcularDiametro(i, j); // función que retorna valor
      dibujarForma(x, y, d);            // función sin retorno
    }
  }
}

// función que retorna valor
float calcularDiametro(int col, int fil) {
  float centroX = columnas / 2.0;
  float centroY = filas / 2.0;
  float distancia = dist(col, fil, centroX, centroY);
  float d = map(distancia, 0, dist(0, 0, centroX, centroY), 2, maxDiametro);
  return d;
}

// función que no retorna valor
void dibujarForma(float x, float y, float diametro) {
  if (modoColor) {
    fill(random(255), random(255), random(255));
  } else {
    fill(255);
  }
  
  if (usarCuadrados) {
    rectMode(CENTER);
    rect(x, y, diametro, diametro);
  } else { 
    ellipse(x, y, diametro, diametro);
  }
}

// funcion keyPressed ( teclado)
void keyPressed() {
  if (key == 'c') {
    modoColor = !modoColor; // alternar color
  } else if (key == 'f') {
    usarCuadrados = !usarCuadrados; // alternar forma
  } else if (key == 'r') {
    reiniciar(); // volver al estado original
  }
}

// Funcion del mousePressed
void mousePressed() {
  columnas = int(random(10, 30));
  filas = int(random(10, 30));
}

// reinicio
void reiniciar() {
  columnas = 20;
  filas = 20;
  maxDiametro = 25;
  modoColor = false;
  usarCuadrados = false;
}

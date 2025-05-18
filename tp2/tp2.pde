PFont fuente;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
int estado ;
String texto1;
String texto2;
String texto3;
String texto4;
 //
int tiempoInicio;

void setup() {
  size(640, 480);
  background(0);
  fuente = loadFont("BellBold (1).vlw");
  textFont(fuente);
  textAlign(CENTER, CENTER);
  textSize(32);
  
  img1 = loadImage("catan.jpg.jpg");
  img2 = loadImage("catanrecursos.jpg.jpg");
  img3 = loadImage("catanobjetivo.jpg.jpg");
  img4 = loadImage("catanfinal.jpg.jpg");

  texto1 = "Catan - Descubre los secretos de la isla.";
  texto2 = "Reúne recursos: madera, ladrillo, trigo,\noveja y piedra para construir y comerciar.";
  texto3 = "Objetivo: ¡Conseguir 10 puntos de victoria!";
  texto4 = "Quien consiga 10 puntos primero gana";

  estado = 1;
  tiempoInicio = millis();  // Guarda el tiempo de inicio
}

void draw() {
  int tiempoActual = millis() - tiempoInicio;
  background(0);  // Limpia la pantalla

  if (estado == 1) {
    image(img1, 0, 0, 640, 480);
    text(texto1, 320, 240 - tiempoActual / 20);
    if (tiempoActual >= 5000) {
      estado = 2;
      tiempoInicio = millis();
    }
  }

  else if (estado == 2) {
    image(img2, 0, 0, 640, 480);
    text(texto2, 320, 240 - tiempoActual / -20);
    if (tiempoActual >= 5000) {
      estado = 3;
      tiempoInicio = millis();
    }
  }

  else if (estado == 3) {
    image(img3, 0, 0, 640, 480);
    text(texto3, 320, 240 - tiempoActual / 10);
    if (tiempoActual >= 6000) {
      estado = 4;
      tiempoInicio = millis();
    }
  }

  else if (estado == 4) {
    image(img4, 0, 0, 640, 480);
    text(texto4, 320, 240);
    if (tiempoActual >= 3000) {
      estado = 5;
     }
  }
} 
 
void mousePressed() {
  if (estado == 4 && mouseX >= 235 && mouseX <= 404 && mouseY >= 235 && mouseY <= 404) {
    estado = 1;  // Reinicia el estado
    tiempoInicio = millis();  // Reinicia el temporizador
    }
}

PImage catan1, catan2, catan3;
int pantalla = 1;
int contador = 0;
int tiempoPorPantalla = 300; // 4 segundos si está a 60fps
PFont fuente;
float textoY = 100;
float velocidadY = 1;

String texto1 = "Catan - Descubre los\nsecretos de la isla";
    
String texto2 = "Reúne recursos: madera, ladrillo, trigo,\noveja y piedra para construir y comerciar";

String texto3 = "Conseguir 10 puntos de victoria,\nel primero en conseguirlo, gana";


void setup() {
  size(640, 480);
   fuente = createFont("BellBold (1).vlw", 30);
  textFont(fuente);
  catan1 = loadImage("catan.jpg.jpg");
  catan2 = loadImage("catanrecursos.jpg.jpg");
  catan3 = loadImage("catanobjetivo.jpg.jpg");
 
}

void draw() {
background(0);
contador++;
 if (pantalla == 1) {
    image(catan1, 0, 0, width, height);
    
    fill(255);
    textAlign(CENTER);
    text(texto1, width / 2, textoY);
    textoY += velocidadY;

    if (contador > tiempoPorPantalla) {
      pantalla = 2;
      contador = 0;
      textoY = 100;
    }
  }
 else if (pantalla == 2) {
    image(catan2, 0, 0, width, height);
    
    fill(255);
    textAlign(CENTER);
    text(texto2, width / 2, textoY);
    textoY += velocidadY;

    if (contador > tiempoPorPantalla) {
      pantalla = 3;
      contador = 0;
      textoY = 100;
    }
  }

 else if (pantalla == 3) {
  image(catan3, 0, 0, width, height);
  
  fill(255);
  textAlign(CENTER);
  text(texto3, width / 2, textoY);
  textoY += velocidadY;

  // mostrar botón solo cuando pasa el texto
  if (contador > tiempoPorPantalla) {
    // Botón de reinicio
    fill(245, 7, 36);
    rect(240, 400, 160, 40);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Reiniciar", 320, 420);
  }
}
}

void mousePressed() {
  if (pantalla == 3 && mouseX > 240 && mouseX < 400 && mouseY > 400 && mouseY < 440) {
    pantalla = 1;
    contador = 0;
    textoY = 100;
  }
}

PImage miObjetoFavorito;

void setup() {
  size(800, 400);
  miObjetoFavorito = loadImage("peluche.png.png");
}

void draw(){

background (#906344 );
image(miObjetoFavorito, 0, 0,400,400);
stroke(144, 111, 85); 
line (100, 0, 160, 400);

// cuerpo
  fill(180, 255, 180); // Verde claro
  noStroke();
  ellipse(600, 200, 200, 120); // cuerpo ovalado
  
  // ojo
  fill(255);
  ellipse(530, 200, 40, 50);
  
  // pupila
  fill(0);
  ellipse(530, 200, 15, 20);
  
  // detalles triangulares (orejitas)
  fill(255, 200, 180); // color piel claro
  triangle(270+275, 150, 275+275, 136, 280+275, 150); // arriba
  triangle(330+250, 210, 348+250, 200, 330+250, 190); // lateral
  
  
  //etiqueta
  pushMatrix();
  translate(620, 240);
  rotate(radians(45));
  fill(255);
  rect(0, 0, 15, 40);
  popMatrix();
}

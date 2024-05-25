//comisión 5-nombre:María Paz Escapil-legajo:119017/2-tp2//

//variables//
PImage foto0, foto1, foto2, foto3;
PFont fuentedetexto;
int animacion;
boolean button = false;
int x = 489, y = 429, w = 150, h = 50;
int pantalla = 0;
int tiempo;
int diametro;
String texto1, texto2, texto3, texto4;
int segundos = 0;
String estado = "titulo";  

void setup() {
  size(640, 480);
  foto0 = loadImage("lametamorfosiskafka.jpg");
  foto1 = loadImage("lametamorfosis1.jpg");
  foto2 = loadImage("lametamorfosis2.jpg");
  foto3 = loadImage("lametamorfosis3.jpg");
  fuentedetexto = loadFont("Trebuchet.vlw");
  textFont(fuentedetexto);
  textSize(35);
  animacion = 0;
  println(animacion);
  pantalla = 0;
  tiempo = 0;
  diametro = width / 10;

  texto1 = "La metamorfosis, \n novela escrita por Franz Kafka.";
  texto2 = "El relato cuenta la historia de Gregor Samsa,\n un viajante de comercio que un día se despierta\n transformado en un enorme insecto. Incapaz de\n comunicarse y adaptarse a su nueva condición,\n Gregor se convierte en una carga para su familia,\n que lo aísla y lo rechaza progresivamente.";
  texto3 = "La obra explora temas como: alienación, identidad\n y la incomprensión humana, culminando en la muerte\n de Gregor, lo que finalmente libera a su familia de\n la carga que representaba.";
  texto4 = "Realmente recomiendo esta obra,\n ya que es una excelente crítica\n a la sociedad y los vínculos sociales\n y familiares, tocando temas profundos\n con los cuales podemos sentirnos\n identificados.";
}

void draw() {
  background(255);
  animacion = frameCount;

  if (estado.equals("titulo")) {
    mostrarTitulo();
  } else if (estado.equals("segunda")) {
    mostrarSegunda();
  } else if (estado.equals("tercera")) {
    mostrarTercera();
  } else if (estado.equals("fin")) {
    mostrarFin();
  }

  if (frameCount % 60 == 0) {
    segundos++;
  }

  actualizarEstado();
}

void mostrarTitulo() {
  push();
  image(foto0, 0, 0, 640, 480);
  fill(255);
  text(texto1, 0, 50);
  fill(230);
  noStroke();
  rect(x, y, w, h);
  fill(0);
  textSize(24);
  text("Comenzar", 510, 462);
  pop();
}

void mostrarSegunda() {
  image(foto1, 0, 0, 700, 480);
  textSize(26);
  fill(25);
  text(texto2, 20, 400 - (animacion % 600) / 3); 
}

void mostrarTercera() {
  image(foto2, 0, 0, 640, 480);
  textSize(25);
  fill(0);
  text(texto3, 10, 400 - (animacion % 1000) / 5); 
}

void mostrarFin() {
  image(foto3, 0, 0, 640, 480);
  fill(230);
  noStroke();
  rect(x, y, w, h);
  fill(0);
  textSize(27);
  text("Reiniciar", 520, 463);
  fill(150);
  textSize(20);
  fill(170);
  text(texto4, (animacion % 800) / 3 % width, 40); 
}

void actualizarEstado() {
  if (segundos < 4) {
    estado = "titulo";
  } else if (segundos >= 4 && segundos < 12) {
    estado = "segunda";
  } else if (segundos >= 12 && segundos < 19) {
    estado = "tercera";
  } else {
    estado = "fin";
  }
}

void mousePressed() {
  if (estado.equals("titulo") && mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    estado = "segunda";
    segundos = 4; 
    animacion = 0; 
  } else if (estado.equals("fin") && mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    estado = "titulo";
    segundos = 0;  
    animacion = 0; 
  }
}

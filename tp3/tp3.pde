//comisión 5-nombre:María Paz Escapil-legajo:119017/2-tp3//

//https://youtu.be/DwZcbwM9vDE

//variables//

PImage ilusion;
PFont bodoni;
int cant = 50;
int tam = 16;
int tamElipse = 5/2;
int tamElipse2 = 6/2;
int tamRect = 15;
int tamRect2 = 19;

color colorRect1;
color colorRect2;
color colorElipse1;
color colorElipse2;

color colorOrgRect1;
color colorOrgRect2;

void setup() {
  size(800, 400);
  colorMode(HSB);
  ellipseMode(RADIUS);
  
  ilusion = loadImage("opart.jpg");
  
  bodoni = loadFont("Bodoni.vlw");
  
  colorRect1 = color(140, 240, 140);
  colorRect2 = color(112, 235, 195);
  colorElipse1 = color(150, 140, 80);
  colorElipse2 = color(0, 0, 255);
  
 
  colorOrgRect1 = colorRect1;
  colorOrgRect2 = colorRect2;
}

void draw() {
  background(100);
  noStroke();
  textFont(bodoni,15);
  
  primeraCuadricula();
  segundaCuadricula();
  
  image(ilusion, 0, 0, 400, 400);
  

  fill(255);
  ellipse(width - 40, 40, 20, 20);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Reset", width - 40, 40);
}

void primeraCuadricula() {
  for (int a = 25; a < cant; a++) {
    for (int b = 0; b < cant; b++) {
      fill(colorOriginal(a, b));
      rect(a * tam, b * tam, tamRect, tam);

      if ((a + b) % 3 == 2) {
        fill(colorElipse1);
      } else {
        fill(colorElipse2);
      }
      ellipse(a * tam, b * tam, tamElipse, tamElipse);
    }
  }
}

void segundaCuadricula() {
  for (int c = 24; c < 39; c++) {
    for (int d = 3; d < 18; d++) {
      fill(colorOriginal(c, d));
      rect(c * 19, d * 19, tamRect2, tamRect2);

      if ((c + d) % 3 == 2) {
        fill(colorElipse1);
      } else {
        fill(colorElipse2);
      }
      ellipse(c * 19, d * 19, tamElipse2, tamElipse2);
      ellipse(c * 19 + 19, d * 19, tamElipse2, tamElipse2);
      ellipse(c * 19, d * 19 + 19, tamElipse2, tamElipse2);
    }
  }
}

void mousePressed() {
  float d = dist(mouseX, mouseY, width - 40, 40);
  if (d < 15) {
   
    valorOriginal();
    
    colorRect1 = colorOrgRect1;
    colorRect2 = colorOrgRect2;
  } else {

    colorRect1 = color(mouseY, 210, 140);
    colorRect2 = color(mouseY, 180, 200);
  }
}

void valorOriginal() {
  tamElipse = 5/2;
  tamElipse2 = 6/2;
}

void keyPressed() {

  if (key == 'w') {
    tamElipse += 1;
    tamElipse2 += 1;
  } else if (key == 's') {
    tamElipse = max(1, tamElipse - 1);
    tamElipse2 = max(1, tamElipse2 - 1);
  }
}

color colorOriginal(int i, int j) {
  if (i % 2 == 0 && j % 2 != 0 || i % 2 != 0 && j % 2 == 0) {
    return colorRect1;
  } else {
    return colorRect2;
  }
}

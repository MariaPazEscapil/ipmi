//variable//
PImage tomato;

void setup (){
  size(800,400);
  colorMode(HSB);
  tomato=loadImage("tomato.jpg");
}
void draw (){
  background(255);
  image(tomato,10,10,200,150);

fill(100);
noStroke();
ellipse(400, 300, 300, 100);

fill(0,150,255);
stroke(0,150,100);
strokeWeight(3);
ellipse(400, 200, 325, 275);

fill(0,12,255);
noStroke();
ellipse(300,165,40,35);

fill(0,150,255);
noStroke();

stroke(100,165,230);
strokeWeight(7);
line(395,100,385,30);

beginShape();
fill(100,165,230);
vertex(400,100);
vertex(380,80);
vertex(425,100);
vertex(350,85);
vertex(420,80);
vertex(400,95);
vertex(400,90);
vertex(398,115);
vertex(375,90);
endShape();

fill(50);
text("tp1",700,370);
text("escapil, maría paz",700,380);
text("comision 5",700,390);
}

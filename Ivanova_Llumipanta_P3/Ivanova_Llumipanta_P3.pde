//screen init
boolean Pantalla=true;
PImage inicio;
//cierre-screen init

//boca
//posiciones rango
int posx=355;
int posX=520;
int posy=500;
int posY=530;

int bcount=0;//CONTADOR PARA GANASTE
float ix;
float iy;
int bs = 100;//tamaño del cuadrado
boolean bover = false;
boolean ilocked = false;
float bdifx = 0.0; 
float bdify = 0.0; 
//cierre boca


PImage photo;
color bgcolor;//color de fondo
int count=0;
//nariz
int has;
int px;
int py;
int i; //nariz i
color c;
int q;//color degrade


//ojos2
//posiciones rango ojos_iman
int opox=175;
int opoX=235;
int opoy=250;
int opoY=275;
//cierre rango

float bx;
float by;
int eyeSize = 120;//tamaño del cuadrado
boolean overEye = false;
boolean olocked = false;
float exOffset = 0.0; 
float eyOffset = 0.0; 
//cierre ojos 2



 
void setup() {
 size(1000,700);
 inicio=loadImage ("pan.jpg");
photo = loadImage("imagen.png");
 
//boca
  ix = 800;//posicion inicial
  iy = 690;
//cierre boka
//nariz:
  px =900;//posicion cuando inicia la pantalla en el eje x de toda la nariz
  py =230;//posicion cuando inicia la pantalla en el eje y de toda la nariz
  c = 0;
//ojos: 
  bx = width/1.4;
  by = height/1.7;
  rectMode(RADIUS);  
  d = new Draggable(900,640,100,8);//dibuja el rect
  noStroke();
  //cierre ojos
}

class Draggable {
  boolean dragging = false; // 
  boolean rollover = false; // 
  
  float x,y,w,h;          // 
  float offsetX, offsetY; 

  Draggable(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
  }
  
  // Method to display
  void display() {
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(120);
    else fill(0);
    strokeWeight(1);
//    rect(x,y,w,h); //rectantgulo 2
    noStroke();
    
  }
  void reset() {
  for(i=0;i<7;i++){
    px=50;
    py=150;
    c=color( 204, 153, 0); 
  }
  has = -1;
}

  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;
      offsetX = x-mx;
      offsetY = y-my;
    }
  }
  
  void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = true;
    } else {
      rollover = false;
    }
  }
 
  void stopDragging() {
    dragging = false;
  }
  
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }

}
//Cierre-Dibuja ojoizquierdo    
       
  }

Draggable d;


void draw() {
if (Pantalla == true) {
    imageMode (CENTER);
   image(inicio, width/2,height/2);
     fill(255);
textSize(50);
text("PRESIONA ALT PARA JUGAR", 40, 650);
noFill();
  }else{
 
//background(255);
bgcolor = #CC0000;
 
  background(bgcolor);
//para q la imagen a armar aparezca solo al hacer presionar la barra espaciadora
if(keyCode==' '){
count++;
//println("count es igual: "+count);

}else{
  if ( count >10){
    image(photo, 900, 50);
  }
    
}

strokeWeight(4);
stroke(255);//color de lineas
fill(255);
line(620, 0, 620, 700);
line(620, 150, 1000, 150);
line(620, 320, 1000, 320);


fill(#E89B0C);
line(620, 520, 1000, 520);
noStroke();
textSize(20);

//fill(0, 102, 153);

text("Finalmente arrastra el rectángulo", 630, 550); //
text("mueve el cursor hasta que el", 630, 570); //
text("rectángulo", 630, 590); //
text("cambie de color", 630, 615); //
text(" y podrás arrastrarlo", 630, 630); //
text("Luego arrastra los círculos", 630, 340);
text("Primero arrastra el triángulo", 630, 180);
text("Presiona la barra", 630, 30);
text("espaciadora para ver", 630, 50);
text("la imagen que", 630, 70);
text("debes armar", 630, 90);
noFill();

//degradado

  noStroke();
  for(int q=12;q<20;q++){
    scale(.99);
//    scale(.99);
    fill(67-10*q,200,(q>=10)?(20*(q-10)):0);
    
  beginShape();
vertex(150, 180);
vertex(550, 180);
vertex(550, 400);
vertex(470, 420);
vertex(470, 560);
vertex(230, 560);
vertex(230, 420);
vertex(150, 400);
endShape(CLOSE);
 
}

    beginShape();
  fill(200, 255, 255);
 
vertex(150, 180);
vertex(550, 180);
vertex(550, 400);
vertex(470, 420);
vertex(470, 560);
vertex(230, 560);
vertex(230, 420);
vertex(150, 400);
// tint(255, 255);
endShape(CLOSE);


//lineas bok
strokeWeight(12);
stroke(0);
line(280, 480, 280, 520);
line(360, 480, 360, 520);
line(440,480, 440, 520);
//cierre lineas bok

//fill(0);
////rect(posx,posy,80,20);//rectangulo prueba
//noFill();


//NAriz:
for(i=0;i<7;i++){
    pushMatrix();
    translate(px,py);
    fill(c);
    scale(1.5);
    switch(i){
    case 1: 
      beginShape(TRIANGLES);
      vertex(-20,-8);
      vertex(8,48);
      vertex(-50,48);
      endShape();
      break;
  }   
    popMatrix();
  }
  if( mousePressed && (has != -1) ){
    px+= mouseX-pmouseX;
    py+= mouseY-pmouseY;
  }
 d.rollover(mouseX,mouseY);
  d.drag(mouseX,mouseY);
  d.display();
        
 //OJOS 2
if (mouseX > bx-eyeSize && mouseX < bx+eyeSize && mouseY > by-eyeSize && mouseY < by+eyeSize) {
    overEye = true;  
    if(!olocked) { 
      stroke(0); 
      fill(255);
    } 
  } else {
    stroke(153);
    fill(0);
    overEye = false;
  } 
strokeWeight(8);
  
stroke(0);
fill (100,12,230);
  ellipse(bx+70, by+50, eyeSize+30, eyeSize+30); //ojo1
  ellipse(bx+270, by+50, eyeSize, eyeSize); //ojo2  
//  noFill();

  
   //boca
  if (mouseX > ix-bs && mouseX < ix+bs && mouseY > iy-bs && mouseY < iy+bs) {
    bover = true;  
    if(!ilocked) { 
//      stroke(0); 
      fill(255);
    } 
  } else {
//    stroke(153);
    fill(0);
    bover = false;
  }
  // Draw the box
  rect(ix, iy, bs, bs/15);//le divido para dos para poder hacer bien la boca
  //cierre boca
  
  //PARA PONER EL GANASTE
  
  
  if(bcount>=8){//
  
    rectMode(CENTER);
   fill(255);
   rect(500,350,1500,1000);
  fill(0);
textSize(100);

text("GANASTE", 340, 320);
  }//CIERRE PARA PONER EL GANASTE
  
 
}// cierre if screen init  
  if(keyCode==ALT){
Pantalla=false;
}

}//cierre draw

void mousePressed() {
    
  //nariz:
    if( mouseButton == LEFT ){
  color mouseC = get(mouseX,mouseY);
    for(int j=0;j<7;j++){
      if( c == mouseC ){
        has = j;
      }
    }  
  }
 

//OJOS 2
  if(overEye) { 
    olocked = true; 
    fill(153);
  } else {
    olocked = false;
  }
  exOffset = mouseX-bx; 
  eyOffset = mouseY-by; 
  //cierre ojos
//CIERRE OJOS2
  
//boca
  if(bover) { 
    ilocked = true; 
    fill(153);
  } else {
    ilocked = false;
  }
  bdifx = mouseX-ix; 
  bdify = mouseY-iy; 
  //cierre boca
  
   
}//cierre mouse pressed

void mouseDragged() {
  //ojos 2
  if(olocked) {
    bx = mouseX-exOffset; 
by = mouseY-eyOffset; 
  }
 
 
  if((mousePressed &&(((opox<mouseX)&& (mouseX<opoX))&& ((opoy<mouseY)&& (mouseY<opoY))))){ // 
bx=opox;
by=opoy;
 

}//cierre ojos2

  
  //boca
  if(ilocked) {
    ix = mouseX-bdifx; 
iy = mouseY-bdify; 
  }
  
  //arrastrar imagen
 
if((mousePressed &&(((posx<mouseX)&& (mouseX<posX))&& ((posy<mouseY)&& (mouseY<posY))))){ // 
ix=posx;
iy=posy;
bcount++;
println("bcount es igual: "+bcount);

}//cierre-arrastrar imagen
 

}//cierre mouseDragged

void mouseReleased() {
  
  
  //ojos2
  olocked = false;
  //cierre ojos2
  
  
  //nariz:
    has = -1;
  for(i=0;i<7;i++){
    if( px < 0 || px> width || py< 0 || py> height ){
      px=150;
      py=150;
    }
  }
  
  //boca
  ilocked = false;
  //cierre boca



}//cierre mouse released





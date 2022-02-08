import processing.pdf.*;


PShape basemap;
String[] data1;
String[][] data2;// here we split the content of data1 wich have a 6 differente;;
                // data in the same  vector in to a 2D matrix;
int count;

void setup(){
  size(1500,750);
  basemap = loadShape("WorldMap.svg");
  shape(basemap,0,0,width,height);
  data1 =  loadStrings("MeteorStrikesDataSet.csv");
  data2 = new String[data1.length][6];
  println(data1[1]);
  for(int i=0;i<data1.length;i++){
     data2[i] = data1[i].split(","); 
  }
  println(data2[1][2]);
  /*println(data1[21]);
  println(data2[21][3]);
  */
  //In this line bellow we started a recording a PDF file.
  // and the end this should be stoped
  beginRecord(PDF,"meteorStrikes.pdf");
  for (int i=0;i<data2.length;i++){
    
    //println(data2[i][3]+ "+" + data2[i][4]);  
    float grafLong  = map(float(data2[i][3]),-180,180,0,width);
    float grafLat = map(float(data2[i][4]),90,-90,0,height);
    float mapmass = 0.05*sqrt(float(data2[i][2]))/PI;
    
    //println(grafLong ,'/',grafLat,count);
    fill(255,0,0,50);
    noStroke();
    
    ellipse(grafLong,grafLat,mapmass,mapmass);
   
    //AQUI SELECIONAMOS OS COMETAS QUE CAIRAM A PARTIR
    // DOS ANOS 2000, COM A CONDIÇÃO DE TER SIDO ENCONTRADO.
    //E TRAÇAMOS UM EIXO EM SUA ORIGEM
    if(float(data2[i][1])>2000 || data2[i][5]=="Found"){
      pushMatrix();
      count++;
      stroke(0,50);
      line(grafLong-50,grafLat,grafLong +50,grafLat);
      line(grafLong,grafLat-50,grafLong,grafLat+50);
      popMatrix();
    }
  }
  endRecord();
  println(count);
  println("PDF was Saved!!");
}


void draw(){
  /*noLoop();
  //translate(width/2,height/2);
  
  for (int i=0;i<data2.length;i++){
    float grafLong  = map(float(data2[i][3]),-180,180,0,width);
    float grafLat = map(float(data2[i][4]),90,-90,0,height);
    fill(255,0,0,100);
    noStroke();
    ellipse(grafLong,grafLat,10,10);
  }
  
*/
}

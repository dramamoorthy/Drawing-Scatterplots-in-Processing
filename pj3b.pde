Table tabularData = null;

void setup(){
  size(600, 600); 
  selectInput("Select a file to process:", "fileSelected");
  

}

void draw(){
 
  
  if(tabularData != null){
    background(255);
    stroke(0);
    fill (0);
    line(250,240,250,345);
    line(250,345,650,345);
     text ("ACT", 355, 385);
     text ("GPA", 150, 280);
     text ("ACT VS GPA SCATTER PLOT", 250,230);
     float start= 1.0;
     float increment= 0.50;
     
     for(int r=0; r<10; r++){
  
  text((start+increment*r),205,345-r*10);
  
  }
  for(int t=15; t<36; t++){
  
  text(t*1,46+t*15,355);
  
  }
    
    drawScatterPlot();
    
    noLoop();
  }
}

void drawScatterPlot(){
  
  int translate_x_axis = 350;
  int translate_y_axis = 50;
  fill(0,0,255);
 
  float x,y;
  float width = 3;
  float height = 3;
  float reductionFactor = 15;
  
  for(TableRow row : tabularData.rows()){
      x = translate_y_axis + row.getInt("ACT")*reductionFactor;
      y = translate_x_axis - row.getFloat("GPA")*reductionFactor;
      
      ellipse(x, y, width, height);
       
  } 
}
void fileSelected(File selection) {
  if (selection == null) {
    
  } else {
        tabularData = loadTable(selection.getAbsolutePath(), "header");
  }
}
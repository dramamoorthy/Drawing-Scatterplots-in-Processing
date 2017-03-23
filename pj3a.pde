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
    line(140,20,140,450);
    line(140,450,550,450);
     text ("SATM", 355, 525);
     text ("SATV", 90, 280);
     text ("SATV VS SATM SCATTER PLOT", 250,30);
     for(int t=1; t<9; t++){
  
  text(t*100,120,455-t*50);
  
  }
  for(int t=1; t<9; t++){
  
  text(t*100,140+t*50,465);
  
  }
    
    drawScatterPlot();
    
    noLoop();
  }
}

void drawScatterPlot(){
  
  int translate_x_axis = 550;
  int translate_y_axis = 50;
  fill(0,0,255);
  
  float x,y;
  float width = 3;
  float height = 3;
  float reductionFactor = 5/3f;
  
  for(TableRow row : tabularData.rows()){ //<>//
      x = translate_y_axis + row.getInt("SATM")/reductionFactor;
      y = translate_x_axis - row.getInt("SATV")/reductionFactor;
      
      ellipse(x, y, width, height);
       
  } 
}
void fileSelected(File selection) {
  if (selection == null) {
    
  } else {
        tabularData = loadTable(selection.getAbsolutePath(), "header");
  }
}
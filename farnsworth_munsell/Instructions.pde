/**

Author: Andy Dennis

Description:
The Instructions class provides the user 
with a quick guide on how to use the software.

**/

class Instructions {
  
  
  void generateInstructions() {
    /* Display help text
    */
    fill(0);
    textSize(16);
    text("Instructions",155,25);
    textSize(12);
    text("Tritanopes have problems distinguishing blues and yellows.",155,50);
    text("In order to test for Tritanopia we can use the Farnsworth-Munsell 100 hue colour test.",155,70);
    text("Re-arrange the boxes so the colours change gradually from left to right.",155,90);
    text("You do not need to change the first or last box in each row. You can only switch boxes in the same row",155,120);
    drawDemoBox();   
  }
  
  void drawDemoBox() {
    /* Draw a demonstration
       of the grid on screen
    */   
    int x = 155;
    int y = 140; 
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) {
          fill(boxes[r][c].boxc);
          rect(x,y,20,20);
          x = x + 30;
      }
      x = 155;
      y = y + 25;
    }    
    
  }
  
}

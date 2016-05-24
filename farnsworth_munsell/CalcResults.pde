/**

Author: Andy Dennis

File: CalcResults

Description:
The CalcResults class contains the code for checking the order
the user dragged the boxes on the screen to. 

It then renders the results informing the user what the got right/wrong.
A miniature version of the grid is displayed with the correct boxes
whited out with a black border and the boxes in the incorrect 
position displayed with their background colour.


**/
public class CalcResults {
 
  void checkResult() {
    /* Grabs the x co-ord the user 
       placed the boxes in using 
       the boxes x co-ordinate variable.
       We then sort them into
       order from sallest x to largest.  */   
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) {
        boxXOrder[r][c] = boxes[r][c].x;
      }
      Arrays.sort(boxXOrder[r]);   
    }
    getIds();
  }
   
  void getIds() { 
    /* Grab the IDs by iterating
       through the list of boxXOrders
       values and comparing them to
       the position of the user dragged box.
       This then gives us a list of 
       the ids in the order the user
       dragged them */  
    for (int r = 0; r < boxXOrder.length; r++) {
      for (int c = 0; c < boxXOrder[r].length; c++) {
        for (int c2 = 0; c2 < boxes[r].length; c2++) {
          if( boxes[r][c2].x == boxXOrder[r][c]) { 
            boxIdsOrder[r][c] = boxes[r][c2].id;
          }
        }
      } 
    }    
    valiateOrder();     
  }
 
  void valiateOrder() {
    /* validate to see if the
        user has the same order
        as the correct order.
        We do this comparing 
        boxIdsOrder to the correct 
        order
    */
    background(canvasBg);
    Boolean correctPosition = true; 
    for (int r = 0; r < correctOrder.length; r++) {
      for (int c = 0; c < correctOrder[r].length; c++) {
         if(correctOrder[r][c] != boxIdsOrder[r][c]) {
           correctPosition = false;  
         } else {
           correctPosition = true; 
         }
         showBox(correctOrder[r][c], correctPosition);
      }
    } 
   BtnMenuItms.drawBtnMenu();
   showBoxMessage();
   showTritanopeResults();
  }

  void showBox(String id, Boolean correctPosition) {
    /* display the mini grid showing
        the users results.
        If they got a match we show a white
        box with a black border.
        If the match is incorect we show
        the background colour.
    */    
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) {
        if(boxes[r][c].id == id) {
          boxes[r][c].w = 10;
          boxes[r][c].h = 10;
          boxes[r][c].x = boxes[r][c].x/3+10;
          boxes[r][c].y = boxes[r][c].y/3+10;
          if(!correctPosition) {
              if(boxes[r][c].cat.equals("tritanope")){
                stroke(249, 65, 65);
              }
              boxes[r][c].display();
              stroke(0);
          } else {
             stroke(0);
             fill(255);
             rect(boxes[r][c].x,boxes[r][c].y,boxes[r][c].w,boxes[r][c].h);
          }    
        }
      }
    }   
  }
  
  void showBoxMessage() {
    /* Show the help text
      about the grid
    */  
    fill(0);
    textSize(12);
    text("The grid above shows the boxes you incorrectly\naligned. Boxes in white were correct answers.",15,canvasH-180);
    text("A explanation of the results can be found on the right.",15,canvasH-140);
  }


  void showTritanopeResults() {
    /* Show the results specific to
       diagnosing Tritanopia
    */   
    fill(0);
    line(500, 0, 500, 255);
    textSize(16);
    text("Results",canvasW-700,25);
    textSize(12);
    text("Tritanopes have problems distinguishing blues and yellows.",canvasW-700,50);
    text("This can result in confusion discerning blues, blue greens, and shades of yellow-red",canvasW-700,70);  
    text("These colours can be found in rows 1 and 3 highlighted red and seen below:",canvasW-700,90);
    int x = 535;
    int y = 120; 
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) {
        if(boxes[r][c].cat.equals("tritanope")) { 
          fill(boxes[r][c].boxc);
          rect(x,y,20,20);
          x = x + 30;
        }
      }
      x = 535;
      y = y + 25;
    }
  }

}

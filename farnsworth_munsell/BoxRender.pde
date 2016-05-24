/**

Author: Andy Dennis

File: BoxRender

Description:
The boxes and randomly mixed by the BoxRender class.
Each time we start the test we get a different box order. 
This prevents a user taking the test multiple times
and learning the order. 

The BoxRender class is also responsible 
for handling click/drag events for re-ordering the boxes.

A selected box will switch positions with another box when
dragged over it.

References:

1.) Farnsworth-Munsell 100 hue color vision test
http://www.color-blindness.com/farnsworth-munsell-100-hue-color-vision-test/#prettyPhoto/2/


**/

class BoxRender {
  JSONArray pallet;
  
  BoxRender(JSONArray new_pallet) {
    pallet = new_pallet;
  }

  void generateBoxes() {
    /* Generate a new Box
       assign it an id and
       background colour.
       Make a note of the correct
       position of the box so when
       we calculate the result we can 
       see if the user dragged it into
       the right place.
       Visual design of this inspired by
       the website at reference [1].
    */   
    for (int r = 0; r < pallet.size(); r++) {
      JSONObject row = pallet.getJSONObject(r);
      JSONArray colours = row.getJSONArray("colours");
      for (int c = 0; c < colours.size(); c++) {
        JSONObject colour = colours.getJSONObject(c);
        color bg = color(unhex(colour.getString("colour")));
        String id = colour.getString("id");
        String cat = colour.getString("cat");
        boxes[r][c] = new Boxes(0,0,40,40,bg,id,cat);
        correctOrder[r][c] = id;
      }
    }
    shuffleBoxes();
  }
 
  void shuffleBoxes() {
    /* Randomly shuffles
       the boxes on the screen
   */    
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) {
        getRandomBox(r, c);
      }
    }
    assignBoxes();
  }

  void getRandomBox(int r, int c) {
    /* grabs a random box that
       has not been shuffled and
       assigns it a postion.
       Ignores the first and
       last box in a row
    */   
    if(c != 0 && c != 21) {
      Random rnd = new Random();
      int index = rnd.nextInt(c + 1);
      if(index == 0) {
        index ++; 
      } else if( index == 21) {
        index --;
      }
      Boxes swap = boxes[r][index];
      boxes[r][index] = boxes[r][c];
      boxes[r][c] = swap;
    }
  }

  void assignBoxes() {
    /* Assigns each of the boxes an
       x and y co-ordinate
    */   
    int x = 20;
    int y = 20;
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) {
        boxes[r][c].x = x;
        boxes[r][c].y = y;
        x += 55;
      }
      y += 55;
      x = 20; 
    }
  }

  void drawBoxes() {
    /* 
      Draws the boxes
    */
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) {
        if(c!=0 && c!=21){
            boxes[r][c].drag(mouseX,mouseY);
        }
        boxes[r][c].display();
      } 
    }    
  }
  
  void switchBoxes(int checkColour) {
    /* Switches the position of 
       the boxes on the screen
    */   
    for (int r = 0; r < boxes.length; r++) {
      for (int c = 0; c < boxes[r].length; c++) { 
        if(boxes[r][c].boxc == checkColour) {
          if(boxSelCol != 0 && boxSelCol != 21 && c != 0 && c!= 21) {
             boxes[boxSelRow][boxSelCol].x = boxes[r][c].x;
             boxes[boxSelRow][boxSelCol].y = boxes[r][c].y;
             boxes[r][c].x = boxSelx;
             boxes[r][c].y = boxSely;  
             boxes[r][c].display();
             boxes[boxSelRow][boxSelCol].display();
             break;
          } if (boxSelCol != 0 && boxSelCol != 21 && c == 0 || c== 21){
            boxes[boxSelRow][boxSelCol].x = boxSelx;
            boxes[boxSelRow][boxSelCol].y = boxSely; 
            boxes[boxSelRow][boxSelCol].display();
            break;
          }
        }
      }
    }
  }

  void clickBoxes() {
    /* Handles the click
       on the box
    */   
    int x = 20;
    int y = 20;
      for (int r = 0; r < boxes.length; r++) {
        for (int c = 0; c < boxes[r].length; c++) {
          if((mouseX < boxes[r][c].x+40 && mouseX > boxes[r][c].x) &&
             (mouseY > boxes[r][c].y && mouseY < boxes[r][c].y+40)){
            boxes[r][c].clicked(mouseX,mouseY);
            boxSelRow = r;
            boxSelCol = c;
            boxSelx = boxes[r][c].x;
            boxSely = boxes[r][c].y;
            selColour = boxes[r][c].boxc; //currently selected box colour
            break;
          } 
          x += 55;
        } 
        y += 55;
        x = 20; 
      }     
  }   

  void releaseClickBoxes() {
    /* Handles when the user stops
       dragging the box
    */   
    boxes[boxSelRow][boxSelCol].stopDragging();
  
    if((boxes[boxSelRow][boxSelCol].y < boxSely-40 || boxes[boxSelRow][boxSelCol].y > boxSely+40)) {
      boxes[boxSelRow][boxSelCol].x = boxSelx;
      boxes[boxSelRow][boxSelCol].y  = boxSely;
    } else {  
      for (int r = 0; r < boxes.length; r++) {
        for (int c = 0; c < boxes[r].length; c++) {
           //check each pixel in box
          for (float r2 = boxes[r][c].x; r2 < boxes[r][c].x+40; r2++) {
            for (float c2 = boxes[r][c].y; c2 < boxes[r][c].y+40; c2++) {
              if( r2 == mouseX && c2 == mouseY) {
                int checkColour = boxes[r][c].boxc;
                if(checkColour != selColour) {
                  renderBoxes.switchBoxes(checkColour);
                  break;
                }
              }
            }
          }   
        }
      } 
    }    
  }  
}

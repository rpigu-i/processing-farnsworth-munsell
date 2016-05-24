/**

Author: Andy Dennis

File: Boxes

Description:
The Boxes class contains the code for rendering
an instance of a box. We store the X and Y coordinates
of the box and it’s background colour.
Background colour is Loaded from pallet JSON file.  

References:

Code/ideas dervived from the following links is also anotated in
comments below.

[1] Draggable Shape
http://www.learningprocessing.com/examples/chapter-5/draggable-shape/

**/

class Boxes {
  boolean dragging = false;  
  float x,y,w,h;        
  float offsetX, offsetY; 
  color boxc;
  String id;
  String cat;

  Boxes(float tempX, float tempY, float tempW,
        float tempH, color tempboxc, String tempId,
        String tempCat) {
    /* Code in this class was inspired by
       reference [1]
    */    
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    id = tempId;
    boxc = tempboxc;
    cat = tempCat;
    offsetX = 0;
    offsetY = 0;
  }

  void display() {
    /* disyplay a box
       on the screen
    */   
    fill(boxc);
    rect(x,y,w,h);
  }

  
  void clicked(int mouseSelX, int mouseSelY) {
    /* Check if click is inside
       our box
    */   
    if (mouseSelX > x && mouseSelX < x + w && 
        mouseSelY > y && mouseSelY < y + h) {
        dragging = true;
        offsetX = x-mouseSelX;
        offsetY = y-mouseSelY;
    }
  }

  void drag(int mouseSelX, int mouseSelY) {
    /* Update the x and y position
       as the user drags the box
    */   
    if (dragging) {
      x = mouseSelX + offsetX;
      y = mouseSelY + offsetY;
    }
  }

  void stopDragging() {
    /* When the user releases
       the mouse stop dragging
    */   
    dragging = false;
  }

}

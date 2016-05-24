/**

Author: Andy Dennis

File: BtnMenu

Description:
BtnMenu class contains the code for handling
generating the menu. 
This contains the buttons for loading the Instruction text,
calculating the results and restarting the test.

**/

public class BtnMenu {
  int btnMenuHeight;
  int btnWidth;
  int canvasH;
  int canvasW;
  int menuColour; 
  String[] btns = {"Restart testing", "Check results!", "Show help text"};
  
  BtnMenu(int h, int w) {
    /* Button menu constructor*/
    btnMenuHeight = 55;
    btnWidth = 115;
    menuColour = 100; 
    canvasH = h;
    canvasW = w;
  }  


  void drawBtnMenu() {
    /* Draws the footer menu
       area on the screen
    */ 
    fill(menuColour); 
    stroke(menuColour);
    rect(0, canvasH-45, canvasW-1, btnMenuHeight-10);
    drawBtnMenuItems();
  }

  void drawBtnMenuItems(){
    /* Draws the menu buttons
       on the bottom of the screen
    */   
    int x = 450; 
    stroke(0);
    textSize(14);
    fill(0);

    for (int i =0; i < btns.length; i++) {
      fill(0);
      rect(x, canvasH-40, btnWidth, btnMenuHeight-20, 7);
      fill(255, 255, 255);
      text(btns[i],x+9,canvasH-18); 
      x = x + 120;
    }
  }

  void menuBtnClick() {
    /* Handles a click on a menu
       button
    */   
    int btnX = 450;
    for (int i =0; i < btns.length; i++) {
      if((mouseX>=btnX && mouseX<btnX+btnWidth) && 
         (mouseY >canvasH-40 && mouseY < (canvasH-40) +(btnMenuHeight-20))){
           fireClickFunction(i); 
         }
      btnX = btnX + 120;
    } 
  }

  void fireClickFunction(int btn){
     /* Handles the click event.
        This decides whether to: 
        1.) show the instructions text.
        2.) restart the test
        3.) check the results
     */
     switch(btn) {
      case 0: renderBoxes.generateBoxes(); 
              showInstructions=false;
              resultsChecked=false; 
              startTest=true; break;
      case 1: showInstructions=false; 
              startTest=false;
              if(!resultsChecked) { 
                checkRes.checkResult();
                resultsChecked = true;
              }; break;
      case 2: showInstructions=true; 
              startTest=false; break;
      default: break;   
     } 
  }

}

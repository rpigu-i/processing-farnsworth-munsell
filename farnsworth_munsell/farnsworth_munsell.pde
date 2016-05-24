/**

Author: Andy Dennis

Description:
The following program provides an Farnsworth-Munsell 100 hue color
vision test for colour blindness, specifically testing for
tritanopic vision.
The program allows the user to drag colored boxes in
4 rows of 22 so that the colors change from one shade
to another.

Classes: The BoxRender, Boxes, BtnMenu, CalcResults
         and Instructions classes are included from
         tabs as inner classes. 

Colour palettes: Loaded from palette JSON file.  

References:

Code/ideas dervived from the following links is also anotated in
comments below.

1.) Colour blindness (Colour wheel)
http://www.websemantics.co.uk/tutorials/accessibility_workshop/sessions/session2/05.colour_usage/01.colour_wheel/

2.) Farnsworth-Munsell 100 hue color vision test
http://www.color-blindness.com/farnsworth-munsell-100-hue-color-vision-test/#prettyPhoto/2/

**/
import java.util.*;

JSONObject json;
JSONArray pallet;
color canvasBg;
Boxes[][] boxes = new Boxes[4][22];
String[][] correctOrder = new String[4][22];
String[][] boxIdsOrder = new String[4][22];
float[][] boxXOrder = new float[4][22];
int boxSelRow;
int boxSelCol;
int selColour = -1;
int canvasW = 1235;
int canvasH = 300;
float boxSelx;
float boxSely;
boolean startTest = true;
boolean showInstructions = false;
boolean resultsChecked = false;
BtnMenu BtnMenuItms;
BoxRender renderBoxes;
CalcResults checkRes;
Instructions instructions;

void setup() {
  /* initalize variables.
     Colours dervived from 
     references [1] and [2]
  */   
  size(canvasW,canvasH); 
  smooth();
  json = loadJSONObject("hue.json");
  pallet = json.getJSONArray("pallet");
  canvasBg = color(255,255,255);
  BtnMenuItms = new BtnMenu(height, width);
  renderBoxes = new BoxRender(pallet);
  checkRes = new CalcResults();
  instructions = new Instructions();
  renderBoxes.generateBoxes(); //generate boxes from pallet 
}

void draw() {
  /* draws the screen currently
     being viewed
  */
  if(startTest) {
    background(canvasBg);
    BtnMenuItms.drawBtnMenu();
    renderBoxes.drawBoxes();
  } else if(showInstructions){
    background(canvasBg);
    BtnMenuItms.drawBtnMenu();
    instructions.generateInstructions();
  }
}

void mousePressed() {
  /* Check if menu button clicked.
     If not hand off to
     BoxRender class
  */
  if((mouseX>0 && mouseX <canvasW-1) &&
     (mouseY>canvasH-40)) {
      BtnMenuItms.menuBtnClick();
  } else {
      renderBoxes.clickBoxes();
  }  
}

void mouseReleased() {
  /* Handle releasing the click */
  renderBoxes.releaseClickBoxes();
}

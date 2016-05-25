# Processing Farnsworth-Munsell colour blindness test


Tritanopia is a rare condition that results in blue-yellow colour-blindness; as a result of this the sufferer confuses blue with green and yellow with violet [1].
In order to test for Tritanopia a different methodology to the Ishihara plates is required. The Ishihara test is only suitable for testing for Deutranopia and Protanopia [2][3].

On considering the research available I decided to use the Farnsworth-Munsell 100 hue colour vision test [4].
This test works by providing the user with 88 coloured boxes. These are lined up in a grid of 4 by 22.
The user is then responsible for lining these boxes up so once the test is complete the colours blend from one into another starting with a shade of red and finishing with another shade of red.

The test requires little interaction other than dragging the boxes, therefore is fairly simple to explain and administer. This is useful if some of the participants in the test are less experience using technology.
The layout of screen was largely based around the 4 by 22 grid; therefore the sketch is wider than it is high. This allows the application to accommodate all the boxes whilst not needing to make them too small, thus making clicking on them and dragging them easier.
Located along the bottom for easy access are the three buttons that form the menu. The menu options are: 

1. Restart testing 
2. Check results! 
3. Show help text

Clicking a menu button redraws the screen with the “page” you selected. There are three pages to switch between, the test, the test results and instruction text.
On the results screen is a re-use of the grid design that the user is familiar with. This is in contrast to versions of the test where a colour circle is generated to show the results [5]. Since we are only interested in Tritanopia results we do not need the more complex colour circle and thus can keep our result explanation simple.
The colours are stored in a separate JSON file in hex format. This is then loaded into the application.

Colours can be changed if we wish by switching the JSON file. The colours range between 9C615E and 9D6262.


#References

[1] Colour Blind Awareness, (2014, November, 28). Tritanopia – Blue-Yellow Color Blindness [Online], Available: http://www.color-blindness.com/tritanopia-blue-yellow-color-blindness/

[2] Essilor, (2014, December, 14). The Ishihara test [Online]
A vailable: http://www.essilor.com/en/EyeHealth/LensesForYourVision/TestyourEyes/Pages/TheIshiharatest.aspx

[3] S. Deeb PhD, A. Motulsky MD, (2011, September, 29). Red-Green Color Vision Defects [Online], Available: http://www.ncbi.nlm.nih.gov/books/NBK1301/

[4] Farnsworth, Dean (1943). "The Farnsworth-Munsell 100-Hue and Dichotomous Tests for Color Vision". Journal of the Optical Society of America 33.

[5] Colblindor, (2014, December, 14). Farnsworth-Munsell 100 Hue Color Vision Test [Online], Available: http://www.color-blindness.com/farnsworth-munsell-100-hue-color-vision-test/#prettyPhoto


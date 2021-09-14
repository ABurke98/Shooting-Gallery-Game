public class Scope {            //Creating the scope class.

  private int scopeSize = 250;       //Private fields for the Scope class.
  private int circleX = mouseX;
  private int circleY = mouseY;
  private int vertLineX = mouseX;
  private int vertLineY = mouseY;
  private int horizLineX = mouseX;
  private int horizLineY = mouseY;


  public Scope() {                     //Scope constructor with a few different overloaded constructors for scope customisation.
  }

  public Scope(int lineWidth) {        //Will make the lines thicker on the scope.
    strokeWeight(lineWidth);
  }

  public Scope(int R, int G, int B) {   //Allows you to change the scope colour.
    stroke(R, G, B);
  }

  public Scope(int R, int G, int B, int lineWidth) {  //Allows you to change the scope colour as well as the thickness of the lines.
    stroke(R, G, B);
    strokeWeight(lineWidth);
  }


  void display() {  //The display function draws scope as well as the background for the game and targets. More on this in readme.
    circleX = mouseX;  // Initialising the scope class fields.
    circleY = mouseY;
    vertLineX = mouseX;
    vertLineY = mouseY;
    horizLineX = mouseX;
    horizLineY = mouseY;
    scopeEdgeCollision();  //Calling the scope Edge collision function.
    circle(circleX, circleY, scopeSize);
    image (img, 100, 50);                                    //Draws the background for the game.
    image(targ, target.targX, target.targY);             //Draws the targets.
    line(vertLineX, vertLineY-scopeSize/2, vertLineX, vertLineY + (scopeSize/2));       //The next two lines are the scope crosshairs one verticle line and on horizontal line.
    line(horizLineX-scopeSize/2, horizLineY, horizLineX + (scopeSize/2), horizLineY);
  }

  void scopeEdgeCollision() {            //Scope edge collision contains a lot of if statements which check to see if the scope is touching any edge of the screen.
    if (circleX <= 0 + scopeSize/2) {
      circleX = scopeSize/2;
    }
    if (circleX >= width - scopeSize/2) {
      circleX = width - scopeSize/2;
    }
    if (circleY <= 0 + scopeSize/2) {
      circleY = scopeSize/2;
    }
    if (circleY >= height - scopeSize/2) {
      circleY = height - scopeSize/2;
    }

    if (horizLineX <= 0 + scopeSize/2) {
      horizLineX = 0 + scopeSize/2;
      horizLineY = circleY;
    }
    if (horizLineX >= width - scopeSize/2) {
      horizLineX = width - scopeSize/2;
      horizLineY = circleY;
    }
    if (horizLineY <= 0 + scopeSize/2) {
      horizLineY = 0 + scopeSize/2;
      horizLineY = circleY;
    }
    if (horizLineY >= height - scopeSize/2) {
      horizLineY = height - scopeSize/2;
      horizLineY = circleY;
    }
    if (vertLineX <= 0 + scopeSize/2) {
      vertLineX = 0 + scopeSize/2;
      vertLineX = circleX;
    }
    if (vertLineX >= width - scopeSize/2) {
      vertLineX = width - scopeSize/2;
      vertLineX = circleX;
    }
    if (vertLineY <= 0 + scopeSize/2) {
      vertLineY = 0 + scopeSize/2;
      vertLineY = circleY;
    }
    if (vertLineY >= height - scopeSize/2) {
      vertLineY = height - scopeSize/2;
      vertLineY = circleY;
    }
  }

  public int getScopeSize() {    //Getter for scopeSize
    return scopeSize;
  }

  public void setScopeSize() {                                    //Setter for scopeSize which takes the users input from the start of the game.
    scopeWidth = Integer.parseInt(JOptionPane.showInputDialog
      ("Enter the width of your scope \n 150 is the lowest available size and 250 is the maximum size\n a larger scope size is easier to play with\n default scopeSize is 180", "180"));
    if (scopeWidth >= 100 || scopeWidth < 250) {
      this.scopeSize=scopeWidth;
    }
    if (scopeWidth < 100 || scopeWidth > 250) {
      this.scopeSize=180;
    }
  }
}

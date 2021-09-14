import processing.sound.*;  // Declaring the variables that will be used in the game. //<>// //<>// //<>//
import javax.swing.*;
SoundFile shot, miss;
PImage img, gameOver;
PImage targ, badTarg;
int targX, targY, score, spawnTime, lives, maxNumberOfGames, gamesPlayed, numberOfGames, scopeWidth, highScoreList, scopeLines, randomBadTarget;
float distance, distanceX;
boolean hit, targOn, targOff, scoring, gameActive = true, endScreen;
String name = null;
Scope scope;                       // The next three lines are where I create my class objects as well as creating an instance of Target class.
Target target = new Target();
Player player;





void setup() {
  gameActive = true;
  miss = new SoundFile(this, "miss.mp3");   //Loading in the sound files that are in use in the game.
  shot = new SoundFile(this, "M4A1S.mp3");
  scope = new Scope(255, 0, 0, 2); // Creating an instance of the scope class using an overloaded constructor.
  gamesPlayed = 0; // From line 22 to 33 is where I intitialise the starting values of the games using various Booleans as well as setter for the classes.
  roundAmount();
  scope.setScopeSize();
  player = new Player(name, numberOfGames);
  player.setPlayerName();
  target.setSpawnTime(0);
  player.setCount(0);
  endScreen = false;
  scoring = true; 
  player.setScore(0);
  player.setLives(5);
  size(1280, 720);     //Using the built in Processing methods for creating the background and choosing the colour 
  background(0);
  noCursor();          
  img = loadImage("building.png");   // Loading the images for use in the game.
  targ = loadImage("target.png");
  gameOver = loadImage("gameover.jpg");
  target.targetCreation();
}

void draw() {    //Draw Loop
  if (gameActive == true) { /*  The gameActive boolean is used for running the code while the game is being played, it will be disabled at the end of the game on the
   Statistics screen so that Processing isn't wasting resources on running the game while it's not needed.*/
    background(0);             //Redrawing the background and setting a fill colour for the scope.
    fill(255);
    scope.display();           //Calling the scope display method which draws the scope and all the various pieces of it.
    target.randomSpawn();      //Making a call to the target randomSpawn function which is based on a timer and will spawn a different target after various times.
    target.difficulty();       //The target difficulty function decreases the time between spawing of the targets at different scores which makes the game harder as you progress.
    scope.scopeEdgeCollision();  /*The scopeEdgeCollision function keeps the scope on the screen. As it is drawn on the mouse position I wanted to make sure the scope didn't
     go half off the screen or 3/4 off the screen if you moved it to a corner.  */

    fill(255, 0, 0);
    textSize(18);
    text("Score: " + player.getScore(), 1000, 600);   //Printing live statistics on the game screen so the user can see important game info.
    text("Lives: " + player.getLives(), 1000, 625);
    text("Round: " + (player.count+1) + " of " + numberOfGames, 1000, 650);

    lifeCheck();  //The life check function reads the lives variable and changes the state of the game depending on lives and other factors.
  }
}

void mousePressed() {                                                             //Hit detection using the mouse Pressed method.
  if (gameActive == true) {                                                     //Only runs when the gameActive state is set to true.
    if (scope.circleX >= target.targX && scope.circleX <=  target.targX+67 && 
      scope.circleY >= target.targY && scope.circleY <= target.targY+95) {     /*Checks to see if the scope and crosshair is over the target, 
     if they are overlapping and the mouse is pressed a hit will be confirmed and a point will be added and a sound will play. 
     if not a life will be lost a different sound will play */

      shot.play();  
      player.score += 1;
      background(0, 255, 0);
      fill(255, 0, 0);
      circle(scope.circleX, scope.circleY, 20);   //This circle is a little hitmarker and will appear where you clicked on the target.
    } else {
      background(209, 52, 52);
      miss.play();
      player.lives -=1;
    }
  }
}

void resetGame() {        //Reset game is used between rounds to reset the score and lives back to default values.
  player.setLives(5);
  player.setScore(0);
}

void gameOver() {    //Game over is the final screen of the game, here the user will have their statistics presented to them with JOptionPanes, it also toggles the endScreen boolean to true.
  endScreen = true;
  cursor();
  image(gameOver, 0, 0);
  JOptionPane.showMessageDialog(null, "Well Played " + player.getPlayerName() +  "\nThe Highest score you acheived was: " + player.highestScore() + 
    "\nYou scored an average of: " + player.averageScore(), "Statistics", JOptionPane.PLAIN_MESSAGE);
  JOptionPane.showMessageDialog(null, player.toString(), "Statistics", JOptionPane.PLAIN_MESSAGE);
  text("If you would like to play again press the shift key", 435, 200);
}

void roundAmount() {   // Round amount is called when the program is first run, it prompts the user to input the amount of rounds they would like to play
  numberOfGames = Integer.parseInt(JOptionPane.showInputDialog("How many games would you like to play?\n Recommended amount 3", "3"));
  if (numberOfGames == 0) {  //The next two if statements are for validation purposes.
    this.numberOfGames = 1;
  }
  if (numberOfGames >=5) {
    this.numberOfGames = 5;
  }
}

void keyPressed() {     //Utilising the keyPressed processing method
  while (endScreen == true) {  


    if (keyCode == 16) {              /* Using a while loop during the endgame screen which listens to see if the shift key is pressed to restart the game from fresh.
     if the shift key is pressed all game values will be reset back to default so the user can start a new game, the prompts for a new game will re-appear 
     so that the user can change rounds or scope size, the name is kept the same. */
      endScreen = false;
      noCursor();
      player.lives = 5;
      player.setScore(0);
      player.setCount(0);
      roundAmount();
      scope.setScopeSize();
      target.setSpawnTime(0);
      gamesPlayed = 0;
      gameActive = true;
      scoring = true;
    }
  }
}

void lifeCheck() {                 //lifeCheck is mentioned above at the end of the draw section.
  if (player.lives == 0) {               
    player.addScore(player.score);
    gamesPlayed++;
    if (gamesPlayed < numberOfGames) {
      resetGame();
    } else {
      scoring = false;
      gameActive = false;
      gameOver();
    }
  }
}

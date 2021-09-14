public class Target {    //Creaitng the target class.


  Target() {        // Target constructor
  }


  Target(int x, int y) {    //Target constructor used in the targetCreation function to assign an X an Y point to the target.
    targX = x;
    targY = y;
  }


  private Target [] targets;                            //Class fields for the Target class.
  private int targX;
  private int targY;
  private int targetX [] = {180, 450, 300, 300, 670, 420, 1000};
  private int targetY [] = {140, 140, 370, 520, 530, 370, 370};
  private int spawnTime;



  public void targetCreation() {                         //Target creation uses a for loop and created new instances of the the target and pulls X and Y coordinates from two arrays.
    targets = new Target[7];
    for (int i = 0; i < targets.length; i++) {
      targets[i] = new Target(targetX[i], targetY[i]);
    }
  }

  public int getTargX() {                       //Getters and Setters for the Target class line 31-64
    return targX;
  }


  public int getTargY() {
    return targY;
  }



  public int getTargetX(int i) {
    return targetX[i];
  }

  public int getSpawnTime() {
    return spawnTime;
  }

  public void setSpawnTime(int spawnTime) {
    this.spawnTime = spawnTime;
  }

  public void setTargetX(int select, int set) {
    this.targetX[select] = set;
  }

  public int getTargetY(int i) {
    return targetY[i];
  }

  public void setTargetY(int select, int set) {
    this.targetY[select] = set;
  }

  public void randomSpawn() {     /*Random spawn is used to start a timer at default values a new target will be spawned after four seconds 
   or after a hit a is detected on a targer using the spawn function */
    if (millis() > spawnTime+4000 || mousePressed && scope.circleX >= targX && scope.circleX <=  targX+67 && scope.circleY >= targY && scope.circleY <= targY+95) {
      spawnTime = millis();
      spawn();
    }
  }

  public void difficulty() {                         /*The difficulty will be increased by speeding upn the rate at which targets appear and dissapear which makes finding and clicking them harder.
   The first stage after the user reaches 15 in score the time it take for targets to dissapear is decreased to 2 seconds.
   after the user reaches score 30 the time it takes for targets to despawn is 1.4 seconds which makes the game quite challenging but still possible.
   */
   if (player.score >=0 && millis() >= spawnTime+4000) {
      spawnTime = millis();
      spawn();
    }
    if (player.score >=15 && millis() >= spawnTime+2000) {
      spawnTime = millis();
      spawn();
    }
    if (player.score >=30 && millis() > spawnTime+1400) {
      spawnTime = millis();
      spawn();
    }
  }

  public void spawn() {                                /*The spawn function generates a random number based on the length of the targets object array. it will use the number to access
   The targets array and will pull the positional data for the instance of that object and pass it into the targX and targY variables
   which will move the target around the screen when spawn is called by the methods above.
   */
    int spawnTarget = (int)random(targets.length);
    targX = targets[spawnTarget].targX;
    targY = targets[spawnTarget].targY;
  }
}

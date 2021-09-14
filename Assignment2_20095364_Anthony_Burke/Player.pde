class Player {               //Creating the player class

  private String playerName;     //Setting private fields for use in the player class
  private int[] scores;
  private int count;
  private int score;
  private int lives;

  public Player(String playerName, int numberOfGames) {    //Player constructor which takes in two values, the players name as well as the number of games they would like to play which also sets the array size.
    this.playerName = playerName;
    scores = new int[numberOfGames];
    count = 0;
  }

  public String getPlayerName() {     // Line 15 to 54 are getters and setters for the player class.
    return playerName;
  }

  public int[] getScores() {
    return scores;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public int getLives() {
    return lives;
  }

  public void setLives(int lives) {
    this.lives = lives;
  }

  public void setPlayerName() {
    name = JOptionPane.showInputDialog("Please enter your name");
    this.playerName = name;
  }

  public void setScores(int[] scores) {
    this.scores = scores;
  }

  public int getCount() {
    return count;
  }

  public void setCount(int count) {
    this.count = count;
  }

  public void addScore(int score) {                                        //add score is called at the end of a round and adds the score from that round into the scores array and increments the count.
    if (score >= 0 && count <= numberOfGames && scoring == true) {
      scores[count] = score;
      count++;
    }
  }

  public int highestScore() {         //The highest score function will show the user the highest score they got throughout the whole game.
    int highestScore = scores[0];

    for (int i = 1; i < count; i++) {  //For loop for checking if the last score is higher then the current stored score and will update if the last score is higher.
      if (scores[i] > highestScore) {
        highestScore=scores[i];
      }
    }
    return highestScore;
  }

  public int averageScore() {           //The average score function will show the user the average score throughout the whole game.
    int total = 0;

    for (int i = 0; i < count; i++) {   //For loop which takes the value total and plusses it with the score from each round and then performs multiplication and returns the result
      total = total + scores[i];
    }
    return total/count;
  }

  public String toString() {                                  //the toString method takes the values from the the scores array and adds them to a string which can be displayed at the end of the game.
    String str = "Scores per round \n";
    for (int i = 0; i<count; i++) {
      str=str + " Round " + (i+1) + ": " + scores[i] + "\n";   //This method will show the user their score for each round.
    }
    return str;
  }
}

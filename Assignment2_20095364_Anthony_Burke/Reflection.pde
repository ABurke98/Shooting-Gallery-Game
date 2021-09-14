/* Reflection

Name : Anthony Burke

Student Number: 2005364

Link to Video on YouTube: https://youtu.be/aJnMRiAN3t8


Part A - Mark (11 /11)
-----------------------------

Includsion of completed:
- Readme             (1)
- Reflection        (5)
- Video            (5)


Part B - Mark (4 /4)
-----------------------------

Comments, 
- indentation, 
- naming, 
- structure of code.



Part C - Mark (3 /5)
-----------------------------
Use of if and loop statements:

Main Class line 101 - 107 - Checks for validation of the amount of rounds entered for the game.
Target Class line 23 - Creates an object array and fills it with target objects with different coordinates to be used for spawning and displaying.

for loops used on:
Player class line 85 - to create a table at the end of the game breaking down the score for each round the user has played.
Player class line 77 - Logs each score the user had throughout the game and then multiplies at the end based on rounds to give average score.

While loop used on:
Main class line 111 - When the endGame boolean is switched on the class will listen while that condition is true for a keypress and if the game is reset the while loop will be closed.


Part D - Mark (10 /10)
-----------------------------
Working Game with inclusion of bespoke methods in the main sketch.

bespoke method:

gameOver() on line 90 toggles a boolean to let the game know that the game is over and to display JOptionPanes to the user with some of their statistics,
           it also loads an image to show an end game screen as well as places text letting the user know how to reset the game
roundAmount() on line 100 Creates an input window when called at the start of the program, the input from the player is stored in a variable which determines how man rounds will be played
              and sets the size of the relevant arrays for that.
lifeCheck() on line 131 is constantly checking the lives variable in the player class, if the lives in a round drops to 0 lifeCheck sees this and will add the score from that round to an array as well as increment the amount of games played by 1
            it also checks the amount of rounds played to make sure it hasn't gone past the specified amount of rounds, if it detects this it turns the scoring system off and disables most of the game functions,
            this means that when the player is looking at the end game screen he/she can't keep clicking and changing the lives or scores variable.
resetGame() on line 85 is a small function but an important one in the overall game, each time the players lives fall to 0 and there is still rounds to be played this function gets called which resets the Score and lives variable for the new round.


-----------------------------
Part E USER DEFINED CLASSES
-----------------------------

Part E1 - Mark (7 /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters

Scope class line 1, a class named scope which holds the appropriate data for the scope, features overloaded constructors, private fields, getters and setters.
Target class line 1, a class named Target which holds the appropriate data for the targets, there are two constructors in Target, one is used to populate the objects array, getters and setters and fields are also present in the class.
Player class line 1, a class for the Player, the player class has getters and setters as well as custom methods, the class also has appropriate fields listed.


Part E2 - Mark (10 /10)
-----------------------------

Class bespoke methods:

scope.Display() on line 29 in the Scope class which is responsible for drawing the visual elements of the scope as well as other game related images, the function also handles the scope movement.
scope.scopeEdgeCollision() on line 44 in the Scope class, this method is responsible for making sure that the Scope doesn't half go off the screen or go 3/4 off the screen in the corner. The function checks to see if the scope has reached the edge 
                           of the screen and will set the scope position accordingly.
randomSpawn() on line 65 in the Target class, uses a timer or a detected hit to determine when the call the Spawn() method will be called. Without this function the Targets would not move.
target.targetCreation() on line 23 in the Target class, creates an object array of X targets and then goes to the targetX and targetY arrays to pull coordinates for each object created.


Methods with no return values: target.difficulty(), target.spawn(), scope.scopeEdgeDetection(), setScopeSize(), resetGame(), gameOver(), lifeCheck()

Methods with values: toString(), averageScore(), highestScore(), getScopeSize(),

Methods with parameters: setTarget(int select, int set) setSpawnTime(int spawnTime), setLive(int lives), setScore(int score)


Part E3 - Mark (10 /10)
-----------------------------

- The user-defined class(es) are used in an appropriate manner 

multiple declarations of user defined classes:
line 26 in the main class to declare a new Player object.
line 11 in the main class to declare a new target item.
line 26 in the target class to declare 7 new targets with a for loop.
line 22 in the main class to declare a new scope with passed in variables

getters/setters are used on
line 39 of the player class, when the set function is called on line 27 of the main class.
line 25 of the main class, the set function is called to prompt the user to input a number for the scopeSize field in Scope class.
line 86 & 87 in the main class, to set the private fields in the player class when a round ends.
line 26 in the main class to set up the base timer variable for the randomSpawn() function in the Target class.

default constructors used on lines
line 11 uses the target(){} constructor
line 26 uses the default player constructor

overloaded constructors used on lines
line 22 uses one the 3 overloaded constructors for the scope class.

------------------------
PART F - DATA STRUCTURES
------------------------

Part F1 - Mark (15 /20)
-----------------------------
- Use of a data structure to store information i.e. array

declared on line 17 & 18 of the Target class, which stores ints of coordinates for the Target object
initialized on line 17 & 18, the values are hard coded from the start as the spawn points can not be random otherwise they may get placed behind walls that can't be seen.
used on line 26 of the target class to populate the objects created by the object array with coordinates.

declared on line 14 the targets array is used to create 7 instances of the Target class.
initialized on line 24 the size is is set manually, more targets can be added but will need new spawn coordinates placed in the targetX and targetY array
used on line 26 of the target class to create the instances of the Target class and to pull coordinates.
used on line 91 where the length of the array will be used to generate a number which will display the corresponding target in the array on the game screen.
...

Part F2 - Mark (10 /20)
-----------------------------
- Calculations performed on the information stored

line 67 in the Player class checks to see if the score from the just completed round is higher then the last score stored in the scores array.
line 78 in the Player class looks at the sum of each score from the rounds played. 
...

FINAL CHECK:
I have checked the constraints and I am not breaking any constraints

*/

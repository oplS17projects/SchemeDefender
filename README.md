# SchemeDefender

### Statement
Scheme Defender is a Galaga style game developed in Racket. We are both very
interested in video games and find the thought of making a game not only
challenging but also entertaining. Through this project we hope to learn a
different approach to making various games through functional programming.

### Analysis
Explain what approaches from class you will bring to bear on the project.

Be explicit about the techiques from the class that you will use. For example:

- Will you use data abstraction? How?
- Will you use recursion? How?
- Will you use map/filter/reduce? How?
- Will you use object-orientation? How?
- Will you use functional approaches to processing your data? How?
- Will you use state-modification approaches? How? (If so, this should be encapsulated within objects. `set!` pretty much should only exist inside an object.)
- Will you build an expression evaluator, like we did in the symbolic differentatior and the metacircular evaluator?
- Will you use lazy evaluation approaches?

The idea here is to identify what ideas from the class you will use in carrying out your project.

**Your project will be graded, in part, by the extent to which you adopt approaches from the course into your implementation, _and_ your discussion about this.**

### Deliverable and Demonstration

### Evaluation of Results

## Architecture Diagram
![SchemeDefender](/SchemeDefender.png?raw=true "SchemeDefender")

The player will be able to move left and right and shoot towards the enemy ships.
The player's movement will be bounded by the edge of the window and will stop at
the edge of the window. Any collision between the player and an enemy will end
the game early. If the player destroys an enemy, the player's score will increase.

The enemy ships will continuously move down the screen and they will be destroyed if
the player shoots them or they will stop being tracked after they move past the
bottom of the screen. If the enemy moves past the bottom of the screen the player's
score will decrease. Enemies will not spawn on top of other enemy ships and their
starting locations will be spaced apart across the screen based on the width of
the image.

## Schedule
Explain how you will go from proposal to finished product.

There are three deliverable milestones to explicitly define, below.

The nature of deliverables depend on your project, but may include things like processed data ready for import, core algorithms implemented, interface design prototyped, etc.

You will be expected to turn in code, documentation, and data (as appropriate) at each of these stages.

Write concrete steps for your schedule to move from concept to working system.

### First Milestone (Sun Apr 9)

### Second Milestone (Sun Apr 16)

### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])

## Group Responsibilities

### Tim Larocque @timLarocque
For the first milestone, I will be working on finding images for the player and
enemies as well as getting the images to display to the screen.

For the second milestone, I will be working on getting the enemies to appear at
the top of the screen in random locations as well as implementing a map function
that will move every enemy downward. The enemies will be contained in a list that
the map will walk through and change the y-coordinate values of the images. The
number of enemies will be determined by the user when the game is launched; there
will be 3 different levels of difficulty: easy, normal, hard.

For the third milestone/Public Presentation, I will be working on having the game
work with File I/O to load high scores and having a live score on the screen
update as the player "destroys" an enemy or an enemy passes through the bottom
of the screen. The game will end once all enemies have been destroyed or have
passed the bottom of the screen.

### Shaquill "Sonny" Chea @cheapets
will work on...

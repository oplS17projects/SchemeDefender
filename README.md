# SchemeDefender

### Statement
Scheme Defender is a mimic of the classical game "Galaga", created in Racket.
Just like many of our peers, both of us are interested in video games and thought
it would be an excellent project to do. Not only did we want something that was
challenging, but entertaining as well. Through the development of this project
we learned a different approach to making various games through functional
programming.

### Analysis
From the numerous libraries available to us in Racket we decided on using the following:
- 2htdp/image: Assist with displaying Images/Sprites
- 2htdp/universe: Assist with interactions between the user and program
- GUI: Creating a friendly to use interface

The player interacts within a field of objects, the ship, enemies, and
missile projectiles. Each of the objects are manipulated via data abstraction.
For instance, the player ship has a constant (y) coordinate while the user
can change it's (x) coordinate with the right/left arrow keys. The (x) coordinate
has +1/-1 to it making the player ship move right/left based on the keyboard
input. The enemies that the player fights has a recursive procedure
implemented that allows them to be spawned continuously until they defeat the
player. They also move accordingly to the (x) & (y) coordinate plane.

Additional features include having a scoreboard to keep track of the how many
enemy ships the player shot down, and possibly having sound effects from the
play-sound library.

### Deliverable and Demonstration
Our goal is to have a functioning program that will simulate a "Galaga" like
game within the Racket language. This will be the result of combining various
libraries in order to complete each component of the game. During the presentation
we should be able to display a majority of the functions we planned on doing,
such as moving an Image/Sprite, spawning enemies, and firing missiles.

### Evaluation of Results
When the project is finished, the game should be able to run based on user decided
window size and difficulty, to appropriately create and destroy enemies, update
the player's score appropriately, and write-out the final score to a list of high scores.

## Architecture Diagram
![prototype](/prototype.png?raw=true "prototype")

![architectureDiagram](/architectureDiagram.png?raw=true "architectureDiagram")

The first diagram is a prototype of what we expect the game to look like once we
are done. The second diagram is the Architecture Diagram depicting how all of the
parts of the prototype will interact with each other.

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

### First Milestone (Sun Apr 9)
We had the basic foundation of our project running:
- Getting our Images/Sprite to Display properly
- Keyboard inputs/movement for the Images/Sprite
From this implementation we're able to build upon it even further.

### Second Milestone (Sun Apr 16)
Our secondary goal is implementing the follow:
- Window Collision
- Player/Enemies functioning

### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
By the time of presentation we should have the previous goals implemented into
the project, while finishing up our remaining one:
- Missile shooting/collision
An additional feature we want to include is a scoreboard, displaying High Scores
from the player.

## Group Responsibilities

### Tim Larocque @timLarocque
For the first milestone, I found some base images for the player and
enemies and got the images to display to the screen.

For the second milestone, I worked on getting the enemies to appear at
the top of the screen in random locations. The enemies are contained in a list that
the map will walk through and change the y-coordinate values of the images. The
number of enemies starts at one enemy at level one and the amount of enemies
increases by one every level. I used a map to increase the level and the speeds
of missiles, enemies, the player, and the rate at which the enemies decide to
proceed down the screen.

For the third milestone/Public Presentation, I will be worked on having a live
score on the screen update as the player "destroys" an enemy or an enemy passes
through the bottom of the screen. The game ends once an enemy has passed the
bottom of the screen.

A small bug in the code that we found and couldn't figure out how to fix was
that the missiles were not showing up properly. I thought this added a level
of complexity and difficulty to the game, so we decided to make this a feature,
not a bug.

### Shaquill "Sonny" Chea @cheapets
After planning out our steps for completing the project we decided to split up
the workload. The parts that I'll be working on are:

- Keyboard input/movement: Making the sprites move accordingly to the key you
  pressed. To accomplish this I plan on using the left/right arrow keys as the
  movement keys for the player spaceship.

- Window collision: Creating bounds within the display window that limits any
  Images/Sprites that we're using from going off the screen unless specified.
  Elaborating further form my Keyboard explanation, I decided to have boundaries from the display window.

- Missile shooting/collision: spawning missiles to "destroy" the enemy.

Fulfilling all parts of the plan would allow us to complete the project as
intended from the start. However just like other teams, we expect to run into
some obstacles while trying to accomplishing everything we need to do.

Overall we were able to accomplish most of what we intended to do, however as Tim mentioned we had a bug with
having the missile to display properly. 

# Scheme Defender

### Statement
Scheme Defender is a mimic of the classical game "Galaga", created in Racket.
Just like many of our peers, both of us are interested in video games and thought
it would be an excellent project to do. Not only did we want something that was
challenging, but entertaining as well. Through the development of this project
we learned a different approach to making various games through functional
programming.

### Libraries Used
- 2htdp/universe
- 2htdp/image
- RSound

We used the two 2htdp libraries to display and play the game. They allowed us to
utilize keyboard input and to use that input to update the game display.

### My Big Contribution
A small precursor to the contribution is the list that both of the below items
use and modify throughout the code:
```racket
;; list of speeds
(define speeds (list (cons 'player 25) ; player
                     15 ; missile
                     2 ; enemy
                     4)) ; attack
```

#### It's a map!
My biggest contribution, I feel was figuring out the map that is called between
every level, increasing the difficulty by increasing the speed of the enemy, the
player, the missile, and the chance of an attack. The list that is returned by
the map then replaces the previous speeds list. Below is that map within the
modification.
```racket
(set! speeds (map (λ (n) (cond
                           [(not (pair? n)) (+ n 1)]
                           [(equal? (car n) 'player) (cons 'player (+ (cdr n) 4))]))
                  speeds))
```
To expend on the cond statement a bit more, the first condition `(not (pair? n))`
is there because of the first item in the list. Initially, when I was making
the map, we wanted the player speed to increase at a faster rate than the rest
of the speeds, so I needed a symbol to be able to identify in the list what value
to increase more. The second condition `(equal? (car n) 'player)` checks for the
player symbol and allows for that different increase.

#### Data Abstraction
Additionally there is a level of data abstraction that I incorporated with the
speeds list. That abstraction is represented by the accessors that implemented
that are called throughout the code. Below are the accessors.
```racket
;; abstracting accessors for speeds
(define player (cdar speeds))
(define missile (cadr speeds))
(define enemy (caddr speeds))
(define attack (car (cdddr speeds))
```

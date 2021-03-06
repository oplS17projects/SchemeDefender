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

#### My Contribution

We were able to complete the "death" image as one of the earlier milestones.
```racket
(define (last-image m)
  (begin
    (set! background game-over-image)
    (communicator m)))
```

Here is a simple implementation of getting the missile's to move and display. We used a list to keep track of the speed in which
the missile traveled. 
```racket
;Displaying missile
(define (missile-appear x previous-missiles)
  (begin
    (projectile-fire)
    (cons
     (list x (- height 40))
     previous-missiles)))
	 
(define (display-missile b connect)
  (cond
    [(empty? b) (display-enemy connect)]
    [(cons? b)
     (place-image
      projectile
      (caar b)
      (cadar b)
      (display-missile (cdr b) connect))]
    [else "error"]))
```

One of the last things that we needed to do was to remove enemy objects from the world-structure. In other words, how did
we know that the missiles hit the enemy? I decided to use the Distances Formula from Calc II, which determines the distance between two
points: the missile(x1,y1) and enemy-ships(x1,y2).

### Distance Formula
![distance_formula](/distance_formula.png?raw=true "distance_formula")

```racket
(define (distance x1 x2)
  (sqrt (+ (sqr (- (car x2) (car x1)))
           (sqr (- (cadr x2) (cadr x2))))))
```

This goes hand in hand with the next function we decided to create, which was "contact". As the name implies we needed to determine if the
missile and enemy do hit. Which if the missile is in the same 'distance' the enemy should be destroyed and removed.
```racket
;Determining if the missile and enemy hit
(define (contact? a b)
  (cond
    [(<= (distance a b) range-right)
     (begin
       (explosion) #t)] [else #f]))
```
Afterwards, this lead into removing the enemy objects from the world itself. We created a procedure in which the condition was seeing if the
enemy is created or not, and if it is have conditions such as missile collision(removes the enemy and missile).

```racket
;Deletes and remove enemy objects
(define (enemy-remove enemy missile)
  (cond
    [(empty? enemy) empty]
    [(cons? enemy)
     (cond
       [(enemy-connect? (car enemy) missile) (enemy-remove (cdr enemy) missile)]
       [else (cons (car enemy) (enemy-remove (cdr enemy) missile))])]))

;Filtering objects
(define (enemy-connect? enemy missile)
  (cond
    [(empty? missile) #f]
    [else (or (contact? enemy (car missile)) (enemy-connect? enemy (cdr missile)))]))
```


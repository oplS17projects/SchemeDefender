#lang racket

;;Including the libraries we initially decided to use
(require 2htdp/image)
(require 2htdp/universe)
(require rsound)

;;Window Width
(define width 780)
;;Window Height
(define height 550)
;;Movement speed for Spaceship
(define player-ship-speed 25)
;;Movement speed for missiles
(define missile-speed 15)
;;Movement speed for Enemy
(define enemy-speed 2)
;;How fast the player will be able to fire
(define attack-speed 4)
;;Creating Missle Object
(define projectile (bitmap "image/missile.png"))
(define range-right 20)
;;Creating background image
(define background (bitmap "image/background.jpg"))
;;Game-over display image
(define game-over-image (bitmap "image/GG.png"))
;;Player ship
(define player-ship (bitmap "image/ship.png"))

;;Defining Enemey Objects
(define enemy (bitmap "image/enemy.jpg")) ;;lmao


;;Posibility of enemy attack
(define int(truncate(/ width attack-speed)))

;;Sound Functions
(define (projectile-fire) (rs-read "Tuturu.wav"))
(define (explosion) (rs-read "Tuturu.wav"))
(define (menu) (rs-read "Tuturu.wav"))

;;Level Design
(define level 1)
(define punctuation 0)

;;Changes the parameters of the game, increases the difficulty
(define (difficulty dif)
  (begin
    (set! player-ship-speed (+ player-ship-speed 4))
    (set! level (+ level 1))
    (set! attack-speed (+ attack-speed 1))
    (set! enemy-speed (+ enemy-speed 1))
    (set! missile-speed (+ missile-speed 1))
    (if
     (= level 5)
        (set! enemy enemy)
        ""
        )
     (* 20 (+ 1 (random level)))))

;;List of where enemies are kept
(define enemies
  (list
   (list (random width) 20 #t)
   (list (random width) 40 #f)
   (list (random width) 60 #t)
   (list (random width) 80 #f)))

;Send the list of enemies and add an enemy
(define (make-enemy en)
  (begin
    (set! enemies
          (cons
           (list (random width) (difficulty ";)") #t)
           enemies)) enemies))

;World
(define-struct world [player projectile-fire enemies])

;Displays the ship and sends data to "show-bullets"
(define (communicator m)
  (place-image
   player-ship
   (world-player m)
   (- height 5)
   (display-missile (world-projectile-fire m) (world-enemies m))))

;Shows bullets on screen and sends data to "aliens"
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

;Dosplaying enemys
(define (display-enemy b)
  (cond
    [(empty? b) (pop-up)]
    [(cons? b)
     (place-image
      enemy
      (caar b)
      (cadar b)
      (display-enemy (cdr b)))]
    [else "error"]))

(define (pop-up)
  (place-image
   (text
    (string-append "points: " (number->string punctuation)) 24 "blue") 700 40 background))

;Function that changes values, is used to update positions of objects
;also to create other objects in a timed way, the main function receives all the data of the game and sends them to other functions
;which modify the values to generate effects in the game

(define (moniter m)
  (cond
    [(not (cons? (world-enemies m)))
     (make-world
      (world-player m)
      empty
      (make-enemy (world-enemies m)))]
    ;runs the game normally
    [else
     (make-world
      (world-player m)
      (projectile-move (world-projectile-fire m))
      (enemy-move (enemy-remove (world-enemies m) (world-projectile-fire m))))]))

;Changing position of missiles
(define (projectile-move b)
  (cond
    [(empty? b) empty]
    [(> (cadar b) 20) empty]
    [(cons? b)
     (cons
      (list
       (caar b)
       (- (cadar b) missile-speed))
      (projectile-move (cdr b)))]))

;Changing position of enemy:
;The function looks for the aliens to fall at random
(define (enemy-move m)
  (cond
    ;Makes the enemy moves down
    [(empty? m) empty]
    [(number? (car (cddar m)))
     (cons
      (list
       (caar m)
       (+ (cadar m) enemy-speed)
       (car (cddar m)))
      (enemy-move (cdr m)))]
    ;Moves right
    [(car (cddar m))
     (cons
      (list
       (+ (caar m) enemy-speed)
       (+ (cadar m) 0)
       (if (> width (caar m))
           (if ( = 1 (random int))
               (+ 20 (random (- width 20))) #t) #f))
      (enemy-move (cdr m)))]
    ;Moves left
    [(not (car (cddar m)))
     (cons
      (list
       (- (caar m) enemy-speed)
       (+ (cadar m) 0)
       (if (> (caar m) 20)
           (if (= 1 (random int))
               (+ 20 (random (- width 20))) #f) #t))
      (enemy-move (cdr m)))]))

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

;Determining if the missile and enemy hit
(define (contact? a b)
  (cond
    [(<= (distance a b) range-right)
     (begin
       (set! punctuation (+ 10 punctuation))
       (explosion) #t)] [else #f]))

;Determining the distance of object
(define (distance x1 x2)
  (sqrt (+ (sqr (- (car x2) (car x1)))
           (sqr (- (cadr x2) (cadr x2))))))

;Keyboard defintion
(define (keyboard m key)
  (cond
    [(and (equal? key "left") (> (world-player m) 20))
     (make-world
      (- (world-player m) player-ship-speed)
      (world-projectile-fire m)
      (world-enemies m))]
    [(and (equal? key "right") (< (world-player m) (- width 20)))
     (make-world
      (+ (world-player m) player-ship-speed)
      (world-projectile-fire m)
      (world-enemies m))]
    [(equal? key " ")
     (make-world
      (world-player m)
      (missile-appear (world-player m) (world-projectile-fire m))
      (world-enemies m))]
    [else m]))

;Displaying missile
(define (missile-appear x previous-missiles)
  (begin
    (projectile-fire)
    (cons
     (list x (- height 40))
     previous-missiles)))

;Checking position of the enemy
(define (position? m)
  (position (world-enemies m)))

;Compares position of enemy
(define (position m)
  (cond
    [(empty? m) #f]
    [(> (cadar m) (- height 40)) #t]
    [#t (position (cdr m))]))

(define (last-image m)
  (begin
    (display "Final Level: ")
    (display level)
    (newline)
    (display "Final Score: ")
    (display punctuation)
    (newline)
    (set! background game-over-image)
    (communicator m)))

(define (start-game)
  (big-bang
   (make-world (/ width 2) empty enemies)
   [on-tick moniter]
   [to-draw communicator]
   [on-key keyboard]
   [stop-when position? last-image]))

(start-game)

#lang racket

;;Including the libraries we initially decided to use
(require 2htdp/image)
(require 2htdp/universe)
(require rsound)

;;Window Width
(define width 780)
;;Window Height
(define height 500)
;;Movement speed for Spaceship
(define player-ship-speed 25)
;;Movement speed for missiles
(define missle-speed 15)
;;Movement speed for Enemy
(define enemy-speed 6)
;;How fast the player will be able to fire
(define attack-speed 5)
;;Creating Missle Object
(define projectile (rectangle 5 10 "solid" "red"))
(define range-right 20)
;;Creating background image
(define background "")
;;Game-over display image
(define game-over-image "")
;;Player ship
(define player-ship "")
;;Defining Enemey Objects
(define enemy "")


;;Posibility of enemy attack
(define int(truncate(/ width attack-speed)))

;;Sound Functions
(define (projectile-fire) (rs-read ""))
(define (explosion) (rs-read ""))
(define (menu) (rs-read ""))

;;Level Design
(define level 1)
(define puntuacion 0)

;;Changes the parameters of the game, increases the difficulty

;;Enemy Parameters

;;List of where enemies are kept
(define enemies
  (list
   (list (random width) 20 #t)
   (list (random width) 40 #f)
   (list (random width) 60 #t)
   (list (random width) 80 #f)))


;;Function that changes values, is used to update objects
;;Also to create other objects in a timed manner
;;.the main function receives all the data of the game and sends them to other functions
;;That modify the values to generate effects in the game.
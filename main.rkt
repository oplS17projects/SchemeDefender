#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define (create-player-scene height)
  (underlay/xy (rectangle 600 600 "solid" "black") 50 400 player))

(define player
  (star-polygon 40 9 5 "solid" "white"))

(animate create-player-scene)
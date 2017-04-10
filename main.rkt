#lang racket

(require 2htdp/image)
(require 2htdp/universe)

;;Background
(define w-bg 500)
(define h-bg 500)
(define blank-bg (rectangle w-bg h-bg "outline" "blue"))

;;Creating parameters for Defender
(define image (bitmap "image.jpg"))
(define mov 10)
(define x-pos 250)
(define y-pos 450)
(define left-side (/ (image-width image) 2))
(define right-side (- w-bg (/ (image-width image) 2)))
(define defender-init x-pos)


;; defender-key: Defender Key -> Defender
; calculates the state following the given state if given key is pressed
(define (defender-key current key)
  (cond
    [(string=? key "left") (move-left current)]
    [(string=? key "right") (move-right current)]
    [else current]
    ))
(check-expect (defender-key 100 "left") (- 100 DEF_SPEED))
(check-expect (defender-key 100 "right") (+ 100 DEF_SPEED))

;;Creating left boundries
(define (touch-left-wall? current) 
  (<= current left-side)
  )
(check-expect (touch-left-wall? left-side) true)
(check-expect (touch-left-wall? 200) false)

;;Creating right boundries
(define (touch-right-wall? current) 
  (cond
    [(>= current right-side) true]
    [else false]
    ))
(check-expect (touch-right-wall? 10) false)
(check-expect (touch-right-wall? right-side) true)

;;Movement key for Right arrow
(define (move-left current)
  (if (touch-left-wall? current)
      current
      (- current mov) 
      ))
(check-expect (move-left 200) (- 200 mov))
(check-expect (move-left left-side) left-side)

;;Movement key for Left arrow
(define (move-right current)
  (if (touch-right-wall? current)
      current
      (+ current mov)
      ))
(check-expect (move-right 10) (+ 10 mov))
(check-expect (move-right right-side) right-side)

;;Displays the image
(define (defender-render current)
  (place-image image
               current
               y-pos
               blank-bg))




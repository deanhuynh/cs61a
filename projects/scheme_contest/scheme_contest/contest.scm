;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Aloha
;;;
;;; Description:
;;;		Warm summer breeze blows
;;;		Palm trees sway in lively dance
;;;		Life in a sweet dream

(define (draw)
	(define (draw-pattern r g b count x y flower)
		(cond 
			((< count 25)
				((begin
				(penup)
				(setposition x y)
				(color (rgb (/ r 255) (/ g 255) (/ b 255)))
		  		(pendown)
		  		(begin_fill)
		  		(circle 250 80)
		  		(left 15)
		  		(end_fill)
		  		(draw-pattern r (+ g 10) b (+ count 1) x y flower))))
	  		((= flower 0)
	  			(draw-pattern 100 0 0 1 (- 150) (- 150) 1))

	  		)
	  	)

  	
  (speed 0)
  (bgcolor (rgb .529 .808 .980))
  (draw-pattern 255 0 0 1 150 150 0)
  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
;; Scheme ;;
(define (compose-all funcs)
	(if (null? funcs)
		(lambda (x) (x))
		(lambda (x) ((car funcs) ((compose-helper (cdr funcs)) x)))
	)
)

(define (deep-map fn s)
 	(cond ((null? s) nil)
 		((list? (car s))(cons (deep-map fn (car s)) (deep-map fn (cdr s))))
 		(else (cons (fn (car s)) (deep-map fn (cdr s))))
 	)
)

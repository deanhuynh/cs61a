(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
  (cond
    ((< x 0)-1)
    ((> x 0) 1)
    (else 0)
  )
)

(define (square x) (* x x))

(define (pow b n)
  (cond
    ((= n 1) b)
    ((odd? n)(* b (square (pow b (/ (- n 1) 2)))))
    (else (square (pow b (/ n 2))))
  )
)

(define (ordered? s)
  (cond
    ((null? (cdr s)) True)
    ((> (car s) (cadr s)) False)
    (else (ordered? (cdr s)))
  )
)

(define (nodots s)
  (if
    (pair? (car s))
    ()

  )
  (if
    (pair? (cdr s))
    (nodots (cdr s))
    (if
      (null? (cdr s))
      nil
      (cons cdr nil)
    )
  )
)
(cons (car s))
; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) #f)
          ((> (car s) v) #f)
          ((= (car s) v) #t)
          (else (contains? (cdr s) v)) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
          ((empty? v) (list s))
          ((> (car s) (car v))(cons (car v) (add s (cdr v))))
          ((< (car s) (car v))(cons (car s)(add (cdr s) v)))
          (else (cons (car v) (add (cdr s) (cdr v)))) ; replace this line
    )
)

(define (intersect s t)
    (cond ((or (empty? s) (empty? t)) nil)
          'YOUR-CODE-HERE
          (else nil) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond ((empty? s) t)
          ((empty? t) s)
          'YOUR-CODE-HERE
          (else nil) ; replace this line
          ))
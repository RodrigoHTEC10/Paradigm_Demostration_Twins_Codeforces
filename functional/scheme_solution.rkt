;;Author: Rodrigo Alejandro Hurtado Cortes
;;Title: Functional paradigm: Twins Codeforces 160A
;;Date: May 18th,2026

;;Input obtention.
  ;; Input form:
  ;; x
  ;; n m ... t

;; Where:
  ;; x = number of elements in the second line
  ;; n m ... t = list of numbers



#lang racket

(provide main)

;; ==================== Definition of functions ====================

;; -------------------- Input checking functions --------------------

;;Auxiliar function number
;;   Checks if the number of elements in the list is equal to
;;   given parameter n.

(define (number list n count)
  (cond
    [(empty? list) (cond
                     [(= count n) true]
                     [else false]
                     )
                   ]
    [(in-range (first list)) (number (rest list) n (+ count 1))]
    [else false]
    )
  )

;;Auxiliar function in-range
;;   Checks if 1<= num <=100

(define (in-range num)
  (cond
    [(and (<= num 100) (>= num 1)) true]
    [else false]))

;; -------------------- Quick sort functions --------------------

;;Auxiliar function invert
;;   Function responsible for inverting the order of the given
;;   list.

(define (invert a)
  (invert-inner a '()))

(define (invert-inner a b)
  (cond [(empty? a) b]
        [else (invert-inner (rest a) (cons (first a) b))]
        )
  )


;;Auxiliar function is_larger
;;   Function responsible for returing a boolean if a > b. 

(define (is_larger a b)
  (cond
    [(> a b) true]
    [else false]))


;;Auxiliar function is_lesser
;;   Function responsible for returing a boolean if a < b.

(define (is_lesser a b)
  (cond
    [(< a b) true]
    [else false]))


;;Auxiliar function is_equal
;;   Function responsible for returing a boolean if a = b.

(define (is_equal a b)
  (cond
    [(= a b) true]
    [else false]))



;;Auxiliar function larger-items
;;   Recursive function responsible for returning a list with all numbers from the list
;;   list that are larger than the number t.

(define (larger-items list t)
  (inner-larger list '() t))

;;inner-larger function

(define (inner-larger list myl t)
  (cond
    [(empty? list) (invert myl)]
    [(is_larger (first list) t) (inner-larger (rest list) (cons (first list) myl) t) ]
    [else (inner-larger (rest list) myl t)]
    )
  )


;;Auxiliar function equal-items
;;   Recursive function responsible for returning a list with all numbers from the list
;;   list that are equal to the number t.

(define (equal-items list t)
  (inner-equal list '() t))

;;inner-equal function

(define (inner-equal list myl t)
  (cond
    [(empty? list) myl]
    [(is_equal (first list) t) (inner-equal (rest list) (cons (first list) myl) t) ]
    [else (inner-equal (rest list) myl t)]
    )
  )


;;Auxiliar function Lesser Items
;;   Recursive function responsible for returning a list with all numbers from the list
;;   list that are less than the number t.

(define (lesser-items list t)
  (inner-lesser list '() t))

;;inner-lesser function

(define (inner-lesser list myl t)
  (cond
    [(empty? list) (invert myl)]
    [(is_lesser (first list) t) (inner-lesser (rest list) (cons (first list) myl) t) ]
    [else (inner-lesser (rest list) myl t)]
    )
  )


;;Auxiliar function Append list
;;   Function responsible for returning a list that contains all elements in order of
;;   the given lists a and b.

(define (append_lists a b)
 (cond [(empty? a) b]
       [else (cons (first a) (append (rest a) b))]
       )
  ) 


;;Quick sort
;;   Recursive function responsible for retuning the given list in descending order making use of
;;   all the previously designed functions.

(define (quick-sort list)
  (cond
    [(empty? list) list]
    [else (append_lists (append_lists
           (quick-sort (larger-items list (first list)))
           (equal-items list (first list)))
           (quick-sort (lesser-items list (first list))))]
    )
  )


;; -------------------- Sum Comparison Functions --------------------
;;Auxiliar function sum_list
;;   Recursive function responsible for adding all inner elements of the
;;   given list.

(define (sum-list list)
  (inner-sum list 0)
  )


;;inner-sum function
(define (inner-sum list sum)
  (cond
    [(empty? list) sum]
    [else (inner-sum (rest list) (+ sum (first list)))]
    )
  )

;; -------------------- Coins function --------------------


;;Function coins
;;   Function that checks if the given inputs (number and list) is within given range
;;   and correct between them, before calling the auxiliar function coins-aux with the
;;   list being sorted in descending order; otherwise returnining 0.

(define (coins list n)
  (if (and (number list n 0) (in-range n)) (coins-aux (quick-sort list) 0 empty) 0)
  )

;;Function coins-aux
;;   Recursive function responsible for comparing the given lists and returning the number
;;   of coins necessary for the list1 being slighty grater than the list. Otherwise, passing
;;   one element of list to list1 at a time.

(define (coins-aux list number list1)
  (cond
       [(empty? list) number]
       [(> (sum-list list1) (sum-list list)) number]
       [else (coins-aux (rest list) (+ number 1) (cons (first list) list1))]
       )
  )

;; ===========================================================

;; -------------------- Program --------------------

(define (main)
  (define n (read-line))
  (define list-text (read-line))

  ;;Conversion of input x to number
  (define num (string->number n))

  ;;Convertion of second line into scheme list of numbers
  (define list (map string->number (string-split list-text)))

  ;;Usage of the main function coins
  (coins list num)
)

(module+ main
  (main))

;;Author: Rodrigo Alejandro Hurtado Cortes
;;Title: Scheme Testing File
;;Date: May 18th,2026

#lang racket

;;Import of rackunit: A unit testing libraby

(require rackunit)

;;Import of the solution file: scheme_solution.rkt

(require "scheme_solution.rkt")

;;List of test-cases with input and expected results

(define test-cases
  (list
   (list "2\n3 3\n"   2)
   (list "4\n3 1 2 3\n" 2)
   (list "5\n5 5 5 5 5\n" 3)
   ))


;;Testing mechanism function that runs the list and prints
;;feedback messages based on the given and expected solution.

(define (run-with-input input)
  (with-input-from-string input main))

(for-each
 (lambda (tc)
   (define result (run-with-input (first tc)))
   (define expected (second tc))
   (if (equal? result expected)
       (displayln (string-append "SUCCESS expected: " (number->string expected)))
       (displayln (string-append "FAIL | input: " (first tc)
                                 "expected: " (number->string expected)
                                 " got: "     (number->string result)))))
 test-cases)

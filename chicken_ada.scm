(import (chicken foreign))

;; Importing from Ada
(define hello-in-ada
  (foreign-safe-lambda void "hello_ada" int))
;; (define libinit
;;   (foreign-safe-lambda void "scheme_helloinit"))
;; (define libfinal
;;   (foreign-safe-lambda void "scheme_hellofinal"))

;; Callable from the outside, returns an int
(define-external
  (hello_scheme
   (c-string message))
  int

  (print "\nHello from Scheme! The message was: \n")
  (print message)
  (print "\nThe message length was:" (string-length message))
  (string-length message)

  )

;;(libinit)
(hello-in-ada 1337)
;;(libfinal)

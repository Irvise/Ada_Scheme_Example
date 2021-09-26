(import (chicken foreign))

;; Importing from Ada
(define hello-in-ada
  (foreign-safe-lambda void "hello_ada" int))

;;;;;;;
;; These functions are only needed if you are doing launching
;; tasks and they require some special treatmen (ala advance IPC).
;; The structure of this two functions is as layed below, however,
;; the name depends on the name of the library. In our case they
;; are scheme_hello{init,final}
;;;;;;;

;; (define libinit
;;   (foreign-safe-lambda void "scheme_helloinit"))
;; (define libfinal
;;   (foreign-safe-lambda void "scheme_hellofinal"))

;; Exporting from Chicken Scheme
;; Callable from the outside, returns an int
(define-external
  (hello_scheme
   (c-string message))
  int

  (print "\nHello from Scheme! The message was: \n")
  (print message)
  (print "\nThe message length was: " (string-length message) "\n")
  (string-length message)

  )

;;(libinit)
(hello-in-ada 1337)
;;(libfinal)

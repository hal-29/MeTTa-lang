; Length of a list
(= (length ()) 0)
(= (length (:: $x $xs)) (+ 1 (length $xs)))

; Check if an element is a member of the list
(= (is-member $x ()) False)
(= (is-member $x (:: $x $xs)) True)
(= (is-member $x (:: $y $xs)) (is-member $x $xs))

; Append two lists
(= (append () $ys) $ys)
(= (append (:: $x $xs) $ys) (:: $x (append $xs $ys)))

; Find the maximum value in a list
(= (max-value (:: $x ())) $x)
(= (max-value (:: $x (:: $y $xs)))
   (if (> $x $y)
       (max-value (:: $x $xs))
       (max-value (:: $y $xs))))

; Find the minimum value in a list
(= (min-value (:: $x ())) $x)
(= (min-value (:: $x (:: $y $xs)))
   (if (< $x $y)
       (min-value (:: $x $xs))
       (min-value (:: $y $xs))))

; Push an element to the front of the list
(= (push $x $xs) (:: $x $xs))

; Pop the first element from the list
(= (pop (:: $x $xs)) $xs)
(= (pop ()) ())

; Remove the first occurrence of an element
(= (remove-element $x ()) ())
(= (remove-element $x (:: $x $xs)) $xs)
(= (remove-element $x (:: $y $xs)) (:: $y (remove-element $x $xs)))

; Remove duplicate elements
(= (remove-duplicate ()) ())
(= (remove-duplicate (:: $x $xs))
   (if (is-member $x $xs)
       (remove-duplicate $xs)
       (:: $x (remove-duplicate $xs))))


; Map a function over a list
(= (multiply-by-2 $x) (* $x 2))
(= (map-multiply-by-2 ()) ())
(= (map-multiply-by-2 (:: $x $xs)) (:: (multiply-by-2 $x) (map-multiply-by-2 $xs)))


; Filter a list based on the condition > 1
(= (greater-than-1 $x) (> $x 1))
(= (filter-greater-than-1 ()) ())
(= (filter-greater-than-1 (:: $x $xs))
   (if (greater-than-1 $x)
       (:: $x (filter-greater-than-1 $xs))
       (filter-greater-than-1 $xs)))

;helper function for folding
(= (add $a $b) (+ $a $b))

; Fold left
(= (foldl-add $acc ()) $acc)
(= (foldl-add $acc (:: $x $xs))
   (foldl-add (add $acc $x) $xs))

; Fold right
(= (foldr-add () $acc) $acc)
(= (foldr-add (:: $x $xs) $acc)
   (add $x (foldr-add $xs $acc)))

; Reverse a list
(= (reverse ()) ())
(= (reverse (:: $x $xs)) (append (reverse $xs) (:: $x ())))

; Insertion sort helper
(= (insert $x ()) (:: $x ()))
(= (insert $x (:: $y $ys))
   (if (< $x $y)
       (:: $x (:: $y $ys))
       (:: $y (insert $x $ys))))

; Sort a list
(= (sort ()) ())
(= (sort (:: $x $xs)) (insert $x (sort $xs)))


! (length (:: 1 (:: 2 (:: 3 ()))))          ; 3
! (is-member 2 (:: 1 (:: 2 (:: 3 ()))))     ; True
! (append (:: 1 (:: 2 ())) (:: 3 (:: 4 ()))) ; (:: 1 (:: 2 (:: 3 (:: 4 ()))))
! (max-value (:: 3 (:: 7 (:: 2 ()))))       ; 7
! (min-value (:: 3 (:: 7 (:: 2 ()))))       ; 2
! (push 5 (:: 1 (:: 2 ())))                 ; (:: 5 (:: 1 (:: 2 ())))
! (pop (:: 1 (:: 2 (:: 3 ()))))             ; (:: 2 (:: 3 ()))
! (remove-element 2 (:: 1 (:: 2 (:: 3 ())))) ; (:: 1 (:: 3 ()))
! (remove-duplicate (:: 1 (:: 2 (:: 1 (:: 3 (:: 2 ())))))) ; (:: 1 (:: 2 (:: 3 ())))
! (map-multiply-by-2 (:: 1 (:: 2 (:: 3 ())))) ; (:: 2 (:: 4 (:: 6 ())))
! (filter-greater-than-1 (:: 1 (:: 2 (:: 3 ())))) ; (:: 2 (:: 3 ()))
! (foldl-add 0 (:: 1 (:: 2 (:: 3 ()))))    ; 6
! (foldr-add (:: 1 (:: 2 (:: 3 ()))) 0)    ; 6
! (reverse (:: 1 (:: 2 (:: 3 ()))))         ; (:: 3 (:: 2 (:: 1 ())))
! (sort (:: 3 (:: 1 (:: 4 (:: 2 ())))))     ; (:: 1 (:: 2 (:: 3 (:: 4 ()))))


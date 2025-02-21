; Define an empty tree
(= (empty) ())

; Define a binary tree node
(= (node $value $left $right)
   (:: $value (:: $left (:: $right ()))))

; Example: Create a binary tree
(= (example-tree)
   (node "A"
      (node "B"
         (empty)
         (node "C" (empty) (empty)))
      (node "D"
         (node "E" (empty) (empty))
         (empty)))
)

! (example-tree)
;; Define a binary tree node
(: node
   (value any)
   (left (optional node))
   (right (optional node))
)

;; Example of creating a binary tree
(def my_tree
   (node 1
      (node 2
         (node 4 nil nil)
         (node 5 nil nil)
      )
      (node 3
         (node 6 nil nil)
         (node 7 nil nil)
      )
   )
)

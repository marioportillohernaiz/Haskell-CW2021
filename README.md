# Haskell-CW
Haskell CW 21COA108

Coursework for semester 1 year 2021 at Loughborough University.
The coursework consisted of 5 questions, the first question which consisted of writing an essay on Functional Programming like questions and the other 
4 on Haskell Programming language. The following questiosn were:

Part 1. (10 + 10 + 5 = 25 marks)
a) Explain three real world applications developed with Haskell.
b) List and explain four benefits that Functional Programming brings to programmers.
c) Explain in your own words what a (mathematical) function is and discuss to what extent Haskell functions resemble mathematical functions (use examples 
to support your answer).

Part 2. (4 + 4 + 4 + 4 + 4 = 20 marks)
a) Define the type Dog which is a 2-tuple consisting of a String (the dog’s name) and an Int (the dog’s height in centimetres).
b) Write a function create_dog_list :: [String] -> [Int] -> [Dog] that gets a list of names and a list of heights and pairs them one by one to create a 
list of Dogs.
c) Write a function sort_dog_list :: [Dog] -> [Dog] that sorts a list of Dogs by their height in ascending order.
Hint: You can alter merge_sort or quick_sort from the lecture.
d) Write a function remove_smallest_dogs :: Int -> [Dog] -> [Dog] that gets an integer k and a list of Dogs and removes the k smallest Dogs from that list. 
(You are allowed to change the order of the Dogs in the resulting list.)
e) Write a function remove_tall_dogs :: [Dog] -> [Dog] that removes all Dogs from a list of Dogs that are taller than 80cm. To get full marks, use 
list comprehension.

Part 3. (15 + 15 = 30 marks)
(a) Define a function steps that takes three positive Int values m n p and returns a String that can be displayed as p steps, of height m and width n+n 
(n spaces followed by n asterisks), the right way up, and repeats the pattern in opposite way, e.g.
Main> putStr (steps 2 3 4)
   ***
   ***
      ******
      ******
         *********
         *********
            ************
            ************
            ************
            ************
         *********
         *********
      ******
      ******
   ***
   ***
   
(b) Define a function flagpattern that takes two positive Int values n greater than or equal to 5, and m greater than or equal to 1, and returns a String 
that can be displayed as the following m 'flag' patterns of dimension n, e.g.
Main> putStr(flagpattern 9 2)
*********
*+     +*
* +   + *
*  + +  *
*   +   *
*  + +  *
* +   + *
*+     +*
*********
*********
*+     +*
* +   + *
*  + +  *
*   +   *
*  + +  *
* +   + *
*+     +*
*********

Part 4. (15 marks)
Define a function compatibility, that takes two String values representing persons names, and outputs their compatibility calculated as follows, e.g.
FREDA FICKLE
BOB BEERGUT
Repeatedly cross out like characters:
FR*DA FICKLE
BOB B*ERGUT

 FR*DA FICKL*
 BOB B**RGUT
 F**DA FICKL*
 BOB B***GUT
Then apply lahi lahi lahi... in rotation thus:
F**DA FICKL*
l a h i l a h i
BOB B***GUT
l a h i l a h

This means that FREDA FICKLE is indifferent to BOB BEERGUT,
whereas BOB BEERGUT hates FREDA FICKLE
(l=like, a=admire, h=hate, i=indifferent).
Main> compatibility "FREDA FICKLE" "BOB BEERGUT"
"FREDA FICKLE is indifferent to BOB BEERGUT and BOB BEERGUT hates FREDA FICKLE"

Part 5. (10 marks)
Define a polymorphic function nsplit that is applied to two arguments of types [a] and a, where a is a type on which == is defined, and partitions 
the original list at occurrences of the second argument and returns a list of int values of the number of elements for each part, e.g.
Main> nsplit [1,2,3,0,4,5,0,0,7,8,9,0] 0
[3,2,3]
Main> nsplit "Haskell is a purely functional programming language" 'a'
[1,9,16,7,7,3,2]

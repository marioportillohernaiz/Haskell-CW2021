--Mario Portillo Hernaiz F118326
--Semester 1 Funtional Programming

------ PART 1a -------------------------------------------
{-
Haskell, a functional programming language has been used widely across the world and in various big-named companies. 
One of which is "Sigma" by the well-known company "Facebook". This being their main weapon to fight against fraud 
and spam, Facebook decided to redesign it due to their own language was slow and lacked important modules. Therefore, 
they switched from their main language (FXL) to Haskell. Haskell helped in various ways, it was purely functional and 
strongly typed meaning it helped testing in isolation for bugs, time delay decreased drastically which enabled them 
to update policies quicker, and also immediate interaction to see how the program worked. This created a more robust 
system for a large company such as Facebook.

Another widely used application is “Cardano Settlement Layer”. This public blockchain and cryptocurrency clearly 
separates blockchain into to two layers, coin distribution and the creation of contracts between each distribution. 
Haskell being a functional programming language is well-suited for programs that require high level of formal verification. 
Using Haskell, Cardano’s contracts are able to offer high level of assurance leading to a safer and more trustworthy way 
of distributing coins.

Lastly but not least, another widely used application is “Hasura”, an instant real time Graph API engine. Hasura used 
Haskell as the core programming language to build the application as it was an advanced purely functional programming 
language which allows rapid development of robust and concise software, and which has wide libraries and active community.
-}
------ PART 1b -------------------------------------------
{-
Functional programming is just a way of coding using just functions. Even though this might sound like it can have 
bad effects on your code, it brings may benefits, some of which are; Functional programming leads to less bugs, this 
is because it is a mapping of one to one functions meaning one input leads to one output. This makes it easier to 
track and test each individual function to check that the input gives the desired output. Also, generally, pure 
functions are better than impure functions this is because pure functions return a value which is the same as the 
same argument, there is no variation between local and global variables. It also means that the state of the outside 
program is not altered. 

Another benefit is that concurrency is easier to keep safe, this means that two concurrent processes cannot access the 
data at the same time. This is one of the hardest bugs to pin down and functional programming fixes this. This also 
means the compiler is taking care of most of the operations, such as the iterator in a loop, so it doesn’t have to be 
manually set up. Lastly, brevity is one of the main benefits of Functional Programming, this means it uses concise and 
the exact use of words to create a program. This helps the programmer to easily read and understand the code as it doesn’t 
have multiple meanings.
-}
------ PART 1c -------------------------------------------
{-
A mathematical function is described as a relationship that maps one element in a set to another element. This means that
one input has one exact output. Say for example the mathematical function,
f(x) = x + 2
for every element that is inputted in the function, it will be added by 2. So, if we enter for example, 1, the only output
would be 3. This is very similar to Haskell functions as they receive an input, do some sort of calculation to then return 
a specific output.

Another point to make is that Haskell is a purely functional programming language which is closer to mathematical functions 
compared to high level languages. On the contrary, mathematical functions only work with numbers and/or variables whereas 
Haskell functions are able to work with other types of values such as Boolean, Strings, Characters, etc. For example, as the 
questions below show, it is possible to replicate the character “*” multiple times to create a list and then turn it into a 
string.

In conclusion, Haskell functions create a mapping from one input to one output which resembles a mathematical function. 
-}
------ PART 2a -------------------------------------------

type Dog = (String, Int)			-- Dog type easily definied using "type" equals to a tuple conaining a String and an Integer.

------ PART 2b -------------------------------------------

create_dog_list::[String]->[Int]->[Dog]
create_dog_list [] [] = []
create_dog_list x y = zip x y			-- The zip function allows 2 lists to be joined as tuples.

------ PART 2c -------------------------------------------

sort_dog_list::[Dog]->[Dog]
sort_dog_list [] = []
sort_dog_list (x:xs) = sort_dog_list[n | n <-xs, snd n <= snd (x)] ++ [x] ++ sort_dog_list[n | n <-xs, snd n > snd (x)]

{- Using list comprehension we can create a quick sort (as shown in the lectures). The first tuple will be placed in the middle, 
and so the second element of the next tuple will be compared to the second element of the first tuple. If it is smaller, it will be
placed up front the list (to the left) otherwise it will be placed at the back of the list (to the right). This loop will be repeated
with all the elements in the list. -}

------ PART 2d -------------------------------------------

remove_smallest_dogs::Int->[Dog]->[Dog]
remove_smallest_dogs x [] = []
remove_smallest_dogs x y = drop x (sort_dog_list y)	
	
{- Using the sorted Dog list from the previous quesiton (where the smallest dog is at the front), we can now use the "drop" function 
to remove x number of dogs from the front of the list, and thus removing the smallest dogs. -}

------ PART 2e -------------------------------------------

remove_tall_dogs::[Dog]->[Dog]
remove_tall_dogs x = [n | n <-x, snd n <= 80]

-- Using list comprehension again we can loop through each item in the list

------ PART 3a -------------------------------------------

width::Int->[Char]
width n = (replicate n '*' ++ "\n")
-- Here we create each width of each step

height::Int->[Char]->[Char]
height m n = concat (replicate m n)
-- In this function we create the height of each step

spaces::Int->[Char]
spaces a = (replicate a ' ')
-- Here we make the spaces that creates the piramid 

stepsList::Int->Int->Int->String
stepsList m n 0 = []
stepsList m n p = height m (spaces (n*p) ++ width (n*p)) ++ stepsList m n (p-1)
{- This function is used to create half of the whole steps function by joining the functions above
and recursively looping through -}

reverseList::Int->Int->Int->String
reverseList m n 0 = []
reverseList m n p = reverseList m n (p-1) ++ height m (spaces (n*p) ++ width (n*p))
{- This function is used to create the other half of the steps but on reverse -}

steps::Int->Int->Int->String
steps m n 0 = []
steps m n p = (reverseList m n p) ++ (stepsList m n p)
-- Finally we join both the steps list and the reverse list to create the steps 

------ PART 3b -------------------------------------------

getSpaces::Int->Int
getSpaces n = n-2
{- I created this function because otherwise "a" will be changed along the "reverseLines". This way
"a" will alsways be -2 and not something like (a-2-2-2) -}

reverseLines::Int->Int->String
reverseLines 0 c = []
reverseLines a c 
	| a == 1 = (replicate c '*' ++ "\n")
	| otherwise = (("*" ++ (replicate (getSpaces a) ' ') ++ "+" ++ (replicate ((c-4) - (getSpaces a)- (getSpaces a)) ' ') ++ "+" ++ (replicate (getSpaces a) ' ') ++ "*")++ "\n") ++ reverseLines (a-1) c

{- Using guards, if "a" is 1 it means its the last line and so it should replicate "*", "c" times. Otherwise it will create every
other line. The way it does this by appending "*" to each side and then creating the spaces between each "*" and each "+". I came to 
this conclusion using a pattern which repeats for every step. Let me do an example to demonstrate using "reverseLines 4 8" ("a" is
4 as the value from "evenOrOdd 8 8" divides "a" by 2) Also, "a" recursively changes -1 until 1.
* _ _ + + _ _ *		(*) plus (Spaces are replicated (4-2)=2) plus (+) plus (spaces replicated (8-4)-(4-2)-(4-2)=0) plus (+) plus ... 
* _ + _ _ + _ *		(*) plus (Spaces are replicated (3-2)=1) plus (+) plus (spaces replicated (8-4)-(3-2)-(3-2)=2) plus (+) plus ...     
* + _ _ _ _ + *		(*) plus (Spaces are replicated (2-2)=0) plus (+) plus (spaces replicated (8-4)-(2-2)-(2-2)=4) plus (+) plus ... 
* * * * * * * *		and so when "a"=1, "*" will be replicated "c" times -}


nonReverseLines::Int->Int->String
nonReverseLines 0 c = []
nonReverseLines a c 
	| a == (c `div` 2) = (replicate c '*' ++ "\n") ++ nonReverseLines (a-1) c
	|otherwise = nonReverseLines (a-1) c ++ (("*" ++ (replicate (getSpaces (a+1)) ' ') ++ "+" ++ (replicate ((c-4) - (getSpaces (a+1))- (getSpaces (a+1))) ' ') ++ "+" ++ (replicate (getSpaces (a+1)) ' ') ++ "*")++ "\n")
{-The pattern used in this function is similar to the one above, but in reverse-}

evenOrOdd::Int->Int->String
evenOrOdd a c
	| a `mod` 2 == 0 = (nonReverseLines (a `div` 2) c) ++ (reverseLines (a `div` 2) c)
	| otherwise = (nonReverseLines ((a-1) `div` 2) c) ++ ("*" ++ (replicate ((a-3) `div` 2) ' ') ++ "+" ++ (replicate ((a-3) `div` 2) ' ') ++ "*" ++ "\n") ++ (reverseLines ((a-1) `div` 2) c)
{-In this function I check that the input is either even or odd. If its even it can simply follow the functions avobe to create the flag.
Otherwise, it will need to add the middle line (example: "*   +   *"). The spaced are worked out by having (a-3) which are the 3 
characters, "*", "+", and "*" and then divide it by 2 as the spaces are in both sides of the "+"-}

flagpattern::Int->Int->String
flagpattern 0 b = []
flagpattern a b = concat (replicate b (evenOrOdd a a))
{- Finaly the pattern is created by calling the above funtions and replicating it "b" times. "evenOrOdd" sends the same value 
"a" twice just so that I can change one and keep the other the same. This helps when recursively calling each line -}

------ PART 4 -------------------------------------------


------ PART 5 -------------------------------------------


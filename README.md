# Evidence: Demostration of a Programming Paradigm - TC2037 - Group 603

Author: Rodrigo Alejandro Hurtado Cortés - A01713854

Date: May 19th, 2026

<br>

# Introduction

A **paradigm** is defined as a distinct set of concepts, theories, and standards that form a framework for how a community or individual perceives reality. Similarly, a **programming paradigm** is a set of patterns, practices, and approaches toward solving a problem through a program in a structured way that requires thinking about it in a particular manner, making use of certain languages that support the logic behind the solution.

Nowadays, the adoption of different paradigms helps programmers **solve problems more effectively by considering different perspectives**, being able to think in different ways, and adapting tools and languages to their own ideas. However, it is important to notice that their use also imposes a series of constraints, both theoretically and practically, leading to a more or less pure paradigm approach.

The property of languages to support either a single or multiple paradigms provides a broad availability of several languages for programmers depending on their needs and specific problems. Programming languages evolve and may become more or less aligned with certain paradigms, allowing developers to make trade-offs while trying to obtain as many advantages from paradigms as possible.

This work presents the solution to a problem using two different paradigms apart from the traditional sequential and imperative paradigms, not only to show the possibility of their implementation but also to compare their characteristics and determine a better approach for solving the problem.

# 160 A. Twins 

<div align=center>
time limit per test - 2 seconds

memory limit per test - 256 megabytes
</div>

Imagine that you have a twin brother or sister. Having another person that looks exactly like you seems very unusual. It's hard to say if having something of an alter ego is good or bad. And if you do have a twin, then you very well know what it's like.

Now let's imagine a typical morning in your family. You haven't woken up yet, and Mom is already going to work. She has been so hasty that she has nearly forgotten to leave the two of her darling children some money to buy lunches in the school cafeteria. She fished in the purse and found some number of coins, or to be exact, n coins of arbitrary values a1, a2, ..., an. But as Mom was running out of time, she didn't split the coins for you two. So she scribbled a note asking you to split the money equally.

As you woke up, you found Mom's coins and read her note. "But why split the money equally?" — you thought. After all, your twin is sleeping and he won't know anything. So you decided to act like that: pick for yourself some subset of coins so that the sum of values of your coins is strictly larger than the sum of values of the remaining coins that your twin will have. However, you correctly thought that if you take too many coins, the twin will suspect the deception. So, you've decided to stick to the following strategy to avoid suspicions: you take the minimum number of coins, whose sum of values is strictly more than the sum of values of the remaining coins. On this basis, determine what minimum number of coins you need to take to divide them in the described manner.

### Input

The first line contains integer $ n (1 ≤ n ≤ 100) $ — the number of coins. The second line contains a sequence of $ n $ integers $a1, a2, ..., an (1 ≤ ai ≤ 100)$ — the coins' values. All numbers are separated with spaces.

### Output
In the single line print the single number — the minimum needed number of coins.

#### Examples
input:
```
2
3 3
```
output:
```
2
```


input:
```
3
2 1 2
```
output:
```
2
```

<div align=right>
From Codeforces
</div>

### Problem Election Justification

The current problem was chosen mainly to demostrate the wide range of possibilities both chosen paradigms have to tackle the same challenges, which include:

- Input processing
- Availability to sort a series of values.
- Perform comparison based on changing bases.

This problem concretelly imposes a challenge for the functional paradigm by requiring the construction of a function that can handle the problem solving for any series of inputs, as long as they respect the input conditions established, through the use or recursive processing and list management.

Similarly, the logical paradigm is tested as the obtention of a solution requires of backtracking applied to series of designed predicates, as well as recursive rules with base cases, in order to obtain the proper answer for the given parameters.

Additionally, the logic to solve the problem can change depending on the paradigm  being used, as one way may be more or less difficult to implement in one language. Both found logic flows to solve the problem are presented in the following section before introducing the indivual solutions in C++ (imperative), scheme (functional) and prolog (logical paradigm).

# Solution Logic

The general process for the solution of the problem can be divided in the following categories:
1. Input obtention (first and second line).
2. Validation of given inputs within range.
3. Validation of coins' quantity based on first input.
4. Sorting obtained coins in descending order.
5. Perform comparison.
6. Act based on comparison.
 
The following section will explain all of them and their variations in detail:

### 1. Input obtention
Usage of the respective language methods in order to obtain the two line inputs. 

### 2. Validation of given inputs
All given integers (independently of their line) must be greater or equal to 1 and lower or equal to 100 without exception, otherwise the final result would be 0.

### 3. Validation of coins' quantity based on first input.
It is necessary to develop a count of the given elements in the second line. If this number of elements is the same as the first given input, the procedure for the solution may continue; otherwise, returns 0 as the result.

### 4. Sorting of the obtained coins.
The given coins must be ordered in descending order (from greatest to lowest) as by obtaining the coins with the greatest values first, the number of coins required to have a total slightly greater than the remaing coins will be minimum.

The procedure or structure to perform this sorting may vary depending on implementation:

- Heap / Priority queue: Store the current values on a heap or priority queue that allows to sort elements when inserting them into the array and take out the greater elements.
- Use of a sorting algorithm: Storage of elements in a list and sorting of the elements based on a concrete sorting algorithm.

### 5. Perform comparison.
Based on the given sorted structure, an empty list or sum must be established to gather the number of minimum coins required by the problem. Once this element is established, the comparison between the two lists or total sums must be performed element by element until the list of coins to take or its sum is at least greater than the sum of the remaining coins.

The comparison can be performed against:
- Half of the total sum of all the coins.
- Constant sum of the elements of the original list (Sum would need to be performed everytime).

### 6. Act based on comparison.
If the sum of the taken coins is still lower than the sum of the remaining coins (not greater), then a new coin will be taken; otherwise the number of taken coins will be returned as the final result.

For the number of taken coins either a counter can be taken since the comparisons starts or a count of taken coins can be performed once the amount is higher than the value being compared to.

On the following sections the same logic flow is taken; however, its implementation will change depending on the paradigm and language adopted.

# Traditional Solution (Imperative Paradigm)

The Imperative Programming Paradigm is the practice of giving the computer instructions using sequential statements in a structured program. (Bhattacharyya, 2018)

It is characterized for its statement-at-a-time focus which pays special attention on what each statement does at which time (sequential); allows to change the values stored at memory locations (mutable states); and clearly states control structures (loops and conditionals).

This paradigm is the most commonly known in the early stages at computer science education (until the current start of this course,  it was the only one I knew) because of its similarity with human instructions; by giving indications of declaring data under names, and telling all the modifications to such data it is relatively easy to transfer the conceptual ideas into code. Because of this, the imperative paradigm is covered by most of the popular programming languages as C, C++, Java or Python (despite these can or can not support other paradigms as well).

## Solution

Programming Language: **C++**

File: general_solution/solution.cpp

Function:
This file was developed in order to pass all the automatic tests in Codeforces and obtain such tests for proving the solutions implemented in the logical and functional paradigm.

The proof of the current solution acceptance is shown in the following images:

*[Screenshot of current codeforces acceptance.]*

Logic:
1. Declaration of variables to use. (integers: <code>num, total, enough, answer, </code>. booleans: <code>approvedNum, approvedEle</code>)
2. Obtention of the first input (number of coins in the second line).
    
    2.1 Verification of input within range.
3. Creation of a priority queue that sorts automatically elements in descending order from <code>queue</code> library.
4. Obtention of the second line input.
5. Process each elemement of the second line by:
    
    5.1 Checking each element is within range.
    
    5.2 Storing each element in the queue.
    
    5.3 Adding each coin value to <code>total</code> variable.
6. Perform comparison
    
    6.1 While loop, as long as the variable <code>enough</code> is less than <code>total/2</code>.
        
    6.1.1 Add the value of the first element of queue to enough.
        
    6.1.2 Increment answer in one (number of taken coins)
        
    6.1.3 Eliminate the first element from the queue.
7. Return answer.
    
    7.1 If all inputs are within range, return the actual answer, else return 0.


# Functional Paradigm

The Functional Programming Paradigm allows the programmer to focus on describing what it needs to be computed instead of responsibilities as organize the computation sequencing or organize memory management (which are associated mainly with the Imperative Paradigm). This description relies in **expressions** (made up from **functions**) with an automatic evaluation handled by the language that support them. To better understand the approach behind this paradigm, the definition and characteristics of functions are presented below.

A **function** is defined as a correspondence between argument values (source) and result values (target). A function analysed *intensionally* explains the process by which the function arrived to the target from the given arguments (all the inner processing); on the other hand, an *extensional* analysis abstracts away the details of the function, considering it as a blackbox that based on the given parameters obtains a target from it. This last characteristic allows to use functions as their given output and consider them as interchangeable components inside a program (as two functions that return the same result from the same inputs would be considered equivalent).

Furthermore, several functions can be combined in a single expression, allowing to use functions (considered as abstract blackboxes that return targets) as parameters of other functions, as the produced subcalculations (of the first function) are directly communicated to other parts of the program that make use of them.

The functional paradigm takes away the posibility to mutate data (no modification of variables) instead giving a new thinking approach that based exclusively on functions leads to:
- Easier debugging.
- Greater modularity and reusability.
- More predictable outcomes.

## Solution

Programming Language: **Scheme**

File: functional/scheme_solution.rkt

The usage of the functional paradigm requires rather than a linear explanation of the solution, of the description and dependency of the several designed functions in order to collect the complete mechanism that solves the "Twins" problem.

The following explanations will begin by the more complex functions diving them slowly into their most basic ones as the following diagram depicts.


*[Insert here model image]*

### Layer 0

- main (layer 0)
Function that holds the complete process mechanism, from the current input obtention and processing to the problem solving logic.

### Layer 1

- define (layer 1)
Built-in function that allow to associate concrete names to values.


- string->number (layer 1)
Built-in function that converts the current given value (string) to a data type (number).


- string-split (layer 1)
Built-in function that allows to divide a string into elements by their white-spaces " ".


- map (layer 1)
Built-in function that allows to go through a list and apply the given function to all the elements of the list. This is applied over the elements divided from the string of the second input in order to apply the function <code>string->number</code> into each string "5" to conver to number 5.


- coins (layer 1)
Created function that returns 0 if the functions <code>number</code>  (giving it the list, number and an empty counter 0), and <code>in-range</code> (giving it the first input) are not meet. Otherwise, call the function <code>coins-aux</code> (giving the list inside the function <code>quick-sort</code> a counter in 0 and an empty list) or return 0.


### Layer 2

- number
Created function that calls itself recursively while taking elements out of the given list (and validating their range with <code>in-range</code>) and increasing the elements count. Only when the list is empty evaluates if the given length and the counter are equal returning true; otherwise returning false.


- quick-sort
Created function that based on the first element of the list (called pivot) calls itself recursively over the group of greater and lesser elements of the list than the pivot (<code>larger-items, lesser-items</code>) and appends the given result (<code>append_lists</code>) together with the elements equal to the pivot (<code>equal-items</code>), until the list is empty.

This recursive calling allows to add always the greater, equal and less elements of each element until the list was empty, and integrate all results together creating a sorting list in descending order.


- coins-aux
Created function that returns a counter number until the list of coins is empty or the sum of the elements of the created list (initially empty) using <code>sum-list</code> is greater than the sum of the list of the remaining coins. If neither of both condition is accomplished, calls itself recursively moving one elements of the list to the taken coins and increasing the coins counter.

### Layer 3 

- in-range
Created function that based on a conditional only returns true when the given number is greater or equal to 1 and less or equal to 100.


- sum-list
Created function that calls its auxiliar function <code>inner-sum</code> sending a list and a 0 (afterwards the sum of the elements of the list).


- append()
Created function that recursively until the first list is empty returns the list b, otherwise calls itself with the remaining elements of the first list (separating the first element). Until all the elements of the first list have not been divided into single elements through the recursive calls, the current elements will join at the start of b all together forming a single list to return.


- larger-items, lesser-items and equal-items
Created function that calls the auxiliar function <code>inner-larger, inner-lesser or inner-equal</code>respectively giving an empty list, the current list and the pivot number.

### Layer 4

- inner-sum
Created function that recursively calls itself adding to the integer parameter the first element of the given list until the list is empty, finally returning such addition.


- inner-larger, inner-lesser and inner-equal
Created function that recursively calls itself until the given list is empty returning the second created list; while this condition is met, in each call it puts elements of the original list to the initially empty list if they accomplish the condition given by the inner function <code>is-larger, is lesser or is-equal</code> respectively, otherwise continuing to the recursive call as given.

These functions return a list containing only the greater, lesser or equal elements to the given pivot number.

### Layer 5

- is-greater = (a > b)

- is-lesser = (a < b>)

- is-equal = (a == b)

- invert
Created function that calls the inner function <code>invert-inner</code> giving the given list and an empty list.


### Layer 6

- invert-inner
Created recursive function that passes all the elements of the original list to the empty list, changing the order of the elements when returning the second list.


----

The presented solution fits the Functional Paradigm for the following reasons:
- The program logic is performed by expressions and the use of functions and their return values.
- There is no variable mutations in the program, only immutable binding of values to determine names using the <code>define</code> function.
- At several points, the program demostrates functional composition by showing the usage of inner functions and the pass of functions as parameters.


## Testing

To test either the actual program or run automatically the 29 tests given by Codeforces, Dr Racket or the extention of Dr Racket into VS code is required.

Once this extention is installed or the file is open in Dr Racket, press the "Run file in terminal" button.

### Individual file

When running the file <code>scheme_solution.rkt</code> the console will display instructions about its use.
1. First introduce the number of coins to enter.
2. Introduce all coins values divided by spaces.

Afterwards the program will return the answer and display it in console.

Examples.

**Valid inputs**

```
Introduce number of coins to enter: E. 3
8
Introduce all coins values divided by spaces: E. 5 6 10
1 5 2 6 3 5 8 2
3
```

Only the coins with values 8(1), 6(1) and 5(1) () are enough to be greater than the addition of the remaining coins (5 + 3 + 2 = 10). 

**Invalid inputs**

```
Introduce number of coins to enter: E. 3
4
Introduce all coins values divided by spaces: E. 5 6 10
5 2 1
0
```


### Testing file

When running the file <code>testing_scheme.rkt</code> all test cases will run automatically.

Due to the design of the initial file the messages with the instructions will be displayed, afterwards a message indicating if the actual test was a success or a fail like:

```
Introduce number of coins to enter: E. 3
Introduce all coins values divided by spaces: E. 5 6 10
SUCCESS expected: 2

or

Introduce number of coins to enter: E. 3
Introduce all coins values divided by spaces: E. 5 6 10
FAIL | input: 2\n3 3\n
    expected: 2
    got: 4
```

It is important to notice that as Codeforces only checks actual successful test cases, all given test cases will be passed as <code>SUCCESS</code>.

# Logical Paradigm

The Logical Programming Paradigm is focused on the idea of giving more importance to the result the programmer wants to accomplish rather than the actual way of doing it (being in this way described as *declarative*). The intellectual approach behind this paradigm rests on the techniques developed by logicians to form valid conclusions from available evidence (deduction). Under this premise, the only three elements of the logical paradigm are presented below:

- **Facts**
Statements that declare information known to be true inside the program's knowledge base. These represent relationships, properties or conditions.

- **Rules**
Logical implications that define new relationships based on existing facts or different rules. These form the current reasoning mechanism of the program.

- **Queries**
Questions made to the logical system in order to determine whether the statement can be proven based on the given information, and inner rules and facts. The user makes queries to the system which returns its answer based on the program facts and rules.

The Logical Paradigm and its implementation focuses on defining what properties define a valid solution to a problem based on the given information. The program interpreter performs searching, matching and backtracking in order to traverse the available facts and rules looking for the current solution that by deduction is the valid conclision to the given inputs. In comparison to the Imperative Paradigm, the Logical Paradigm gets far away from defining instructions to solve a problem, and rather focuses on the conditions that define a solution, while not being able to mutate data, or define sequential instructions.

## Solution

Programming Language: **Prolog**

File: logical/prolog_solution.pl

In the presented section, the composition of the file <code>prolog_solution.pl</code> will be divided into the three main elements of Logic Paradigm in order to demostrate its theorical use during the development of the solution, same concept is validated by the following presented model.


*[Add here the model of the logical paradigm]*


Note: When talking about the rules (which may have different versions depending on their parameters) the name convention "name/number" will be taken, where the number represents the number of rules under the same name.

### Query
<code>main/1</code> is itself a query to the system disguised as a rule that captures the input of the user (number and values of coins) and performs automatically the validation of the inpits and the obtention of the problem solution (as long as the validations are approved).

### Knowledge Base
Even though there is no traditional facts stablished in the form <code>dog(fido).</code>, there is usage of an actual knowledge bases in the presented solution through the unification of the use of rule's base cases and comparison against known truths inside rules.


The base cases for the rules <code>count, invert, greater_than, append, quick_sort</code> and <code>sum_ele_aux</code> declare truths that either carried empty constants contain the same value than another constant where the calculation was perform (stopping backtracking and allowing to take a result out of a recursive rule) or declare the stop condition of a recursive rule; being equivalent to an actual fact that despite the information it carries or the process behind it stops processes and assigns values.


On the other hand, rules such as <code>range</code> and <code>verify_count</code> rely on given parameters to compare agaisnt a known truth (the declared range between 1 and 100, and the fact that the number of elements in the list must be equal to the given number) in order to assign a value to a given constant (flags used to continue or interrupt the program and return a result).


Together, the presence of these presented truths inside different designes rules form a knowledge base that works as a validation of the given information and conditions that logically assign calculations to constants in order to continue a process.

### Rules
The implementation of rules with one and several variations is clearly presented in the solution as the program is implemented through the validation, completion and cooperation among rules. Their current design allows to perform different processes that range from mathematical operations to logical comparisons in recursive calls and complement each other being part of more complex rules, making use of backtracking while the actual deduction of the answer is being processed. One of the most complex examples is the rule <code>greater_than</code> that making use of backtracking and performing comparisons among constants X and H leads to the addition of elements to multiple lists that end up being greater, less or equal to the presented pivot (X).


## Rules decomposition

The rules <code>read_line_to_string</code> and <code>number_string</code> are build-in prolog.

- main
Query desguised as rule that reads the input from console, convert the inputs respectively into numbers and a list of numbers, and validates their range and count before passing to the actual problem solving rule <code>coins</code>. If any of the validations making use of <code>range</code> or <code>verify_count</code> fail, the rule assigns 0 to F as the sequence was interrupted.

- split_to_ints
Rule that divides the given input string into a list and converts all the elements of the list into numbers using <code>number_string</code> through the maping of the list.

- range (KB)
Validated the range of R (1=< R <=100) and assigns T a number as a flag (0 or 1).

- verify_count
Making use of the rule <code>count</code> to validate the amount of elements in the given list L, assigns the flag R a number (0 or 1).

- count (KB)
Function that recursively verifies each element of the given list is within range using the rule <code>range</code>, takes out one element from the list, and increase the counter until the list is empty, the returned counter is only the count if all the elements are within range, being both a counter and a validator (base case assignation).

- coins
Performs a <code>quick_sort</code> to the given list and makes use of the rule <code>coins_aux</code> in order to obtain the deduction of N before returning it.

- quick_sort (KB)
Recursive rule that divides the list into three sections (larger, equal, small) making use of the rule <code>greater_than</code> calls itself in both the larger and smaller lists, until the given list is empty, then joins together in order the elements of the lists as larger + equal + pivot + less using <code>append</code> leading to a given list in descending order passed by the constant X.

- greater_than (KB)
Recursive rule with two variants that based on comparisons with the number X assigns the elements of the original given list Y into three lists (greater, equal and smaller numbers) and returns them in different constants once the original list has been emptied and the greater and smaller list have been inverted <code>invert</code>.

- invert (KB)
Recursive rule with three variants (one that calls the other two) that passes all elements of the original list into an empty list, inverting the elements and returning them into a different constant.

- append (KB)
Recursive rule responsible for joining the elements of two list together in order and return the new list into a different constant.

- coins_aux
Recursive rule that compares the sum of elements in the two given lists (through the rule <code>sum_ele</code>) and returns the counter in C through the constant N once the sum of the list V is greater than the sum of the list L, stopping backtracking and furthermore calls of the rule. Otherwise, passes one element of L into V and increases C by 1 through assignation and call of the function with a new constant.

- sum-ele
Reccursive rule with three variants (one variant calls the other two) that adds up together the elements of the list by assigning the sum of the elements into the constant S and calls itself until the given list is empty and returns the addition through the constant R.

## Testing
To test either the actual program or run automatically the 29 tests given by Codeforces, an installed version of prolog as SWI Prolog is required.

The following indications are designed for SWI Prolog which is the version installed in class and can be accessed in the following link [SWI-Prolog](https://www.swi-prolog.org/) or 

To run the chosen program in terminal use the following command:
```
swipl [file_name or file/path]
```

### Individual file
Run from the github repository (/Paradigm_Demostration_Twins_Codeforces)
```
swipl logical/prolog_solution.pl 
```

or inside the /logical directory
```
swipl prolog_solution.pl 
```

Inmediately the command line for prolog will be open:
```
?- 
```

Type:
```
main(F).
```
The program will start and the input will open in terminal as <code>|: </code> here type the input (number of coins to enter) and press the "Enter" key.
Insert the second input (values of the coins divided by one whitespace) and press the "Enter" key.
The program will return the minimum number of coins to take and have a slighly greater amount that the remaining coins or 0 in case the input was invalid.

Examples.

**Valid inputs**

```
?- main(F).
|: 5
|: 5 2 3 8 15
F = 2 .
```
Only the coins with values 15 and 8 (2 coins with a total of 23) are enough to be greater than the addition of the remaining coins (5 + 3 + 2 = 10). 

**Invalid inputs**
```
?- main(F).
|: 5
|: 2
F = 0.
```
As the input indicated it will enter 5 coins, but only gave the value of the first one is considered invalid and returns 0 as a result.

### Testing file5 



# Analysis

## Traditional Solution (Sequential & Imperative Paradigm)
### Time Complexity


### Space Complexity

## Functional Paradigm
### Time Complexity


### Space Complexity

## Logical Paradigm
### Time Complexity


### Space Complexity


# Conclusion


# References
Alsbjergvej 10, 9260 Gistrup, Denmark
Bhattacharyya, Avi. Cybernetics in C++, River Publishers, 2018. ProQuest Ebook Central, http://ebookcentral.proquest.com/lib/biblitesm/detail.action?docID=5493972.

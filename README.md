# **MIPS-Assembly-Language**
10 questions with solution of MIPS assembly language

## **Q1**:
Write a program that selects a number between 0 and 10 and then asks the user to guess that number. The program should keep asking for guesses until the user guesses correctly. When the user's guess is correct, print "Well Guessed!" and end the program.

## **Q2**:
Write a program that reads a memory location and if its value is even, store the number 0, otherwise store the number 1 in the same location. To determine if a number is even or odd, only the srl and sll instructions are allowed. Assume the memory address is located at register $s0.

## **Q3**:
Write a program that operates on two arrays of numbers stored in memory with predetermined lengths. First, it should take a natural number n (smaller than the length of the array) from the user, and then n numbers in the form of n<sub>1</sub> to n<sub>n</sub>. It should then swap the elements of the two arrays at positions n<sub>i</sub>. Note that this swapping should be done in place; meaning the final output should be visible in the initial two arrays in memory.
<details>
<summary>:eyes: Show example</summary>
*As an example, suppose we have two arrays with the following elements:<br _>
A: 1, 2, 3, 4, 5<br _>
B: 6, 7, 8, 9, 10, 11<br _>
Now, if the input numbers are 2, 4, and 5, the second, fourth, and fifth elements of the two arrays should be swapped pairwise. We will have:<br _>
A: 1, 7, 3, 9, 10<br _>
B: 6, 2, 8, 4, 5, 11*<br _>
</details>

## **Q4**:
Write a program to prompt the user for a 4-digit BCD number, and print an appropriate output whether it is divisible by 33 or not. Note that a 16-bit binary string is provided as input, where each 4 bits from right to left represent units, tens, hundreds, and thousands of the 4-digit BCD number, respectively.

## **Q5**:
Write a recursive subroutine to factorize the natural number *a* into its prime factors.

## **Q6**:
Write a program that first takes an integer x as input, then receives a string of length x as input, and converts uppercase English letters to lowercase and lowercase letters to uppercase while leaving other characters unchanged. Use syscall 9 to store the string in memory.

## **Q7**:
Write a program that opens a text file, reads its contents character by character from the end to the beginning, and writes them into another text file.

## **Q8**:
Write a program that takes a decimal number in base 10 as input and prints its binary equivalent. In special cases, calculate the output up to 10 decimal places.

## **Q9**:
Write a subroutine that recursively calculates the output of the given function. Receive the number *n* from the user before calling the subroutine and print the result after the subroutine finishes.
```math
\mathrm{f}(n) = \begin{cases}
    1 & \text{if } n \leq 1 \\
    2 + \frac{f(n-1)}{n} & n > 1
\end{cases}
```

## **Q10**:
We have a function that adds two numbers stored in registers a0 and a1 and returns the result. Write a program that takes two numbers as input, uses this function to print the sum in the output, and then modifies the function's code so that instead of adding the two numbers, it subtracts the second number from the first one. Then, call this function again with the same inputs and print the result.

You can also see the questions in persian [*here*](https://github.com/Amirreza81/MIPS-Assembly-Language/blob/main/CSL-HW01.pdf).

If you find any problem, feel free to contact [me](amirrezaazari1381@gmail.com).
## Instructor ✍
[DR. Laleh Arshadi](https://www.linkedin.com/in/laleh-arshadi-3042b6163/?originalSubdomain=ir)

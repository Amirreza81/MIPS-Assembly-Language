# **MIPS Assembly Language: Programming Exercises with Solutions**

This document presents a collection of 10 MIPS assembly language exercises, each designed to enhance understanding of low-level programming concepts. Solutions accompany each question to aid in learning and implementation.

## **Exercise 1: Number Guessing Game**
Write a MIPS assembly program that selects a random number between 0 and 10 and prompts the user to guess the number. The program should continue accepting guesses until the user correctly identifies the number. Upon a correct guess, display the message "Well Guessed!" and terminate.

---

## **Exercise 2: Even or Odd Memory Update**
Develop a program that reads a value from a specified memory location. If the value is even, store `0`; otherwise, store `1`. Only the `srl` (Shift Right Logical) and `sll` (Shift Left Logical) instructions may be used to determine parity. Assume the memory address is stored in register `$s0`.

---

## **Exercise 3: Array Element Swapping**
Implement a program that operates on two arrays stored in memory. The user inputs a natural number `n` (less than the array's length) and then specifies `n` indices. The program swaps elements of the two arrays at the given positions in place.

**Example:**
```
Initial Arrays:
A = {1, 2, 3, 4, 5}
B = {6, 7, 8, 9, 10, 11}
Input: {2, 4, 5}

After Swap:
A = {1, 7, 3, 9, 10}
B = {6, 2, 8, 4, 5, 11}
```

---

## **Exercise 4: BCD Divisibility Check**
Write a program that prompts the user for a 4-digit BCD (Binary-Coded Decimal) number and determines whether it is divisible by 33. The input is a 16-bit binary value where each 4-bit segment represents a decimal digit (units, tens, hundreds, thousands).

---

## **Exercise 5: Recursive Prime Factorization**
Implement a recursive subroutine to compute the prime factorization of a given natural number `a`.

---

## **Exercise 6: Case Conversion in Strings**
Develop a program that:
- Accepts an integer `x` from the user.
- Receives a string of length `x` using syscall 9.
- Converts uppercase letters to lowercase and vice versa while preserving other characters.

---

## **Exercise 7: Reverse File Read and Write**
Write a program that opens a text file, reads its contents character by character in reverse order, and writes the reversed content into another text file.

---

## **Exercise 8: Decimal to Binary Conversion**
Implement a program that takes a decimal number as input and prints its binary equivalent. For fractional numbers, compute the binary representation up to 10 decimal places.

---

## **Exercise 9: Recursive Function Calculation**
Write a recursive subroutine to evaluate the function:
\[
\mathrm{f}(n) = \begin{cases}
    1 & \text{if } n \leq 1 \\
    2 + \frac{f(n-1)}{n} & n > 1
\end{cases}
\]
The program should prompt the user for `n`, compute `f(n)`, and display the result.

---

## **Exercise 10: Modifying a Function at Runtime**
Implement a function that:
1. Takes two numbers as input.
2. Adds the numbers (stored in `$a0` and `$a1`) and returns the result.
3. Prints the sum.
4. Modifies the function to perform subtraction instead of addition.
5. Calls the modified function with the same inputs and prints the new result.

---

For additional reference, you can find these questions in Persian [*here*](https://github.com/Amirreza81/MIPS-Assembly-Language/blob/main/CSL-HW01.pdf).

For any inquiries, feel free to contact [Amirreza Azari](mailto:amirrezaazari1381@gmail.com).

## **Instructor** ✍
[Dr. Laleh Arshadi](https://www.linkedin.com/in/laleh-arshadi-3042b6163/?originalSubdomain=ir)
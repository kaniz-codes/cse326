# Lab 03: If-Else Problems in 8086 Assembly

The main goal of this lab is to understand how decision-making works in Assembly using comparison and jump instructions.

## Lab Documents

| File | Description |
|---|---|
| [Question PDF](if-else.pdf) | Lab question file |
| [Lab Report](lab-report.pdf) | Completed lab report |


## Index

| Problem | Task | View Code | Download |
|---:|---|---|---|
| 01 | Take input two letters and print them in alphabetical order | [View](01-alphabetical-order.asm) | [Download](01-alphabetical-order.asm?raw=1) |
| 02 | Take input two letters and print them in reverse alphabetical order | [View](02-reverse-alphabetical-order.asm) | [Download](02-reverse-alphabetical-order.asm?raw=1) |
| 03 | Take letter input and check if it is a vowel or consonant | [View](03-vowel-or-consonant.asm) | [Download](03-vowel-or-consonant.asm?raw=1) |
| 04 | Take character input and check whether it is alphabet or digit | [View](04-alphabet-or-digit.asm) | [Download](04-alphabet-or-digit.asm?raw=1) |
| 05 | Find the smallest and largest among 3 digits | [View](05-smallest-and-largest-digit.asm) | [Download](05-smallest-and-largest-digit.asm?raw=1) |


## Topics Covered

- Conditional statements in Assembly
- `CMP` instruction
- Conditional jump instructions
- Character input
- Character output
- ASCII value comparison
- If-else logic in 8086 Assembly



## Important Instructions Used

| Instruction | Purpose |
|---|---|
| `MOV` | Moves data from one place to another |
| `CMP` | Compares two values |
| `JL` | Jumps if less |
| `JG` | Jumps if greater |
| `JE` | Jumps if equal |
| `JNE` | Jumps if not equal |
| `JLE` | Jumps if less than or equal |
| `JGE` | Jumps if greater than or equal |
| `LEA` | Loads the address of a variable/string |
| `INT 21H` | DOS interrupt used for input/output |

---

## Problems with Solutions

### 01: Print Two Letters in Alphabetical Order

**Problem:**  
Take input two letters and print them in alphabetical order.

**Example:**

```txt
Input:
Enter the first letter: H
Enter the second letter: A

Output:
The letters in alphabetical order: AH
```
<details> <summary><kbd>View Solution Code</kbd></summary>

```asm
.MODEL SMALL
.STACK 100H

.DATA
    STR DB "Enter the first letter: $"
    STR1 DB 10,13,"Enter the second letter: $"
    STR2 DB 10,13,"The letters in alphabetical order: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, STR
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL

    MOV AH, 9
    LEA DX, STR1
    INT 21H

    MOV AH, 1
    INT 21H
    MOV CL, AL

    MOV AH, 9
    LEA DX, STR2
    INT 21H

    CMP BL, CL
    JLE ORDER

    MOV AH, 2
    MOV DL, CL
    INT 21H

    MOV DL, BL
    INT 21H
    JMP EXIT

ORDER:
    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV DL, CL
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
```
</details>

### 02: Print Two Letters in Reverse Alphabetical Order

**Problem:**
Take input two letters and print them in reverse alphabetical order.

**Example:**

```txt
Input:
Enter the first letter: H
Enter the second letter: A

Output:
The letters in reverse alphabetical order: HA
```
<details> <summary><kbd>View Solution Code</kbd></summary>

```asm
.MODEL SMALL
.STACK 100H

.DATA
    STR DB "Enter the first letter: $"
    STR1 DB 10,13,"Enter the second letter: $"
    STR2 DB 10,13,"The letters in reverse alphabetical order: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, STR
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL

    MOV AH, 9
    LEA DX, STR1
    INT 21H

    MOV AH, 1
    INT 21H
    MOV CL, AL

    MOV AH, 9
    LEA DX, STR2
    INT 21H

    CMP BL, CL
    JGE ORDER

    MOV AH, 2
    MOV DL, CL
    INT 21H

    MOV DL, BL
    INT 21H
    JMP EXIT

ORDER:
    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV DL, CL
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
```
</details>

### 03: Check Vowel or Consonant

**Problem:**
Take a letter input and check if it is a vowel or consonant.

**Example:**

```txt
Input:
Enter letter: A

Output:
It is a vowel

Input:
Enter letter: K

Output:
It is a consonant
```
<details> <summary><kbd>View Solution Code</kbd></summary>

```asm
.MODEL SMALL
.STACK 100H

.DATA
    STR DB "Enter letter: $"
    STR1 DB 10,13,"It is a vowel$"
    STR2 DB 10,13,"It is a consonant$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, STR
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL

    CMP BL, 'A'
    JE VOWEL
    CMP BL, 'E'
    JE VOWEL
    CMP BL, 'I'
    JE VOWEL
    CMP BL, 'O'
    JE VOWEL
    CMP BL, 'U'
    JE VOWEL

    CMP BL, 'a'
    JE VOWEL
    CMP BL, 'e'
    JE VOWEL
    CMP BL, 'i'
    JE VOWEL
    CMP BL, 'o'
    JE VOWEL
    CMP BL, 'u'
    JE VOWEL

    MOV AH, 9
    LEA DX, STR2
    INT 21H
    JMP EXIT

VOWEL:
    MOV AH, 9
    LEA DX, STR1
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
```
</details>

### 04: Check Alphabet or Digit

**Problem:**
Take a character input and check whether it is an alphabet or digit.

**Example:**

```txt
Input:
Enter character: A

Output:
Alphabet

Input:
Enter character: 7

Output:
Digit
```

<details> <summary><kbd>View Solution Code</kbd></summary>

```asm
.MODEL SMALL
.STACK 100H

.DATA
    STR DB "Enter a character: $"
    STR1 DB 10,13,"Digit$"
    STR2 DB 10,13,"Alphabet$"
    STR3 DB 10,13,"Invalid character$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, STR
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; check digit 0-9
    CMP BL, '0'
    JL CHECK_UPPER
    CMP BL, '9'
    JLE DIGIT

CHECK_UPPER:
    ; check uppercase A-Z
    CMP BL, 'A'
    JL INVALID
    CMP BL, 'Z'
    JLE ALPHABET

CHECK_LOWER:
    ; check lowercase a-z
    CMP BL, 'a'
    JL INVALID
    CMP BL, 'z'
    JLE ALPHABET

    JMP INVALID

DIGIT:
    MOV AH, 9
    LEA DX, STR1
    INT 21H
    JMP EXIT

ALPHABET:
    MOV AH, 9
    LEA DX, STR2
    INT 21H
    JMP EXIT

INVALID:
    MOV AH, 9
    LEA DX, STR3
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
```
</details>

### 05: Find Smallest and Largest Among Three Digits

**Problem:**
Find out the smallest and largest among 3 digits.

**Example:**

```txt
Input:
Enter first value: 8
Enter second value: 1
Enter third value: 6

Output:
Smallest: 1
Largest: 8
```
<details> <summary><kbd>View Solution Code</kbd></summary>

```asm
.MODEL SMALL
.STACK 100H

.DATA
    STR DB "Enter first digit: $"
    STR1 DB 10,13,"Enter second digit: $"
    STR2 DB 10,13,"Enter third digit: $"
    STR3 DB 10,13,"Smallest: $"
    STR4 DB 10,13,"Largest: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, STR
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL

    MOV AH, 9
    LEA DX, STR1
    INT 21H

    MOV AH, 1
    INT 21H
    MOV CL, AL

    MOV AH, 9
    LEA DX, STR2
    INT 21H

    MOV AH, 1
    INT 21H
    MOV CH, AL

    ; assume BL = smallest, CL = middle, CH = largest

    CMP BL, CL
    JLE STEP1
    MOV DL, BL
    MOV BL, CL
    MOV CL, DL

STEP1:
    CMP CL, CH
    JLE STEP2
    MOV DL, CL
    MOV CL, CH
    MOV CH, DL

STEP2:
    CMP BL, CL
    JLE PRINT
    MOV DL, BL
    MOV BL, CL
    MOV CL, DL

PRINT:
    MOV AH, 9
    LEA DX, STR3
    INT 21H

    MOV AH, 2
    MOV DL, BL
    INT 21H

    MOV AH, 9
    LEA DX, STR4
    INT 21H

    MOV AH, 2
    MOV DL, CH
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
```
</details>
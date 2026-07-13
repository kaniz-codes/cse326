# Lab 01: Single Character Input/Output

This lab introduces basic character input and output in 8086 Assembly

## Single Character Input
To take a single character input from the keyboard:

```asm
MOV AH, 1
INT 21H
```

> **IMP:** `MOV AH, 01H` is used for single character input. `INT` stands for **Interrupt**.

> **Note:** The input character is automatically stored in the `AL` register. To store multiple inputs, move the value from `AL` to another 8-bit register.

# Multiple Character Input

To take multiple characters

```asm
MOV AH, 01H
INT 21H
MOV BH, AL

MOV AH, 01H
INT 21H
MOV BL, AL
```


# Single Character Output

```asm
MOV AH, 1
INT 21H

MOV AH,2
INT 21H
```
>NOTE AH 2 is used foroutput

## Key Concepts

- AH = Function set
- AH = 01H for Read single keyboard character
- AH = 02H for Display single character on screen
- AH = 09H for Display a string on screen
- AL = stores value automatically from input
- DL = Defaultoutput register. We have to put the value inside DL to desplay the value as output.

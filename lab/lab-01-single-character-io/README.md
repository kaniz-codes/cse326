# Lab 01: Single Character Input/Output

## Objective
To learn how to take a single character input and display output using 8086 Assembly.

## Tools Used
- EMU8086 / DOSBox / MASM
- 8086 Assembly Language

## Program List
| File | Description |
|------|-------------|
| single-character-input.asm | Takes one character input from user |
| single-character-output.asm | Displays one character on screen |

## How to Run
1. Open the `.asm` file in EMU8086.
2. Compile the program.
3. Run the program.
4. Enter a character when asked.

## Expected Output
The program should display the entered character.

## Key Concepts
- `MOV`
- `INT 21H`
- AH = 01H for input
- AH = 02H for output
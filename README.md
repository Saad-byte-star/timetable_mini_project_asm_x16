# Documentation for CS Department Room Timetable Assembly Program

## Overview
This program, written in Assembly language, is designed to simulate a basic authentication and menu system for a CS Department Room Timetable application. The program features email and password authentication, and upon successful login, allows users to view the room timetable.

---

## Features
1. **Authentication:**
   - Email and password login with masked input.
   - Verification of user credentials.
2. **Menu Navigation:**
   - Options to display the room timetable or exit the program.
3. **Room Timetable:**
   - Displays lectures scheduled for each day of the week.

---

## Macro
### `print` Macro
- **Purpose:** Used to print strings to the console.
- **Definition:**
  ```assembly
  print macro p1
      mov dx, offset p1
      mov ah, 9
      int 21h
  endm
  ```
- **Usage:** `print <string_variable>`

---

## Data Section
### Authentication Data
- `PSWRD1`: Stores the email for authentication (`studentlgu@gmail.com`).
- `BUFF1`: Buffer for email input.
- `PSWRD`: Stores the password (`studilgu`).
- `BUFF`: Buffer for password input.

### Messages
- **Login Messages:**
  - `MSG11`: Prompt for login (`LOGIN:`).
  - `MSG12`: Incorrect login message.
  - `MSG13`: Correct login message.
- **Password Messages:**
  - `MSG1`: Prompt to enter password.
  - `MSG2`: Incorrect password message.
  - `MSG3`: Correct password message.
- **Menu Messages:**
  - `choice`: Prompt for menu options.
  - `mmmm` / `mmmm1`: Menu options for navigating back or exiting.

### Timetable Data
- Daily schedule stored in variables `ttttt` to `ttttt23`, each representing lectures for specific days.

---

## Code Sections

### Initialization
- Initializes the data segment.
- Displays the project title using the `print` macro.

### Email Authentication
- **Inputs:** User email via keyboard (character by character).
- **Verification:** Compares entered email with the stored email (`PSWRD1`).

### Password Authentication
- **Inputs:** User password via keyboard (masked input with `*`).
- **Verification:** Compares entered password with the stored password (`PSWRD`).

### Main Menu
- Displays room timetable or exits the program based on user input.

### Room Timetable Display
- Displays the timetable for each day of the week with lectures and room numbers.

### Exit Program
- Ends the program by invoking interrupt `4Ch`.

---

## Procedures

### `newline`
- **Purpose:** Prints a newline on the console.
- **Definition:**
  ```assembly
  newline proc
      mov dx,10
      mov ah,2
      int 21h
      mov dx,13
      mov ah,2
      int 21h
      ret
  newline endp
  ```
- **Usage:** `call newline`

---

## Flowchart

1. **Start**
2. **Display Project Title**
3. **Email Authentication**
   - Correct: Proceed to Password Authentication.
   - Incorrect: Exit with error message.
4. **Password Authentication**
   - Correct: Proceed to Main Menu.
   - Incorrect: Exit with error message.
5. **Main Menu**
   - Option 1: Display Timetable.
   - Option 2: Exit.
6. **Display Timetable**
   - Return to Main Menu or Exit.
7. **Exit Program**

---

## Input/Output Details

### Inputs
1. Email (20 characters).
2. Password (8 characters).
3. Menu choice (`1` or `2`).

### Outputs
1. Success or failure messages during authentication.
2. Room timetable based on user choice.
3. Menu options for navigation.

---

## Notes
- The program uses DOS interrupts for input/output (`int 21h`).
- All user inputs are case-sensitive.
- Buffer sizes are predefined; inputs exceeding these limits may cause unexpected behavior.
```
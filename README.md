### Documentation for CS Department Room Timetable Assembly Program

#### Overview
This Assembly language program is designed to simulate a simple authentication system and display the CS Department's Room Timetable upon successful login. The program asks for an email and password, verifies the credentials, and provides the user with the option to view the weekly timetable or exit the program.

---

#### Features

1. **Authentication:**
   - Email and password authentication with input masking (`*`).
   - Correct or incorrect login feedback.

2. **Menu Navigation:**
   - After successful login, users can either view the timetable or exit.

3. **Room Timetable:**
   - Displays the lecture schedule for each day of the week.

---

#### `print` Macro

- **Purpose:** This macro is used for printing strings to the console.
  
- **Definition:**
  ```assembly
  print macro p1
      mov dx, offset p1
      mov ah, 9
      int 21h
  endm
  ```

- **Usage:** 
  ```assembly
  print <string_variable>
  ```
  This will print the string variable to the console.

---

#### Data Section

##### Authentication Data:
- `EML`: Stores the email (`studentlgu@gmail.com`) for authentication.
- `EMLBUFF`: Buffer to store user-entered email.
- `PSWRD`: Stores the password (`studilgu`).
- `BUFF`: Buffer to store user-entered password.

##### Messages:
- **Login Messages:**
  - `LOG_MSG`: Prompt for email input (`LOGIN:`).
  - `INCORRECT_LOG`: Message when login fails.
  - `CORRECT_LOG`: Message when login is successful.

- **Password Messages:**
  - `PASS_INPUT`: Prompt for password input (`ENTER YOUR PASSWORD:`).
  - `WRONG_PASS`: Message when password is incorrect.
  - `CORRECT_PASS`: Message when password is correct.

- **Menu Messages:**
  - `choice`: Prompt asking user to choose between viewing the timetable or exiting.
  - `GO_BACK`, `EXIT_MSG`: Options for navigating the menu or exiting.

##### Timetable Data:
- Timetable for each day of the week (e.g., `monday`, `tuesday`, `wednesday`, etc.), with lecture details like lecture numbers and room assignments.

---

#### Code Sections

##### Initialization:
- Initializes the data segment and sets up the environment.
- Prints the project title using the `print` macro.

##### Email Authentication:
- Prompts the user to enter their email, masks input with `*`, and compares the entered email to the stored one (`EML`).
- If the email is correct, the program proceeds to password verification; otherwise, it exits with an error message.

##### Password Authentication:
- Prompts for password input, masks input with `*`, and compares the entered password to the stored password (`PSWRD`).
- If the password is correct, the program proceeds to the main menu; otherwise, it exits with an error message.

##### Main Menu:
- Displays the timetable for the week or exits the program based on user input (`1` for timetable, `2` to exit).

##### Room Timetable Display:
- If the user selects option `1`, the program prints the timetable for each day of the week with lectures scheduled.

##### Exit Program:
- If the user selects option `2`, the program exits using the DOS interrupt `4Ch`.

---

#### Procedures

##### `newline` Procedure
- **Purpose:** This procedure prints a newline (carriage return and line feed).
  
- **Definition:**
  ```assembly
  newline proc
      mov dx, 10
      mov ah, 2
      int 21h
      mov dx, 13
      mov ah, 2
      int 21h
      ret
  newline endp
  ```

- **Usage:** `call newline` will add a new line to the output.

---

#### Flowchart

1. **Start**
2. **Display Project Title**
3. **Email Authentication**
   - If correct, proceed to password authentication.
   - If incorrect, exit with error message.
4. **Password Authentication**
   - If correct, proceed to the main menu.
   - If incorrect, exit with error message.
5. **Main Menu**
   - Option 1: View timetable.
   - Option 2: Exit.
6. **Room Timetable Display**
   - Display lectures for each day.
   - Return to the main menu or exit.
7. **Exit Program**

---

#### Input/Output Details

##### Inputs:
- Email (max 20 characters).
- Password (max 8 characters).
- Menu choice (`1` or `2`).

##### Outputs:
- Authentication success or failure messages.
- Weekly timetable if the user chooses option `1`.
- Menu options for navigation.

---

#### Notes:
- The program uses DOS interrupts (`int 21h`) for handling input and output.
- Inputs are case-sensitive.
- Buffer sizes are fixed, and inputs exceeding the defined limits may cause errors or unexpected behavior.

This Assembly program is a good example of how to handle basic input/output and simple string manipulation using low-level assembly language.
; Macro for printing strings
print macro p1
    mov dx,offset p1
    mov ah,9
    int 21h
endm

.model small 
.stack 100h
.data 
; ------------- DATA SECTION -------------
project_title db "CS DEPARTMENT ROOM TIMETABLE$"

; Login credentials
EML DB 'studentlgu@gmail.com'    ; Email login
EMLBUFF  DB 20 DUP(?)            ; Email buffer
LOG_MSG  DB 'LOGIN: $'
INCORRECT_LOG  DB 'INCORRECT LOGIN!$'
CORRECT_LOG  DB 'CORRECT LOGIN!$'

PSWRD  DB 'studilgu'                ; Password
BUFF   DB 20 DUP(?)                 ; Password buffer
PASS_INPUT   DB 'ENTER YOUR PASSWORD: $'
WRONG_PASS   DB 'WRONG PASSWORD!$'
CORRECT_PASS   DB 'CORRECT PASSWORD!$'

; Informational messages
choice db "ENTER YOUR CHOICE (1-Room Timetable, 2-Exit): $"
room_msg db "CS DEPARTMENT ROOM TIMETABLE$"

; Room timetable data
monday db "MONDAY$"
monday1 db "LECTURE NO : 1 58-OB - Programming Fundamentals$"
monday2 db "LECTURE NO : 2 FREE $"
monday3 db "LECTURE NO : 3 12-NB - Data Structures$"
tuesday db "TUESDAY$"
tuesday1 db "LECTURE NO : 1 FREE $"
tuesday2 db "LECTURE NO : 2 91-OB - Object Oriented Programming$"
tuesday3 db "LECTURE NO : 3 12-NB - Database Systems$"
wednesday db "WEDNESDAY$"
wednesday1 db "LECTURE NO : 1 38-OB - Computer Networks$"
wednesday2 db "LECTURE NO : 2 FREE $"
wednesday3 db "LECTURE NO : 3 32-NB - Operating Systems$"
thursday db "THURSDAY$"
thursday1 db "LECTURE NO : 1 5-OB - Software Engineering$"
thursday2 db "LECTURE NO : 2 FREE $"
thursday3 db "LECTURE NO : 3 19-NB - Web Technologies$"
friday db "FRIDAY$"
friday1 db "LECTURE NO : 1 58-OB - Artificial Intelligence$"
friday2 db "LECTURE NO : 2 FREE $"
friday3 db "LECTURE NO : 3 12-NB - Machine Learning$"
saturday db "SATURDAY$"
saturday1 db "ALL SLOTS FREE $"
sunday db "SUNDAY$"
sunday1 db "ALL SLOTS FREE$"

GO_BACK db "PRESS 1 GO BACK TO MENU $"
EXIT_MSG db "PRESS 2 EXIT$"

.code
main proc 
    mov ax,@data
    mov ds,ax
    
    print project_title 
    call newline
    
    ; First authentication - Email
    LEA SI,EML
    LEA DI,EMLBUFF
    MOV AH,9
    LEA DX,LOG_MSG
    INT 21H
    
    MOV CX,20
email_input:
    MOV AH,07
    INT 21H
    MOV [DI],AL
    INC DI
    MOV AH,2
    MOV DL,'*'
    INT 21H
    LOOP email_input
    
    LEA SI,EML
    LEA DI,EMLBUFF
    MOV CX,20
    MOV BX,0
    
verify_email:
    MOV BL,[SI]
    MOV BH,[DI]
    INC SI
    INC DI
    CMP BL,BH
    JNE login_failed
    LOOP verify_email
    
    call newline
    MOV AH,9
    LEA DX,CORRECT_LOG
    INT 21H
    jmp password_check
    
login_failed:
    MOV AH,9
    LEA DX,INCORRECT_LOG
    INT 21H
    mov ah,4ch
    int 21h

password_check:
    call newline
    LEA SI,PSWRD
    LEA DI,BUFF
    MOV AH,9
    LEA DX,PASS_INPUT
    INT 21H
    
    MOV CX,8
password_input:
    MOV AH,07
    INT 21H
    MOV [DI],AL
    INC DI
    MOV AH,2
    MOV DL,'*'
    INT 21H
    LOOP password_input
    
    LEA SI,PSWRD
    LEA DI,BUFF
    MOV CX,8
    MOV BX,0
    
verify_password:
    MOV BL,[SI]
    MOV BH,[DI]
    INC SI
    INC DI
    CMP BL,BH
    JNE password_failed
    LOOP verify_password
    
    call newline
    MOV AH,9
    LEA DX,CORRECT_PASS
    INT 21H
    JMP main_menu

password_failed:
    MOV AH,9
    LEA DX,WRONG_PASS
    INT 21H
    mov ah,4ch
    int 21h

main_menu:
    call newline
    print room_msg
    call newline
    print choice
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'1'
    je display_timetable
    cmp bl,'2'
    je exit_program
    
display_timetable:
    call newline
    print monday    ; Monday
    call newline
    print monday1
    call newline
    print monday2
    call newline
    print monday3
    call newline
    print tuesday   ; Tuesday
    call newline
    print tuesday1
    call newline
    print tuesday2
    call newline
    print tuesday3
    call newline
    print wednesday   ; Wednesday
    call newline
    print wednesday1
    call newline
    print wednesday2
    call newline
    print wednesday3
    call newline
    print thursday  ; Thursday
    call newline
    print thursday1
    call newline
    print thursday2
    call newline
    print thursday3
    call newline
    print friday  ; Friday
    call newline
    print friday1
    call newline
    print friday2
    call newline
    print friday3
    call newline
    print saturday  ; Saturday
    call newline
    print saturday1
    call newline
    print sunday  ; Sunday
    call newline
    print sunday1
    call newline
    
    print GO_BACK
    call newline
    print EXIT_MSG
    call newline
    print choice
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'1'
    je main_menu
    cmp bl,'2'
    je exit_program
    
exit_program:
    MOV AH,4CH
    INT 21H

main endp

; Utility procedure for newline
newline proc
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h 
    ret
newline endp

END main

; Macro for printing strings
print macro p1
    mov dx,offset p1
    mov ah,9
    int 21h
endm

.model small 
.stack 100h
.data 
; ------------- RETAINED DATA SECTION -------------
project_title db "CS DEPARTMENT ROOM TIMETABLE$"

; Login credentials
PSWRD1 DB 'studentlgu@gmail.com'    ; Email login
BUFF1  DB 20 DUP(?)                 ; Email buffer
MSG11  DB 'LOGIN: $'
MSG12  DB 'INCORRECT LOGIN!$'
MSG13  DB 'CORRECT LOGIN!$'

PSWRD  DB 'studilgu'                ; Password
BUFF   DB 20 DUP(?)                 ; Password buffer
MSG1   DB 'ENTER YOUR PASSWORD: $'
MSG2   DB 'WRONG PASSWORD!$'
MSG3   DB 'CORRECT PASSWORD!$'

; Room information messages
choice db "ENTER YOUR CHOICE (1-Room Timetable, 2-Exit): $"
room_msg db "CS DEPARTMENT ROOM TIMETABLE$"

; Room timetable data
ttttt db "MONDAY$"
ttttt1 db "LECTURE NO : 1 58-OB - Programming Fundamentals$"
ttttt2 db "LECTURE NO : 2 FREE $"
ttttt3 db "LECTURE NO : 3 12-NB - Data Structures$"
ttttt4 db "TUESDAY$"
ttttt5 db "LECTURE NO : 1 FREE $"
ttttt6 db "LECTURE NO : 2 91-OB - Object Oriented Programming$"
ttttt7 db "LECTURE NO : 3 12-NB - Database Systems$"
ttttt8 db "WEDNESDAY$"
ttttt9 db "LECTURE NO : 1 38-OB - Computer Networks$"
ttttt10 db "LECTURE NO : 2 FREE $"
ttttt11 db "LECTURE NO : 3 32-NB - Operating Systems$"
ttttt12 db "THURSDAY$"
ttttt13 db "LECTURE NO : 1 5-OB - Software Engineering$"
ttttt14 db "LECTURE NO : 2 FREE $"
ttttt15 db "LECTURE NO : 3 19-NB - Web Technologies$"
ttttt16 db "FRIDAY$"
ttttt17 db "LECTURE NO : 1 58-OB - Artificial Intelligence$"
ttttt18 db "LECTURE NO : 2 FREE $"
ttttt19 db "LECTURE NO : 3 12-NB - Machine Learning$"
ttttt20 db "SATURDAY$"
ttttt21 db "ALL SLOTS FREE $"
ttttt22 db "SUNDAY$"
ttttt23 db "ALL SLOTS FREE$"

mmmm db "PRESS 1 GO BACK TO MENU $"
mmmm1 db "PRESS 2 EXIT$"

.code
main proc 
    mov ax,@data
    mov ds,ax
    
    print project_title 
    call newline
    
    ; First authentication - Email
    LEA SI,PSWRD1
    LEA DI,BUFF1
    MOV AH,9
    LEA DX,MSG11
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
    
    LEA SI,PSWRD1
    LEA DI,BUFF1
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
    LEA DX,MSG13
    INT 21H
    jmp password_check
    
login_failed:
    MOV AH,9
    LEA DX,MSG12
    INT 21H
    mov ah,4ch
    int 21h

password_check:
    call newline
    LEA SI,PSWRD
    LEA DI,BUFF
    MOV AH,9
    LEA DX,MSG1
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
    LEA DX,MSG3
    INT 21H
    JMP main_menu

password_failed:
    MOV AH,9
    LEA DX,MSG2
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
    print ttttt    ; Monday
    call newline
    print ttttt1
    call newline
    print ttttt2
    call newline
    print ttttt3
    call newline
    print ttttt4   ; Tuesday
    call newline
    print ttttt5
    call newline
    print ttttt6
    call newline
    print ttttt7
    call newline
    print ttttt8   ; Wednesday
    call newline
    print ttttt9
    call newline
    print ttttt10
    call newline
    print ttttt11
    call newline
    print ttttt12  ; Thursday
    call newline
    print ttttt13
    call newline
    print ttttt14
    call newline
    print ttttt15
    call newline
    print ttttt16  ; Friday
    call newline
    print ttttt17
    call newline
    print ttttt18
    call newline
    print ttttt19
    call newline
    print ttttt20  ; Saturday
    call newline
    print ttttt21
    call newline
    print ttttt22  ; Sunday
    call newline
    print ttttt23
    call newline
    
    print mmmm
    call newline
    print mmmm1
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

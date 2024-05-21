;Assignment : To check the vowels in my name

include "emu8086.inc"      
.model small
.stack 100h
.data     
arr1 db 20 dup('$')  
var1 db 0      
arr2 db 'A','E','I','O','U','a','e','i','o','u' 
arrSize db 0
.code

main proc           
    mov ax, @data
    mov ds, ax  
    mov cx, 20
    mov si, offset arr1  
    mov bl, 0
    
    print "Enter your Name: "  
    
    label1: 
    mov ah, 1
    int 21h
    mov [si], al        
    cmp al, 13
    je output
    inc bl 
    inc si             
    loop label1     
    
    output:
    mov cx, bx
    mov arrSize, bl
    mov dl, 10
    mov ah, 2
    int 21h
         
    mov dl, 13
    mov ah, 2
    int 21h
        
    print "You've Entered: "    
    mov si, offset arr1
    
    label2:   
    mov dx, [si]  
    mov ah, 2    
    int 21h    
    inc si             
    loop label2
    
    call vowel
    
    mov ah, 4ch
    int 21h 
main endp

;Check Vowels Procedure
vowel proc 
    mov ax, @data
    mov ds, ax 
                                    
    ;Check for Vowel   
    mov si, offset arr1 
    mov di, offset arr2 
    
    mov cx, bx 
    mov dx, 0
    mov bl, 0        
    
    mov dl, 10
    mov ah, 2
    int 21h
     
    mov dl, 13
    mov ah, 2
    int 21h
        
    print "Vowels in this: " 
    
    label3:     
    mov dl, [si]
    mov var1, cl 
    mov cx, 10   
       
        label4: 
        mov dl, [si] 
        cmp dl, [di]  
        
        je call vowelCounter
        inc di 
        loop label4 
   
    innerTermination:        
    inc si 
    mov cl, var1 
    mov di, offset arr2      
    loop label3 
    
    mov dl, 10
    mov ah, 2
    int 21h     
    mov dl, 13
    mov ah, 2
    int 21h   
    print "Count: " 
    mov dl, bl  
    add dl, 48
    mov ah, 2   
    int 21h         
    ret 
vowel endp

;Counter for Vowel Procedure
vowelCounter proc 
    add bl, 1 
    ;Prints Vowel on Console Screen 
    mov ah, 2
    int 21h
    jmp innerTermination    
    ret
vowelCounter endp
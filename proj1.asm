#include <reg932.inc>

cseg at 0

	mov p2m1,#0		; configure Port 2 as bi-directional
	mov p1m1,#0		; configure Port 1 as bi-directional
	mov p0m1,#0		; configure Port 0 as bi-directional

loop:
	mov c,p2.0		; move switch 1 to c flag
	jnc red_loop1		; jump to red_loop1 label if sw1 pressed
	mov c,p0.1		; move switch 2 to c flag
	jnc yellow_loop2	; jump to yellow_loop2 label if sw2 pressed
	mov c,p2.3		; move switch 3 to c flag
	jnc green_loop3		; jump to green_loop3 label if sw3 pressed
	mov c,p0.2		; move switch 4 to c flag
	jnc amber_loop4		; jump to amber_loop4 label if sw4 pressed
	mov c,p1.4		; move switch 5 to c flag
	jnc blue_loop5		; jump to blue_loop5 label if sw5 pressed
	mov c,p0.0		; move switch 4 to c flag
	jnc red_loop6		; jump to red_loop6 label if sw6 pressed
	mov c,p2.1		; move switch 4 to c flag
	jnc yellow_loop7	; jump to yellow_loop7 label if sw7 pressed
	mov c,p0.3		; move switch 4 to c flag
	jnc green_loop8		; jump to green_loop8 label if sw8 pressed
	mov c,p2.2		; move switch 4 to c flag
	jnc amber_loop9		; jump to amber_loop9 label if sw9 pressed
	
	sjmp led_off		; jumps to led_off if no buttons are pressed

red_loop1:
	clr p2.4		; turns the red LED1 on
	sjmp loop		; jumps back to start of program
yellow_loop2:			; led flash loop label 
	clr p0.5		; turns the yellow LED2 on
	sjmp loop		; jumps back to start of program
green_loop3:
	clr p2.7		; turns the green LED3 on
	sjmp loop		; jumps back to start of program
amber_loop4:
	clr p0.6		; turns the amber LED4 on
	sjmp loop		; jumps back to start of program
blue_loop5:
	clr p1.6		; turns the blue LED5 on
	sjmp loop		; jumps back to start of program
red_loop6:
	clr p0.4		; turns the red LED6 on
	sjmp loop		; jumps back to start of program
yellow_loop7:
	clr p2.5		; turns the yellow LED7 on
	sjmp loop		; jumps back to start of program
green_loop8:
	clr p0.7		; turns the green LED8 on
	sjmp loop		; jumps back to start of program
amber_loop9:
	clr p2.6		; turns the amber LED9 on
	sjmp loop		; jumps back to start of program
led_off:
	setb p2.4		; switches the red LED1 off
	setb p0.5		; switches the yellow LED2 off
	setb p2.7		; switches the green LED3 off
	setb p0.6		; switches the amber LED4 off
	setb p1.6		; switches the blue LED5 off
	setb p0.4		; switches the red LED6 off
	setb p2.5		; switches the yellow LED7 off
        setb p0.7               ; switches the green LED8 off
	setb p2.6		; switches the amber LED9 off
	sjmp loop		; jumps back to the start of the program

end

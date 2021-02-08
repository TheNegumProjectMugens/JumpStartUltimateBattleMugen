
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
[Command]
name = "superjump" ;Required (do not remove)
command = ~$D,U
time = 10

[command]
name = "CU"
command = D,F,a
time = 15

[command]
name = "T"
command = D,B,a
time = 15

[Command]
name = "QCB_x"
command = D, DB, B, x
time = 20

[Command]
name = "QCF_x"
command = D, DF, F, x
time = 20

[command]
name = "T2"
command = D,B,b
time = 15

[command]
name = "T3"
command = D,B,c
time = 15

[command]
name = "C"
command = D,F,b
time = 15

[command]
name = "C4"
command = D,F,c
time = 15

[command]
name = "C1"
command = /b
time = 15

command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------

;-| Special Motions |------------------------------------------------------

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

x = x
[command]
name = "CS22"
command = ~D,
time = 15


;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

[Command]
name = "segura_x"
command = /x

[Command]
name = "segura_y"
command = /y

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

; Air Dash FWD
[State -1, Air Dash FWD]
type = ChangeState
value = 111
triggerall = command = "FF"
triggerall = power >= 50
trigger1 = statetype = A
trigger1 = ctrl

[State -1, superjump]
type = Changestate
value = 4000
triggerall = command = "superjump"
trigger1 = statetype != A
trigger1 = ctrl

; Air Dash FWD
[State -1, Air Dash FWD]
type = ChangeState
value = 112
triggerall = command = "BB"
triggerall = power >= 50
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State -1, Amaterasu]
type = ChangeState
value = 1000
triggerall = command = "C4"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 3000

[State -1, Amaterasu]
type = ChangeState
value = 450
triggerall = command = "T3"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 3000

[State -1, Amaterasu]
type = ChangeState
value = 230
triggerall = command = "CU"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 1000

[State -1, Amaterasu]
type = ChangeState
value = 230
triggerall = command = "a"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 1000


[State -1, Amaterasu]
type = ChangeState
value = 420
triggerall = command = "T"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 1000

[State -1, Amaterasu]
type = ChangeState
value = 250
triggerall = command = "C"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 500

[State -1, Amaterasu]
type = ChangeState
value = 440
triggerall = command = "T2"
trigger1 = (statetype = s) && ctrl
triggerall = power >= 2000

[State -1]
type = ChangeState
value = 46
triggerall = backedgebodydist <= 1 && backedgebodydist > -1
triggerall = command = "holdfwd"
triggerall = var(0) = 0
triggerall = Pos Y < -30
trigger1 = StateType = A
trigger1 = Ctrl
trigger1 = Vel X <= 0


;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "y" || command = "z"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 10
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;===========================================================================
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = stateno = 100
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S

; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 220
triggerall = stateno = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = time >= 10

;---------------------------------------------------------------------------

; Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = stateno = 220
triggerall = command = "x"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = time >= 15

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
triggerall = power >= 200

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State -1, Teleport]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = ctrl
trigger1 = command = "holdfwd"
triggerall = power >= 200

[State -1, Teleport]
type = ChangeState
value = 431
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype = S
triggerall = ctrl
trigger1 = command = "holdback"
triggerall = power >= 200
;---------------------------------------------------------------------------
;Power Charge
[State -1, Power Charge]
type = ChangeState
value = 900
triggerall = Power < 3000 ;evita que continue carregando quando já está com o power cheio
triggerall = (command = "segura_x"&&command = "segura_y") ;lembre-se de unir os dois comandos criados acima
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------

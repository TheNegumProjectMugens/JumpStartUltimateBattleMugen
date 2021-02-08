; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = "some_name"
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /F, a    ;hold fwd while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;               command = ~30
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their engine.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands are given below. Delete, add, or modify as you wish.

;-| Super Motions |--------------------------------------------------------


;-| Special Motions |------------------------------------------------------
;-----------------


;-----------------
; QCB
[Command]
name = "QCB_a"
command = ~D, DB, B, a

[Command]
name = "QCB_b"
command = ~D, DB, B, b

[Command]
name = "QCB_c"
command = ~D, DB, B, c

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_z"
command = ~D, DB, B, z

;-----------------
; Uppercut
[Command]
name = "uppercut_a"
command = ~F, D, DF, a

[Command]
name = "uppercut_b"
command = ~F, D, DF, b

[Command]
name = "uppercut_c"
command = ~F, D, DF, c

[Command]
name = "uppercut_x"
command = ~F, D, DF, x

[Command]
name = "uppercut_y"
command = ~F, D, DF, y

[Command]
name = "uppercut_z"
command = ~F, D, DF, z


;--------------------
;Charge_Down_up
[Command]
name = "chargedownup_a"
command = ~60$D, U, a
time = 10

[Command]
name = "chargedownup_b"
command = ~60$D, U, b
time = 10

[Command]
name = "chargedownup_c"
command = ~60$D, U, c
time = 10

[Command]
name = "chargedownup_x"
command = ~60$D, U, x
time = 10

[Command]
name = "chargedownup_y"
command = ~60$D, U, y
time = 10

[Command]
name = "chargedownup_z"
command = ~60$D, U, z
time = 10

;--------------------
;Charge_Back_fwd
[Command]
name = "chargebackfwd_a"
command = ~60$B, F, a
time = 10

[Command]
name = "chargebackfwd_b"
command = ~60$B, F, b
time = 10

[Command]
name = "chargedownup_c"
command = ~60$D, U, c
time = 10

[Command]
name = "chargedownup_x"
command = ~60$D, U, x
time = 10

[Command]
name = "chargedownup_y"
command = ~60$D, U, y
time = 10

[Command]
name = "chargedownup_z"
command = ~60$D, U, z
time = 10



;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF";Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB";Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = a+b
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "fwd_a"
command = /F,a
time = 1

[Command]
name = "fwd_b"
command = /F,b
time = 1

[Command]
name = "fwd_c"
command = /F,c
time = 1

[Command]
name = "fwd_x"
command = /F,x
time = 1

[Command]
name = "fwd_y"
command = /F,y
time = 1

[Command]
name = "fwd_z"
command = /F,z
time = 1

[Command]
name = "back_a"
command = /B,a
time = 1

[Command]
name = "back_b"
command = /B,b
time = 1

[Command]
name = "back_c"
command = /B,b
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
name = "fwd_yb"
command = /F, y+b
time = 1

[Command]
name = "back_yb"
command = /B, y+b
time = 1

[Command]
name = "back_ab"
command = /B, a+b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "up"
command = ~5UF, /UF
time = 40

[Command]
name = "up"
command = ~5UB, /UB
time = 40

[Command]
name = "up"
command = ~5UB, /UF
time = 40

[Command]
name = "up"
command = ~5UF, /UB
time = 40

[Command]
name = "up"
command = ~5U, /U
time = 40

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

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup";Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_yb"
command = /y+b
time = 30

[Command]
name = "hold_xa"
command = /x+a
time = 30

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 30

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 30

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1]                  ;Don't change this
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = "command_name"
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
;   - ctrl
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

;---------------------------------------------------------------------------
;sonic flip
[state -1]
type = changestate
value = 1000
triggerall = command = "up" && stateno != 100 && stateno != 105
trigger1 = statetype = A
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;charge
[state -1]
type = changestate
value = 400
triggerall = command = "hold_s" && statetype = S
trigger1 = (ctrl)

;---------------------------------------------------------------------------
;pursuit
[state -1]
type = changestate
value = 90
triggerall = command = "holdfwd" && stateno = 203 && (movecontact)
triggerall = (command = "a" || command = "b" || command = "c")
trigger1 = statetype = S && time > 10

;finish pursuit
[state -1]
type = changestate
value = 602
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 90 || (prevstateno = 90 && (ctrl))

;---------------------------------------------------------------------------
;RunFwd
[State -1]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;RunBack
[State -1]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;Stand_Throw (close dir+b)
; Complicated? Skip the throws and look at stand_a, etc, first.
; This is disabled right now. Remove the "null;" below when you
; want to use it.
[State -1]
type =  ChangeState
value = 900
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = p2bodydist X < 5 ;Near P2
trigger1 = command = "fwd_b";p2 stand
trigger1 = stateno != 100    ;Not running
trigger1 = p2statetype = S
trigger1 = p2movetype != H
trigger2 = command = "fwd_b";p2 crouch
trigger2 = stateno != 100    ;Not running
trigger2 = p2statetype = C
trigger2 = p2movetype != H
trigger3 = command = "back_b";p2 stand
trigger3 = p2statetype = S
trigger3 = p2movetype != H
trigger4 = command = "back_b";p2 crouch
trigger4 = p2statetype = C
trigger4 = p2movetype != H

;---------------------------------------------------------------------------
;Air_Throw1 (close dir+b)
; This is disabled right now. Remove the "null;" below when you
; want to use it.
[State -1]
type = null; ChangeState
value = 950
triggerall = statetype = A
triggerall = ctrl = 1
triggerall = p2bodydist X < 9
triggerall = p2bodydist Y > -22
triggerall = p2bodydist Y < 22
triggerall = p2statetype = A
triggerall = p2movetype != H
trigger1 = command = "fwd_b"
trigger2 = command = "back_b"


;==========================================================================
; sonic flare
[State -1]
type = ChangeState
value = 203
triggerall = command = "a" && command = "holdfwd";Place name of command here
;triggerall = command != "holddown" 
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = 202 && (movecontact)

; sonic updraft
[State -1]
type = ChangeState
value = 204
triggerall = command = "a" && command = "holdback";Place name of command here
;triggerall = command != "holddown" 
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = 202 && (movecontact) 

;---------------------------------------------------------------------------
;1st attack
; Sonic punch
[State -1]
type = ChangeState
value = 200
triggerall = command = "a"
;triggerall = command != "holddown" 
trigger1 = statetype = S
trigger1 = ctrl = 1

; sonic kick
[State -1]
type = ChangeState
value = 201
triggerall = command = "a"
;triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = 200 && AnimElemTime(3) > 0

; top kick 
[State -1]
type = ChangeState
value = 202
triggerall = command = "a"
;triggerall = command != "holddown" 
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = 201 && AnimElemTime(3) > 0



;---------------------------------------------------------------------------
;windmill
[State -1]
type = ChangeState
value = 601
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = stateno = 100 || stateno = 105
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;sonic rocket
[State -1]
type = ChangeState
value = 600
triggerall = command = "a" || command = "b" || command = "c"
trigger1 = statetype = A && (stateno != 100 || stateno != 105)
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;sonic Wave
[state -1]
type = changestate
value = 1010
triggerall = command = "x"
Triggerall = power >=200
trigger1 = statetype = S && ctrl = 1

;sonic Storm
[state -1]
type = changestate
value = 1020
triggerall = command = "x" && stateno != 1010 && (stateno != 100 || stateno != 105)
Triggerall = power >=200
trigger1 = Statetype = A && (ctrl) 
trigger2 = stateno = 600 && time > 10
trigger3 = stateno = 1000 && time > 15

;sonic drive
[state -1]
type = changestate
value = 1030
triggerall = command = "y" && numhelper(1031) = 0
trigger1 = statetype = S && ctrl

;sonic drive part 2
[state -1]
type = changestate
value = 1033
triggerall = command = "y" && numhelper(1031) = 1
Triggerall = power >=300
trigger1 = statetype = S && stateno = 1030
trigger2 = statetype = S && (ctrl)

;sonic meteor
[state -1]
type = changestate
value = 1040
triggerall = command = "y"
Triggerall = power >300
trigger1 = statetype = A && (ctrl)
trigger2 = stateno = 50 || (stateno = 1000 && time > 10)
trigger3 = stateno = 600 && time > 20

;sonic cracker
[state -1]
type = changestate
value = 1050
triggerall = command = "z"
Triggerall = power >=400
trigger1 = statetype = S && (ctrl)

;sonic air cracker
[state -1]
type = changestate
value = 1060
triggerall = command = "z"
Triggerall = power >=400
trigger1 = statetype = A && (ctrl)

;Spin Dash
[state -1]
type = changestate
value = 82
triggerall = command = "x"
triggerall = command = "holddown"
Triggerall = power >=20
trigger1 = statetype = C && (ctrl)




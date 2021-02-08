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


;-| Super Motions |--------------------------------------------------------
[Command]
name = "super1a"
command = ~D, DF, F, D, DF, F,  a
time = 30

[Command]
name = "super1b"
command = ~D, DF, F, D, DF, F,  b
time = 30

[Command]
name = "Shield"
command = ~D, DB, B, D, DB, B, a
time = 30

;-| Special Motions |------------------------------------------------------
[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCB_a"
command = ~D, DF, F, a

[Command]
name = "QCB_b"
command = ~D, DF, F, b

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

[Command]
name = "ab"
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
name = "downfwd_a"
command = /DF,a
time = 1

[Command]
name = "downfwd_b"
command = /DF,b
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
command = /B,c
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
name = "fwd_ab"
command = /F, a+b
time = 1

[Command]
name = "back_ab"
command = /B, a+b
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
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
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
;Super1A
[State -1]
type = ChangeState
value = 3000
triggerall = command = "super1a"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = MoveContact

;Super1B
[State -1]
type = ChangeState
value = 3000
triggerall = command = "super1b"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = MoveContact

;---------------------------------------------------------------------------
;SHIELD
[State -1]
type = ChangeState
value = 6000
triggerall = command = "Shield"
triggerall = power >= 3000
triggerall = numhelper(6900) = 0
;triggerall = Var(1) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = MoveContact

;===========================================================================
;---------------------------------------------------------------------------
;Fireball_X
[State -1]
type = ChangeState
value = 1000
triggerall = command = "QCF_a";fireball_x ;-------
triggerall = numproj = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
;trigger2 = stateno = 200        ;Stand_x
;trigger2 = MoveContact
;trigger3 = stateno = 300        ;Stand_z
;trigger3 = MoveContact
;trigger4 = stateno = 500        ;Crouch_b
;trigger4 = MoveContact
;trigger6 = stateno = 210        ;stand_b
;trigger6 = MoveContact
;trigger7 = stateno = 400        ;crouch_a
;trigger7 = MoveContact
;trigger8 = stateno = 450        ;crouch_z
;trigger8 = MoveContact
;trigger9 = stateno = 430        ;crouch_x
;trigger9 = MoveContact



;---------------------------------------------------------------------------
;Fireball_Y
[State -1]
type = ChangeState
value = 1010
triggerall = command = "QCF_b";fireball_x ;-------
triggerall = numproj = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
;trigger2 = stateno = 200        ;Stand_x
;trigger2 = MoveContact
;trigger3 = stateno = 300        ;Stand_z
;trigger3 = MoveContact
;trigger4 = stateno = 500        ;Crouch_b
;trigger4 = MoveContact
;trigger6 = stateno = 210        ;stand_b
;trigger6 = MoveContact
;trigger7 = stateno = 400        ;crouch_a
;trigger7 = MoveContact
;trigger8 = stateno = 450        ;crouch_z
;trigger8 = MoveContact
;trigger9 = stateno = 430        ;crouch_x
;trigger9 = MoveContact



;===========================================================================
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
;Stand_Throw
[State -1]
type = ChangeState
value = 900
triggerall = statetype = S
triggerall = ctrl = 1
trigger1 = command = "fwd_ab";Command
trigger2 = command = "back_ab";Command
trigger3 = command = "fwd_b";Near, p2 stand
trigger3 = stateno != 100    ;Not running
trigger3 = p2bodydist X < 3
trigger3 = p2statetype = S
trigger3 = p2movetype != H
trigger4 = command = "fwd_b";Near, p2 crouch
trigger4 = stateno != 100    ;Not running
trigger4 = p2bodydist X < 3
trigger4 = p2statetype = C
trigger4 = p2movetype != H
trigger5 = command = "back_b";Near, p2 stand
trigger5 = p2bodydist X < 5
trigger5 = p2statetype = S
trigger5 = p2movetype != H
trigger6 = command = "back_b";Near, p2 crouch
trigger6 = p2bodydist X < 5
trigger6 = p2statetype = C
trigger6 = p2movetype != H

;---------------------------------------------------------------------------
;Air_Throw1
[State -1]
type = ChangeState
value = 950
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = command = "fwd_ab"
trigger2 = command = "back_ab"
;---------------------------
;Air_Throw1 (second set of commands)
[State -1]
type = ChangeState
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


;===========================================================================
;---------------------------------------------------------------------------
;Stand_A
[State -1]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
;trigger2 = stateno = 200
;trigger2 = time > 7

;---------------------------------------------------------------------------
;Stand_B
[State -1]
type = ChangeState
value = 210
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = 200
trigger2 = MoveContact

;---------------------------------------------------------------------------
;Crouch_A
[State -1]
type = ChangeState
value = 400
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;Crouch_B
[State -1]
type = ChangeState
value = 410
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = stateno = 400 ;crouch_a
trigger2 = MoveContact
trigger3 = stateno = 500 ;crouch_fwd_a
trigger3 = MoveContact

;---------------------------------------------------------------------------
;Jump_A
[State -1]
type = ChangeState
value = 600
trigger1 = command = "a"
trigger1 = statetype = A
trigger1 = ctrl = 1
trigger2 = command = "a";-------
trigger2 = stateno = 600 ;jump_a
trigger2 = statetime >= 6

;---------------------------------------------------------------------------
;Jump_B
[State -1]
type = ChangeState
value = 610
trigger1 = command = "b"
trigger1 = statetype = A
trigger1 = ctrl = 1
trigger2 = command = "b";-------
trigger2 = stateno = 600 ;jump_a
trigger2 = MoveContact
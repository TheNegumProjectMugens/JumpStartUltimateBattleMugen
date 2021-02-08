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
name = "Sonicfury"
command = ~D, DF, F, a+b

[Command]
name = "super_hurricane"
command = ~D, DB, B, D, DB, B, a
time = 30

[Command]
name = "super_hurricane"
command = ~D, DB, B, D, DB, B, b
time = 30

[Command]
name = "raging_demon"
command = a, a, F, b
time = 25

[Command]
name = "supershuang_a"
command = ~D, DF, F, D, DF, F, c
time = 20

[Command]
name = "SpinDash"
command = ~D, DF, F, D, DF, F, b
time = 30

;-| Special Motions |------------------------------------------------------
[Command]
name = "nedleehit_a"
command = ~D, DF, F, a

[Command]
name = "nedleehit_b"
command = ~D, DF, F, b

[Command]
name = "Summon Tails_a"
command = ~D, DB, B, a

[Command]
name = "Summon Tails_b"
command = ~D, DB, B, b

[Command]
name = "Jet_a"
command = ~D, DB, B, c
time = 7

[Command]
name = "Jet_b"
command = ~D, DF, F, c
time = 7

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

-| Hold Button |-----------------------------------------------------------

[Command]
name = "hold_yb"
command = /y+b
time = 30

[Command]
name = "hold_yb"
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
;RagingDemon
[State -1]
type = ChangeState
value = 4000
triggerall = command = "raging_demon"
triggerall = power >= 3000
trigger1 = ctrl = 1
trigger1 = statetype != A

;---------------------------------------------------------------------------
;Spin Dash
[State -1]
type = ChangeState
value = 3400
triggerall = command = "SpinDash"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = movecontact = 1

;---------------------------------------------------------------------------
;Superwaza A
[State -1]
type = ChangeState
value = 3000
triggerall = command = "Sonicfury"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = movecontact = 1

;---------------------------------------------------------------------------
;Super_Hurricane
[State -1]
type = ChangeState
value = 1800
triggerall = power >= 1000
triggerall = command = "super_hurricane"
trigger1 = statetype != A
trigger1 = ctrl = 1
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger3 = stateno = 200
trigger3 = movecontact = 1
trigger4 = stateno = 300        ;Stand_fwd_a
trigger4 = movecontact = 1
trigger5 = stateno = 210        ;stand_b
trigger5 = movecontact = 1
trigger6 = stateno = 1700;
trigger6 = movecontact = 1
trigger7 = stateno = 1600
trigger7 = movecontact = 1

;---------------------------------------------------------------------------
;SUPERSHUANG 
[State -1]
type = ChangeState
value = 2040
triggerall = command = "supershuang_a"
triggerall = power >= 1000 ;Level 1
trigger1 = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 200        ;stand_a
trigger3 = statetype != A
trigger3 = hitdefattr = SC, NA, SA
trigger3 = movecontact = 1
trigger4 = stateno = 101

;===========================================================================
;---------------------------------------------------------------------------
;WazaA_a
[State -1]
type = ChangeState
value = 1000
triggerall = command = "nedleehit_a"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = 200
trigger2 = movecontact = 1
trigger3 = stateno = 210
trigger3 = movecontact = 1
trigger4 = stateno = 400
trigger4 = movecontact = 1
trigger5 = stateno = 410
trigger5 = movecontact = 1

;---------------------------------------------------------------------------
;WazaA_b
[State -1]
type = ChangeState
value = 1010
triggerall = command = "nedleehit_b"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = stateno = 200
trigger2 = movecontact = 1
trigger3 = stateno = 210
trigger3 = movecontact = 1
trigger4 = stateno = 400
trigger4 = movecontact = 1
trigger5 = stateno = 410
trigger5 = movecontact = 1

;---------------------------------------------------------------------------
;Summon Tails_b
[State -1]
type = ChangeState
value = 2003
triggerall = command = "Summon Tails_b"
trigger1 = statetype != A
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;Summon Tails_a
[State -1]
type = ChangeState
value = 2000
triggerall = command = "Summon Tails_a"
trigger1 = statetype != A
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;Jet_A
[State -1]
type = ChangeState
value = 1040
triggerall = command = "Jet_a"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = statetype = C
trigger2 = ctrl = 1
trigger3 = stateno = 200        ;Stand_a
trigger3 = time >= 3
trigger4 = stateno = 400        ;Crouch_a
trigger4 = time >= 3
trigger5 = stateno = 310        ;Stand_fwd_b
trigger5 = movecontact = 1
trigger6 = stateno = 210        ;Stand_b
trigger6 = movecontact = 1
trigger7 = stateno = 101

;---------------------------------------------------------------------------
;Jet_B
[State -1]
type = ChangeState
value = 1055
triggerall = command = "Jet_b"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = statetype = C
trigger2 = ctrl = 1
trigger3 = stateno = 200        ;Stand_a
trigger3 = time >= 3
trigger4 = stateno = 400        ;Crouch_a
trigger4 = time >= 3
trigger5 = stateno = 310        ;Stand_fwd_b
trigger5 = movecontact = 1
trigger6 = stateno = 210        ;Stand_b
trigger6 = movecontact = 1
trigger7 = stateno = 101

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
trigger2 = stateno = 200
trigger2 = time > 7

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
trigger2 = movecontact = 1

;---------------------------------------------------------------------------
;Crouch_A
[State -1]
type = ChangeState
value = 402
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
;Crouch_B
[State -1]
type = ChangeState
value = 403
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = stateno = 400 ;crouch_a
trigger2 = movecontact = 1
trigger3 = stateno = 500 ;crouch_fwd_a
trigger3 = movecontact = 1

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
trigger2 = movecontact = 1

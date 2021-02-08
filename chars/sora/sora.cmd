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
name = "start"
command = s
time = 1

[Command]
name = "F"
command = F
time = 1

[Command]
name = "B"
command = B
time = 1

[Command]
name = "U"
command = U
time = 1

[Command]
name = "D"
command = D
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
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1


[Command]
name = "a2"
command = a
time = 1

[Command]
name = "b2"
command = b
time = 1

[Command]
name = "c2"
command = c
time = 1

[Command]
name = "x2"
command = x
time = 1

[Command]
name = "y2"
command = y
time = 1

[Command]
name = "z2"
command = z
time = 1

[Command]
name = "start2"
command = s
time = 1

[Command]
name = "holdfwd2"
command = /$F
time = 1

[Command]
name = "holdback2"
command = /$B
time = 1

[Command]
name = "holdup2"
command = /$U
time = 1

[Command]
name = "holddown2"
command = /$D
time = 1

[Command]
name = "holda2"
command = /a
time = 1

[Command]
name = "holdb2"
command = /b
time = 1

[Command]
name = "holdc2"
command = /c
time = 1

[Command]
name = "holdx2"
command = /x
time = 1

[Command]
name = "holdy2"
command = /y
time = 1

[Command]
name = "holdz2"
command = /z
time = 1

[Command]
name = "holdstart2"
command = /s
time = 1

[Command]
name = "recovery2"
command = x+y
time = 1

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
;   name = some_name
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
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
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
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
;

;-| Super Motions |--------------------------------------------------------


;-| Special Motions |------------------------------------------------------

[Command]
name = "upper_x"
command = ~F, D, DF, x

[Command]
name = "upper_y"
command = ~F, D, DF, y

[Command]
name = "upper_xy"
command = ~F, D, DF, x+y

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_a"
command = ~D, DF, F, a

[Command]
name = "QCB_b"
command = ~D, DF, F, b

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "BF"     ;Required (do not remove)
command = B, F
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "forward_a"
command = /$F,a
time = 1

[Command]
name = "forward_x"
command = /$F,x
time = 1

[Command]
name = "sweep"
command = /$B, x
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
name = "start"
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
name = "holdup" ;Required (do not remove)
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

;--------------------------------------------------------------------------;-
;Dodge Roll
;ƒ_ƒbƒVƒ…
[State -1, DodgeRoll]
type = ChangeState
value = 100
triggerall = statetype = S
triggerall = ctrl
triggerall = !IsHelper
triggerall = var(2) = 0
trigger1 = command = "FF"
trigger2 = command = "BF"

;===========================================================================
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;SORA'S MOVES
;;;;;;;;;;;;;;;;;;;
;;; SUPER MOVES ;;;
;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
;;; SPECIAL MOVES ;;;
;;;;;;;;;;;;;;;;;;;;;
;Cure
[State -1, Cure]
type = ChangeState
value = 1000
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 0
triggerall = Power >= 600
trigger1 = command = "b"

;Fire
[State -1, Fire]
type = ChangeState
value = 1010
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 1
triggerall = Power >= 300
trigger1 = command = "b"

;Blizzard
[State -1, Blizzard]
type = ChangeState
value = 1020
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 2
triggerall = Power >= 300
trigger1 = command = "b"

;Thunder
[State -1, Thunder]
type = ChangeState
value = 1030
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 3
triggerall = Power >= 300
trigger1 = command = "b"

;Gravity
[State -1, Gravity]
type = ChangeState
value = 1040
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 4
triggerall = Power >= 300
trigger1 = command = "b"

;Stop
[State -1, Stop]
type = ChangeState
value = 1050
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 5
triggerall = Power >= 300
trigger1 = command = "b"

;Aero
[State -1, Aero]
type = ChangeState
value = 1060
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 6
triggerall = Power >= 300
trigger1 = command = "b"

;Select Magic
[State -1, MagicSelect]
type = ChangeState
value = 1500
triggerall = !IsHelper
triggerall = statetype = S
triggerall = MoveType != H
triggerall = StateNo != 1500
trigger1 = command = "holdy"

;Call Party Member
[State -1, Call Party Member]
type = ChangeState
value = 1600
triggerall = !IsHelper
triggerall = RoundState = 2
triggerall = StateNo != 1600
triggerall = statetype = S
triggerall = NumHelper = 0
trigger1 = P1Name = "Sora" && P3Name != "Sora"
trigger2 = P1Name != "Sora" && P3Name = "Sora"
trigger3 = P2Name = "Sora" && P4Name != "Sora"
trigger4 = P2Name != "Sora" && P4Name = "Sora"

;;;;;;;;;;;;;;;;;;;;;
;;; REGULAR MOVES ;;;
;;;;;;;;;;;;;;;;;;;;;
;First Strike (Ground)
[State -1, FirstStrikeGround]
type = ChangeState
value = 200
triggerall = !IsHelper
triggerall = statetype = S
triggerall = ctrl
trigger1 = command = "a"

;First Strike (Air)
[State -1, FirstStrikeAir]
type = ChangeState
value = 600
triggerall = !IsHelper
triggerall = statetype = A
triggerall = ctrl
trigger1 = command = "a"

;PARTY MEMBERS MOVES
;;;;;;;;;;;;;;;;;;;;
;;; BASIC STATES ;;;
;;;;;;;;;;;;;;;;;;;;
;Turn
;[State -1, Turn]
;type = Turn
;triggerall = IsHelper
;triggerall = Ctrl
;trigger1 = command = "B"

;DONALD
;Ground Staff Attack
[State -1, DonaldGroundStaff]
type = ChangeState
value = 20020
triggerall = IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 1
trigger1 = command = "a"

;Cure
;[State -1, DonaldCure]
;type = ChangeState
;value = 20021
;triggerall = IsHelper
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = var(0) = 1
;trigger1 = command = "b"

;Fire
;[State -1, DonaldFire]
;type = ChangeState
;value = 20022
;triggerall = IsHelper
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = var(0) = 1
;trigger1 = command = "b"

;Blizzard
;[State -1, DonaldBlizzard]
;type = ChangeState
;value = 20023
;triggerall = IsHelper
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = var(0) = 1
;trigger1 = command = "b"

;Thunder
;[State -1, DonaldThunder]
;type = ChangeState
;value = 20024
;triggerall = IsHelper
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = var(0) = 1
;trigger1 = command = "b"

;Gravity
;[State -1, DonaldGravity]
;type = ChangeState
;value = 20025
;triggerall = IsHelper
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = var(0) = 1
;trigger1 = command = "b"

;Stop
;[State -1, DonaldStop]
;type = ChangeState
;value = 20026
;triggerall = IsHelper
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = var(0) = 1
;trigger1 = command = "b"

;Aero
;[State -1, DonaldAero]
;type = ChangeState
;value = 20027
;triggerall = IsHelper
;triggerall = statetype = S
;triggerall = ctrl
;triggerall = var(0) = 1
;trigger1 = command = "b"

;Air Staff Attack
[State -1, DonaldAirStaff]
type = ChangeState
value = 20040
triggerall = IsHelper
triggerall = statetype = A
triggerall = ctrl
triggerall = var(0) = 1
trigger1 = command = "a"

;GOOFY
;Ground Shield Strike
[State -1, GoofyGroundShield]
type = ChangeState
value = 20120
triggerall = IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 2
trigger1 = command = "a"

;Air Shield Strike
[State -1, GoofyAirShield]
type = ChangeState
value = 20140
triggerall = IsHelper
triggerall = statetype = A
triggerall = ctrl
triggerall = var(0) = 2
trigger1 = command = "a"

;ALADDIN
;Stand Sword
[State -1, AladdinStandSword]
type = ChangeState
value = 20220
triggerall = IsHelper
triggerall = statetype = S
triggerall = ctrl
triggerall = var(0) = 3
trigger1 = command = "a"

;Duck Sword
[State -1, AladdinDuckSword]
type = ChangeState
value = 20230
triggerall = IsHelper
triggerall = statetype = C
triggerall = ctrl
triggerall = var(0) = 3
trigger1 = command = "a"

;Air Sword
[State -1, AladdinAirSword]
type = ChangeState
value = 20240
triggerall = IsHelper
triggerall = statetype = A
triggerall = ctrl
triggerall = var(0) = 3
trigger1 = command = "a"

;ABU
;Stand Sword
[State -1, AbuStandSword]
type = ChangeState
value = 20320
triggerall = IsHelper
triggerall = statetype = S || statetype = C
triggerall = ctrl
triggerall = var(0) = 4
trigger1 = command = "a"

;Air Sword
[State -1, AbuAirSword]
type = ChangeState
value = 20340
triggerall = IsHelper
triggerall = statetype = A
triggerall = ctrl
triggerall = var(0) = 4
trigger1 = command = "a"

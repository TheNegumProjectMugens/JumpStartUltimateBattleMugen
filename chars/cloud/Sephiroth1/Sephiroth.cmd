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
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
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
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below. 
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
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

; -| CPU Commands |------

[Command]
name = "CPU1"
command = D, D, U, U, D, U
time = 1

[Command]
name = "CPU2"
command = D, U, U, D, D, U
time = 1

[Command]
name = "CPU3"
command = D, D, D, U, U, U
time = 1

[Command]
name = "CPU4"
command = F, F, B, B, F, B
time = 1

[Command]
name = "CPU5"
command = F, B, B, F, F, B
time = 1

[Command]
name = "CPU6"
command = F, F, F, B, B, B
time = 1

[Command]
name = "CPU7"
command = D, U, D, U, D, U
time = 1

[Command]
name = "CPU8"
command = F, B, F, B, F, B
time = 1

[Command]
name = "CPU9"
command = B, F, B, F, B, F
time = 1

[Command]
name = "CPU10"
command = U, D, U, D, U, D
time = 1

[Command]
name = "CPU11"
command = D, F, B, U, D, F
time = 1

[Command]
name = "CPU12"
command = F, D, U, B, F, D
time = 1

[Command]
name = "CPU13"
command = D, F, B, U
time = 1

[Command]
name = "CPU14"
command = F, D, U, B
time = 1

[Command]
name = "CPU14"
command = B, F, U, D, B, U
time = 1

[Command]
name = "CPU14"
command = U, U, U, U, U, U
time = 1

[Command]
name = "CPU15"
command = F
time = 1

[Command]
name = "CPU16"
command = D
time = 1

[Command]
name = "CPU17"
command = B
time = 1

[Command]
name = "CPU18"
command = U
time = 1

[Command]
name = "CPU19"
command = a
time = 1

[Command]
name = "CPU20"
command = b
time = 1

[Command]
name = "CPU21"
command = c
time = 1

[Command]
name = "CPU22"
command = x
time = 1

[Command]
name = "CPU23"
command = y
time = 1

[Command]
name = "CPU24"
command = z
time = 1

[Command]
name = "CPU25"
command = s
time = 1

[Command]
name = "CPU26"
command = D,D,D,F,F,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU27"
command = D,D,D,F,F,U,a+b+c+x+y+z
time = 1

[Command]
name = "CPU28"
command = D,D,D,F,F,UF,a+b+c+x+y+z
time = 1

[Command]
name = "CPU29"
command = D,D,D,F,F,D,a+b+c+x+y+z
time = 1

[Command]
name = "CPU30"
command = D,D,D,F,F,DF,a+b+c+x+y+z
time = 1

[Command]
name = "CPU31"
command = D,D,D,F,F,B,a+b+c+x+y+z
time = 1

[Command]
name = "CPU32"
command = D,D,D,F,F,DB,a+b+c+x+y+z
time = 1

[Command]
name = "CPU33"
command = D,D,D,F,F,UB,a+b+c+x+y+z
time = 1

[Command]
name = "CPU34"
command = D,D,D,F,U,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU35"
command = D,D,D,F,UF,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU36"
command = D,D,D,F,DF,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU37"
command = D,D,D,F,D,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU38"
command = D,D,D,F,DB,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU39"
command = D,D,D,F,B,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU40"
command = D,D,D,F,UB,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU41"
command = D,D,D,F,F,F,a+b+c+x+y,z
time = 1

[Command]
name = "CPU42"
command = D,D,D,F,F,F,a+b+c+x,y,z
time = 1

[Command]
name = "CPU43"
command = D,D,D,F,F,F,a+b+c,x,y,z
time = 1

[Command]
name = "CPU44"
command = D,D,D,F,F,F,a+b,c,x,y,z
time = 1

[Command]
name = "CPU45"
command = D,D,D,F,F,F,a,b,c,x,y,z
time = 1

[Command]
name = "CPU46"
command = D,D,D,F,F,F,a+b+c,x+y+z
time = 1

[Command]
name = "CPU47"
command = D,D,D,F,F,U,a+b,c+x+y+z
time = 1

[Command]
name = "CPU48"
command = D,D,D,F,F,UF,a,b+c+x+y+z
time = 1

[Command]
name = "CPU49"
command = D,D,D,F,F,U,a+b,c+x+y+z
time = 1

[Command]
name = "CPU50"
command = D,D,D,F,F,DF,a,b,c+x+y+z
time = 1

[Command]
name = "CPU51"
command = D,D,D,F,F,B,a+b,c+x,y+z
time = 1

[Command]
name = "CPU52"
command = D,D,D,F,F,DB,a,b+c+x,y+z
time = 1

[Command]
name = "CPU53"
command = D,D,D,F,F,UB,a,b+c+x+y,z
time = 1

[Command]
name = "CPU54"
command = DF,D,D,F,U,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU55"
command = B,D,D,F,UF,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU56"
command = B,B,BD,F,DF,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU57"
command = D,F,F,F,D,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU58"
command = DF,D,DF,UF,DB,F,a+b+c+x+y+z
time = 1

[Command]
name = "CPU59"
command = D,D,D,F,DB,DF,a+b+c+x+y+z
time = 1

[Command]
name = "CPU60"
command = D,D,UF,DF,UB,UF,a+b+c+x+y+z
time = 1

[Command]
name = "CPU61"
command = D,DF,DF,DF,DF,F,a+b+c+x+y,z
time = 1

[Command]
name = "CPU62"
command = D,D,DB,UF,DF,UF,a+b+c+x,y,z
time = 1

[Command]
name = "CPU63"
command = F,U,F,F,F,F,a,b+c,x,y,z
time = 1

[Command]
name = "CPU64"
command = DF,UF,D,DF,U,F,a+b,c+x,y,z
time = 1

[Command]
name = "CPU65"
command = D,D,D,D,F,D,a+b,c,x,y+z
time = 1

[Command]
name = "CPU66"
command = D,D,D,F,F,F,a+b+c+x+y+z,a
time = 1

[Command]
name = "CPU67"
command = D,D,D,F,F,U,a+b+c+x+y+z,b
time = 1

[Command]
name = "CPU68"
command = D,D,D,F,F,UF,a+b+c+x+y+z,c
time = 1

[Command]
name = "CPU69"
command = D,D,D,F,F,D,a+b+c+x+y+z,x
time = 1

[Command]
name = "CPU70"
command = D,D,D,F,F,DF,a+b+c+x+y+z,y
time = 1

[Command]
name = "CPU71"
command = D,D,D,F,F,B,a+b+c+x+y+z,z
time = 1

[Command]
name = "CPU72"
command = D,D,D,F,F,DB,a+b+c+x+y+z,a+b
time = 1

[Command]
name = "CPU73"
command = D,D,D,F,F,UB,a+b+c+x+y+z,a+c
time = 1

[Command]
name = "CPU74"
command = D,D,D,F,U,F,a+b+c+x+y+z,b+c
time = 1

[Command]
name = "CPU75"
command = D,D,D,F,UF,F,a+b+c+x+y+z,x+z
time = 1
;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
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
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

time = 20

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

[Command]
name = "holdb"
command = /$b
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
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------

[state -1, light hit]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[state -1, air hit]
type = ChangeState
value = 205
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = var(1) != 1
trigger1 = statetype = A
trigger1 = ctrl

[state -1, light hit]
type = ChangeState
value = 210
triggerall = stateno = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = time >= 15

[state -1, light hit]
type = ChangeState
value = 230
triggerall = stateno = 210
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = time >= 15

[state -1, Meteor]
type = ChangeState
value = 1000
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl

[state -1, Teleport]
type = ChangeState
value = 5555
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = power >= 100
trigger1 = statetype = S
trigger1 = ctrl = 1

;[state -1, Air Teleport]
;type = ChangeState
;value = 5556
;triggerall = command = "c"
;triggerall = command != "holddown"
;triggerall = power >= 100
;trigger1 = statetype = A
;trigger1 = ctrl = 1

[state -1, Flash]
type = ChangeState
value = 220
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl = 1

[state -1, Levitate]
type = ChangeState
value = 4444
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = power >= 10
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, Levitation Forward]
type = ChangeState
value = 4445
;triggerall = command = "F"
triggerall = command = "holdfwd"
triggerall = power >= 10
triggerall = var(1) != 0
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, Levitation Backward]
type = ChangeState
value = 4446
;triggerall = command = "F"
triggerall = command = "holdback"
triggerall = power >= 10
triggerall = var(1) != 0
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, Levitation Up]
type = ChangeState
value = 4447
;triggerall = command = "F"
triggerall = command = "holdup"
triggerall = power >= 10
triggerall = var(1) != 0
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, Levitation Down]
type = ChangeState
value = 4448
;triggerall = command = "F"
triggerall = command = "holddown"
triggerall = power >= 10
triggerall = var(1) != 0
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, Land Levitation]
type = ChangeState
value = 4449
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl = 1

[State -1, Power Charge]
type = ChangeState
value = 1111
triggerall = command = "holdb"
triggerall = command != "holddown"
triggerall = var(1) = 1
trigger1 = ctrl = 1
trigger1 = statetype = A
;-------------------------------------------------------------------------
[State -1, Activate AI]
type = VarSet
trigger1 = command = "CPU1"
trigger2 = command = "CPU2"
trigger3 = command = "CPU3"
trigger4 = command = "CPU4"
trigger5 = command = "CPU5"
trigger6 = command = "CPU6"
trigger7 = command = "CPU7"
trigger8 = command = "CPU8"
trigger9 = command = "CPU9"
trigger10 = command = "CPU10"
trigger11 = command = "CPU11"
trigger12 = command = "CPU12"
trigger13 = command = "CPU13"
trigger14 = command = "CPU14"
trigger15 = command = "CPU15"
trigger16 = command = "CPU16"
trigger17 = command = "CPU17"
trigger18 = command = "CPU18"
trigger19 = command = "CPU19"
trigger20 = command = "CPU20"
trigger21 = command = "CPU21"
trigger22 = command = "CPU22"
trigger23 = command = "CPU23"
trigger24 = command = "CPU24"
trigger25 = command = "CPU25"
trigger26 = command = "CPU26"
trigger27 = command = "CPU27"
trigger28 = command = "CPU28"
trigger29 = command = "CPU29"
trigger30 = command = "CPU30"
trigger31 = command = "CPU31"
trigger32 = command = "CPU32"
trigger33 = command = "CPU33"
trigger34 = command = "CPU34"
trigger35 = command = "CPU35"
trigger36 = command = "CPU36"
trigger37 = command = "CPU37"
trigger38 = command = "CPU38"
trigger39 = command = "CPU39"
trigger40 = command = "CPU40"
trigger41 = command = "CPU41"
trigger42 = command = "CPU42"
trigger43 = command = "CPU43"
trigger44 = command = "CPU44"
trigger45 = command = "CPU45"
trigger46 = command = "CPU46"
trigger47 = command = "CPU47"
trigger48 = command = "CPU48"
trigger49 = command = "CPU49"
trigger50 = command = "CPU50"
trigger51 = command = "CPU51"
trigger52 = command = "CPU52"
trigger53 = command = "CPU53"
trigger54 = command = "CPU54"
trigger55 = command = "CPU55"
trigger56 = command = "CPU56"
trigger57 = command = "CPU57"
trigger58 = command = "CPU58"
trigger59 = command = "CPU59"
trigger60 = command = "CPU60"
trigger61 = command = "CPU61"
trigger62 = command = "CPU62"
trigger63 = command = "CPU63"
trigger64 = command = "CPU64"
trigger65 = command = "CPU65"
trigger66 = command = "CPU66"
trigger67 = command = "CPU67"
trigger68 = command = "CPU68"
trigger69 = command = "CPU69"
trigger70 = command = "CPU70"
trigger71 = command = "CPU71"
trigger72 = command = "CPU72"
trigger73 = command = "CPU73"
trigger74 = command = "CPU74"
trigger75 = command = "CPU75"
v = 20 ;You can change this to any number provided that it doesn't collide with other variables.
value = 1

[State -1, Light hit]
type = ChangeState
value = 200 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = statetype != A ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 100000)
persistent = 0

[State -1, Air Light hit]
type = ChangeState
value = 205 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = statetype != S ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 100000)
persistent = 0

[State -1, Light hit]
type = ChangeState
value = 210 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = statetype != A ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 100000)
persistent = 0

[State -1, Light Hit]
type = ChangeState
value = 230 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = stateno = 210
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = statetype != A ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 100000)
trigger1 = time >= 15
persistent = 0

[State -1, Teleport]
type = ChangeState
value = 5555 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = statetype != A ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 80000)
trigger1 = time >= 15
persistent = 0


[State -1, Flash]
type = ChangeState
value = 220 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = statetype != A ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
triggerall = power >= 50
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 8000)
trigger1 = time >= 15
persistent = 0

[State -1, Power Charge]
type = ChangeState
value = 1111 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = var(1) = 1
triggerall = statetype = A ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
triggerall = power <= 2999
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 1700)
trigger1 = time >= 15
persistent = 0

[State -1, Land Levitation]
type = ChangeState
value = 4449 ;Guy's taunt stateno (state number). You can change this to your character's taunt stateno.
triggerall = var(20) = 1 ;It executes if it detects CPU control. In plain terms, "If Variable 20 is equal to 1".
triggerall = var(1) = 1
triggerall = statetype = A ;This prevents the mistake of the CPU taunting in mid-air!
triggerall = movetype != H ;This prevents the mistake of the CPU taunting while currently being hit!
triggerall = statetype != L ;This prevents the mistake of the CPU taunting while currently lying down!
triggerall = P2life != 0 ;This prevents the mistake of the CPU taunting when the enemy is already dead!
trigger1 = (P2statetype = L) && (ctrl = 1) && (random <= 3000)
trigger1 = time >= 15
persistent = 0

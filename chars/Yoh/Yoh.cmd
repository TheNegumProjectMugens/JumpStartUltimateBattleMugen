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
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------
[Command] ;Quarter circle forward + x
name = "trans"
command = ~D, DB, B, x
time = 25

[Command] ;Quarter circle forward + x
name = "s1"
command = ~D, DB, B, a
time = 25

[Command] ;Quarter circle forward + x
name = "s2"
command = ~D, DB, B, b
time = 25

[Command] ;Quarter circle forward + x
name = "s3"
command = ~D, DB, B, c
time = 25

[Command] ;Quarter circle forward + x
name = "sasuke"
command = ~D, DF, F, a
time = 25

[Command] ;Quarter circle forward + x
name = "naruto"
command = ~D, DF, F, b
time = 25
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


;---|AI Commands|-----------------------------------------------------------
[Command]
name = "AI1"
command = D,D,D,F,F,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI2"
command = D,D,D,F,F,U,a+b+c+x+y+z
time = 1

[Command]
name = "AI3"
command = D,D,D,F,F,UF,a+b+c+x+y+z
time = 1

[Command]
name = "AI4"
command = D,D,D,F,F,D,a+b+c+x+y+z
time = 1

[Command]
name = "AI5"
command = D,D,D,F,F,DF,a+b+c+x+y+z
time = 1

[Command]
name = "AI6"
command = D,D,D,F,F,B,a+b+c+x+y+z
time = 1

[Command]
name = "AI7"
command = D,D,D,F,F,DB,a+b+c+x+y+z
time = 1

[Command]
name = "AI8"
command = D,D,D,F,F,UB,a+b+c+x+y+z
time = 1

[Command]
name = "AI9"
command = D,D,D,F,U,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI10"
command = D,D,D,F,UF,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI11"
command = D,D,D,F,DF,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI12"
command = D,D,D,F,D,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI13"
command = D,D,D,F,DB,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI14"
command = D,D,D,F,B,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI15"
command = D,D,D,F,UB,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI16"
command = D,D,D,F,F,F,a+b+c+x+y,z
time = 1

[Command]
name = "AI17"
command = D,D,D,F,F,F,a+b+c+x,y,z
time = 1

[Command]
name = "AI18"
command = D,D,D,F,F,F,a+b+c,x,y,z
time = 1

[Command]
name = "AI19"
command = D,D,D,F,F,F,a+b,c,x,y,z
time = 1

[Command]
name = "AI20"
command = D,D,D,F,F,F,a,b,c,x,y,z
time = 1

[Command]
name = "AI21"
command = D,D,D,F,F,F,a+b+c,x+y+z
time = 1

[Command]
name = "AI22"
command = D,D,D,F,F,U,a+b,c+x+y+z
time = 1

[Command]
name = "AI23"
command = D,D,D,F,F,UF,a,b+c+x+y+z
time = 1

[Command]
name = "AI24"
command = D,D,D,F,F,U,a+b,c+x+y+z
time = 1

[Command]
name = "AI25"
command = D,D,D,F,F,DF,a,b,c+x+y+z
time = 1

[Command]
name = "AI26"
command = D,D,D,F,F,B,a+b,c+x,y+z
time = 1

[Command]
name = "AI27"
command = D,D,D,F,F,DB,a,b+c+x,y+z
time = 1

[Command]
name = "AI28"
command = D,D,D,F,F,UB,a,b+c+x+y,z
time = 1

[Command]
name = "AI29"
command = DF,D,D,F,U,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI30"
command = B,D,D,F,UF,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI31"
command = B,B,BD,F,DF,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI32"
command = D,F,F,F,D,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI33"
command = DF,D,DF,UF,DB,F,a+b+c+x+y+z
time = 1

[Command]
name = "AI34"
command = D,D,D,F,DB,DF,a+b+c+x+y+z
time = 1

[Command]
name = "AI35"
command = D,D,UF,DF,UB,UF,a+b+c+x+y+z
time = 1

[Command]
name = "AI36"
command = D,DF,DF,DF,DF,F,a+b+c+x+y,z
time = 1

[Command]
name = "AI37"
command = D,D,DB,UF,DF,UF,a+b+c+x,y,z
time = 1

[Command]
name = "AI38"
command = F,U,F,F,F,F,a,b+c,x,y,z
time = 1

[Command]
name = "AI39"
command = DF,UF,D,DF,U,F,a+b,c+x,y,z
time = 1

[Command]
name = "AI40"
command = D,D,D,D,F,D,a+b,c,x,y+z
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
;---|Strikers|---------------------------------------------------------------
[State -1, Naruto]
type = Helper
Triggerall = power >= 1500
triggerall = numhelper(8005) = 0
triggerall = command = "naruto"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
helpertype = normal ;player
name = "Naruto"
ID = 8005
stateno = 8005
pos = -70,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
ontop = 1

[State -1, Sasuke]
type = Helper
Triggerall = power >= 1500
triggerall = numhelper(8000) = 0
triggerall = command = "sasuke"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
helpertype = normal ;player
name = "Sasuke"
ID = 8000
stateno = 8000
pos = 70,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
ontop = 1
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Transformation]
type = ChangeState
value = 999
triggerall = var(0) = 0
triggerall = power >= 2000
triggerall = command = "trans"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Special 3]
type = ChangeState
value = 710
triggerall = power >= 2000
triggerall = command = "s3"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = animelemtime(3)>0 && stateno = 200
trigger3 = animelemtime(3)>0 && stateno = 210
trigger4 = animelemtime(5)>0 && stateno = 220
trigger5 = animelemtime(3)>0 && stateno = 400
trigger6 = time >= 36 && stateno = 410
trigger7 = animelemtime(4)>0 && stateno = 420
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Special 2]
type = ChangeState
value = 700
triggerall = power >= 1000
triggerall = command = "s2"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = animelemtime(3)>0 && stateno = 200
trigger3 = animelemtime(3)>0 && stateno = 210
trigger4 = animelemtime(5)>0 && stateno = 220
trigger5 = animelemtime(3)>0 && stateno = 400
trigger6 = time >= 36 && stateno = 410
trigger7 = animelemtime(4)>0 && stateno = 420
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Special 1]
type = ChangeState
value = 701
triggerall = power >= 500
triggerall = command = "s1"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = animelemtime(3)>0 && stateno = 200
trigger3 = animelemtime(3)>0 && stateno = 210
trigger4 = animelemtime(5)>0 && stateno = 220
trigger5 = animelemtime(3)>0 && stateno = 400
trigger6 = time >= 36 && stateno = 410
trigger7 = animelemtime(4)>0 && stateno = 420
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
;---------------------------------------------------------------------------
;Block
[State -1, Block]
type = ChangeState
value = 120
trigger1 = command = "hold_x"
trigger1 = ctrl
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
; Stand Light Punch
[State -1, Stand Light Slash]
type = ChangeState
value = ifelse(stateno = 100,230,200)
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Slash]
type = ChangeState
value = ifelse(stateno = 100,230,210)
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = animelemtime(3)>0 && stateno = 200
;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Strong Slash]
type = ChangeState
value = ifelse(stateno = 100,230,220)
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = animelemtime(3)>0 && stateno = 210
;---------------------------------------------------------------------------
; Stand Strong Punch
[State -1, Stand Combo Finisher]
type = ChangeState
value = ifelse(random < 500,ifelse(random < 500,410,400),ifelse(random > 500,230,420))
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = animelemtime(5)>0 && stateno = 220
;---------------------------------------------------------------------------
; Stand Light Punch
;[State -1, Crouch Light Slash]
;type = ChangeState
;value = 400
;triggerall = command = "a"
;triggerall = command = "holddown"
;trigger1 = statetype = C
;trigger1 = ctrl
;trigger2 = animelemtime(5)>0 && stateno = 220
;---------------------------------------------------------------------------
; Stand Light Punch
;[State -1, Crouch Medium Slash]
;type = ChangeState
;value = 410
;triggerall = command = "b"
;triggerall = command = "holddown"
;trigger1 = statetype = C
;trigger1 = ctrl
;trigger2 = animelemtime(3)>0 && stateno = 400
;---------------------------------------------------------------------------
; Stand Light Punch
;[State -1, Crouch Heavy Slash]
;type = ChangeState
;value = 420
;triggerall = command = "c"
;triggerall = command = "holddown"
;trigger1 = statetype = C
;trigger1 = ctrl
;trigger2 = time >= 36 && stateno = 410
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Energy Wave]
type = ChangeState
value = 430
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = animelemtime(4)>0 && stateno = 420
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Air Light Slash]
type = ChangeState
value = 600
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Air Medium Slash]
type = ChangeState
value = 610
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = animelemtime(3)>0 && stateno = 600

;----|AI|-------------------------------------------------------------------
[State -1, Activate AI]
type = VarSet
triggerall = var(20) != 1
trigger1 = command = "AI1"
trigger2 = command = "AI2"
trigger3 = command = "AI3"
trigger4 = command = "AI4"
trigger5 = command = "AI5"
trigger6 = command = "AI6"
trigger7 = command = "AI7"
trigger8 = command = "AI8"
trigger9 = command = "AI9"
trigger10 = command = "AI10"
trigger11 = command = "AI11"
trigger12 = command = "AI12"
trigger13 = command = "AI13"
trigger14 = command = "AI14"
trigger15 = command = "AI15"
trigger16 = command = "AI16"
trigger17 = command = "AI17"
trigger18 = command = "AI18"
trigger19 = command = "AI19"
trigger20 = command = "AI20"
trigger21 = command = "AI21"
trigger22 = command = "AI22"
trigger23 = command = "AI23"
trigger24 = command = "AI24"
trigger25 = command = "AI25"
trigger26 = command = "AI26"
trigger27 = command = "AI27"
trigger28 = command = "AI28"
trigger29 = command = "AI29"
trigger30 = command = "AI30"
trigger31 = command = "AI31"
trigger32 = command = "AI32"
trigger33 = command = "AI33"
trigger34 = command = "AI34"
trigger35 = command = "AI35"
trigger36 = command = "AI36"
trigger37 = command = "AI37"
trigger38 = command = "AI38"
trigger39 = command = "AI39"
trigger40 = command = "AI40"
var(20) = 1

[State -1, Kill AI]
type = VarSet
triggerall = var(20) = 1
trigger1 = p2life < 0
trigger2 = life < 0
value = 0

;light punch
[State -1, AI Dash Fwd]
type = ChangeState
triggerall = var(20) = 1
triggerall = random <= 20
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X > 99
trigger1 = ctrl = 1
value = 100

;light punch
[State -1, AI Dash Back]
type = ChangeState
triggerall = var(20) = 1
triggerall = random <= 150
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = Life = [100,400]
triggerall = P2bodydist X < 60
trigger1 = ctrl = 1
value = 105

; ==========================
[State -1,AI Standing Guard]
type = ChangeState
triggerall = var(20) = 1
triggerall = Statetype != A
triggerall = P2statetype != C ;
triggerall = Statetype = S
triggerall = P2Movetype = A
triggerall = Pos Y != [-1,-999]
triggerall = ctrl = 1
trigger1 = random <= 500
value = 130

; =============================
; AI Stand to Crouch Guard Transition
; =============================
[State -1,AI Stand to Crouch Guard Transition]
type = ChangeState
triggerall = var(20) = 1
triggerall = StateType != A
triggerall = P2statetype = C
triggerall = P2Movetype = A
triggerall = Pos Y != [-1,-999]
trigger1 = stateno = 150
trigger1 = 1
value = 152

; =============================
; AI Crouching Guard
; =============================
[State -1, AI Crouching Guard]
type = ChangeState
triggerall = var(20) = 1
triggerall = StateType != A
triggerall = P2statetype = C
triggerall = P2Movetype = A
triggerall = Pos Y != [-1,-999]
triggerall = ctrl = 1
trigger1 = random <= 500
value = 131

; =============================
; AI Crouch to Stand Guard Transition
; =============================
[State -1,AI Crouch to Stand Guard Transition]
type = ChangeState
triggerall = var(20) = 1
triggerall = Statetype != A
triggerall = P2statetype != C
triggerall = P2Movetype = A
trigger1 = 1
trigger1 = stateno = 152
value = 150

; =============================
; AI Aerial Guard
; =============================
[State -1,AI Aerial Guard]
type = ChangeState
triggerall = var(20) = 1
triggerall = Statetype = A
triggerall = P2Movetype = A
triggerall = ctrl = 1
trigger1 = random <= 500
value = 132
;---------------------------------------------------------------------

;light punch
[State -1, AI light punch]
type = ChangeState
triggerall = var(20) = 1
triggerall = random <= 100
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X <= 50
trigger1 = ctrl = 1
value = 200

;medium punch
[State -1, AI medium punch]
type = ChangeState
triggerall = Stateno = 200
trigger1 = movehit = 1
triggerall = random <= 80
triggerall = var(20) = 1
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X <= 50
value = 210

;heavy punch
[State -1, AI heavy punch]
type = ChangeState
triggerall = Stateno = 210
trigger1 = random <=90
trigger1 = movehit = 1
triggerall = var(20) = 1
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X <= 50
value = 220

;heavy punch
[State -1, AI Combo FINISHER]
type = ChangeState
triggerall = Stateno = 220
trigger1 = random <=500
trigger1 = movehit = 1
triggerall = var(20) = 1
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X <= 50
value = ifelse(random < 500,ifelse(random < 500,410,400),ifelse(random > 500,230,420))

;heavy punch
[State -1, AI Weak Energy Wave]
type = ChangeState
triggerall = Stateno = 420
trigger1 = movehit = 1
triggerall = var(20) = 1
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
value = 430

;light punch
[State -1, AI Special 1]
type = ChangeState
triggerall = power >= 500
triggerall = var(20) = 1
triggerall = random <= 100
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X > 80
trigger1 = ctrl = 1
value = 701

;light punch
[State -1, AI Special 2]
type = ChangeState
triggerall = power >= 1000
triggerall = var(20) = 1
triggerall = random <= 80
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X < 79
trigger1 = ctrl = 1
value = 700

;light punch
[State -1, AI Special 3]
type = ChangeState
triggerall = power >= 2000
triggerall = var(20) = 1
triggerall = random <= 150
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X > 90
trigger1 = ctrl = 1
value = 710

;light punch
[State -1, AI Transformation]
type = ChangeState
triggerall = power >= 2000
triggerall = var(20) = 1
triggerall = random <= 600
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X > 30
trigger1 = ctrl = 1
value = 999


[State -1,AI Naruto]
type = Helper
triggerall = var(20) = 1
Triggerall = power >= 1500
triggerall = random <= 10
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X > 90
triggerall = numhelper(8005) = 0
trigger1 = statetype = S
trigger1 = ctrl
helpertype = normal ;player
name = "Naruto"
ID = 8005
stateno = 8005
pos = -70,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
ontop = 1

[State -1,AI Sasuke]
type = Helper
triggerall = var(20) = 1
Triggerall = power >= 1500
triggerall = random <= 12
triggerall = StateType != A
triggerall = Movetype != H
triggerall = P2Life > 0
triggerall = P2bodydist X > 60
triggerall = numhelper(8000) = 0
trigger1 = statetype = S
trigger1 = ctrl
helpertype = normal ;player
name = "Sasuke"
ID = 8000
stateno = 8000
pos = 70,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
ontop = 1

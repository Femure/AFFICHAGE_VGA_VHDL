
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/PONG/PONG.srcs/utils_1/imports/synth_1/pong.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2]
[C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/PONG/PONG.srcs/utils_1/imports/synth_1/pong.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
_
Command: %s
53*	vivadotcl2.
,synth_design -top pong -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
13356Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1320.262 ; gain = 440.840
h px� 
�
synthesizing module '%s'638*oasys2
pong28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
148@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
reset27
5C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/reset.vhd2
62
RE02
reset28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1228@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
reset29
5C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/reset.vhd2
138@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
reset2
02
129
5C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/reset.vhd2
138@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

ps2_decode2@
>C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_decode.vhd2
62
K02

ps2_decode28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1258@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

ps2_decode2B
>C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_decode.vhd2
168@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ps2_keyboard2B
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_keyboard.vhd2
52
ps2_keyboard_02
ps2_keyboard2B
>C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_decode.vhd2
398@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ps2_keyboard2D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_keyboard.vhd2
158@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	debouncer2?
=C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/debouncer.vhd2
62
D02
	debouncer2D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_keyboard.vhd2
508@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	debouncer2A
=C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/debouncer.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	debouncer2
02
12A
=C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/debouncer.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	debouncer2?
=C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/debouncer.vhd2
62
D12
	debouncer2D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_keyboard.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ps2_receiver2B
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_receiver.vhd2
62
R02
ps2_receiver2D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_keyboard.vhd2
548@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ps2_receiver2D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_receiver.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ps2_receiver2
02
12D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_receiver.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ps2_controller2D
BC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_controller.vhd2
62
C02
ps2_controller2D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_keyboard.vhd2
578@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ps2_controller2F
BC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_controller.vhd2
168@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ps2_controller2
02
12F
BC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_controller.vhd2
168@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ps2_keyboard2
02
12D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_keyboard.vhd2
158@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

ps2_decode2
02
12B
>C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/KEYBOARD/ps2_decode.vhd2
168@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	div_25MHz2E
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/VGA MONOCHROME/div_25MHz.vhd2
62
A02
	div_25MHz28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1288@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	div_25MHz2G
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/VGA MONOCHROME/div_25MHz.vhd2
138@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	div_25MHz2
02
12G
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/VGA MONOCHROME/div_25MHz.vhd2
138@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
vga_controller_640_602G
EC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/vga_controller_640_60.vhd2
62
A12
vga_controller_640_6028
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1298@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
vga_controller_640_602I
EC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/vga_controller_640_60.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
vga_controller_640_602
02
12I
EC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/vga_controller_640_60.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
terrain_aff2E
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/terrain/terrain_aff.vhd2
62
T02
terrain_aff28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1328@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
terrain_aff2G
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/terrain/terrain_aff.vhd2
138@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
terrain_aff2
02
12G
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/terrain/terrain_aff.vhd2
138@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
raquette_move2H
FC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/raquette/raquette_move.vhd2
62
R02
raquette_move28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1358@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
raquette_move2J
FC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/raquette/raquette_move.vhd2
188@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
raquette_move2
02
12J
FC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/raquette/raquette_move.vhd2
188@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
acc_balle_clk2E
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/balle/acc_balle_clk.vhd2
62
B02
acc_balle_clk28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1388@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
acc_balle_clk2G
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/balle/acc_balle_clk.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
acc_balle_clk2
02
12G
CC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/balle/acc_balle_clk.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

balle_move2B
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/Balle/balle_move.vhd2
62
B12

balle_move28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1398@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

balle_move2D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/Balle/balle_move.vhd2
168@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

balle_move2
02
12D
@C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/Balle/balle_move.vhd2
168@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	score_cnt2A
?C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/score/score_cnt.vhd2
62
S02
	score_cnt28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1428@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	score_cnt2C
?C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/score/score_cnt.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	score_cnt2
02
12C
?C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/score/score_cnt.vhd2
148@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	score_aff2A
?C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/score/score_aff.vhd2
62
S12
	score_aff28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1438@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	score_aff2C
?C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/score/score_aff.vhd2
158@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	score_aff2
02
12C
?C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/score/score_aff.vhd2
158@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
image27
5C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/image.vhd2
62
A22
image28
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
1468@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
image29
5C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/image.vhd2
138@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
image2
02
129
5C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/image.vhd2
138@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
pong2
02
128
4C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/pong.vhd2
148@Z8-256h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1438.207 ; gain = 558.785
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1438.207 ; gain = 558.785
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1438.207 ; gain = 558.785
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0152

1438.2072
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
{
Parsing XDC File [%s]
179*designutils2:
6C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/BASYS3.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2:
6C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/BASYS3.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project28
6C:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/BASYS3.xdc2
.Xil/pong_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1525.1642
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0042

1525.1642
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
n
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2

ps2_decodeZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                   ready |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                new_code |                               01 |                               01
h p
x
� 
y
%s
*synth2a
_               translate |                               10 |                               10
h p
x
� 
y
%s
*synth2a
_                  output |                               11 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2

sequential2

ps2_decodeZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 14    
h p
x
� 
F
%s
*synth2.
,	   2 Input   31 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   13 Bit       Adders := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit       Adders := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   9 Input      1 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	               11 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 14    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 14    
h p
x
� 
F
%s
*synth2.
,	   4 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   31 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   5 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    2 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 37    
h p
x
� 
F
%s
*synth2.
,	   9 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	  26 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   8 Input    1 Bit        Muxes := 2     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     2|
h px� 
2
%s*synth2
|2     |CARRY4 |   282|
h px� 
2
%s*synth2
|3     |LUT1   |   221|
h px� 
2
%s*synth2
|4     |LUT2   |   547|
h px� 
2
%s*synth2
|5     |LUT3   |    90|
h px� 
2
%s*synth2
|6     |LUT4   |   462|
h px� 
2
%s*synth2
|7     |LUT5   |    61|
h px� 
2
%s*synth2
|8     |LUT6   |   212|
h px� 
2
%s*synth2
|9     |FDCE   |   316|
h px� 
2
%s*synth2
|10    |FDPE   |    16|
h px� 
2
%s*synth2
|11    |FDRE   |    67|
h px� 
2
%s*synth2
|12    |IBUF   |     8|
h px� 
2
%s*synth2
|13    |OBUF   |    14|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:21 ; elapsed = 00:00:28 . Memory (MB): peak = 1525.164 ; gain = 558.785
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1525.164 ; gain = 645.742
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0232

1525.1642
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
282Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1525.1642
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

718ce1c1Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
712
12
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:322

00:00:332

1525.1642

1036.711Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0062

1525.1642
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2M
KC:/Users/maxim/VHDL/FPGA/AFFICHAGE VGA/PONG/PONG/PONG.runs/synth_1/pong.dcpZ17-1381h px� 
|
%s4*runtcl2`
^Executing : report_utilization -file pong_utilization_synth.rpt -pb pong_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu May 16 16:48:26 2024Z17-206h px� 


End Record
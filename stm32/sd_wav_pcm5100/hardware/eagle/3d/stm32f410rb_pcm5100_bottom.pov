//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/ARM_Playground/stm32/sd_wav_pcm5100/hardware/eagle/stm32f410rb_pcm5100.brd
//4/5/16 10:43 AM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 3;
#declare pin_short = on;

#declare e3d_environment = on;

#local cam_x = 0;
#local cam_y = 250;
#local cam_z = -133;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 45;
#local pcb_rotate_z = 180;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 17;
#local lgt1_pos_y = 33;
#local lgt1_pos_z = 30;
#local lgt1_intense = 0.738265;
#local lgt2_pos_x = -17;
#local lgt2_pos_y = 33;
#local lgt2_pos_z = 30;
#local lgt2_intense = 0.738265;
#local lgt3_pos_x = 17;
#local lgt3_pos_y = 33;
#local lgt3_pos_z = -20;
#local lgt3_intense = 0.738265;
#local lgt4_pos_x = -17;
#local lgt4_pos_y = 33;
#local lgt4_pos_z = -20;
#local lgt4_intense = 0.738265;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 46.050200;
#declare pcb_y_size = 58.166200;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(163);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-23.025100,0,-29.083100>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro STM32F410RB_PCM5100(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Board
box{<46.177200,0,58.166200><0.127000,-1.500000,0.000000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_BOOT0_0) #declare global_pack_BOOT0_0=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<7.035800,-1.500000,34.544000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 BOOT0_0  0603-RES
#ifndef(pack_BOOT0_1) #declare global_pack_BOOT0_1=yes; object {RES_SMD_CHIP_0805("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<7.035800,-1.500000,31.750000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 BOOT0_1  0603-RES
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<10.604500,-1.500000,38.989000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C1 0.1uF 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<11.684000,-1.500000,23.304500>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C2 0.1uF 0805
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<25.323800,-1.500000,26.720800>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C3 0.1uF 0805
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<25.565100,-1.500000,36.652200>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C4 0.1uF 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<28.143200,-1.500000,30.391100>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C5 2.2uF 0805
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<20.142200,-1.500000,40.982900>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C9 0.1uF 0805
#ifndef(pack_C21) #declare global_pack_C21=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<30.099000,-1.500000,37.465000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C21 0.1uF 0805
#ifndef(pack_C22) #declare global_pack_C22=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<30.861000,-1.500000,29.591000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C22 0.1uF 0805
#ifndef(pack_C23) #declare global_pack_C23=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<35.687000,-1.500000,28.638500>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C23 0.1uF 0805
#ifndef(pack_C24) #declare global_pack_C24=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<33.274000,-1.500000,39.370000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C24 2.2uF 0805
#ifndef(pack_C25) #declare global_pack_C25=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<33.274000,-1.500000,41.910000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C25 2.2uF 0805
#ifndef(pack_C26) #declare global_pack_C26=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<38.608000,-1.500000,41.656000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C26 0.1uF 0805
#ifndef(pack_C27) #declare global_pack_C27=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<38.608000,-1.500000,39.116000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C27 10uF 0805
#ifndef(pack_C28) #declare global_pack_C28=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<33.210500,-1.500000,47.053500>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C28 2.2nF 0805
#ifndef(pack_C29) #declare global_pack_C29=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<38.798500,-1.500000,47.053500>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C29 2.2nF 0805
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {QFP_LQFP_64_050MM("STM32F410","ST",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<16.764000,-1.500000,32.004000>translate<0,-0.035000,0> }#end		//LQFP-64 IC1 STM32F410 LQFP64
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<4.127500,0.000000,20.637500>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) JP1 SWD 1X06
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_ARK_350MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<38.709600,0.000000,5.842000>}#end		//connector JP2 Vsupply - 3.3Vcc SCREWTERMINAL-3.5MM-2
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_ARK_350MM_4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<11.557000,0.000000,52.705000>}#end		//connector JP3 BTN_1-4 SCREWTERMINAL-3.5MM-4
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_ARK_350MM_3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<25.146000,0.000000,6.045200>}#end		//connector JP5 BTN_5-7 SCREWTERMINAL-3.5MM-3
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_ARK_350MM_4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<29.997400,0.000000,52.705000>}#end		//connector JP6 AUDIO_OUT SCREWTERMINAL-3.5MM-4
#ifndef(pack_JP7) #declare global_pack_JP7=yes; object {CON_ARK_350MM_4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<10.210800,0.000000,6.070600>}#end		//connector JP7 BTN_8-11 SCREWTERMINAL-3.5MM-4
#ifndef(pack_MMC1) #declare global_pack_MMC1=yes; object {MICRO_SD("Amphenol",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<34.163000,-1.500000,18.097500>}#end		// MMC1 Amphenol MICROSD_AMPHENOL
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("220",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<7.620000,-1.500000,27.940000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R1 22 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<7.239000,-1.500000,37.274500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R2 10K 0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("220",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<6.832600,-1.500000,15.138400>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R3 22 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("220",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<7.620000,-1.500000,22.199600>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R4 22 0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("220",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<7.620000,-1.500000,24.384000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R5 22 0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("471",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<38.671500,-1.500000,44.386500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R6 470 0805
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0805("471",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<33.210500,-1.500000,44.513500>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R7 470 0805
#ifndef(pack_U5) #declare global_pack_U5=yes; object {IC_SMD_TSSOP20("PCM5100","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<35.687000,-1.500000,34.036000>translate<0,-0.035000,0> }#end		//TSSOP20 U5 PCM5100 ROBERTSONICS_PW_R-PDSO-G20
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.885800,-1.537000,34.544000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.185800,-1.537000,34.544000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.885800,-1.537000,31.750000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.185800,-1.537000,31.750000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.504500,-1.537000,38.989000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.704500,-1.537000,38.989000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.684000,-1.537000,24.204500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.684000,-1.537000,22.404500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<24.423800,-1.537000,26.720800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.223800,-1.537000,26.720800>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.565100,-1.537000,35.752200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.565100,-1.537000,37.552200>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.043200,-1.537000,30.391100>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.243200,-1.537000,30.391100>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.042200,-1.537000,40.982900>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.242200,-1.537000,40.982900>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.099000,-1.537000,38.365000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.099000,-1.537000,36.565000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.861000,-1.537000,28.691000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.861000,-1.537000,30.491000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.587000,-1.537000,28.638500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.787000,-1.537000,28.638500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.174000,-1.537000,39.370000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.374000,-1.537000,39.370000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.174000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.374000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.508000,-1.537000,41.656000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.708000,-1.537000,41.656000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.508000,-1.537000,39.116000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.708000,-1.537000,39.116000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.110500,-1.537000,47.053500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.310500,-1.537000,47.053500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.898500,-1.537000,47.053500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.698500,-1.537000,47.053500>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.014000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.514000,-1.537000,38.054000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,35.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,35.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,34.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,34.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,33.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,33.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,32.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,32.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,31.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,31.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,30.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,30.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,29.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,29.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,28.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.814000,-1.537000,28.254000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<14.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.514000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(1.962000,0.300000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.014000,-1.537000,25.954000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,28.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,28.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,29.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,29.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,30.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,30.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,31.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,31.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,32.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,32.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,33.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,33.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,34.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,34.754000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,35.254000>}
object{TOOLS_PCB_SMD(0.300000,1.962000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.714000,-1.537000,35.754000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-0.000000,0>translate<4.127500,0,26.987500> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-0.000000,0>translate<4.127500,0,24.447500> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-0.000000,0>translate<4.127500,0,21.907500> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-0.000000,0>translate<4.127500,0,19.367500> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-0.000000,0>translate<4.127500,0,16.827500> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-0.000000,0>translate<4.127500,0,14.287500> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.709600,0,4.064000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.709600,0,7.564000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.891000,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.391000,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<9.891000,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<6.391000,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.413000,1.200000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<21.590000,0,6.045200> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.413000,1.200000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<25.090000,0,6.045200> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.413000,1.200000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<28.590000,0,6.045200> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.331400,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<31.831400,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<28.331400,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<24.831400,0,52.705000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<4.876800,0,6.070600> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<8.376800,0,6.070600> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.876800,0,6.070600> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.200000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<15.376800,0,6.070600> texture{col_thl}}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.673000,-1.537000,15.997500>}
object{TOOLS_PCB_SMD(1.550000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.753000,-1.537000,12.437500>}
object{TOOLS_PCB_SMD(1.550000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<30.343000,-1.537000,23.627500>}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.673000,-1.537000,19.297500>}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.673000,-1.537000,17.097500>}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.673000,-1.537000,21.497500>}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.673000,-1.537000,22.597500>}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.683000,-1.537000,14.887500>}
object{TOOLS_PCB_SMD(1.500000,1.300000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.543000,-1.537000,23.877500>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.533000,-1.537000,12.377500>}
object{TOOLS_PCB_SMD(1.400000,0.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.873000,-1.537000,23.957500>}
object{TOOLS_PCB_SMD(1.400000,0.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.233000,-1.537000,11.997500>}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.673000,-1.537000,18.197500>}
object{TOOLS_PCB_SMD(1.750000,0.700000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.673000,-1.537000,20.397500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.620000,-1.537000,28.840000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.620000,-1.537000,27.040000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.339000,-1.537000,37.274500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.139000,-1.537000,37.274500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.732600,-1.537000,15.138400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.932600,-1.537000,15.138400>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.520000,-1.537000,22.199600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.720000,-1.537000,22.199600>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.520000,-1.537000,24.384000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.720000,-1.537000,24.384000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.771500,-1.537000,44.386500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.571500,-1.537000,44.386500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.110500,-1.537000,44.513500>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.310500,-1.537000,44.513500>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.762000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.412000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<34.062000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<34.712000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.362000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.012000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.662000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.312000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.962000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.612000,-1.537000,36.936000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.612000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.962000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.312000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.662000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.012000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.362000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.712000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.062000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.412000,-1.537000,31.136000>}
object{TOOLS_PCB_SMD(0.400000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.762000,-1.537000,31.136000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<25.527000,0,31.038800> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<40.386000,0,32.004000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<5.080000,0,43.942000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<5.080000,0,29.464000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.210000,0,26.162000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.940000,0,36.753800> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,15.240000>}
box{<0,0,-0.152400><11.176000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.270000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,31.496000>}
box{<0,0,-0.152400><11.684000,0.035000,0.152400> rotate<0,90.000000,0> translate<2.032000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,42.164000>}
box{<0,0,-0.152400><10.668000,0.035000,0.152400> rotate<0,90.000000,0> translate<2.032000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,53.086000>}
box{<0,0,-0.152400><10.922000,0.035000,0.152400> rotate<0,90.000000,0> translate<2.032000,-1.535000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.286000,-1.535000,31.750000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<2.032000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.476500,-1.535000,19.367500>}
box{<0,0,-0.152400><0.628618,0.035000,0.152400> rotate<0,44.997030,0> translate<2.032000,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,16.764000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<1.270000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.064000,-1.535000,16.764000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<2.794000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.064000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,16.827500>}
box{<0,0,-0.152400><0.089803,0.035000,0.152400> rotate<0,-44.997030,0> translate<4.064000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.476500,-1.535000,19.367500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,19.367500>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,0.000000,0> translate<2.476500,-1.535000,19.367500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,16.827500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.191000,-1.535000,16.764000>}
box{<0,0,-0.152400><0.089803,0.035000,0.152400> rotate<0,44.997030,0> translate<4.127500,-1.535000,16.827500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,19.367500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.191000,-1.535000,19.304000>}
box{<0,0,-0.152400><0.089803,0.035000,0.152400> rotate<0,44.997030,0> translate<4.127500,-1.535000,19.367500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,14.287500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.230000,-1.535000,14.390000>}
box{<0,0,-0.152400><0.144957,0.035000,0.152400> rotate<0,-44.997030,0> translate<4.127500,-1.535000,14.287500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.318000,-1.535000,55.372000>}
box{<0,0,-0.152400><3.232892,0.035000,0.152400> rotate<0,-44.997030,0> translate<2.032000,-1.535000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.826000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.876800,-1.535000,6.070600>}
box{<0,0,-0.152400><3.073820,0.035000,0.152400> rotate<0,89.047171,0> translate<4.826000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,1.524000>}
box{<0,0,-0.152400><4.579050,0.035000,0.152400> rotate<0,33.687844,0> translate<1.270000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,29.464000>}
box{<0,0,-0.152400><14.478000,0.035000,0.152400> rotate<0,-90.000000,0> translate<5.080000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.230000,-1.535000,14.390000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.184200,-1.535000,14.390000>}
box{<0,0,-0.152400><0.954200,0.035000,0.152400> rotate<0,0.000000,0> translate<4.230000,-1.535000,14.390000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.704000,-1.535000,28.840000>}
box{<0,0,-0.152400><0.882469,0.035000,0.152400> rotate<0,44.997030,0> translate<5.080000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.184200,-1.535000,14.390000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.932600,-1.535000,15.138400>}
box{<0,0,-0.152400><1.058397,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.184200,-1.535000,14.390000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.191000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.096000,-1.535000,16.764000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.191000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.286000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.185800,-1.535000,31.750000>}
box{<0,0,-0.152400><3.899800,0.035000,0.152400> rotate<0,0.000000,0> translate<2.286000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.185800,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.185800,-1.535000,37.121300>}
box{<0,0,-0.152400><2.577300,0.035000,0.152400> rotate<0,90.000000,0> translate<6.185800,-1.535000,37.121300> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.185800,-1.535000,37.121300>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.339000,-1.535000,37.274500>}
box{<0,0,-0.152400><0.216658,0.035000,0.152400> rotate<0,-44.997030,0> translate<6.185800,-1.535000,37.121300> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.391000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.451600,-1.535000,52.511600>}
box{<0,0,-0.152400><0.202672,0.035000,0.152400> rotate<0,72.597336,0> translate<6.391000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.451600,-1.535000,50.012600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.451600,-1.535000,52.511600>}
box{<0,0,-0.152400><2.499000,0.035000,0.152400> rotate<0,90.000000,0> translate<6.451600,-1.535000,52.511600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,21.907500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.706500,-1.535000,21.907500>}
box{<0,0,-0.152400><2.579000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.127500,-1.535000,21.907500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,24.447500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.706500,-1.535000,24.447500>}
box{<0,0,-0.152400><2.579000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.127500,-1.535000,24.447500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.706500,-1.535000,21.907500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.720000,-1.535000,22.199600>}
box{<0,0,-0.152400><0.292412,0.035000,0.152400> rotate<0,-87.348076,0> translate<6.706500,-1.535000,21.907500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.706500,-1.535000,24.447500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.720000,-1.535000,24.384000>}
box{<0,0,-0.152400><0.064919,0.035000,0.152400> rotate<0,77.992558,0> translate<6.706500,-1.535000,24.447500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.127500,-1.535000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.517500,-1.535000,26.987500>}
box{<0,0,-0.152400><3.390000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.127500,-1.535000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.191000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,19.304000>}
box{<0,0,-0.152400><3.429000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.191000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.517500,-1.535000,26.987500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,27.040000>}
box{<0,0,-0.152400><0.115163,0.035000,0.152400> rotate<0,-27.119514,0> translate<7.517500,-1.535000,26.987500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.704000,-1.535000,28.840000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,28.840000>}
box{<0,0,-0.152400><1.916000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.704000,-1.535000,28.840000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.670800,-1.535000,16.586200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.670800,-1.535000,15.200200>}
box{<0,0,-0.152400><1.386000,0.035000,0.152400> rotate<0,-90.000000,0> translate<7.670800,-1.535000,15.200200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.670800,-1.535000,15.200200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.732600,-1.535000,15.138400>}
box{<0,0,-0.152400><0.087398,0.035000,0.152400> rotate<0,44.997030,0> translate<7.670800,-1.535000,15.200200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.885800,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.885800,-1.535000,33.731200>}
box{<0,0,-0.152400><1.981200,0.035000,0.152400> rotate<0,90.000000,0> translate<7.885800,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.885800,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.885800,-1.535000,34.544000>}
box{<0,0,-0.152400><0.812800,0.035000,0.152400> rotate<0,90.000000,0> translate<7.885800,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.885800,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.908600,-1.535000,33.754000>}
box{<0,0,-0.152400><0.032244,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.885800,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.128000,-1.535000,37.313500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.139000,-1.535000,37.274500>}
box{<0,0,-0.152400><0.040522,0.035000,0.152400> rotate<0,74.243926,0> translate<8.128000,-1.535000,37.313500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.139000,-1.535000,37.274500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.178800,-1.535000,37.274500>}
box{<0,0,-0.152400><0.039800,0.035000,0.152400> rotate<0,0.000000,0> translate<8.139000,-1.535000,37.274500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.139000,-1.535000,37.274500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.356600,-1.535000,37.312600>}
box{<0,0,-0.152400><0.220910,0.035000,0.152400> rotate<0,-9.930700,0> translate<8.139000,-1.535000,37.274500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.178800,-1.535000,37.274500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.356600,-1.535000,37.312600>}
box{<0,0,-0.152400><0.181836,0.035000,0.152400> rotate<0,-12.093959,0> translate<8.178800,-1.535000,37.274500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.356600,-1.535000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.356600,-1.535000,37.312600>}
box{<0,0,-0.152400><0.431800,0.035000,0.152400> rotate<0,90.000000,0> translate<8.356600,-1.535000,37.312600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.376800,-1.535000,6.070600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.382000,-1.535000,9.906000>}
box{<0,0,-0.152400><3.835404,0.035000,0.152400> rotate<0,-89.916384,0> translate<8.376800,-1.535000,6.070600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.520000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,24.804000>}
box{<0,0,-0.152400><0.559732,0.035000,0.152400> rotate<0,-48.618276,0> translate<8.520000,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,30.937200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,24.804000>}
box{<0,0,-0.152400><6.133200,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.890000,-1.535000,24.804000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.356600,-1.535000,36.880800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.144300,-1.535000,35.254000>}
box{<0,0,-0.152400><1.807470,0.035000,0.152400> rotate<0,64.159402,0> translate<8.356600,-1.535000,36.880800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,30.937200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.206800,-1.535000,31.254000>}
box{<0,0,-0.152400><0.448023,0.035000,0.152400> rotate<0,-44.997030,0> translate<8.890000,-1.535000,30.937200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.356600,-1.535000,37.312600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.398000,-1.535000,38.940000>}
box{<0,0,-0.152400><1.932083,0.035000,0.152400> rotate<0,-57.380367,0> translate<8.356600,-1.535000,37.312600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.520000,-1.535000,22.199600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.652000,-1.535000,23.026000>}
box{<0,0,-0.152400><1.401557,0.035000,0.152400> rotate<0,-36.128380,0> translate<8.520000,-1.535000,22.199600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.652000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.652000,-1.535000,23.026000>}
box{<0,0,-0.152400><4.914000,0.035000,0.152400> rotate<0,-90.000000,0> translate<9.652000,-1.535000,23.026000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.398000,-1.535000,38.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.754500,-1.535000,38.940000>}
box{<0,0,-0.152400><0.356500,0.035000,0.152400> rotate<0,0.000000,0> translate<9.398000,-1.535000,38.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.704500,-1.535000,38.989000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.754500,-1.535000,38.940000>}
box{<0,0,-0.152400><0.070007,0.035000,0.152400> rotate<0,44.418343,0> translate<9.704500,-1.535000,38.989000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.891000,-1.535000,47.675800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.891000,-1.535000,52.705000>}
box{<0,0,-0.152400><5.029200,0.035000,0.152400> rotate<0,90.000000,0> translate<9.891000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.891000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.906000,-1.535000,52.466000>}
box{<0,0,-0.152400><0.239470,0.035000,0.152400> rotate<0,86.403038,0> translate<9.891000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.891000,-1.535000,47.675800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.931400,-1.535000,47.675800>}
box{<0,0,-0.152400><0.040400,0.035000,0.152400> rotate<0,0.000000,0> translate<9.891000,-1.535000,47.675800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.652000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.966000,-1.535000,28.254000>}
box{<0,0,-0.152400><0.444063,0.035000,0.152400> rotate<0,-44.997030,0> translate<9.652000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,22.098000>}
box{<0,0,-0.152400><3.951313,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.620000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,22.098000>}
box{<0,0,-0.152400><1.016000,0.035000,0.152400> rotate<0,-90.000000,0> translate<10.414000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.966000,-1.535000,28.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,28.254000>}
box{<0,0,-0.152400><0.748000,0.035000,0.152400> rotate<0,0.000000,0> translate<9.966000,-1.535000,28.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.206800,-1.535000,31.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,31.254000>}
box{<0,0,-0.152400><1.507200,0.035000,0.152400> rotate<0,0.000000,0> translate<9.206800,-1.535000,31.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.908600,-1.535000,33.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,33.754000>}
box{<0,0,-0.152400><2.805400,0.035000,0.152400> rotate<0,0.000000,0> translate<7.908600,-1.535000,33.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.144300,-1.535000,35.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,35.254000>}
box{<0,0,-0.152400><1.569700,0.035000,0.152400> rotate<0,0.000000,0> translate<9.144300,-1.535000,35.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,35.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,38.198500>}
box{<0,0,-0.152400><2.444500,0.035000,0.152400> rotate<0,90.000000,0> translate<10.714000,-1.535000,38.198500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.032000,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.226800,-1.535000,42.164000>}
box{<0,0,-0.152400><9.194800,0.035000,0.152400> rotate<0,0.000000,0> translate<2.032000,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,43.942000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.080000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.454500,-1.535000,24.154500>}
box{<0,0,-0.152400><1.471489,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.414000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.455400,-1.535000,41.935400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.455400,-1.535000,39.038100>}
box{<0,0,-0.152400><2.897300,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.455400,-1.535000,39.038100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.226800,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.455400,-1.535000,41.935400>}
box{<0,0,-0.152400><0.323289,0.035000,0.152400> rotate<0,44.997030,0> translate<11.226800,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,38.198500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.504500,-1.535000,38.989000>}
box{<0,0,-0.152400><1.117936,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.714000,-1.535000,38.198500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.455400,-1.535000,39.038100>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.504500,-1.535000,38.989000>}
box{<0,0,-0.152400><0.069438,0.035000,0.152400> rotate<0,44.997030,0> translate<11.455400,-1.535000,39.038100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.096000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,22.098000>}
box{<0,0,-0.152400><7.725108,0.035000,0.152400> rotate<0,-43.664898,0> translate<6.096000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,22.404500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,22.098000>}
box{<0,0,-0.152400><0.306500,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.684000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.454500,-1.535000,24.154500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,24.204500>}
box{<0,0,-0.152400><0.234883,0.035000,0.152400> rotate<0,-12.289872,0> translate<11.454500,-1.535000,24.154500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,25.120600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,24.204500>}
box{<0,0,-0.152400><0.916100,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.684000,-1.535000,24.204500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.826000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.826000,-1.535000,7.000000>}
box{<0,0,-0.152400><0.142000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.826000,-1.535000,7.000000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.826000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.836400,-1.535000,6.858000>}
box{<0,0,-0.152400><0.010400,0.035000,0.152400> rotate<0,0.000000,0> translate<11.826000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.836400,-1.535000,11.506200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.836400,-1.535000,6.858000>}
box{<0,0,-0.152400><4.648200,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.836400,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.826000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.876800,-1.535000,6.070600>}
box{<0,0,-0.152400><0.789037,0.035000,0.152400> rotate<0,86.302918,0> translate<11.826000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,22.404500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.988800,-1.535000,22.403700>}
box{<0,0,-0.152400><0.304801,0.035000,0.152400> rotate<0,0.150372,0> translate<11.684000,-1.535000,22.404500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.714000,-1.535000,35.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.244000,-1.535000,35.254000>}
box{<0,0,-0.152400><1.530000,0.035000,0.152400> rotate<0,0.000000,0> translate<10.714000,-1.535000,35.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,-1.535000,25.120600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.517400,-1.535000,25.954000>}
box{<0,0,-0.152400><1.178606,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.684000,-1.535000,25.120600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.517400,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.014000,-1.535000,25.954000>}
box{<0,0,-0.152400><0.496600,0.035000,0.152400> rotate<0,0.000000,0> translate<12.517400,-1.535000,25.954000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.391000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.462000,-1.535000,52.522000>}
box{<0,0,-0.152400><0.196291,0.035000,0.152400> rotate<0,68.790295,0> translate<13.391000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.462000,-1.535000,45.415200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.462000,-1.535000,52.522000>}
box{<0,0,-0.152400><7.106800,0.035000,0.152400> rotate<0,90.000000,0> translate<13.462000,-1.535000,52.522000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.988800,-1.535000,22.403700>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.512800,-1.535000,24.460200>}
box{<0,0,-0.152400><2.559642,0.035000,0.152400> rotate<0,-53.455625,0> translate<11.988800,-1.535000,22.403700> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.512800,-1.535000,24.460200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.514000,-1.535000,25.554500>}
box{<0,0,-0.152400><1.094301,0.035000,0.152400> rotate<0,-89.931234,0> translate<13.512800,-1.535000,24.460200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.514000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.514000,-1.535000,25.554500>}
box{<0,0,-0.152400><0.399500,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.514000,-1.535000,25.554500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.244000,-1.535000,35.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.514000,-1.535000,33.984000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<12.244000,-1.535000,35.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.514000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.514000,-1.535000,33.984000>}
box{<0,0,-0.152400><8.030000,0.035000,0.152400> rotate<0,90.000000,0> translate<13.514000,-1.535000,33.984000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.514000,-1.535000,33.984000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.566000,-1.535000,34.036000>}
box{<0,0,-0.152400><0.073539,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.514000,-1.535000,33.984000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.670800,-1.535000,16.586200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.014000,-1.535000,22.929400>}
box{<0,0,-0.152400><8.970639,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.670800,-1.535000,16.586200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.014000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.014000,-1.535000,22.929400>}
box{<0,0,-0.152400><3.024600,0.035000,0.152400> rotate<0,-90.000000,0> translate<14.014000,-1.535000,22.929400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.826000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.514000,-1.535000,22.007000>}
box{<0,0,-0.152400><16.103233,0.035000,0.152400> rotate<0,-53.010612,0> translate<4.826000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.514000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.514000,-1.535000,22.007000>}
box{<0,0,-0.152400><3.947000,0.035000,0.152400> rotate<0,-90.000000,0> translate<14.514000,-1.535000,22.007000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.011400,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.011400,-1.535000,24.993600>}
box{<0,0,-0.152400><0.960400,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.011400,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.011400,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.014000,-1.535000,25.954000>}
box{<0,0,-0.152400><0.002600,0.035000,0.152400> rotate<0,0.000000,0> translate<15.011400,-1.535000,25.954000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.011400,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.138400,-1.535000,23.977600>}
box{<0,0,-0.152400><1.023907,0.035000,0.152400> rotate<0,82.869514,0> translate<15.011400,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.382000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.141000,-1.535000,21.592600>}
box{<0,0,-0.152400><13.500396,0.035000,0.152400> rotate<0,-59.952900,0> translate<8.382000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.138400,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.141000,-1.535000,21.592600>}
box{<0,0,-0.152400><2.385001,0.035000,0.152400> rotate<0,89.931604,0> translate<15.138400,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.519400,-1.535000,25.801600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.519400,-1.535000,24.942800>}
box{<0,0,-0.152400><0.858800,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.519400,-1.535000,24.942800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.514000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.519400,-1.535000,25.801600>}
box{<0,0,-0.152400><0.152496,0.035000,0.152400> rotate<0,87.964878,0> translate<15.514000,-1.535000,25.954000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.836400,-1.535000,11.506200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.697200,-1.535000,21.107000>}
box{<0,0,-0.152400><10.348002,0.035000,0.152400> rotate<0,-68.088811,0> translate<11.836400,-1.535000,11.506200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.519400,-1.535000,24.942800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.697200,-1.535000,24.053800>}
box{<0,0,-0.152400><0.906606,0.035000,0.152400> rotate<0,78.684874,0> translate<15.519400,-1.535000,24.942800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.697200,-1.535000,21.107000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.697200,-1.535000,24.053800>}
box{<0,0,-0.152400><2.946800,0.035000,0.152400> rotate<0,90.000000,0> translate<15.697200,-1.535000,24.053800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.376800,-1.535000,6.070600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.014000,-1.535000,7.038000>}
box{<0,0,-0.152400><1.158398,0.035000,0.152400> rotate<0,-56.624456,0> translate<15.376800,-1.535000,6.070600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.014000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.014000,-1.535000,24.954800>}
box{<0,0,-0.152400><0.999200,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.014000,-1.535000,24.954800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.014000,-1.535000,39.358000>}
box{<0,0,-0.152400><6.482755,0.035000,0.152400> rotate<0,44.997030,0> translate<11.430000,-1.535000,43.942000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.014000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.014000,-1.535000,39.358000>}
box{<0,0,-0.152400><1.304000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.014000,-1.535000,39.358000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.014000,-1.535000,24.954800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,-1.535000,24.180800>}
box{<0,0,-0.152400><0.810950,0.035000,0.152400> rotate<0,72.632752,0> translate<16.014000,-1.535000,24.954800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.376800,-1.535000,6.070600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.281400,-1.535000,7.305400>}
box{<0,0,-0.152400><1.530697,0.035000,0.152400> rotate<0,-53.770383,0> translate<15.376800,-1.535000,6.070600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.281400,-1.535000,7.305400>}
box{<0,0,-0.152400><16.875419,0.035000,0.152400> rotate<0,89.907827,0> translate<16.256000,-1.535000,24.180800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.451600,-1.535000,50.012600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.514000,-1.535000,39.950200>}
box{<0,0,-0.152400><14.230383,0.035000,0.152400> rotate<0,44.997030,0> translate<6.451600,-1.535000,50.012600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.514000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.514000,-1.535000,39.950200>}
box{<0,0,-0.152400><1.896200,0.035000,0.152400> rotate<0,90.000000,0> translate<16.514000,-1.535000,39.950200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.566000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,34.036000>}
box{<0,0,-0.152400><3.198000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.566000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,34.036000>}
box{<0,0,-0.152400><1.016000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.764000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.891000,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.891000,-1.535000,21.691600>}
box{<0,0,-0.152400><2.489200,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.891000,-1.535000,21.691600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.891000,-1.535000,24.180800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.014000,-1.535000,24.964200>}
box{<0,0,-0.152400><0.792997,0.035000,0.152400> rotate<0,-81.071605,0> translate<16.891000,-1.535000,24.180800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.014000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.014000,-1.535000,24.964200>}
box{<0,0,-0.152400><0.989800,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.014000,-1.535000,24.964200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.931400,-1.535000,47.675800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.014000,-1.535000,40.593200>}
box{<0,0,-0.152400><10.016309,0.035000,0.152400> rotate<0,44.997030,0> translate<9.931400,-1.535000,47.675800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.014000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.014000,-1.535000,40.593200>}
box{<0,0,-0.152400><2.539200,0.035000,0.152400> rotate<0,90.000000,0> translate<17.014000,-1.535000,40.593200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.514000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.514000,-1.535000,22.084600>}
box{<0,0,-0.152400><3.869400,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.514000,-1.535000,22.084600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.462000,-1.535000,45.415200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.514000,-1.535000,41.363200>}
box{<0,0,-0.152400><5.730393,0.035000,0.152400> rotate<0,44.997030,0> translate<13.462000,-1.535000,45.415200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.514000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.514000,-1.535000,41.363200>}
box{<0,0,-0.152400><3.309200,0.035000,0.152400> rotate<0,90.000000,0> translate<17.514000,-1.535000,41.363200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.014000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.014000,-1.535000,24.912000>}
box{<0,0,-0.152400><1.042000,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.014000,-1.535000,24.912000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.891000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.014000,-1.535000,51.582000>}
box{<0,0,-0.152400><1.588162,0.035000,0.152400> rotate<0,44.997030,0> translate<16.891000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.014000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.014000,-1.535000,51.582000>}
box{<0,0,-0.152400><13.528000,0.035000,0.152400> rotate<0,90.000000,0> translate<18.014000,-1.535000,51.582000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.161000,-1.535000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.161000,-1.535000,22.479000>}
box{<0,0,-0.152400><1.752600,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.161000,-1.535000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.014000,-1.535000,24.912000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.161000,-1.535000,24.231600>}
box{<0,0,-0.152400><0.696099,0.035000,0.152400> rotate<0,77.803528,0> translate<18.014000,-1.535000,24.912000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,24.945400>}
box{<0,0,-0.152400><1.008600,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.514000,-1.535000,24.945400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,35.786000>}
box{<0,0,-0.152400><2.474874,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.764000,-1.535000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,35.786000>}
box{<0,0,-0.152400><2.268000,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.514000,-1.535000,35.786000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,39.493500>}
box{<0,0,-0.152400><1.439500,0.035000,0.152400> rotate<0,90.000000,0> translate<18.514000,-1.535000,39.493500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.891000,-1.535000,21.691600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,-1.535000,20.040600>}
box{<0,0,-0.152400><2.334867,0.035000,0.152400> rotate<0,44.997030,0> translate<16.891000,-1.535000,21.691600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,-1.535000,20.040600>}
box{<0,0,-0.152400><16.484600,0.035000,0.152400> rotate<0,90.000000,0> translate<18.542000,-1.535000,20.040600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,-1.535000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,-1.535000,23.190200>}
box{<0,0,-0.152400><1.066800,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.796000,-1.535000,23.190200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,24.945400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,-1.535000,24.257000>}
box{<0,0,-0.152400><0.743921,0.035000,0.152400> rotate<0,67.719289,0> translate<18.514000,-1.535000,24.945400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.014000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.014000,-1.535000,27.396000>}
box{<0,0,-0.152400><1.442000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.014000,-1.535000,27.396000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.014000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.014000,-1.535000,39.257800>}
box{<0,0,-0.152400><1.203800,0.035000,0.152400> rotate<0,90.000000,0> translate<19.014000,-1.535000,39.257800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,35.786000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.046000,-1.535000,35.254000>}
box{<0,0,-0.152400><0.752362,0.035000,0.152400> rotate<0,44.997030,0> translate<18.514000,-1.535000,35.786000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.514000,-1.535000,39.493500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.242200,-1.535000,40.982900>}
box{<0,0,-0.152400><1.657886,0.035000,0.152400> rotate<0,-63.940767,0> translate<18.514000,-1.535000,39.493500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.014000,-1.535000,27.396000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,-1.535000,27.686000>}
box{<0,0,-0.152400><0.410122,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.014000,-1.535000,27.396000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.014000,-1.535000,39.257800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,-1.535000,39.700200>}
box{<0,0,-0.152400><0.625648,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.014000,-1.535000,39.257800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.514000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.514000,-1.535000,23.640600>}
box{<0,0,-0.152400><2.313400,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.514000,-1.535000,23.640600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,-1.535000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.558000,-1.535000,2.794000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,36.867464,0> translate<18.542000,-1.535000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.046000,-1.535000,35.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.888200,-1.535000,35.254000>}
box{<0,0,-0.152400><0.842200,0.035000,0.152400> rotate<0,0.000000,0> translate<19.046000,-1.535000,35.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.014000,-1.535000,25.954000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.014000,-1.535000,24.359800>}
box{<0,0,-0.152400><1.594200,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.014000,-1.535000,24.359800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.456400,-1.535000,39.700200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.218400,-1.535000,39.700200>}
box{<0,0,-0.152400><0.762000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.456400,-1.535000,39.700200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.514000,-1.535000,38.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.518800,-1.535000,38.058800>}
box{<0,0,-0.152400><0.006788,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.514000,-1.535000,38.054000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.218400,-1.535000,39.700200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.777200,-1.535000,40.259000>}
box{<0,0,-0.152400><0.790263,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.218400,-1.535000,39.700200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.777200,-1.535000,40.259000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.777200,-1.535000,40.717900>}
box{<0,0,-0.152400><0.458900,0.035000,0.152400> rotate<0,90.000000,0> translate<20.777200,-1.535000,40.717900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.030000,-1.535000,28.754000>}
box{<0,0,-0.152400><6.033035,0.035000,0.152400> rotate<0,44.997030,0> translate<16.764000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.777200,-1.535000,40.717900>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.042200,-1.535000,40.982900>}
box{<0,0,-0.152400><0.374767,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.777200,-1.535000,40.717900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,27.686000>}
box{<0,0,-0.152400><1.778000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.304000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.042200,-1.535000,40.982900>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,40.615500>}
box{<0,0,-0.152400><0.369549,0.035000,0.152400> rotate<0,83.811795,0> translate<21.042200,-1.535000,40.982900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.318000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,55.372000>}
box{<0,0,-0.152400><16.764000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.318000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,40.615500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,55.372000>}
box{<0,0,-0.152400><14.756500,0.035000,0.152400> rotate<0,90.000000,0> translate<21.082000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.518800,-1.535000,38.058800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.294800,-1.535000,38.058800>}
box{<0,0,-0.152400><0.776000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.518800,-1.535000,38.058800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,18.008600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,6.045200>}
box{<0,0,-0.152400><11.963400,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.590000,-1.535000,6.045200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.514000,-1.535000,22.084600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,18.008600>}
box{<0,0,-0.152400><5.764334,0.035000,0.152400> rotate<0,44.997030,0> translate<17.514000,-1.535000,22.084600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.888200,-1.535000,35.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.186400,-1.535000,37.552200>}
box{<0,0,-0.152400><3.250146,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.888200,-1.535000,35.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.030000,-1.535000,28.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,28.754000>}
box{<0,0,-0.152400><1.784000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.030000,-1.535000,28.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.518000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,32.254000>}
box{<0,0,-0.152400><0.296027,0.035000,0.152400> rotate<0,0.774169,0> translate<22.518000,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.888200,-1.535000,35.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,35.254000>}
box{<0,0,-0.152400><2.925800,0.035000,0.152400> rotate<0,0.000000,0> translate<19.888200,-1.535000,35.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,28.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.890600,-1.535000,28.254000>}
box{<0,0,-0.152400><0.076600,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,28.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,32.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.864000,-1.535000,32.754000>}
box{<0,0,-0.152400><1.050000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,32.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,29.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.216800,-1.535000,29.754000>}
box{<0,0,-0.152400><1.402800,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,29.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.423800,-1.535000,26.720800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.423800,-1.535000,26.300000>}
box{<0,0,-0.152400><0.420800,0.035000,0.152400> rotate<0,-90.000000,0> translate<24.423800,-1.535000,26.300000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.890600,-1.535000,28.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.423800,-1.535000,26.720800>}
box{<0,0,-0.152400><2.168272,0.035000,0.152400> rotate<0,44.997030,0> translate<22.890600,-1.535000,28.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.518000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.434800,-1.535000,32.258000>}
box{<0,0,-0.152400><1.916800,0.035000,0.152400> rotate<0,0.000000,0> translate<22.518000,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,34.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.566900,-1.535000,34.754000>}
box{<0,0,-0.152400><1.752900,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,34.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.612600,0.000000,28.625800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.612600,0.000000,33.426400>}
box{<0,0,-0.152400><4.800600,0.035000,0.152400> rotate<0,90.000000,0> translate<24.612600,0.000000,33.426400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,28.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.713000,-1.535000,28.754000>}
box{<0,0,-0.152400><1.899000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,28.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.864000,-1.535000,32.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.739600,-1.535000,33.223200>}
box{<0,0,-0.152400><0.993390,0.035000,0.152400> rotate<0,-28.183267,0> translate<23.864000,-1.535000,32.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.294800,-1.535000,38.058800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.892000,-1.535000,41.656000>}
box{<0,0,-0.152400><5.087209,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.294800,-1.535000,38.058800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.831400,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.892000,-1.535000,52.492000>}
box{<0,0,-0.152400><0.221453,0.035000,0.152400> rotate<0,74.113683,0> translate<24.831400,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.892000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.892000,-1.535000,52.492000>}
box{<0,0,-0.152400><10.836000,0.035000,0.152400> rotate<0,90.000000,0> translate<24.892000,-1.535000,52.492000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,34.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.983000,-1.535000,34.254000>}
box{<0,0,-0.152400><2.169000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,34.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.983000,-1.535000,34.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.008400,-1.535000,34.279400>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.983000,-1.535000,34.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.090000,-1.535000,6.045200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.146000,-1.535000,6.152000>}
box{<0,0,-0.152400><0.120591,0.035000,0.152400> rotate<0,-62.325861,0> translate<25.090000,-1.535000,6.045200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.146000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.146000,-1.535000,6.152000>}
box{<0,0,-0.152400><9.342000,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.146000,-1.535000,6.152000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.161000,-1.535000,22.479000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.146000,-1.535000,15.494000>}
box{<0,0,-0.152400><9.878282,0.035000,0.152400> rotate<0,44.997030,0> translate<18.161000,-1.535000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.216800,-1.535000,29.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.146000,-1.535000,30.683200>}
box{<0,0,-0.152400><1.314087,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.216800,-1.535000,29.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.434800,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.273000,-1.535000,32.664400>}
box{<0,0,-0.152400><0.931526,0.035000,0.152400> rotate<0,-25.864650,0> translate<24.434800,-1.535000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.273000,-1.535000,32.664400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.298400,-1.535000,32.689800>}
box{<0,0,-0.152400><0.035921,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.273000,-1.535000,32.664400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.014000,-1.535000,24.359800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.323800,-1.535000,19.050000>}
box{<0,0,-0.152400><7.509191,0.035000,0.152400> rotate<0,44.997030,0> translate<20.014000,-1.535000,24.359800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.146000,-1.535000,30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.527000,-1.535000,31.038800>}
box{<0,0,-0.152400><0.521164,0.035000,0.152400> rotate<0,-43.022227,0> translate<25.146000,-1.535000,30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.566900,-1.535000,34.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.565100,-1.535000,35.752200>}
box{<0,0,-0.152400><1.411668,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.566900,-1.535000,34.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.186400,-1.535000,37.552200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.565100,-1.535000,37.552200>}
box{<0,0,-0.152400><3.378700,0.035000,0.152400> rotate<0,0.000000,0> translate<22.186400,-1.535000,37.552200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.565100,-1.535000,37.552200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.565100,-1.535000,37.782500>}
box{<0,0,-0.152400><0.230300,0.035000,0.152400> rotate<0,90.000000,0> translate<25.565100,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.423800,-1.535000,26.300000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.628600,-1.535000,25.095200>}
box{<0,0,-0.152400><1.703844,0.035000,0.152400> rotate<0,44.997030,0> translate<24.423800,-1.535000,26.300000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.008400,-1.535000,34.279400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.857200,-1.535000,34.569400>}
box{<0,0,-0.152400><0.896973,0.035000,0.152400> rotate<0,-18.861940,0> translate<25.008400,-1.535000,34.279400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,29.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.106100,-1.535000,29.254000>}
box{<0,0,-0.152400><3.292100,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,29.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.514000,-1.535000,23.640600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.136600,-1.535000,17.018000>}
box{<0,0,-0.152400><9.365771,0.035000,0.152400> rotate<0,44.997030,0> translate<19.514000,-1.535000,23.640600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-1.535000,27.254200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-1.535000,26.731800>}
box{<0,0,-0.152400><0.522400,0.035000,0.152400> rotate<0,-90.000000,0> translate<26.212800,-1.535000,26.731800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.713000,-1.535000,28.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-1.535000,27.254200>}
box{<0,0,-0.152400><2.121038,0.035000,0.152400> rotate<0,44.997030,0> translate<24.713000,-1.535000,28.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.212800,-1.535000,26.731800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.223800,-1.535000,26.720800>}
box{<0,0,-0.152400><0.015556,0.035000,0.152400> rotate<0,44.997030,0> translate<26.212800,-1.535000,26.731800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.416000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.416000,-1.535000,8.270000>}
box{<0,0,-0.152400><7.224000,0.035000,0.152400> rotate<0,-90.000000,0> translate<26.416000,-1.535000,8.270000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,-1.535000,23.190200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.416000,-1.535000,15.494000>}
box{<0,0,-0.152400><10.830323,0.035000,0.152400> rotate<0,45.282063,0> translate<18.796000,-1.535000,23.190200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.565100,-1.535000,37.782500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,-1.535000,39.141400>}
box{<0,0,-0.152400><1.921775,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.565100,-1.535000,37.782500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.612600,0.000000,28.625800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.051000,0.000000,26.187400>}
box{<0,0,-0.152400><3.448418,0.035000,0.152400> rotate<0,44.997030,0> translate<24.612600,0.000000,28.625800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.051000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.051000,0.000000,26.187400>}
box{<0,0,-0.152400><0.025400,0.035000,0.152400> rotate<0,90.000000,0> translate<27.051000,0.000000,26.187400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.178000,-1.535000,21.590000>}
box{<0,0,-0.152400><8.621046,0.035000,0.152400> rotate<0,44.997030,0> translate<21.082000,-1.535000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.106100,-1.535000,29.254000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.243200,-1.535000,30.391100>}
box{<0,0,-0.152400><1.608102,0.035000,0.152400> rotate<0,-44.997030,0> translate<26.106100,-1.535000,29.254000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.814000,-1.535000,33.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.406600,-1.535000,33.754000>}
box{<0,0,-0.152400><4.592600,0.035000,0.152400> rotate<0,0.000000,0> translate<22.814000,-1.535000,33.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.223800,-1.535000,26.720800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,28.106000>}
box{<0,0,-0.152400><2.014152,0.035000,0.152400> rotate<0,-43.448105,0> translate<26.223800,-1.535000,26.720800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,28.106000>}
box{<0,0,-0.152400><1.104000,0.035000,0.152400> rotate<0,-90.000000,0> translate<27.686000,-1.535000,28.106000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.565100,-1.535000,35.752200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.798600,-1.535000,35.752200>}
box{<0,0,-0.152400><2.233500,0.035000,0.152400> rotate<0,0.000000,0> translate<25.565100,-1.535000,35.752200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.798600,-1.535000,35.752200>}
box{<0,0,-0.152400><0.159240,0.035000,0.152400> rotate<0,44.997030,0> translate<27.686000,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.406600,-1.535000,33.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.813000,-1.535000,34.010600>}
box{<0,0,-0.152400><0.480629,0.035000,0.152400> rotate<0,-32.266088,0> translate<27.406600,-1.535000,33.754000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.739600,-1.535000,33.223200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.838400,-1.535000,33.223200>}
box{<0,0,-0.152400><3.098800,0.035000,0.152400> rotate<0,0.000000,0> translate<24.739600,-1.535000,33.223200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,35.864800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,36.118800>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<27.686000,-1.535000,35.864800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,36.753800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,36.118800>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<27.940000,-1.535000,36.118800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.612600,0.000000,33.426400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,36.753800>}
box{<0,0,-0.152400><4.705654,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.612600,0.000000,33.426400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.628600,-1.535000,25.095200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.143200,-1.535000,25.095200>}
box{<0,0,-0.152400><2.514600,0.035000,0.152400> rotate<0,0.000000,0> translate<25.628600,-1.535000,25.095200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.282000,-1.535000,29.630000>}
box{<0,0,-0.152400><0.729120,0.035000,0.152400> rotate<0,-35.169955,0> translate<27.686000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.838400,-1.535000,33.223200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.321000,-1.535000,33.426400>}
box{<0,0,-0.152400><0.523634,0.035000,0.152400> rotate<0,-22.832147,0> translate<27.838400,-1.535000,33.223200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.416000,-1.535000,8.270000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.590000,-1.535000,6.045200>}
box{<0,0,-0.152400><3.110629,0.035000,0.152400> rotate<0,45.658643,0> translate<26.416000,-1.535000,8.270000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.282000,-1.535000,29.630000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.043200,-1.535000,30.391100>}
box{<0,0,-0.152400><1.076429,0.035000,0.152400> rotate<0,-44.993267,0> translate<28.282000,-1.535000,29.630000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.051000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,26.162000>}
box{<0,0,-0.152400><2.159000,0.035000,0.152400> rotate<0,0.000000,0> translate<27.051000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.143200,-1.535000,25.095200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,26.162000>}
box{<0,0,-0.152400><1.508683,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.143200,-1.535000,25.095200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.956000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,26.162000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.956000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.798600,-1.535000,35.752200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.286200,-1.535000,35.752200>}
box{<0,0,-0.152400><1.487600,0.035000,0.152400> rotate<0,0.000000,0> translate<27.798600,-1.535000,35.752200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,-1.535000,39.141400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.870400,-1.535000,39.141400>}
box{<0,0,-0.152400><2.946400,0.035000,0.152400> rotate<0,0.000000,0> translate<26.924000,-1.535000,39.141400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,39.039800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,38.442000>}
box{<0,0,-0.152400><0.597800,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.972000,-1.535000,38.442000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.870400,-1.535000,39.141400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,39.039800>}
box{<0,0,-0.152400><0.143684,0.035000,0.152400> rotate<0,44.997030,0> translate<29.870400,-1.535000,39.141400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,39.039800>}
box{<0,0,-0.152400><0.838200,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.972000,-1.535000,39.039800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,55.372000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.082000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.972000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.972000,-1.535000,55.372000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.972000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.286200,-1.535000,35.752200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,36.565000>}
box{<0,0,-0.152400><1.149473,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.286200,-1.535000,35.752200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,38.442000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,38.365000>}
box{<0,0,-0.152400><0.148519,0.035000,0.152400> rotate<0,31.226339,0> translate<29.972000,-1.535000,38.442000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.043200,-1.535000,30.391100>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.761100,-1.535000,30.391100>}
box{<0,0,-0.152400><1.717900,0.035000,0.152400> rotate<0,0.000000,0> translate<29.043200,-1.535000,30.391100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,27.813000>}
box{<0,0,-0.152400><2.334867,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.210000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,28.691000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,27.813000>}
box{<0,0,-0.152400><0.878000,0.035000,0.152400> rotate<0,-90.000000,0> translate<30.861000,-1.535000,27.813000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.761100,-1.535000,30.391100>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,30.491000>}
box{<0,0,-0.152400><0.141280,0.035000,0.152400> rotate<0,-44.997030,0> translate<30.761100,-1.535000,30.391100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.836500,-1.535000,30.416500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,30.491000>}
box{<0,0,-0.152400><0.078425,0.035000,0.152400> rotate<0,-71.791343,0> translate<30.836500,-1.535000,30.416500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,30.491000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,31.623000>}
box{<0,0,-0.152400><1.132000,0.035000,0.152400> rotate<0,90.000000,0> translate<30.861000,-1.535000,31.623000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,31.623000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.496000,-1.535000,32.156400>}
box{<0,0,-0.152400><0.829301,0.035000,0.152400> rotate<0,-40.027617,0> translate<30.861000,-1.535000,31.623000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,41.910000>}
box{<0,0,-0.152400><2.700057,0.035000,0.152400> rotate<0,-48.810853,0> translate<29.972000,-1.535000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.861000,-1.535000,28.691000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.043000,-1.535000,28.741000>}
box{<0,0,-0.152400><1.183057,0.035000,0.152400> rotate<0,-2.422075,0> translate<30.861000,-1.535000,28.691000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,41.490000>}
box{<0,0,-0.127000><0.342000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.258000,-1.535000,41.490000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.310500,-1.535000,44.513500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.310500,-1.535000,47.053500>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<32.310500,-1.535000,47.053500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.331400,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.310500,-1.535000,48.776700>}
box{<0,0,-0.152400><5.591492,0.035000,0.152400> rotate<0,44.628971,0> translate<28.331400,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.310500,-1.535000,47.053500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.310500,-1.535000,48.776700>}
box{<0,0,-0.152400><1.723200,0.035000,0.152400> rotate<0,90.000000,0> translate<32.310500,-1.535000,48.776700> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.374000,-1.535000,41.910000>}
box{<0,0,-0.152400><0.624000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.750000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,41.490000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.374000,-1.535000,41.910000>}
box{<0,0,-0.127000><0.435725,0.035000,0.127000> rotate<0,-74.555434,0> translate<32.258000,-1.535000,41.490000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,36.565000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.391000,-1.535000,36.565000>}
box{<0,0,-0.152400><2.292000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.099000,-1.535000,36.565000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.374000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.512000,-1.535000,39.028000>}
box{<0,0,-0.152400><0.368793,0.035000,0.152400> rotate<0,68.021003,0> translate<32.374000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.512000,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.512000,-1.535000,39.028000>}
box{<0,0,-0.152400><0.420000,0.035000,0.152400> rotate<0,90.000000,0> translate<32.512000,-1.535000,39.028000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.762000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.762000,-1.535000,36.072000>}
box{<0,0,-0.152400><0.864000,0.035000,0.152400> rotate<0,-90.000000,0> translate<32.762000,-1.535000,36.072000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.391000,-1.535000,36.565000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.762000,-1.535000,36.936000>}
box{<0,0,-0.152400><0.524673,0.035000,0.152400> rotate<0,-44.997030,0> translate<32.391000,-1.535000,36.565000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.043000,-1.535000,28.741000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.766000,-1.535000,29.464000>}
box{<0,0,-0.152400><1.022476,0.035000,0.152400> rotate<0,-44.997030,0> translate<32.043000,-1.535000,28.741000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.762000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.766000,-1.535000,31.132000>}
box{<0,0,-0.152400><0.005657,0.035000,0.152400> rotate<0,44.997030,0> translate<32.762000,-1.535000,31.136000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.766000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.766000,-1.535000,31.132000>}
box{<0,0,-0.152400><1.668000,0.035000,0.152400> rotate<0,90.000000,0> translate<32.766000,-1.535000,31.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.972000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.197800,-1.535000,48.844200>}
box{<0,0,-0.127000><4.561970,0.035000,0.127000> rotate<0,44.997030,0> translate<29.972000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.197800,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.197800,-1.535000,48.844200>}
box{<0,0,-0.127000><3.124200,0.035000,0.127000> rotate<0,90.000000,0> translate<33.197800,-1.535000,48.844200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.496000,-1.535000,32.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,32.156400>}
box{<0,0,-0.152400><1.778000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.496000,-1.535000,32.156400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.258000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.274000,-1.535000,40.132000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<32.258000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.274000,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.274000,-1.535000,40.132000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.274000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,27.802000>}
box{<0,0,-0.152400><3.334000,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.412000,-1.535000,27.802000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.274000,-1.535000,32.156400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,32.120000>}
box{<0,0,-0.152400><0.142720,0.035000,0.152400> rotate<0,14.775281,0> translate<33.274000,-1.535000,32.156400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,32.120000>}
box{<0,0,-0.152400><0.984000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.412000,-1.535000,32.120000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.512000,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,37.708000>}
box{<0,0,-0.152400><1.272792,0.035000,0.152400> rotate<0,44.997030,0> translate<32.512000,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,37.708000>}
box{<0,0,-0.152400><0.772000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.412000,-1.535000,37.708000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.831400,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.528000,-1.535000,52.578000>}
box{<0,0,-0.152400><1.701347,0.035000,0.152400> rotate<0,4.280643,0> translate<31.831400,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.528000,-1.535000,52.324000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.528000,-1.535000,52.578000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.528000,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.528000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.528000,-1.535000,52.578000>}
box{<0,0,-0.152400><2.032000,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.528000,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.762000,-1.535000,36.072000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.553400,-1.535000,35.128200>}
box{<0,0,-0.152400><1.231695,0.035000,0.152400> rotate<0,50.016021,0> translate<32.762000,-1.535000,36.072000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,-1.535000,27.802000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,27.178000>}
box{<0,0,-0.152400><0.882469,0.035000,0.152400> rotate<0,44.997030,0> translate<33.412000,-1.535000,27.802000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,36.910000>}
box{<0,0,-0.152400><0.842000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.036000,-1.535000,36.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.528000,-1.535000,52.324000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.060500,-1.535000,50.323500>}
box{<0,0,-0.152400><2.070159,0.035000,0.152400> rotate<0,75.089478,0> translate<33.528000,-1.535000,52.324000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.062000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.062000,-1.535000,29.413500>}
box{<0,0,-0.152400><1.722500,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.062000,-1.535000,29.413500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,36.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.062000,-1.535000,36.936000>}
box{<0,0,-0.152400><0.036770,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.036000,-1.535000,36.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.274000,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.062000,-1.535000,37.820000>}
box{<0,0,-0.127000><1.114400,0.035000,0.127000> rotate<0,44.997030,0> translate<33.274000,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.062000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.062000,-1.535000,37.820000>}
box{<0,0,-0.127000><0.884000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.062000,-1.535000,37.820000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.060500,-1.535000,50.323500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.110500,-1.535000,47.053500>}
box{<0,0,-0.152400><3.270382,0.035000,0.152400> rotate<0,89.118104,0> translate<34.060500,-1.535000,50.323500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.558000,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,2.794000>}
box{<0,0,-0.152400><14.732000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.558000,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.298400,-1.535000,32.689800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.340800,-1.535000,32.689800>}
box{<0,0,-0.152400><9.042400,0.035000,0.152400> rotate<0,0.000000,0> translate<25.298400,-1.535000,32.689800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,-1.535000,35.814000>}
box{<0,0,-0.152400><0.567961,0.035000,0.152400> rotate<0,26.563298,0> translate<34.036000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.340800,-1.535000,32.689800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.712000,-1.535000,32.318600>}
box{<0,0,-0.152400><0.524956,0.035000,0.152400> rotate<0,44.997030,0> translate<34.340800,-1.535000,32.689800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.712000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.712000,-1.535000,32.318600>}
box{<0,0,-0.152400><1.182600,0.035000,0.152400> rotate<0,90.000000,0> translate<34.712000,-1.535000,32.318600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.174000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.712000,-1.535000,38.528000>}
box{<0,0,-0.152400><0.999204,0.035000,0.152400> rotate<0,57.419469,0> translate<34.174000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.712000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.712000,-1.535000,38.528000>}
box{<0,0,-0.152400><1.592000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.712000,-1.535000,38.528000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.062000,-1.535000,29.413500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.787000,-1.535000,28.638500>}
box{<0,0,-0.152400><1.061249,0.035000,0.152400> rotate<0,46.906057,0> translate<34.062000,-1.535000,29.413500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.174000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.798000,-1.535000,41.656000>}
box{<0,0,-0.152400><0.673715,0.035000,0.152400> rotate<0,22.147382,0> translate<34.174000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.362000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.362000,-1.535000,29.863500>}
box{<0,0,-0.152400><1.272500,0.035000,0.152400> rotate<0,-90.000000,0> translate<35.362000,-1.535000,29.863500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.798000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.362000,-1.535000,41.092000>}
box{<0,0,-0.152400><0.797616,0.035000,0.152400> rotate<0,44.997030,0> translate<34.798000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.362000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.362000,-1.535000,41.092000>}
box{<0,0,-0.152400><4.156000,0.035000,0.152400> rotate<0,90.000000,0> translate<35.362000,-1.535000,41.092000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.321000,-1.535000,33.426400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.941000,-1.535000,33.426400>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.321000,-1.535000,33.426400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.012000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.012000,-1.535000,30.028000>}
box{<0,0,-0.152400><1.108000,0.035000,0.152400> rotate<0,-90.000000,0> translate<36.012000,-1.535000,30.028000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.110500,-1.535000,44.513500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.012000,-1.535000,42.562000>}
box{<0,0,-0.152400><2.724712,0.035000,0.152400> rotate<0,45.740461,0> translate<34.110500,-1.535000,44.513500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.012000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.012000,-1.535000,42.562000>}
box{<0,0,-0.152400><5.626000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.012000,-1.535000,42.562000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.068000,-1.535000,1.524000>}
box{<0,0,-0.152400><30.988000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.080000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.331400,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.068000,-1.535000,52.578000>}
box{<0,0,-0.152400><0.747468,0.035000,0.152400> rotate<0,9.781761,0> translate<35.331400,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.813000,-1.535000,34.010600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.319400,-1.535000,34.008000>}
box{<0,0,-0.152400><8.506400,0.035000,0.152400> rotate<0,0.017511,0> translate<27.813000,-1.535000,34.010600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.322000,-1.535000,27.178000>}
box{<0,0,-0.152400><2.286000,0.035000,0.152400> rotate<0,0.000000,0> translate<34.036000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.012000,-1.535000,30.028000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.322000,-1.535000,29.718000>}
box{<0,0,-0.152400><0.438406,0.035000,0.152400> rotate<0,44.997030,0> translate<36.012000,-1.535000,30.028000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.319400,-1.535000,34.008000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.499800,-1.535000,33.782000>}
box{<0,0,-0.152400><0.289172,0.035000,0.152400> rotate<0,51.398687,0> translate<36.319400,-1.535000,34.008000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.362000,-1.535000,29.863500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.587000,-1.535000,28.638500>}
box{<0,0,-0.152400><1.732412,0.035000,0.152400> rotate<0,44.997030,0> translate<35.362000,-1.535000,29.863500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.576000,-1.535000,28.677500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.587000,-1.535000,28.638500>}
box{<0,0,-0.152400><0.040522,0.035000,0.152400> rotate<0,74.243926,0> translate<36.576000,-1.535000,28.677500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.941000,-1.535000,33.426400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.662000,-1.535000,32.172000>}
box{<0,0,-0.152400><1.446845,0.035000,0.152400> rotate<0,60.106743,0> translate<35.941000,-1.535000,33.426400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.662000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.662000,-1.535000,32.172000>}
box{<0,0,-0.152400><1.036000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.662000,-1.535000,32.172000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.662000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.662000,-1.535000,43.227000>}
box{<0,0,-0.152400><6.291000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.662000,-1.535000,43.227000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.322000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,27.686000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.322000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.587000,-1.535000,28.638500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,28.345500>}
box{<0,0,-0.152400><0.380655,0.035000,0.152400> rotate<0,50.326011,0> translate<36.587000,-1.535000,28.638500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,28.345500>}
box{<0,0,-0.152400><0.659500,0.035000,0.152400> rotate<0,90.000000,0> translate<36.830000,-1.535000,28.345500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.084000,-1.535000,5.588000>}
box{<0,0,-0.152400><3.951313,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.290000,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.084000,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.084000,-1.535000,14.971059>}
box{<0,0,-0.152400><9.383059,0.035000,0.152400> rotate<0,90.000000,0> translate<37.084000,-1.535000,14.971059> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.312000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.312000,-1.535000,38.670000>}
box{<0,0,-0.152400><1.734000,0.035000,0.152400> rotate<0,90.000000,0> translate<37.312000,-1.535000,38.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.312000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.338000,-1.535000,31.162000>}
box{<0,0,-0.152400><0.036770,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.312000,-1.535000,31.136000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.338000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.338000,-1.535000,31.162000>}
box{<0,0,-0.152400><1.096000,0.035000,0.152400> rotate<0,-90.000000,0> translate<37.338000,-1.535000,31.162000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.499800,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.338000,-1.535000,32.258000>}
box{<0,0,-0.152400><1.739297,0.035000,0.152400> rotate<0,61.185168,0> translate<36.499800,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.528000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.592000,-1.535000,54.610000>}
box{<0,0,-0.152400><4.064000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.528000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.312000,-1.535000,38.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.708000,-1.535000,39.116000>}
box{<0,0,-0.152400><0.596433,0.035000,0.152400> rotate<0,-48.395177,0> translate<37.312000,-1.535000,38.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.708000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.708000,-1.535000,39.116000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<37.708000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.708000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.758000,-1.535000,42.584000>}
box{<0,0,-0.127000><0.929346,0.035000,0.127000> rotate<0,-86.910189,0> translate<37.708000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.662000,-1.535000,43.227000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.771500,-1.535000,44.386500>}
box{<0,0,-0.152400><1.604815,0.035000,0.152400> rotate<0,-46.259320,0> translate<36.662000,-1.535000,43.227000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.544000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.846000,-1.535000,35.814000>}
box{<0,0,-0.152400><3.302000,0.035000,0.152400> rotate<0,0.000000,0> translate<34.544000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.110500,-1.535000,47.053500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.898500,-1.535000,47.053500>}
box{<0,0,-0.152400><3.788000,0.035000,0.152400> rotate<0,0.000000,0> translate<34.110500,-1.535000,47.053500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.962000,-1.535000,31.136000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.962000,-1.535000,32.374000>}
box{<0,0,-0.152400><1.238000,0.035000,0.152400> rotate<0,90.000000,0> translate<37.962000,-1.535000,32.374000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.846000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.962000,-1.535000,35.930000>}
box{<0,0,-0.152400><0.164049,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.846000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.962000,-1.535000,36.936000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.962000,-1.535000,35.930000>}
box{<0,0,-0.152400><1.006000,0.035000,0.152400> rotate<0,-90.000000,0> translate<37.962000,-1.535000,35.930000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.084000,-1.535000,14.971059>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.114941,-1.535000,16.002000>}
box{<0,0,-0.152400><1.457970,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.084000,-1.535000,14.971059> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.962000,-1.535000,32.374000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.354000,-1.535000,32.766000>}
box{<0,0,-0.152400><0.554372,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.962000,-1.535000,32.374000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.197800,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.354000,-1.535000,45.720000>}
box{<0,0,-0.127000><5.156200,0.035000,0.127000> rotate<0,0.000000,0> translate<33.197800,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.068000,-1.535000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,-1.535000,4.064000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.068000,-1.535000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.972000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,-1.535000,55.372000>}
box{<0,0,-0.152400><8.636000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.972000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.758000,-1.535000,42.584000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.684200,-1.535000,43.459400>}
box{<0,0,-0.127000><1.274430,0.035000,0.127000> rotate<0,-43.381987,0> translate<37.758000,-1.535000,42.584000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.354000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.684200,-1.535000,45.491400>}
box{<0,0,-0.127000><0.401609,0.035000,0.127000> rotate<0,34.692864,0> translate<38.354000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.684200,-1.535000,43.459400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.684200,-1.535000,45.491400>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.684200,-1.535000,45.491400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.709600,-1.535000,4.064000>}
box{<0,0,-0.152400><0.101600,0.035000,0.152400> rotate<0,0.000000,0> translate<38.608000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.846000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.116000,-1.535000,35.814000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<37.846000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.527000,0.000000,31.038800>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,30.988000>}
box{<0,0,-0.152400><13.843093,0.035000,0.152400> rotate<0,0.210245,0> translate<25.527000,0.000000,31.038800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.323800,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.425500,-1.535000,19.050000>}
box{<0,0,-0.152400><14.101700,0.035000,0.152400> rotate<0,0.000000,0> translate<25.323800,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.587000,-1.535000,28.638500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.433500,-1.535000,28.638500>}
box{<0,0,-0.152400><2.846500,0.035000,0.152400> rotate<0,0.000000,0> translate<36.587000,-1.535000,28.638500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.116000,-1.535000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.458000,-1.535000,36.156000>}
box{<0,0,-0.152400><0.483661,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.116000,-1.535000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.458000,-1.535000,36.156000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.508000,-1.535000,39.116000>}
box{<0,0,-0.152400><2.960422,0.035000,0.152400> rotate<0,-89.026382,0> translate<39.458000,-1.535000,36.156000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.508000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.508000,-1.535000,39.116000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<39.508000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.521500,-1.535000,46.926500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.571500,-1.535000,44.386500>}
box{<0,0,-0.152400><2.540492,0.035000,0.152400> rotate<0,88.866411,0> translate<39.521500,-1.535000,46.926500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.178000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.580500,-1.535000,21.590000>}
box{<0,0,-0.152400><12.402500,0.035000,0.152400> rotate<0,0.000000,0> translate<27.178000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.136600,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.593500,-1.535000,17.018000>}
box{<0,0,-0.152400><13.456900,0.035000,0.152400> rotate<0,0.000000,0> translate<26.136600,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,47.078000>}
box{<0,0,-0.152400><1.944000,0.035000,0.152400> rotate<0,-90.000000,0> translate<39.624000,-1.535000,47.078000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.068000,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,49.022000>}
box{<0,0,-0.152400><5.028943,0.035000,0.152400> rotate<0,44.997030,0> translate<36.068000,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.114941,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.668500,-1.535000,16.002000>}
box{<0,0,-0.152400><1.553559,0.035000,0.152400> rotate<0,0.000000,0> translate<38.114941,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.668500,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.673000,-1.535000,15.997500>}
box{<0,0,-0.152400><0.006364,0.035000,0.152400> rotate<0,44.997030,0> translate<39.668500,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.593500,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.673000,-1.535000,17.097500>}
box{<0,0,-0.152400><0.112430,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.593500,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.425500,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.673000,-1.535000,19.297500>}
box{<0,0,-0.152400><0.350018,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.425500,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.580500,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.673000,-1.535000,21.497500>}
box{<0,0,-0.152400><0.130815,0.035000,0.152400> rotate<0,44.997030,0> translate<39.580500,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.673000,-1.535000,15.997500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.677500,-1.535000,16.002000>}
box{<0,0,-0.152400><0.006364,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.673000,-1.535000,15.997500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.521500,-1.535000,46.926500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.698500,-1.535000,47.053500>}
box{<0,0,-0.152400><0.217849,0.035000,0.152400> rotate<0,-35.657620,0> translate<39.521500,-1.535000,46.926500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,47.078000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.698500,-1.535000,47.053500>}
box{<0,0,-0.152400><0.078425,0.035000,0.152400> rotate<0,18.202717,0> translate<39.624000,-1.535000,47.078000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.673000,-1.535000,20.397500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.750500,-1.535000,20.320000>}
box{<0,0,-0.152400><0.109602,0.035000,0.152400> rotate<0,44.997030,0> translate<39.673000,-1.535000,20.397500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.508000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.878000,-1.535000,41.656000>}
box{<0,0,-0.152400><0.370000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.508000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.354000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,32.766000>}
box{<0,0,-0.152400><1.778000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.354000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.857200,-1.535000,34.569400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.193400,-1.535000,34.569400>}
box{<0,0,-0.152400><14.336200,0.035000,0.152400> rotate<0,0.000000,0> translate<25.857200,-1.535000,34.569400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.193400,-1.535000,34.569400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.295000,-1.535000,34.533400>}
box{<0,0,-0.152400><0.107789,0.035000,0.152400> rotate<0,19.509512,0> translate<40.193400,-1.535000,34.569400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.322000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,-1.535000,29.718000>}
box{<0,0,-0.152400><4.064000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.322000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,0.000000,32.004000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.370000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,-1.535000,32.004000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,-90.000000,0> translate<40.386000,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,-1.535000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,-1.535000,32.512000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<40.132000,-1.535000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.878000,-1.535000,41.656000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.148000,-1.535000,42.926000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.878000,-1.535000,41.656000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.592000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.148000,-1.535000,51.054000>}
box{<0,0,-0.152400><5.028943,0.035000,0.152400> rotate<0,44.997030,0> translate<37.592000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.148000,-1.535000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.148000,-1.535000,51.054000>}
box{<0,0,-0.152400><8.128000,0.035000,0.152400> rotate<0,90.000000,0> translate<41.148000,-1.535000,51.054000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.750500,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.402000,-1.535000,20.320000>}
box{<0,0,-0.152400><1.651500,0.035000,0.152400> rotate<0,0.000000,0> translate<39.750500,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.709600,-1.535000,7.564000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,7.564000>}
box{<0,0,-0.152400><3.200400,0.035000,0.152400> rotate<0,0.000000,0> translate<38.709600,-1.535000,7.564000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.402000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,20.828000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.402000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,20.828000>}
box{<0,0,-0.152400><5.334000,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.910000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.433500,-1.535000,28.638500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,26.162000>}
box{<0,0,-0.152400><3.502300,0.035000,0.152400> rotate<0,44.997030,0> translate<39.433500,-1.535000,28.638500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,-1.535000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,30.480000>}
box{<0,0,-0.152400><1.703884,0.035000,0.152400> rotate<0,-26.563298,0> translate<40.386000,-1.535000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,30.480000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.910000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.295000,-1.535000,34.533400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,33.274000>}
box{<0,0,-0.152400><2.048002,0.035000,0.152400> rotate<0,37.945109,0> translate<40.295000,-1.535000,34.533400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.673000,-1.535000,18.197500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.835500,-1.535000,18.197500>}
box{<0,0,-0.152400><3.162500,0.035000,0.152400> rotate<0,0.000000,0> translate<39.673000,-1.535000,18.197500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,7.564000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.926000,-1.535000,8.580000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.910000,-1.535000,7.564000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.835500,-1.535000,18.197500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.926000,-1.535000,18.288000>}
box{<0,0,-0.152400><0.127986,0.035000,0.152400> rotate<0,-44.997030,0> translate<42.835500,-1.535000,18.197500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.926000,-1.535000,8.580000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.926000,-1.535000,18.288000>}
box{<0,0,-0.152400><9.708000,0.035000,0.152400> rotate<0,90.000000,0> translate<42.926000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.926000,-1.535000,51.054000>}
box{<0,0,-0.152400><6.106574,0.035000,0.152400> rotate<0,44.997030,0> translate<38.608000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.553400,-1.535000,35.128200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.951400,-1.535000,35.128200>}
box{<0,0,-0.152400><9.398000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.553400,-1.535000,35.128200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.926000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.951400,-1.535000,35.128200>}
box{<0,0,-0.152400><16.840219,0.035000,0.152400> rotate<0,-89.907647,0> translate<42.926000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.926000,-1.535000,51.054000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.951400,-1.535000,35.128200>}
box{<0,0,-0.152400><15.925820,0.035000,0.152400> rotate<0,89.902686,0> translate<42.926000,-1.535000,51.054000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.962100,-1.535000,44.412225>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.775594,-1.535000,44.412225>}
box{<0,0,-0.101600><0.813494,0.035000,0.101600> rotate<0,0.000000,0> translate<26.962100,-1.535000,44.412225> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.775594,-1.535000,44.141063>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.775594,-1.535000,44.683391>}
box{<0,0,-0.101600><0.542328,0.035000,0.101600> rotate<0,90.000000,0> translate<27.775594,-1.535000,44.683391> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<26.962100,-1.535000,45.347744>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.775594,-1.535000,45.347744>}
box{<0,0,-0.101600><0.813494,0.035000,0.101600> rotate<0,0.000000,0> translate<26.962100,-1.535000,45.347744> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.775594,-1.535000,45.076581>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<27.775594,-1.535000,45.618909>}
box{<0,0,-0.101600><0.542328,0.035000,0.101600> rotate<0,90.000000,0> translate<27.775594,-1.535000,45.618909> }
//Rect
union{
box{<-0.158750,0,-0.793750><0.158750,0.037000,0.793750> rotate<0,180.000000,0> translate<29.559250,-1.537000,43.529250>}
box{<-0.158750,0,-0.793750><0.158750,0.037000,0.793750> rotate<0,180.000000,0> translate<28.924250,-1.537000,43.529250>}
box{<-0.158750,0,-0.793750><0.158750,0.037000,0.793750> rotate<0,180.000000,0> translate<28.289250,-1.537000,43.529250>}
box{<-0.158750,0,-0.793750><0.158750,0.037000,0.793750> rotate<0,180.000000,0> translate<29.559250,-1.537000,46.704250>}
box{<-0.158750,0,-0.793750><0.158750,0.037000,0.793750> rotate<0,180.000000,0> translate<28.924250,-1.537000,46.704250>}
box{<-0.158750,0,-0.793750><0.158750,0.037000,0.793750> rotate<0,180.000000,0> translate<28.289250,-1.537000,46.704250>}
box{<-0.158750,0,-0.793750><0.158750,0.037000,0.793750> rotate<0,270.000000,0> translate<28.924250,-1.537000,45.116750>}
box{<-3.016250,0,-0.158750><3.016250,0.037000,0.158750> rotate<0,90.000000,0> translate<26.447750,-1.537000,45.091350>}
box{<-3.016250,0,-0.158750><3.016250,0.037000,0.158750> rotate<0,90.000000,0> translate<30.194250,-1.537000,45.091350>}
box{<-1.727200,0,-0.177800><1.727200,0.037000,0.177800> rotate<0,0.000000,0> translate<28.321000,-1.537000,47.929800>}
box{<-1.727200,0,-0.177800><1.727200,0.037000,0.177800> rotate<0,0.000000,0> translate<28.321000,-1.537000,42.265600>}
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,2.217444>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,55.493388>}
box{<0,0,-0.203200><53.275944,0.035000,0.203200> rotate<0,90.000000,0> translate<1.041397,-1.535000,55.493388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,2.217444>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.205200,-1.535000,2.381250>}
box{<0,0,-0.203200><0.231655,0.035000,0.203200> rotate<0,-44.997577,0> translate<1.041397,-1.535000,2.217444> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.343172,-1.535000,2.438400>}
box{<0,0,-0.203200><0.301775,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.220266,-1.535000,2.844800>}
box{<0,0,-0.203200><17.178869,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.836913,-1.535000,3.251200>}
box{<0,0,-0.203200><16.795516,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,3.657600>}
box{<0,0,-0.203200><16.738603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,4.064000>}
box{<0,0,-0.203200><16.738603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.178053,-1.535000,4.470400>}
box{<0,0,-0.203200><3.136656,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.771653,-1.535000,4.876800>}
box{<0,0,-0.203200><2.730256,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.365253,-1.535000,5.283200>}
box{<0,0,-0.203200><2.323856,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.251200,-1.535000,5.689600>}
box{<0,0,-0.203200><2.209803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.251200,-1.535000,6.096000>}
box{<0,0,-0.203200><2.209803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.251200,-1.535000,6.502400>}
box{<0,0,-0.203200><2.209803,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.416059,-1.535000,6.908800>}
box{<0,0,-0.203200><2.374663,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.822459,-1.535000,7.315200>}
box{<0,0,-0.203200><2.781062,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.087406,-1.535000,7.721600>}
box{<0,0,-0.203200><3.046009,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.080691,-1.535000,8.128000>}
box{<0,0,-0.203200><3.039294,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.073972,-1.535000,8.534400>}
box{<0,0,-0.203200><3.032575,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.067256,-1.535000,8.940800>}
box{<0,0,-0.203200><3.025859,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.086978,-1.535000,9.347200>}
box{<0,0,-0.203200><3.045581,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.331184,-1.535000,9.753600>}
box{<0,0,-0.203200><3.289788,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.637272,-1.535000,10.160000>}
box{<0,0,-0.203200><3.595875,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.943359,-1.535000,10.566400>}
box{<0,0,-0.203200><3.901962,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.249447,-1.535000,10.972800>}
box{<0,0,-0.203200><4.208050,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.555534,-1.535000,11.379200>}
box{<0,0,-0.203200><4.514138,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.861622,-1.535000,11.785600>}
box{<0,0,-0.203200><4.820225,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.167709,-1.535000,12.192000>}
box{<0,0,-0.203200><5.126313,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.473797,-1.535000,12.598400>}
box{<0,0,-0.203200><5.432400,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.470466,-1.535000,13.004800>}
box{<0,0,-0.203200><2.429069,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.064066,-1.535000,13.411200>}
box{<0,0,-0.203200><2.022669,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.755900,-1.535000,13.817600>}
box{<0,0,-0.203200><1.714503,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.755900,-1.535000,14.224000>}
box{<0,0,-0.203200><1.714503,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.755900,-1.535000,14.630400>}
box{<0,0,-0.203200><1.714503,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.937069,-1.535000,15.036800>}
box{<0,0,-0.203200><1.895672,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.343469,-1.535000,15.443200>}
box{<0,0,-0.203200><2.302072,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.923000,-1.535000,15.849600>}
box{<0,0,-0.203200><3.881603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.189244,-1.535000,16.256000>}
box{<0,0,-0.203200><4.147847,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.908800,-1.535000,16.662400>}
box{<0,0,-0.203200><5.867403,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.075769,-1.535000,17.068800>}
box{<0,0,-0.203200><6.034372,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.482169,-1.535000,17.475200>}
box{<0,0,-0.203200><6.440772,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.888569,-1.535000,17.881600>}
box{<0,0,-0.203200><6.847172,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.267266,-1.535000,18.288000>}
box{<0,0,-0.203200><2.225869,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.110300,-1.535000,18.694400>}
box{<0,0,-0.203200><1.068903,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.665566,-1.535000,19.100800>}
box{<0,0,-0.203200><0.624169,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.333466,-1.535000,19.507200>}
box{<0,0,-0.203200><0.292069,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,19.913600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,20.320000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,20.726400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,21.132800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,21.539200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,21.945600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,22.352000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,22.758400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,23.164800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,23.571200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,23.977600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,24.384000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,24.790400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,25.196800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,25.603200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,26.009600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,26.416000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,26.822400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,27.228800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,27.635200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,28.041600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,28.448000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,28.854400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,29.260800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,29.667200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,30.073600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,30.480000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,30.886400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,31.292800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,31.699200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,32.105600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,32.512000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,32.918400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,33.324800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,33.731200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,34.137600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,34.544000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,34.950400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,35.356800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,35.763200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,36.169600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,36.576000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,36.982400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,37.388800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,37.795200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,38.201600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,38.608000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,39.014400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,39.420800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,39.827200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,40.233600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,40.640000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,41.046400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,41.452800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,41.859200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,42.265600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,42.672000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,43.078400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,43.484800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,43.891200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,44.297600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,44.704000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,45.110400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,45.516800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,45.923200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,46.329600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,46.736000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,47.142400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,47.548800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,47.955200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,48.361600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,48.768000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,49.174400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,49.580800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,49.987200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,50.393600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,50.800000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,51.206400>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,51.612800>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,52.019200>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,52.425600>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,52.832000>}
box{<0,0,-0.203200><0.228603,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270344,-1.535000,53.238400>}
box{<0,0,-0.203200><0.228947,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.513169,-1.535000,53.644800>}
box{<0,0,-0.203200><0.471772,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.919569,-1.535000,54.051200>}
box{<0,0,-0.203200><0.878172,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.325969,-1.535000,54.457600>}
box{<0,0,-0.203200><1.284572,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732369,-1.535000,54.864000>}
box{<0,0,-0.203200><1.690972,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.138769,-1.535000,55.270400>}
box{<0,0,-0.203200><2.097372,0.035000,0.203200> rotate<0,0.000000,0> translate<1.041397,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041397,-1.535000,55.493388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.322856,-1.535000,55.376800>}
box{<0,0,-0.203200><0.304651,0.035000,0.203200> rotate<0,22.499073,0> translate<1.041397,-1.535000,55.493388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.205200,-1.535000,2.381250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.576856,-1.535000,2.535197>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,-22.498754,0> translate<1.205200,-1.535000,2.381250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,19.660425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.386006,-1.535000,19.380359>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,67.495673,0> translate<1.270000,-1.535000,19.660425> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,53.237572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,19.660425>}
box{<0,0,-0.203200><33.577147,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.270000,-1.535000,19.660425> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,53.237572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.386006,-1.535000,53.517637>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<1.270000,-1.535000,53.237572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.322856,-1.535000,55.376800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.725141,-1.535000,55.376800>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,0.000000,0> translate<1.322856,-1.535000,55.376800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.386006,-1.535000,19.380359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.044859,-1.535000,18.721506>}
box{<0,0,-0.203200><0.931759,0.035000,0.203200> rotate<0,44.997030,0> translate<1.386006,-1.535000,19.380359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.386006,-1.535000,53.517637>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.672006,-1.535000,55.803638>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.386006,-1.535000,53.517637> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.576856,-1.535000,2.535197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.979141,-1.535000,2.535197>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,0.000000,0> translate<1.576856,-1.535000,2.535197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.725141,-1.535000,55.376800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.096797,-1.535000,55.530747>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,-22.498754,0> translate<1.725141,-1.535000,55.376800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.979141,-1.535000,2.535197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.350797,-1.535000,2.381250>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,22.498754,0> translate<1.979141,-1.535000,2.535197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.044859,-1.535000,18.721506>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324925,-1.535000,18.605500>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,22.498388,0> translate<2.044859,-1.535000,18.721506> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.096797,-1.535000,55.530747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,55.815200>}
box{<0,0,-0.203200><0.402277,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.096797,-1.535000,55.530747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.116941,-1.535000,57.225103>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,56.960797>}
box{<0,0,-0.203200><0.373788,0.035000,0.203200> rotate<0,44.996691,0> translate<2.116941,-1.535000,57.225103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.116941,-1.535000,57.225103>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.087906,-1.535000,57.201953>}
box{<0,0,-0.203200><41.970972,0.035000,0.203200> rotate<0,0.031601,0> translate<2.116941,-1.535000,57.225103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.212828,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.762131,-1.535000,2.438400>}
box{<0,0,-0.203200><16.549303,0.035000,0.203200> rotate<0,0.000000,0> translate<2.212828,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.242850,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.545169,-1.535000,55.676800>}
box{<0,0,-0.203200><1.302319,0.035000,0.203200> rotate<0,0.000000,0> translate<2.242850,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.324925,-1.535000,18.605500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.949766,-1.535000,18.605500>}
box{<0,0,-0.203200><0.624841,0.035000,0.203200> rotate<0,0.000000,0> translate<2.324925,-1.535000,18.605500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.350797,-1.535000,2.381250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635250,-1.535000,2.096797>}
box{<0,0,-0.203200><0.402277,0.035000,0.203200> rotate<0,44.997030,0> translate<2.350797,-1.535000,2.381250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,55.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.535197,-1.535000,56.186856>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,-67.495306,0> translate<2.381250,-1.535000,55.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.381250,-1.535000,56.960797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.535197,-1.535000,56.589141>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,67.495306,0> translate<2.381250,-1.535000,56.960797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.408091,-1.535000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.819909,-1.535000,56.896000>}
box{<0,0,-0.203200><41.411819,0.035000,0.203200> rotate<0,0.000000,0> translate<2.408091,-1.535000,56.896000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.492259,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.043791,-1.535000,56.083200>}
box{<0,0,-0.203200><1.551531,0.035000,0.203200> rotate<0,0.000000,0> translate<2.492259,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.535197,-1.535000,56.186856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.535197,-1.535000,56.589141>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,90.000000,0> translate<2.535197,-1.535000,56.589141> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.535197,-1.535000,56.489600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692800,-1.535000,56.489600>}
box{<0,0,-0.203200><41.157603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.535197,-1.535000,56.489600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598444,-1.535000,0.914397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635250,-1.535000,0.951200>}
box{<0,0,-0.203200><0.052050,0.035000,0.203200> rotate<0,-44.994598,0> translate<2.598444,-1.535000,0.914397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.598444,-1.535000,0.914397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.629553,-1.535000,0.914397>}
box{<0,0,-0.203200><41.031109,0.035000,0.203200> rotate<0,0.000000,0> translate<2.598444,-1.535000,0.914397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635250,-1.535000,0.951200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.789197,-1.535000,1.322856>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,-67.495306,0> translate<2.635250,-1.535000,0.951200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.635250,-1.535000,2.096797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.789197,-1.535000,1.725141>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,67.495306,0> translate<2.635250,-1.535000,2.096797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.662091,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.406425,-1.535000,2.032000>}
box{<0,0,-0.203200><16.744334,0.035000,0.203200> rotate<0,0.000000,0> translate<2.662091,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.746259,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.481734,-1.535000,1.219200>}
box{<0,0,-0.203200><40.735475,0.035000,0.203200> rotate<0,0.000000,0> translate<2.746259,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.755900,-1.535000,13.719366>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.559366,-1.535000,12.915900>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<2.755900,-1.535000,13.719366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.755900,-1.535000,14.855631>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.755900,-1.535000,13.719366>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.755900,-1.535000,13.719366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.755900,-1.535000,14.855631>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.559366,-1.535000,15.659097>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.755900,-1.535000,14.855631> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.789197,-1.535000,1.322856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.789197,-1.535000,1.725141>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,90.000000,0> translate<2.789197,-1.535000,1.725141> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.789197,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.438800,-1.535000,1.625600>}
box{<0,0,-0.203200><40.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.789197,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,32.511997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,41.402000>}
box{<0,0,-0.203200><8.890003,0.035000,0.203200> rotate<0,90.000000,0> translate<2.793997,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,32.511997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.084497,-1.535000,32.511997>}
box{<0,0,-0.203200><2.290500,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,32.511997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.084500,-1.535000,32.512000>}
box{<0,0,-0.203200><2.290503,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.123800,-1.535000,32.918400>}
box{<0,0,-0.203200><4.329803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.123800,-1.535000,33.324800>}
box{<0,0,-0.203200><4.329803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.105538,-1.535000,33.731200>}
box{<0,0,-0.203200><2.311541,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026200,-1.535000,34.137600>}
box{<0,0,-0.203200><2.232203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026200,-1.535000,34.544000>}
box{<0,0,-0.203200><2.232203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026200,-1.535000,34.950400>}
box{<0,0,-0.203200><2.232203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.105541,-1.535000,35.356800>}
box{<0,0,-0.203200><2.311544,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.423800,-1.535000,35.763200>}
box{<0,0,-0.203200><2.629803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.423800,-1.535000,36.169600>}
box{<0,0,-0.203200><2.629803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,36.576000>}
box{<0,0,-0.203200><2.535403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,36.982400>}
box{<0,0,-0.203200><2.535403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,37.388800>}
box{<0,0,-0.203200><2.535403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,37.795200>}
box{<0,0,-0.203200><2.535403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.414666,-1.535000,38.201600>}
box{<0,0,-0.203200><2.620669,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.058838,-1.535000,38.608000>}
box{<0,0,-0.203200><7.264841,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.452269,-1.535000,39.014400>}
box{<0,0,-0.203200><7.658272,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.494900,-1.535000,39.420800>}
box{<0,0,-0.203200><7.700903,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.543341,-1.535000,39.827200>}
box{<0,0,-0.203200><7.749344,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.693400,-1.535000,40.233600>}
box{<0,0,-0.203200><7.899403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.693400,-1.535000,40.640000>}
box{<0,0,-0.203200><7.899403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.693400,-1.535000,41.046400>}
box{<0,0,-0.203200><7.899403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.693400,-1.535000,41.402000>}
box{<0,0,-0.203200><7.899403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,42.925997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,52.770366>}
box{<0,0,-0.203200><9.844369,0.035000,0.203200> rotate<0,90.000000,0> translate<2.793997,-1.535000,52.770366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,42.925997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.395300,-1.535000,42.925997>}
box{<0,0,-0.203200><1.601303,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,42.925997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.176694,-1.535000,43.078400>}
box{<0,0,-0.203200><1.382697,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.018000,-1.535000,43.484800>}
box{<0,0,-0.203200><1.224003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.018000,-1.535000,43.891200>}
box{<0,0,-0.203200><1.224003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.018000,-1.535000,44.297600>}
box{<0,0,-0.203200><1.224003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.096016,-1.535000,44.704000>}
box{<0,0,-0.203200><1.302019,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.276166,-1.535000,45.110400>}
box{<0,0,-0.203200><7.482169,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.869766,-1.535000,45.516800>}
box{<0,0,-0.203200><7.075769,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.463366,-1.535000,45.923200>}
box{<0,0,-0.203200><6.669369,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.056966,-1.535000,46.329600>}
box{<0,0,-0.203200><6.262969,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.650566,-1.535000,46.736000>}
box{<0,0,-0.203200><5.856569,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.244166,-1.535000,47.142400>}
box{<0,0,-0.203200><5.450169,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.837766,-1.535000,47.548800>}
box{<0,0,-0.203200><5.043769,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.431366,-1.535000,47.955200>}
box{<0,0,-0.203200><4.637369,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.024966,-1.535000,48.361600>}
box{<0,0,-0.203200><4.230969,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.618566,-1.535000,48.768000>}
box{<0,0,-0.203200><3.824569,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.212166,-1.535000,49.174400>}
box{<0,0,-0.203200><3.418169,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.805766,-1.535000,49.580800>}
box{<0,0,-0.203200><3.011769,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689600,-1.535000,49.987200>}
box{<0,0,-0.203200><2.895603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689600,-1.535000,50.393600>}
box{<0,0,-0.203200><2.895603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689600,-1.535000,50.800000>}
box{<0,0,-0.203200><2.895603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.590653,-1.535000,51.206400>}
box{<0,0,-0.203200><2.796656,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.184253,-1.535000,51.612800>}
box{<0,0,-0.203200><2.390256,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.777853,-1.535000,52.019200>}
box{<0,0,-0.203200><1.983856,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765400,-1.535000,52.425600>}
box{<0,0,-0.203200><1.971403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.793997,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.793997,-1.535000,52.770366>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.633631,-1.535000,54.610000>}
box{<0,0,-0.203200><2.601636,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.793997,-1.535000,52.770366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.855631,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765400,-1.535000,52.832000>}
box{<0,0,-0.203200><1.909769,0.035000,0.203200> rotate<0,0.000000,0> translate<2.855631,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.949766,-1.535000,18.605500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.559366,-1.535000,17.995900>}
box{<0,0,-0.203200><0.862105,0.035000,0.203200> rotate<0,44.997030,0> translate<2.949766,-1.535000,18.605500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.251200,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.203453,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<3.251200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.251200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.251200,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.251200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.251200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.089709,-1.535000,7.582450>}
box{<0,0,-0.203200><1.185829,0.035000,0.203200> rotate<0,-44.996923,0> translate<3.251200,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.262031,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765400,-1.535000,53.238400>}
box{<0,0,-0.203200><1.503369,0.035000,0.203200> rotate<0,0.000000,0> translate<3.262031,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.559366,-1.535000,12.915900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.695631,-1.535000,12.915900>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<3.559366,-1.535000,12.915900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.559366,-1.535000,15.659097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.695631,-1.535000,15.659097>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<3.559366,-1.535000,15.659097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.559366,-1.535000,17.995900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.695631,-1.535000,17.995900>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<3.559366,-1.535000,17.995900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.668431,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.031856,-1.535000,53.644800>}
box{<0,0,-0.203200><1.363425,0.035000,0.203200> rotate<0,0.000000,0> translate<3.668431,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.672006,-1.535000,55.803638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.886359,-1.535000,56.017991>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.672006,-1.535000,55.803638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.886359,-1.535000,56.017991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.166425,-1.535000,56.133997>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<3.886359,-1.535000,56.017991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.018000,-1.535000,43.368341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.110806,-1.535000,43.144288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<4.018000,-1.535000,43.368341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.018000,-1.535000,44.515656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.018000,-1.535000,43.368341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.018000,-1.535000,43.368341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.018000,-1.535000,44.515656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.110806,-1.535000,44.739709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.018000,-1.535000,44.515656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.050309,-1.535000,9.187856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.062400,-1.535000,9.234647>}
box{<0,0,-0.203200><0.048327,0.035000,0.203200> rotate<0,-75.506785,0> translate<4.050309,-1.535000,9.187856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.050309,-1.535000,9.187856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064884,-1.535000,9.084344>}
box{<0,0,-0.203200><0.104534,0.035000,0.203200> rotate<0,81.979790,0> translate<4.050309,-1.535000,9.187856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.061600,-1.535000,9.282956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.062400,-1.535000,9.234647>}
box{<0,0,-0.203200><0.048316,0.035000,0.203200> rotate<0,89.045395,0> translate<4.061600,-1.535000,9.282956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.061600,-1.535000,9.282956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.099991,-1.535000,9.380147>}
box{<0,0,-0.203200><0.104498,0.035000,0.203200> rotate<0,-68.441296,0> translate<4.061600,-1.535000,9.282956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064884,-1.535000,9.084344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.089709,-1.535000,7.582450>}
box{<0,0,-0.203200><1.502099,0.035000,0.203200> rotate<0,89.047160,0> translate<4.064884,-1.535000,9.084344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.074831,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.438256,-1.535000,54.051200>}
box{<0,0,-0.203200><1.363425,0.035000,0.203200> rotate<0,0.000000,0> translate<4.074831,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.099991,-1.535000,9.380147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.126138,-1.535000,9.481359>}
box{<0,0,-0.203200><0.104535,0.035000,0.203200> rotate<0,-75.510117,0> translate<4.099991,-1.535000,9.380147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.110806,-1.535000,43.144288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.282287,-1.535000,42.972806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<4.110806,-1.535000,43.144288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.110806,-1.535000,44.739709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.282287,-1.535000,44.911191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.110806,-1.535000,44.739709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.126138,-1.535000,9.481359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.155216,-1.535000,9.519963>}
box{<0,0,-0.203200><0.048329,0.035000,0.203200> rotate<0,-53.007310,0> translate<4.126138,-1.535000,9.481359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.155216,-1.535000,9.519963>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.172963,-1.535000,9.564900>}
box{<0,0,-0.203200><0.048315,0.035000,0.203200> rotate<0,-68.445254,0> translate<4.155216,-1.535000,9.519963> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.166425,-1.535000,56.133997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.759572,-1.535000,56.133997>}
box{<0,0,-0.203200><34.593147,0.035000,0.203200> rotate<0,0.000000,0> translate<4.166425,-1.535000,56.133997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.172963,-1.535000,9.564900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.245625,-1.535000,9.640003>}
box{<0,0,-0.203200><0.104500,0.035000,0.203200> rotate<0,-45.943228,0> translate<4.172963,-1.535000,9.564900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.203453,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.550144,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<4.203453,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.245625,-1.535000,9.640003>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.475809,-1.535000,13.928800>}
box{<0,0,-0.203200><5.369159,0.035000,0.203200> rotate<0,-53.010613,0> translate<4.245625,-1.535000,9.640003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.282287,-1.535000,42.972806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.395300,-1.535000,42.925997>}
box{<0,0,-0.203200><0.122323,0.035000,0.203200> rotate<0,22.497678,0> translate<4.282287,-1.535000,42.972806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.282287,-1.535000,44.911191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506341,-1.535000,45.003997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<4.282287,-1.535000,44.911191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.481231,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,54.457600>}
box{<0,0,-0.203200><15.838769,0.035000,0.203200> rotate<0,0.000000,0> translate<4.481231,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.506341,-1.535000,45.003997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.653656,-1.535000,45.003997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<4.506341,-1.535000,45.003997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.633631,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,54.610000>}
box{<0,0,-0.203200><15.686369,0.035000,0.203200> rotate<0,0.000000,0> translate<4.633631,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.695631,-1.535000,12.915900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.458613,-1.535000,13.678884>}
box{<0,0,-0.203200><1.079021,0.035000,0.203200> rotate<0,-44.997148,0> translate<4.695631,-1.535000,12.915900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.695631,-1.535000,15.659097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.923000,-1.535000,15.431725>}
box{<0,0,-0.203200><0.321550,0.035000,0.203200> rotate<0,44.997424,0> translate<4.695631,-1.535000,15.659097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.695631,-1.535000,17.995900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.241731,-1.535000,18.542000>}
box{<0,0,-0.203200><0.772302,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.695631,-1.535000,17.995900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765400,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689600,-1.535000,51.107453>}
box{<0,0,-0.203200><1.307016,0.035000,0.203200> rotate<0,44.997030,0> translate<4.765400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765400,-1.535000,52.031653>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.765400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.717653,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.765400,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.784528,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.779884,-1.535000,13.004800>}
box{<0,0,-0.203200><1.995356,0.035000,0.203200> rotate<0,0.000000,0> translate<4.784528,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.911528,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.923000,-1.535000,15.443200>}
box{<0,0,-0.203200><0.011472,0.035000,0.203200> rotate<0,0.000000,0> translate<4.911528,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.923000,-1.535000,15.859656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.923000,-1.535000,15.431725>}
box{<0,0,-0.203200><0.427931,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.923000,-1.535000,15.431725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.923000,-1.535000,15.859656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.015806,-1.535000,16.083709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.923000,-1.535000,15.859656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.987731,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.294969,-1.535000,18.288000>}
box{<0,0,-0.203200><3.307238,0.035000,0.203200> rotate<0,0.000000,0> translate<4.987731,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.015806,-1.535000,16.083709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.187288,-1.535000,16.255191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.015806,-1.535000,16.083709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026200,-1.535000,33.922741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119006,-1.535000,33.698687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<5.026200,-1.535000,33.922741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026200,-1.535000,35.165256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026200,-1.535000,33.922741>}
box{<0,0,-0.203200><1.242516,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.026200,-1.535000,33.922741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.026200,-1.535000,35.165256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119006,-1.535000,35.389309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<5.026200,-1.535000,35.165256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.084497,-1.535000,32.511997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119006,-1.535000,32.595309>}
box{<0,0,-0.203200><0.090177,0.035000,0.203200> rotate<0,-67.495423,0> translate<5.084497,-1.535000,32.511997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119006,-1.535000,32.595309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.290488,-1.535000,32.766791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.119006,-1.535000,32.595309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119006,-1.535000,33.698687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.290488,-1.535000,33.527206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<5.119006,-1.535000,33.698687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.119006,-1.535000,35.389309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.290488,-1.535000,35.560791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.119006,-1.535000,35.389309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.187288,-1.535000,16.255191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.411341,-1.535000,16.347997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.187288,-1.535000,16.255191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.190928,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.085972,-1.535000,13.411200>}
box{<0,0,-0.203200><1.895044,0.035000,0.203200> rotate<0,0.000000,0> translate<5.190928,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.241731,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.771572,-1.535000,18.542000>}
box{<0,0,-0.203200><2.529841,0.035000,0.203200> rotate<0,0.000000,0> translate<5.241731,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.290488,-1.535000,32.766791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.514541,-1.535000,32.859597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.290488,-1.535000,32.766791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.290488,-1.535000,33.527206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.514541,-1.535000,33.434400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<5.290488,-1.535000,33.527206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.290488,-1.535000,35.560791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.423800,-1.535000,35.616009>}
box{<0,0,-0.203200><0.144296,0.035000,0.203200> rotate<0,-22.498113,0> translate<5.290488,-1.535000,35.560791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,36.553241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.422206,-1.535000,36.329188>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<5.329400,-1.535000,36.553241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,37.995756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,36.553241>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.329400,-1.535000,36.553241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329400,-1.535000,37.995756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.422206,-1.535000,38.219809>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<5.329400,-1.535000,37.995756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.411341,-1.535000,16.347997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.453856,-1.535000,16.347997>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<5.411341,-1.535000,16.347997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.422206,-1.535000,36.329188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.423800,-1.535000,36.327594>}
box{<0,0,-0.203200><0.002254,0.035000,0.203200> rotate<0,44.997030,0> translate<5.422206,-1.535000,36.329188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.422206,-1.535000,38.219809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.593688,-1.535000,38.391291>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.422206,-1.535000,38.219809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.423800,-1.535000,36.327594>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.423800,-1.535000,35.616009>}
box{<0,0,-0.203200><0.711584,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.423800,-1.535000,35.616009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.458613,-1.535000,13.678884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.615838,-1.535000,13.744006>}
box{<0,0,-0.203200><0.170178,0.035000,0.203200> rotate<0,-22.497628,0> translate<5.458613,-1.535000,13.678884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.514541,-1.535000,32.859597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.857056,-1.535000,32.859597>}
box{<0,0,-0.203200><1.342516,0.035000,0.203200> rotate<0,0.000000,0> translate<5.514541,-1.535000,32.859597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.514541,-1.535000,33.434400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.857056,-1.535000,33.434400>}
box{<0,0,-0.203200><1.342516,0.035000,0.203200> rotate<0,0.000000,0> translate<5.514541,-1.535000,33.434400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.550144,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502397,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.550144,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.575544,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.678053,-1.535000,4.470400>}
box{<0,0,-0.203200><2.102509,0.035000,0.203200> rotate<0,0.000000,0> translate<5.575544,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.592219,-1.535000,8.894747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.613069,-1.535000,7.633269>}
box{<0,0,-0.203200><1.261650,0.035000,0.203200> rotate<0,89.047211,0> translate<5.592219,-1.535000,8.894747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.592219,-1.535000,8.894747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.299384,-1.535000,16.472294>}
box{<0,0,-0.203200><9.486356,0.035000,0.203200> rotate<0,-53.010613,0> translate<5.592219,-1.535000,8.894747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.593688,-1.535000,38.391291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.817741,-1.535000,38.484097>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.593688,-1.535000,38.391291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.598175,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.618144,-1.535000,8.534400>}
box{<0,0,-0.203200><2.019969,0.035000,0.203200> rotate<0,0.000000,0> translate<5.598175,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.604894,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.617591,-1.535000,8.128000>}
box{<0,0,-0.203200><2.012697,0.035000,0.203200> rotate<0,0.000000,0> translate<5.604894,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.611609,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.617041,-1.535000,7.721600>}
box{<0,0,-0.203200><2.005431,0.035000,0.203200> rotate<0,0.000000,0> translate<5.611609,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.613069,-1.535000,7.633269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502397,-1.535000,6.743944>}
box{<0,0,-0.203200><1.257698,0.035000,0.203200> rotate<0,44.996930,0> translate<5.613069,-1.535000,7.633269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.615838,-1.535000,13.744006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.800631,-1.535000,13.928800>}
box{<0,0,-0.203200><0.261338,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.615838,-1.535000,13.744006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.626903,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.618694,-1.535000,8.940800>}
box{<0,0,-0.203200><1.991791,0.035000,0.203200> rotate<0,0.000000,0> translate<5.626903,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.653656,-1.535000,45.003997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.877709,-1.535000,44.911191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<5.653656,-1.535000,45.003997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689431,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.392059,-1.535000,13.817600>}
box{<0,0,-0.203200><1.702628,0.035000,0.203200> rotate<0,0.000000,0> translate<5.689431,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689600,-1.535000,49.861025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.805606,-1.535000,49.580959>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,67.495673,0> translate<5.689600,-1.535000,49.861025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689600,-1.535000,51.107453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.689600,-1.535000,49.861025>}
box{<0,0,-0.203200><1.246428,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.689600,-1.535000,49.861025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.717653,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.064344,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<5.717653,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.800631,-1.535000,13.928800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.453856,-1.535000,13.928800>}
box{<0,0,-0.203200><0.653225,0.035000,0.203200> rotate<0,0.000000,0> translate<5.800631,-1.535000,13.928800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.805606,-1.535000,49.580959>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.019959,-1.535000,49.366606>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,44.997030,0> translate<5.805606,-1.535000,49.580959> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.817741,-1.535000,38.484097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.860256,-1.535000,38.484097>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<5.817741,-1.535000,38.484097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.877709,-1.535000,44.911191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.049191,-1.535000,44.739709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<5.877709,-1.535000,44.911191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.931141,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.322459,-1.535000,7.315200>}
box{<0,0,-0.203200><1.391319,0.035000,0.203200> rotate<0,0.000000,0> translate<5.931141,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.932991,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619244,-1.535000,9.347200>}
box{<0,0,-0.203200><1.686253,0.035000,0.203200> rotate<0,0.000000,0> translate<5.932991,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.981944,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.271653,-1.535000,4.876800>}
box{<0,0,-0.203200><1.289709,0.035000,0.203200> rotate<0,0.000000,0> translate<5.981944,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.019959,-1.535000,49.366606>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.682572,-1.535000,44.703997>}
box{<0,0,-0.203200><6.593928,0.035000,0.203200> rotate<0,44.997011,0> translate<6.019959,-1.535000,49.366606> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.049191,-1.535000,44.739709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.063981,-1.535000,44.703997>}
box{<0,0,-0.203200><0.038654,0.035000,0.203200> rotate<0,67.498252,0> translate<6.049191,-1.535000,44.739709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.063981,-1.535000,44.703997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.682572,-1.535000,44.703997>}
box{<0,0,-0.203200><4.618591,0.035000,0.203200> rotate<0,0.000000,0> translate<6.063981,-1.535000,44.703997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.063981,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.682566,-1.535000,44.704000>}
box{<0,0,-0.203200><4.618584,0.035000,0.203200> rotate<0,0.000000,0> translate<6.063981,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.239078,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619797,-1.535000,9.753600>}
box{<0,0,-0.203200><1.380719,0.035000,0.203200> rotate<0,0.000000,0> translate<6.239078,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.337541,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.916059,-1.535000,6.908800>}
box{<0,0,-0.203200><0.578519,0.035000,0.203200> rotate<0,0.000000,0> translate<6.337541,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.388344,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.865253,-1.535000,5.283200>}
box{<0,0,-0.203200><0.476909,0.035000,0.203200> rotate<0,0.000000,0> translate<6.388344,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.453856,-1.535000,13.928800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.677909,-1.535000,14.021606>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<6.453856,-1.535000,13.928800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.453856,-1.535000,16.347997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.677909,-1.535000,16.255191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<6.453856,-1.535000,16.347997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502397,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502397,-1.535000,6.743944>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<6.502397,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502397,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.751200,-1.535000,5.689600>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<6.502397,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502397,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.751200,-1.535000,6.096000>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<6.502397,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.502397,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.751200,-1.535000,6.502400>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<6.502397,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.545166,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.648641,-1.535000,10.160000>}
box{<0,0,-0.203200><1.103475,0.035000,0.203200> rotate<0,0.000000,0> translate<6.545166,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.675956,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.908800,-1.535000,16.256000>}
box{<0,0,-0.203200><0.232844,0.035000,0.203200> rotate<0,0.000000,0> translate<6.675956,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.677909,-1.535000,14.021606>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.832600,-1.535000,14.176297>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.677909,-1.535000,14.021606> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.677909,-1.535000,16.255191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.832600,-1.535000,16.100500>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,44.997030,0> translate<6.677909,-1.535000,16.255191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.751200,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.703453,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<6.751200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.751200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.751200,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.751200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.751200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.616888,-1.535000,7.609628>}
box{<0,0,-0.203200><1.224265,0.035000,0.203200> rotate<0,-44.996927,0> translate<6.751200,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.832600,-1.535000,14.176297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.987288,-1.535000,14.021606>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<6.832600,-1.535000,14.176297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.832600,-1.535000,16.100500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.908800,-1.535000,16.176700>}
box{<0,0,-0.203200><0.107763,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.832600,-1.535000,16.100500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.851253,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.883684,-1.535000,10.566400>}
box{<0,0,-0.203200><1.032431,0.035000,0.203200> rotate<0,0.000000,0> translate<6.851253,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.857056,-1.535000,32.859597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.035800,-1.535000,32.785559>}
box{<0,0,-0.203200><0.193471,0.035000,0.203200> rotate<0,22.498355,0> translate<6.857056,-1.535000,32.859597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.857056,-1.535000,33.434400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.035800,-1.535000,33.508437>}
box{<0,0,-0.203200><0.193471,0.035000,0.203200> rotate<0,-22.498355,0> translate<6.857056,-1.535000,33.434400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.860256,-1.535000,38.484097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.084309,-1.535000,38.391291>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<6.860256,-1.535000,38.484097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.908800,-1.535000,16.737772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.908800,-1.535000,16.176700>}
box{<0,0,-0.203200><0.561072,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.908800,-1.535000,16.176700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.908800,-1.535000,16.737772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.024806,-1.535000,17.017838>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<6.908800,-1.535000,16.737772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.947797,-1.535000,35.616009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.947797,-1.535000,36.101163>}
box{<0,0,-0.203200><0.485153,0.035000,0.203200> rotate<0,90.000000,0> translate<6.947797,-1.535000,36.101163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.947797,-1.535000,35.616009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.035800,-1.535000,35.579559>}
box{<0,0,-0.203200><0.095253,0.035000,0.203200> rotate<0,22.497355,0> translate<6.947797,-1.535000,35.616009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.947797,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,35.763200>}
box{<0,0,-0.203200><2.175603,0.035000,0.203200> rotate<0,0.000000,0> translate<6.947797,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.947797,-1.535000,36.101163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.084309,-1.535000,36.157706>}
box{<0,0,-0.203200><0.147759,0.035000,0.203200> rotate<0,-22.497949,0> translate<6.947797,-1.535000,36.101163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.987288,-1.535000,14.021606>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.211341,-1.535000,13.928800>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<6.987288,-1.535000,14.021606> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.024806,-1.535000,17.017838>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.239159,-1.535000,17.232191>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.024806,-1.535000,17.017838> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.035800,-1.535000,32.785559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.123800,-1.535000,32.822009>}
box{<0,0,-0.203200><0.095250,0.035000,0.203200> rotate<0,-22.498074,0> translate<7.035800,-1.535000,32.785559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.035800,-1.535000,33.508437>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.123800,-1.535000,33.471988>}
box{<0,0,-0.203200><0.095250,0.035000,0.203200> rotate<0,22.498074,0> translate<7.035800,-1.535000,33.508437> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.035800,-1.535000,35.579559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.214541,-1.535000,35.653597>}
box{<0,0,-0.203200><0.193468,0.035000,0.203200> rotate<0,-22.498709,0> translate<7.035800,-1.535000,35.579559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.064344,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.016597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<7.064344,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.084309,-1.535000,36.157706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.255791,-1.535000,36.329188>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.084309,-1.535000,36.157706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.084309,-1.535000,38.391291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.255791,-1.535000,38.219809>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<7.084309,-1.535000,38.391291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.096203,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.183191,-1.535000,36.169600>}
box{<0,0,-0.203200><2.086987,0.035000,0.203200> rotate<0,0.000000,0> translate<7.096203,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.123800,-1.535000,33.471988>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.123800,-1.535000,32.822009>}
box{<0,0,-0.203200><0.649978,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.123800,-1.535000,32.822009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.157341,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.118728,-1.535000,10.972800>}
box{<0,0,-0.203200><0.961387,0.035000,0.203200> rotate<0,0.000000,0> translate<7.157341,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.211341,-1.535000,13.928800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.475809,-1.535000,13.928800>}
box{<0,0,-0.203200><0.264469,0.035000,0.203200> rotate<0,0.000000,0> translate<7.211341,-1.535000,13.928800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.213597,-1.535000,50.328231>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.213597,-1.535000,51.228653>}
box{<0,0,-0.203200><0.900422,0.035000,0.203200> rotate<0,90.000000,0> translate<7.213597,-1.535000,51.228653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.213597,-1.535000,50.328231>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,48.412825>}
box{<0,0,-0.203200><2.708791,0.035000,0.203200> rotate<0,44.997077,0> translate<7.213597,-1.535000,50.328231> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.213597,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,50.393600>}
box{<0,0,-0.203200><1.915403,0.035000,0.203200> rotate<0,0.000000,0> translate<7.213597,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.213597,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,50.800000>}
box{<0,0,-0.203200><1.915403,0.035000,0.203200> rotate<0,0.000000,0> translate<7.213597,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.213597,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.090653,-1.535000,51.206400>}
box{<0,0,-0.203200><1.877056,0.035000,0.203200> rotate<0,0.000000,0> translate<7.213597,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.213597,-1.535000,51.228653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.016597,-1.535000,52.031653>}
box{<0,0,-0.203200><1.135613,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.213597,-1.535000,51.228653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.214541,-1.535000,35.653597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.557056,-1.535000,35.653597>}
box{<0,0,-0.203200><1.342516,0.035000,0.203200> rotate<0,0.000000,0> translate<7.214541,-1.535000,35.653597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.239159,-1.535000,17.232191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.252000,-1.535000,23.245031>}
box{<0,0,-0.203200><8.503441,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.239159,-1.535000,17.232191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.255791,-1.535000,36.329188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,36.553241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<7.255791,-1.535000,36.329188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.255791,-1.535000,38.219809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,37.995756>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<7.255791,-1.535000,38.219809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.263334,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,38.201600>}
box{<0,0,-0.203200><2.688666,0.035000,0.203200> rotate<0,0.000000,0> translate<7.263334,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.343741,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.938256,-1.535000,54.051200>}
box{<0,0,-0.203200><1.594516,0.035000,0.203200> rotate<0,0.000000,0> translate<7.343741,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,36.553241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,37.995756>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<7.348597,-1.535000,37.995756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,36.576000>}
box{<0,0,-0.203200><2.603403,0.035000,0.203200> rotate<0,0.000000,0> translate<7.348597,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,36.982400>}
box{<0,0,-0.203200><2.603403,0.035000,0.203200> rotate<0,0.000000,0> translate<7.348597,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,37.388800>}
box{<0,0,-0.203200><2.603403,0.035000,0.203200> rotate<0,0.000000,0> translate<7.348597,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.348597,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,37.795200>}
box{<0,0,-0.203200><2.603403,0.035000,0.203200> rotate<0,0.000000,0> translate<7.348597,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.463428,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.353772,-1.535000,11.379200>}
box{<0,0,-0.203200><0.890344,0.035000,0.203200> rotate<0,0.000000,0> translate<7.463428,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.554628,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,49.987200>}
box{<0,0,-0.203200><1.574372,0.035000,0.203200> rotate<0,0.000000,0> translate<7.554628,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.597744,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.684253,-1.535000,51.612800>}
box{<0,0,-0.203200><1.086509,0.035000,0.203200> rotate<0,0.000000,0> translate<7.597744,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.606697,-1.535000,9.855769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619866,-1.535000,9.806481>}
box{<0,0,-0.203200><0.051016,0.035000,0.203200> rotate<0,75.036049,0> translate<7.606697,-1.535000,9.855769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.606697,-1.535000,9.855769>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620069,-1.535000,9.956747>}
box{<0,0,-0.203200><0.101860,0.035000,0.203200> rotate<0,-82.451141,0> translate<7.606697,-1.535000,9.855769> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.616888,-1.535000,7.609628>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.619866,-1.535000,9.806481>}
box{<0,0,-0.203200><2.196855,0.035000,0.203200> rotate<0,-89.916394,0> translate<7.616888,-1.535000,7.609628> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620069,-1.535000,9.956747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620206,-1.535000,10.058603>}
box{<0,0,-0.203200><0.101856,0.035000,0.203200> rotate<0,-89.916720,0> translate<7.620069,-1.535000,9.956747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620206,-1.535000,10.058603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.639794,-1.535000,10.105709>}
box{<0,0,-0.203200><0.051016,0.035000,0.203200> rotate<0,-67.417261,0> translate<7.620206,-1.535000,10.058603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.639794,-1.535000,10.105709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.646491,-1.535000,10.156288>}
box{<0,0,-0.203200><0.051020,0.035000,0.203200> rotate<0,-82.452094,0> translate<7.639794,-1.535000,10.105709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.646491,-1.535000,10.156288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.697491,-1.535000,10.244463>}
box{<0,0,-0.203200><0.101862,0.035000,0.203200> rotate<0,-59.951159,0> translate<7.646491,-1.535000,10.156288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.697491,-1.535000,10.244463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.736594,-1.535000,10.338513>}
box{<0,0,-0.203200><0.101855,0.035000,0.203200> rotate<0,-67.419497,0> translate<7.697491,-1.535000,10.244463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.703453,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050144,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<7.703453,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.736594,-1.535000,10.338513>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772719,-1.535000,10.374538>}
box{<0,0,-0.203200><0.051018,0.035000,0.203200> rotate<0,-44.917623,0> translate<7.736594,-1.535000,10.338513> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.750141,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.531856,-1.535000,53.644800>}
box{<0,0,-0.203200><0.781716,0.035000,0.203200> rotate<0,0.000000,0> translate<7.750141,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.769516,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.588816,-1.535000,11.785600>}
box{<0,0,-0.203200><0.819300,0.035000,0.203200> rotate<0,0.000000,0> translate<7.769516,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.771572,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.051638,-1.535000,18.658006>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<7.771572,-1.535000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.772719,-1.535000,10.374538>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.299384,-1.535000,16.472294>}
box{<0,0,-0.203200><7.044147,0.035000,0.203200> rotate<0,-59.952902,0> translate<7.772719,-1.535000,10.374538> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.961028,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,49.580800>}
box{<0,0,-0.203200><1.167972,0.035000,0.203200> rotate<0,0.000000,0> translate<7.961028,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.004144,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.277853,-1.535000,52.019200>}
box{<0,0,-0.203200><0.273709,0.035000,0.203200> rotate<0,0.000000,0> translate<8.004144,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.016597,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.016597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<8.016597,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.016597,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.265400,-1.535000,52.425600>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.016597,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.016597,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.265400,-1.535000,52.832000>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.016597,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.016597,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.265400,-1.535000,53.238400>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.016597,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.051638,-1.535000,18.658006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.059991,-1.535000,21.666359>}
box{<0,0,-0.203200><4.254454,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.051638,-1.535000,18.658006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.075603,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.823859,-1.535000,12.192000>}
box{<0,0,-0.203200><0.748256,0.035000,0.203200> rotate<0,0.000000,0> translate<8.075603,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.088031,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.701369,-1.535000,18.694400>}
box{<0,0,-0.203200><0.613338,0.035000,0.203200> rotate<0,0.000000,0> translate<8.088031,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.265400,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,51.168053>}
box{<0,0,-0.203200><1.221315,0.035000,0.203200> rotate<0,44.997030,0> translate<8.265400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.265400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.265400,-1.535000,52.031653>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.265400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.265400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.217653,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.265400,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.367428,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,49.174400>}
box{<0,0,-0.203200><0.761572,0.035000,0.203200> rotate<0,0.000000,0> translate<8.367428,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.381691,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.058900,-1.535000,12.598400>}
box{<0,0,-0.203200><0.677209,0.035000,0.203200> rotate<0,0.000000,0> translate<8.381691,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.494431,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.107769,-1.535000,19.100800>}
box{<0,0,-0.203200><0.613338,0.035000,0.203200> rotate<0,0.000000,0> translate<8.494431,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.557056,-1.535000,35.653597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.781109,-1.535000,35.560791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<8.557056,-1.535000,35.653597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.687778,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.293944,-1.535000,13.004800>}
box{<0,0,-0.203200><0.606166,0.035000,0.203200> rotate<0,0.000000,0> translate<8.687778,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.773828,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,48.768000>}
box{<0,0,-0.203200><0.355172,0.035000,0.203200> rotate<0,0.000000,0> translate<8.773828,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.781109,-1.535000,35.560791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.952591,-1.535000,35.389309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<8.781109,-1.535000,35.560791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.900831,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.514169,-1.535000,19.507200>}
box{<0,0,-0.203200><0.613337,0.035000,0.203200> rotate<0,0.000000,0> translate<8.900831,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.952591,-1.535000,35.389309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.045397,-1.535000,35.165256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<8.952591,-1.535000,35.389309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.966059,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.175566,-1.535000,35.356800>}
box{<0,0,-0.203200><0.209506,0.035000,0.203200> rotate<0,0.000000,0> translate<8.966059,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.993866,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.528988,-1.535000,13.411200>}
box{<0,0,-0.203200><0.535122,0.035000,0.203200> rotate<0,0.000000,0> translate<8.993866,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.045397,-1.535000,34.515997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.045397,-1.535000,35.165256>}
box{<0,0,-0.203200><0.649259,0.035000,0.203200> rotate<0,90.000000,0> translate<9.045397,-1.535000,35.165256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.045397,-1.535000,34.515997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,34.515997>}
box{<0,0,-0.203200><0.078003,0.035000,0.203200> rotate<0,0.000000,0> translate<9.045397,-1.535000,34.515997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.045397,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,34.544000>}
box{<0,0,-0.203200><0.078003,0.035000,0.203200> rotate<0,0.000000,0> translate<9.045397,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.045397,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,34.950400>}
box{<0,0,-0.203200><0.078003,0.035000,0.203200> rotate<0,0.000000,0> translate<9.045397,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.050144,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.002397,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.050144,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.075544,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.178053,-1.535000,4.470400>}
box{<0,0,-0.203200><2.102509,0.035000,0.203200> rotate<0,0.000000,0> translate<9.075544,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,35.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,34.515997>}
box{<0,0,-0.203200><0.509259,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.123400,-1.535000,34.515997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,35.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.216206,-1.535000,35.249309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<9.123400,-1.535000,35.025256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,35.482741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.216206,-1.535000,35.258688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<9.123400,-1.535000,35.482741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,36.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,35.482741>}
box{<0,0,-0.203200><0.542516,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.123400,-1.535000,35.482741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.123400,-1.535000,36.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.216206,-1.535000,36.249309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<9.123400,-1.535000,36.025256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,51.168053>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.129000,-1.535000,48.412825>}
box{<0,0,-0.203200><2.755228,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.129000,-1.535000,48.412825> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.140878,-1.535000,7.605459>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.143719,-1.535000,9.701037>}
box{<0,0,-0.203200><2.095580,0.035000,0.203200> rotate<0,-89.916399,0> translate<9.140878,-1.535000,7.605459> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.140878,-1.535000,7.605459>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.002397,-1.535000,6.743944>}
box{<0,0,-0.203200><1.218369,0.035000,0.203200> rotate<0,44.996926,0> translate<9.140878,-1.535000,7.605459> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.141034,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,7.721600>}
box{<0,0,-0.203200><1.933366,0.035000,0.203200> rotate<0,0.000000,0> translate<9.141034,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.141584,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,8.128000>}
box{<0,0,-0.203200><1.932816,0.035000,0.203200> rotate<0,0.000000,0> translate<9.141584,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.142134,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,8.534400>}
box{<0,0,-0.203200><1.932266,0.035000,0.203200> rotate<0,0.000000,0> translate<9.142134,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.142688,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,8.940800>}
box{<0,0,-0.203200><1.931712,0.035000,0.203200> rotate<0,0.000000,0> translate<9.142688,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.143237,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,9.347200>}
box{<0,0,-0.203200><1.931163,0.035000,0.203200> rotate<0,0.000000,0> translate<9.143237,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.143719,-1.535000,9.701037>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.903097,-1.535000,16.201159>}
box{<0,0,-0.203200><7.508962,0.035000,0.203200> rotate<0,-59.952886,0> translate<9.143719,-1.535000,9.701037> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.174116,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,9.753600>}
box{<0,0,-0.203200><1.900284,0.035000,0.203200> rotate<0,0.000000,0> translate<9.174116,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.216206,-1.535000,35.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.220897,-1.535000,35.253997>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-44.977939,0> translate<9.216206,-1.535000,35.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.216206,-1.535000,35.258688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.220897,-1.535000,35.253997>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<9.216206,-1.535000,35.258688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.216206,-1.535000,36.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.387688,-1.535000,36.420791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.216206,-1.535000,36.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.217653,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.564344,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<9.217653,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.299953,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.764031,-1.535000,13.817600>}
box{<0,0,-0.203200><0.464078,0.035000,0.203200> rotate<0,0.000000,0> translate<9.299953,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.307231,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.920569,-1.535000,19.913600>}
box{<0,0,-0.203200><0.613338,0.035000,0.203200> rotate<0,0.000000,0> translate<9.307231,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.387688,-1.535000,36.420791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.611741,-1.535000,36.513597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<9.387688,-1.535000,36.420791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.409159,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,10.160000>}
box{<0,0,-0.203200><1.665241,0.035000,0.203200> rotate<0,0.000000,0> translate<9.409159,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.431141,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.822456,-1.535000,7.315200>}
box{<0,0,-0.203200><1.391316,0.035000,0.203200> rotate<0,0.000000,0> translate<9.431141,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.481944,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.771653,-1.535000,4.876800>}
box{<0,0,-0.203200><1.289709,0.035000,0.203200> rotate<0,0.000000,0> translate<9.481944,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.606041,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.999075,-1.535000,14.224000>}
box{<0,0,-0.203200><0.393034,0.035000,0.203200> rotate<0,0.000000,0> translate<9.606041,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.611741,-1.535000,36.513597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,36.513597>}
box{<0,0,-0.203200><0.340259,0.035000,0.203200> rotate<0,0.000000,0> translate<9.611741,-1.535000,36.513597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.644203,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,10.566400>}
box{<0,0,-0.203200><1.430197,0.035000,0.203200> rotate<0,0.000000,0> translate<9.644203,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.713631,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.326969,-1.535000,20.320000>}
box{<0,0,-0.203200><0.613338,0.035000,0.203200> rotate<0,0.000000,0> translate<9.713631,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.837541,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.416056,-1.535000,6.908800>}
box{<0,0,-0.203200><0.578516,0.035000,0.203200> rotate<0,0.000000,0> translate<9.837541,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.879247,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,10.972800>}
box{<0,0,-0.203200><1.195153,0.035000,0.203200> rotate<0,0.000000,0> translate<9.879247,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.888344,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.365253,-1.535000,5.283200>}
box{<0,0,-0.203200><0.476909,0.035000,0.203200> rotate<0,0.000000,0> translate<9.888344,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.912128,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.234119,-1.535000,14.630400>}
box{<0,0,-0.203200><0.321991,0.035000,0.203200> rotate<0,0.000000,0> translate<9.912128,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,38.350072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,36.513597>}
box{<0,0,-0.203200><1.836475,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.952000,-1.535000,36.513597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.952000,-1.535000,38.350072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.068006,-1.535000,38.630138>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<9.952000,-1.535000,38.350072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.002397,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.002397,-1.535000,6.743944>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<10.002397,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.002397,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.251200,-1.535000,5.689600>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.002397,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.002397,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.251200,-1.535000,6.096000>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.002397,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.002397,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.251200,-1.535000,6.502400>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.002397,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.068006,-1.535000,38.630138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.494900,-1.535000,39.057031>}
box{<0,0,-0.203200><0.603719,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.068006,-1.535000,38.630138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.114291,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,11.379200>}
box{<0,0,-0.203200><0.960109,0.035000,0.203200> rotate<0,0.000000,0> translate<10.114291,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.120031,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.733369,-1.535000,20.726400>}
box{<0,0,-0.203200><0.613338,0.035000,0.203200> rotate<0,0.000000,0> translate<10.120031,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.218216,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.469163,-1.535000,15.036800>}
box{<0,0,-0.203200><0.250947,0.035000,0.203200> rotate<0,0.000000,0> translate<10.218216,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.251200,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.203453,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<10.251200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.251200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.251200,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.251200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.251200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,7.567144>}
box{<0,0,-0.203200><1.164181,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.251200,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.349334,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.127350,-1.535000,11.785600>}
box{<0,0,-0.203200><0.778016,0.035000,0.203200> rotate<0,0.000000,0> translate<10.349334,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,24.191625>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,27.492000>}
box{<0,0,-0.203200><3.300375,0.035000,0.203200> rotate<0,90.000000,0> translate<10.413997,-1.535000,27.492000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,24.191625>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.474400,-1.535000,24.252031>}
box{<0,0,-0.203200><0.085425,0.035000,0.203200> rotate<0,-44.998512,0> translate<10.413997,-1.535000,24.191625> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.474400,-1.535000,24.384000>}
box{<0,0,-0.203200><0.060403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.501178,-1.535000,24.790400>}
box{<0,0,-0.203200><0.087181,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.920984,-1.535000,25.196800>}
box{<0,0,-0.203200><0.506987,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.088969,-1.535000,25.603200>}
box{<0,0,-0.203200><0.674972,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.495369,-1.535000,26.009600>}
box{<0,0,-0.203200><1.081372,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.901769,-1.535000,26.416000>}
box{<0,0,-0.203200><1.487772,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,26.822400>}
box{<0,0,-0.203200><1.840403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.325872,-1.535000,27.228800>}
box{<0,0,-0.203200><1.911875,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.413997,-1.535000,27.492000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.865572,-1.535000,27.492000>}
box{<0,0,-0.203200><0.451575,0.035000,0.203200> rotate<0,0.000000,0> translate<10.413997,-1.535000,27.492000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.474400,-1.535000,24.725756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.474400,-1.535000,24.252031>}
box{<0,0,-0.203200><0.473725,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.474400,-1.535000,24.252031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.474400,-1.535000,24.725756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.567206,-1.535000,24.949809>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<10.474400,-1.535000,24.725756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.494900,-1.535000,39.710256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.494900,-1.535000,39.057031>}
box{<0,0,-0.203200><0.653225,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.494900,-1.535000,39.057031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.494900,-1.535000,39.710256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.587706,-1.535000,39.934309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<10.494900,-1.535000,39.710256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.524303,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.704206,-1.535000,15.443200>}
box{<0,0,-0.203200><0.179903,0.035000,0.203200> rotate<0,0.000000,0> translate<10.524303,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.526431,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.139769,-1.535000,21.132800>}
box{<0,0,-0.203200><0.613338,0.035000,0.203200> rotate<0,0.000000,0> translate<10.526431,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.564344,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.516597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<10.564344,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.567206,-1.535000,24.949809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.738688,-1.535000,25.121291>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.567206,-1.535000,24.949809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.584378,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.290884,-1.535000,12.192000>}
box{<0,0,-0.203200><0.706506,0.035000,0.203200> rotate<0,0.000000,0> translate<10.584378,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.587706,-1.535000,39.934309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.693400,-1.535000,40.040003>}
box{<0,0,-0.203200><0.149474,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.587706,-1.535000,39.934309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,48.031831>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,51.168053>}
box{<0,0,-0.203200><3.136222,0.035000,0.203200> rotate<0,90.000000,0> translate<10.652997,-1.535000,51.168053> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,48.031831>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,45.984825>}
box{<0,0,-0.203200><2.894902,0.035000,0.203200> rotate<0,44.997074,0> translate<10.652997,-1.535000,48.031831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,48.361600>}
box{<0,0,-0.203200><2.047003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.652997,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,48.768000>}
box{<0,0,-0.203200><2.047003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.652997,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,49.174400>}
box{<0,0,-0.203200><2.047003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.652997,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,49.580800>}
box{<0,0,-0.203200><2.047003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.652997,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,49.987200>}
box{<0,0,-0.203200><2.047003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.652997,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,50.393600>}
box{<0,0,-0.203200><2.047003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.652997,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,50.800000>}
box{<0,0,-0.203200><2.047003,0.035000,0.203200> rotate<0,0.000000,0> translate<10.652997,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.652997,-1.535000,51.168053>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.516597,-1.535000,52.031653>}
box{<0,0,-0.203200><1.221315,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.652997,-1.535000,51.168053> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.691344,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.590653,-1.535000,51.206400>}
box{<0,0,-0.203200><1.899309,0.035000,0.203200> rotate<0,0.000000,0> translate<10.691344,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.693400,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.693400,-1.535000,40.040003>}
box{<0,0,-0.203200><1.361997,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.693400,-1.535000,40.040003> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.729628,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,47.955200>}
box{<0,0,-0.203200><1.970372,0.035000,0.203200> rotate<0,0.000000,0> translate<10.729628,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.738688,-1.535000,25.121291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,-1.535000,25.197222>}
box{<0,0,-0.203200><0.198416,0.035000,0.203200> rotate<0,-22.498709,0> translate<10.738688,-1.535000,25.121291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.819422,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.454309,-1.535000,12.598400>}
box{<0,0,-0.203200><0.634888,0.035000,0.203200> rotate<0,0.000000,0> translate<10.819422,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.830391,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.939247,-1.535000,15.849600>}
box{<0,0,-0.203200><0.108856,0.035000,0.203200> rotate<0,0.000000,0> translate<10.830391,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.843741,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.438256,-1.535000,54.051200>}
box{<0,0,-0.203200><1.594516,0.035000,0.203200> rotate<0,0.000000,0> translate<10.843741,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.865572,-1.535000,27.492000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.871366,-1.535000,27.494400>}
box{<0,0,-0.203200><0.006271,0.035000,0.203200> rotate<0,-22.499783,0> translate<10.865572,-1.535000,27.492000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.871366,-1.535000,27.494400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.816256,-1.535000,27.494400>}
box{<0,0,-0.203200><0.944891,0.035000,0.203200> rotate<0,0.000000,0> translate<10.871366,-1.535000,27.494400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,-1.535000,25.272172>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,-1.535000,25.197222>}
box{<0,0,-0.203200><0.074950,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.922000,-1.535000,25.197222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.922000,-1.535000,25.272172>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.038006,-1.535000,25.552238>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<10.922000,-1.535000,25.272172> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.932831,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546169,-1.535000,21.539200>}
box{<0,0,-0.203200><0.613338,0.035000,0.203200> rotate<0,0.000000,0> translate<10.932831,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.038006,-1.535000,25.552238>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252359,-1.535000,25.766591>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.038006,-1.535000,25.552238> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.054466,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.617738,-1.535000,13.004800>}
box{<0,0,-0.203200><0.563272,0.035000,0.203200> rotate<0,0.000000,0> translate<11.054466,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.059991,-1.535000,21.666359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175997,-1.535000,21.946425>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<11.059991,-1.535000,21.666359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.072872,-1.535000,11.649872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,11.502222>}
box{<0,0,-0.203200><0.147658,0.035000,0.203200> rotate<0,89.401130,0> translate<11.072872,-1.535000,11.649872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.072872,-1.535000,11.649872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,11.653672>}
box{<0,0,-0.203200><0.004096,0.035000,0.203200> rotate<0,-68.088565,0> translate<11.072872,-1.535000,11.649872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,11.502222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,7.567144>}
box{<0,0,-0.203200><3.935078,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.074400,-1.535000,7.567144> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,11.657772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,11.653672>}
box{<0,0,-0.203200><0.004100,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.074400,-1.535000,11.653672> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074400,-1.535000,11.657772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130941,-1.535000,11.794269>}
box{<0,0,-0.203200><0.147744,0.035000,0.203200> rotate<0,-67.494912,0> translate<11.074400,-1.535000,11.657772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.097744,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.184253,-1.535000,51.612800>}
box{<0,0,-0.203200><1.086509,0.035000,0.203200> rotate<0,0.000000,0> translate<11.097744,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.130941,-1.535000,11.794269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.903097,-1.535000,16.201159>}
box{<0,0,-0.203200><4.749866,0.035000,0.203200> rotate<0,-68.088818,0> translate<11.130941,-1.535000,11.794269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.136028,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,47.548800>}
box{<0,0,-0.203200><1.563972,0.035000,0.203200> rotate<0,0.000000,0> translate<11.136028,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.136478,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.174291,-1.535000,16.256000>}
box{<0,0,-0.203200><0.037813,0.035000,0.203200> rotate<0,0.000000,0> translate<11.136478,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175653,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.952569,-1.535000,21.945600>}
box{<0,0,-0.203200><0.776916,0.035000,0.203200> rotate<0,0.000000,0> translate<11.175653,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175997,-1.535000,21.946425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175997,-1.535000,22.798366>}
box{<0,0,-0.203200><0.851941,0.035000,0.203200> rotate<0,90.000000,0> translate<11.175997,-1.535000,22.798366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175997,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.358969,-1.535000,22.352000>}
box{<0,0,-0.203200><1.182972,0.035000,0.203200> rotate<0,0.000000,0> translate<11.175997,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175997,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.765369,-1.535000,22.758400>}
box{<0,0,-0.203200><1.589372,0.035000,0.203200> rotate<0,0.000000,0> translate<11.175997,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175997,-1.535000,22.798366>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.572531,-1.535000,23.194900>}
box{<0,0,-0.203200><0.560784,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.175997,-1.535000,22.798366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.203453,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550144,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<11.203453,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.250141,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.031856,-1.535000,53.644800>}
box{<0,0,-0.203200><0.781716,0.035000,0.203200> rotate<0,0.000000,0> translate<11.250141,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252359,-1.535000,25.766591>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.085759,-1.535000,26.599991>}
box{<0,0,-0.203200><1.178606,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.252359,-1.535000,25.766591> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.289509,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.781163,-1.535000,13.411200>}
box{<0,0,-0.203200><0.491653,0.035000,0.203200> rotate<0,0.000000,0> translate<11.289509,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.475997,-1.535000,36.513597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.475997,-1.535000,37.779400>}
box{<0,0,-0.203200><1.265803,0.035000,0.203200> rotate<0,90.000000,0> translate<11.475997,-1.535000,37.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.475997,-1.535000,36.513597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.816256,-1.535000,36.513597>}
box{<0,0,-0.203200><0.340259,0.035000,0.203200> rotate<0,0.000000,0> translate<11.475997,-1.535000,36.513597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.475997,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.498894,-1.535000,36.576000>}
box{<0,0,-0.203200><1.022897,0.035000,0.203200> rotate<0,0.000000,0> translate<11.475997,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.475997,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,36.982400>}
box{<0,0,-0.203200><0.778403,0.035000,0.203200> rotate<0,0.000000,0> translate<11.475997,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.475997,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,37.388800>}
box{<0,0,-0.203200><0.778403,0.035000,0.203200> rotate<0,0.000000,0> translate<11.475997,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.475997,-1.535000,37.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025756,-1.535000,37.779400>}
box{<0,0,-0.203200><0.549759,0.035000,0.203200> rotate<0,0.000000,0> translate<11.475997,-1.535000,37.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.504144,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.777853,-1.535000,52.019200>}
box{<0,0,-0.203200><0.273709,0.035000,0.203200> rotate<0,0.000000,0> translate<11.504144,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.516597,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.516597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<11.516597,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.516597,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.765400,-1.535000,52.425600>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.516597,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.516597,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.765400,-1.535000,52.832000>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.516597,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.516597,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.765400,-1.535000,53.238400>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.516597,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.524553,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.944591,-1.535000,13.817600>}
box{<0,0,-0.203200><0.420037,0.035000,0.203200> rotate<0,0.000000,0> translate<11.524553,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.542428,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,47.142400>}
box{<0,0,-0.203200><1.157572,0.035000,0.203200> rotate<0,0.000000,0> translate<11.542428,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.542431,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.171769,-1.535000,23.164800>}
box{<0,0,-0.203200><1.629338,0.035000,0.203200> rotate<0,0.000000,0> translate<11.542431,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.572531,-1.535000,23.194900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.405256,-1.535000,23.194900>}
box{<0,0,-0.203200><0.832725,0.035000,0.203200> rotate<0,0.000000,0> translate<11.572531,-1.535000,23.194900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.759594,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.108019,-1.535000,14.224000>}
box{<0,0,-0.203200><0.348425,0.035000,0.203200> rotate<0,0.000000,0> translate<11.759594,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.765400,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,51.097053>}
box{<0,0,-0.203200><1.321724,0.035000,0.203200> rotate<0,44.997030,0> translate<11.765400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.765400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.765400,-1.535000,52.031653>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.765400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.765400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.717653,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.765400,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.816256,-1.535000,27.494400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.040309,-1.535000,27.587206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<11.816256,-1.535000,27.494400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.816256,-1.535000,36.513597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.040309,-1.535000,36.420791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<11.816256,-1.535000,36.513597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.948828,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,46.736000>}
box{<0,0,-0.203200><0.751172,0.035000,0.203200> rotate<0,0.000000,0> translate<11.948828,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.994638,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.271444,-1.535000,14.630400>}
box{<0,0,-0.203200><0.276806,0.035000,0.203200> rotate<0,0.000000,0> translate<11.994638,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025756,-1.535000,37.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.249809,-1.535000,37.872206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<12.025756,-1.535000,37.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.040309,-1.535000,27.587206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,27.758688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.040309,-1.535000,27.587206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.040309,-1.535000,36.420791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,36.249309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<12.040309,-1.535000,36.420791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.063900,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,37.795200>}
box{<0,0,-0.203200><0.190500,0.035000,0.203200> rotate<0,0.000000,0> translate<12.063900,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.085759,-1.535000,26.599991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,26.669844>}
box{<0,0,-0.203200><0.182535,0.035000,0.203200> rotate<0,-22.498483,0> translate<12.085759,-1.535000,26.599991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.088303,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288297,-1.535000,27.635200>}
box{<0,0,-0.203200><6.199994,0.035000,0.203200> rotate<0,0.000000,0> translate<12.088303,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.207100,-1.535000,35.253997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,35.249309>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,44.977939,0> translate<12.207100,-1.535000,35.253997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.207100,-1.535000,35.253997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,35.258688>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.207100,-1.535000,35.253997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,27.758688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,27.982741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<12.211791,-1.535000,27.758688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,35.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,35.025256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<12.211791,-1.535000,35.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,35.258688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,35.482741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<12.211791,-1.535000,35.258688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.211791,-1.535000,36.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,36.025256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<12.211791,-1.535000,36.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.229681,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.434872,-1.535000,15.036800>}
box{<0,0,-0.203200><0.205191,0.035000,0.203200> rotate<0,0.000000,0> translate<12.229681,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.244809,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.283191,-1.535000,36.169600>}
box{<0,0,-0.203200><9.038381,0.035000,0.203200> rotate<0,0.000000,0> translate<12.244809,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.249809,-1.535000,37.872206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,37.876800>}
box{<0,0,-0.203200><0.006494,0.035000,0.203200> rotate<0,-45.016524,0> translate<12.249809,-1.535000,37.872206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.252428,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.275566,-1.535000,35.356800>}
box{<0,0,-0.203200><9.023138,0.035000,0.203200> rotate<0,0.000000,0> translate<12.252428,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,27.056256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,26.669844>}
box{<0,0,-0.203200><0.386412,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.254400,-1.535000,26.669844> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,27.056256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.347206,-1.535000,27.280309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<12.254400,-1.535000,27.056256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,36.951741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.347206,-1.535000,36.727688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<12.254400,-1.535000,36.951741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,37.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.254400,-1.535000,36.951741>}
box{<0,0,-0.203200><0.925059,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.254400,-1.535000,36.951741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,27.982741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,35.025256>}
box{<0,0,-0.203200><7.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<12.304597,-1.535000,35.025256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.581972,-1.535000,28.041600>}
box{<0,0,-0.203200><6.277375,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,28.448000>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.276559,-1.535000,28.854400>}
box{<0,0,-0.203200><8.971963,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,29.260800>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,29.667200>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,30.073600>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,30.480000>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,30.886400>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,31.292800>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,31.699200>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,32.105600>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,32.512000>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,32.918400>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,33.324800>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,33.731200>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,34.137600>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,34.544000>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,34.950400>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,35.482741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,36.025256>}
box{<0,0,-0.203200><0.542516,0.035000,0.203200> rotate<0,90.000000,0> translate<12.304597,-1.535000,36.025256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.304597,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,35.763200>}
box{<0,0,-0.203200><8.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.304597,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.347206,-1.535000,27.280309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.518688,-1.535000,27.451791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.347206,-1.535000,27.280309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.347206,-1.535000,36.727688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.518688,-1.535000,36.556206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<12.347206,-1.535000,36.727688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.355228,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,46.329600>}
box{<0,0,-0.203200><0.344772,0.035000,0.203200> rotate<0,0.000000,0> translate<12.355228,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.405256,-1.535000,23.194900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.629309,-1.535000,23.287706>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<12.405256,-1.535000,23.194900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.464725,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598297,-1.535000,15.443200>}
box{<0,0,-0.203200><0.133572,0.035000,0.203200> rotate<0,0.000000,0> translate<12.464725,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.518688,-1.535000,27.451791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.742741,-1.535000,27.544597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<12.518688,-1.535000,27.451791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.518688,-1.535000,36.556206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.742741,-1.535000,36.463400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<12.518688,-1.535000,36.556206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.550144,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.502397,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.550144,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.575544,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.678053,-1.535000,4.470400>}
box{<0,0,-0.203200><2.102509,0.035000,0.203200> rotate<0,0.000000,0> translate<12.575544,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,7.647944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,11.358722>}
box{<0,0,-0.203200><3.710778,0.035000,0.203200> rotate<0,90.000000,0> translate<12.598397,-1.535000,11.358722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,7.647944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.502397,-1.535000,6.743944>}
box{<0,0,-0.203200><1.278449,0.035000,0.203200> rotate<0,44.997030,0> translate<12.598397,-1.535000,7.647944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.518769,-1.535000,7.721600>}
box{<0,0,-0.203200><2.920372,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.518159,-1.535000,8.128000>}
box{<0,0,-0.203200><2.919763,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.517547,-1.535000,8.534400>}
box{<0,0,-0.203200><2.919150,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.516934,-1.535000,8.940800>}
box{<0,0,-0.203200><2.918537,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.516322,-1.535000,9.347200>}
box{<0,0,-0.203200><2.917925,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.515713,-1.535000,9.753600>}
box{<0,0,-0.203200><2.917316,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.515100,-1.535000,10.160000>}
box{<0,0,-0.203200><2.916703,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.514488,-1.535000,10.566400>}
box{<0,0,-0.203200><2.916091,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.513875,-1.535000,10.972800>}
box{<0,0,-0.203200><2.915478,0.035000,0.203200> rotate<0,0.000000,0> translate<12.598397,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598397,-1.535000,11.358722>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.502428,-1.535000,18.580294>}
box{<0,0,-0.203200><7.783604,0.035000,0.203200> rotate<0,-68.088827,0> translate<12.598397,-1.535000,11.358722> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.606631,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.513266,-1.535000,11.379200>}
box{<0,0,-0.203200><2.906634,0.035000,0.203200> rotate<0,0.000000,0> translate<12.606631,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.629309,-1.535000,23.287706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800791,-1.535000,23.459188>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.629309,-1.535000,23.287706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.699769,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.761725,-1.535000,15.849600>}
box{<0,0,-0.203200><0.061956,0.035000,0.203200> rotate<0,0.000000,0> translate<12.699769,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,51.097053>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,-1.535000,45.984825>}
box{<0,0,-0.203200><5.112228,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.700000,-1.535000,45.984825> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.717653,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.064344,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<12.717653,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.742741,-1.535000,27.544597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.285256,-1.535000,27.544597>}
box{<0,0,-0.203200><0.542516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.742741,-1.535000,27.544597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.742741,-1.535000,36.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.285256,-1.535000,36.463400>}
box{<0,0,-0.203200><5.542516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.742741,-1.535000,36.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.770056,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.512653,-1.535000,11.785600>}
box{<0,0,-0.203200><2.742597,0.035000,0.203200> rotate<0,0.000000,0> translate<12.770056,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.800791,-1.535000,23.459188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.893597,-1.535000,23.683241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<12.800791,-1.535000,23.459188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.847188,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.252000,-1.535000,23.571200>}
box{<0,0,-0.203200><0.404813,0.035000,0.203200> rotate<0,0.000000,0> translate<12.847188,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.893597,-1.535000,23.683241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.893597,-1.535000,24.363400>}
box{<0,0,-0.203200><0.680159,0.035000,0.203200> rotate<0,90.000000,0> translate<12.893597,-1.535000,24.363400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.893597,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.252000,-1.535000,23.977600>}
box{<0,0,-0.203200><0.358403,0.035000,0.203200> rotate<0,0.000000,0> translate<12.893597,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.893597,-1.535000,24.363400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.252000,-1.535000,24.363400>}
box{<0,0,-0.203200><0.358403,0.035000,0.203200> rotate<0,0.000000,0> translate<12.893597,-1.535000,24.363400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.931141,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.322456,-1.535000,7.315200>}
box{<0,0,-0.203200><1.391316,0.035000,0.203200> rotate<0,0.000000,0> translate<12.931141,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.933484,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.512041,-1.535000,12.192000>}
box{<0,0,-0.203200><2.578556,0.035000,0.203200> rotate<0,0.000000,0> translate<12.933484,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.981944,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.271653,-1.535000,4.876800>}
box{<0,0,-0.203200><1.289709,0.035000,0.203200> rotate<0,0.000000,0> translate<12.981944,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.096909,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.511431,-1.535000,12.598400>}
box{<0,0,-0.203200><2.414522,0.035000,0.203200> rotate<0,0.000000,0> translate<13.096909,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.252000,-1.535000,24.363400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.252000,-1.535000,23.245031>}
box{<0,0,-0.203200><1.118369,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.252000,-1.535000,23.245031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.260338,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.510819,-1.535000,13.004800>}
box{<0,0,-0.203200><2.250481,0.035000,0.203200> rotate<0,0.000000,0> translate<13.260338,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.285256,-1.535000,27.544597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.509309,-1.535000,27.451791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<13.285256,-1.535000,27.544597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.337541,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.916056,-1.535000,6.908800>}
box{<0,0,-0.203200><0.578516,0.035000,0.203200> rotate<0,0.000000,0> translate<13.337541,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.388344,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.865253,-1.535000,5.283200>}
box{<0,0,-0.203200><0.476909,0.035000,0.203200> rotate<0,0.000000,0> translate<13.388344,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.423766,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.510206,-1.535000,13.411200>}
box{<0,0,-0.203200><2.086441,0.035000,0.203200> rotate<0,0.000000,0> translate<13.423766,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.502397,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.502397,-1.535000,6.743944>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<13.502397,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.502397,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.751200,-1.535000,5.689600>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.502397,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.502397,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.751200,-1.535000,6.096000>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.502397,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.502397,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.751200,-1.535000,6.502400>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.502397,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.509309,-1.535000,27.451791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.514000,-1.535000,27.447100>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<13.509309,-1.535000,27.451791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.514000,-1.535000,27.447100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.518688,-1.535000,27.451791>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-45.016121,0> translate<13.514000,-1.535000,27.447100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.518688,-1.535000,27.451791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.742741,-1.535000,27.544597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<13.518688,-1.535000,27.451791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.587191,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.509594,-1.535000,13.817600>}
box{<0,0,-0.203200><1.922403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.587191,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.742741,-1.535000,27.544597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.252000,-1.535000,27.544597>}
box{<0,0,-0.203200><4.509259,0.035000,0.203200> rotate<0,0.000000,0> translate<13.742741,-1.535000,27.544597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.750619,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.508984,-1.535000,14.224000>}
box{<0,0,-0.203200><1.758366,0.035000,0.203200> rotate<0,0.000000,0> translate<13.750619,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.751200,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.703453,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<13.751200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.751200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.751200,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.751200,-1.535000,5.397253> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.751200,-1.535000,6.743944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.703453,-1.535000,7.696197>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.751200,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.914044,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.508372,-1.535000,14.630400>}
box{<0,0,-0.203200><1.594328,0.035000,0.203200> rotate<0,0.000000,0> translate<13.914044,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.064344,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.016597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<14.064344,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.077472,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.507759,-1.535000,15.036800>}
box{<0,0,-0.203200><1.430288,0.035000,0.203200> rotate<0,0.000000,0> translate<14.077472,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,45.730828>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,51.239053>}
box{<0,0,-0.203200><5.508225,0.035000,0.203200> rotate<0,90.000000,0> translate<14.223997,-1.535000,51.239053> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,45.730828>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,42.702825>}
box{<0,0,-0.203200><4.282243,0.035000,0.203200> rotate<0,44.997030,0> translate<14.223997,-1.535000,45.730828> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,45.923200>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,46.329600>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,46.736000>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,47.142400>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,47.548800>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,47.955200>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,48.361600>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,48.768000>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,49.174400>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,49.580800>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,49.987200>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,50.393600>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,50.800000>}
box{<0,0,-0.203200><3.028003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.090653,-1.535000,51.206400>}
box{<0,0,-0.203200><1.866656,0.035000,0.203200> rotate<0,0.000000,0> translate<14.223997,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.223997,-1.535000,51.239053>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.016597,-1.535000,52.031653>}
box{<0,0,-0.203200><1.120906,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.223997,-1.535000,51.239053> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.240897,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.507147,-1.535000,15.443200>}
box{<0,0,-0.203200><1.266250,0.035000,0.203200> rotate<0,0.000000,0> translate<14.240897,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.343741,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.938256,-1.535000,54.051200>}
box{<0,0,-0.203200><1.594516,0.035000,0.203200> rotate<0,0.000000,0> translate<14.343741,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.404325,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.506538,-1.535000,15.849600>}
box{<0,0,-0.203200><1.102213,0.035000,0.203200> rotate<0,0.000000,0> translate<14.404325,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.438025,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,45.516800>}
box{<0,0,-0.203200><2.813975,0.035000,0.203200> rotate<0,0.000000,0> translate<14.438025,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.567753,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.505925,-1.535000,16.256000>}
box{<0,0,-0.203200><0.938172,0.035000,0.203200> rotate<0,0.000000,0> translate<14.567753,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.597744,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.684253,-1.535000,51.612800>}
box{<0,0,-0.203200><1.086509,0.035000,0.203200> rotate<0,0.000000,0> translate<14.597744,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.703453,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.050144,-1.535000,4.445000>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<14.703453,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.703453,-1.535000,7.696197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.518809,-1.535000,7.696197>}
box{<0,0,-0.203200><0.815356,0.035000,0.203200> rotate<0,0.000000,0> translate<14.703453,-1.535000,7.696197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.731178,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.505313,-1.535000,16.662400>}
box{<0,0,-0.203200><0.774134,0.035000,0.203200> rotate<0,0.000000,0> translate<14.731178,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.750141,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.531856,-1.535000,53.644800>}
box{<0,0,-0.203200><0.781716,0.035000,0.203200> rotate<0,0.000000,0> translate<14.750141,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.844425,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,45.110400>}
box{<0,0,-0.203200><2.407575,0.035000,0.203200> rotate<0,0.000000,0> translate<14.844425,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.894606,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.504700,-1.535000,17.068800>}
box{<0,0,-0.203200><0.610094,0.035000,0.203200> rotate<0,0.000000,0> translate<14.894606,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.004144,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.277853,-1.535000,52.019200>}
box{<0,0,-0.203200><0.273709,0.035000,0.203200> rotate<0,0.000000,0> translate<15.004144,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.016597,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.016597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<15.016597,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.016597,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.265400,-1.535000,52.425600>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.016597,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.016597,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.265400,-1.535000,52.832000>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.016597,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.016597,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.265400,-1.535000,53.238400>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.016597,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.058031,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.504091,-1.535000,17.475200>}
box{<0,0,-0.203200><0.446059,0.035000,0.203200> rotate<0,0.000000,0> translate<15.058031,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.221459,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503478,-1.535000,17.881600>}
box{<0,0,-0.203200><0.282019,0.035000,0.203200> rotate<0,0.000000,0> translate<15.221459,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.250825,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,44.704000>}
box{<0,0,-0.203200><2.001175,0.035000,0.203200> rotate<0,0.000000,0> translate<15.250825,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.265400,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.217653,-1.535000,51.079400>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<15.265400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.265400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.265400,-1.535000,52.031653>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.265400,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.265400,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.217653,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.265400,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.384884,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.502866,-1.535000,18.288000>}
box{<0,0,-0.203200><0.117981,0.035000,0.203200> rotate<0,0.000000,0> translate<15.384884,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.502428,-1.535000,18.580294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.518809,-1.535000,7.696197>}
box{<0,0,-0.203200><10.884109,0.035000,0.203200> rotate<0,89.907832,0> translate<15.502428,-1.535000,18.580294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.657225,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,44.297600>}
box{<0,0,-0.203200><1.594775,0.035000,0.203200> rotate<0,0.000000,0> translate<15.657225,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.050144,-1.535000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.002397,-1.535000,5.397253>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.050144,-1.535000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.063625,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,43.891200>}
box{<0,0,-0.203200><1.188375,0.035000,0.203200> rotate<0,0.000000,0> translate<16.063625,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.075544,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,4.470400>}
box{<0,0,-0.203200><1.704456,0.035000,0.203200> rotate<0,0.000000,0> translate<16.075544,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.217653,-1.535000,51.079400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,51.079400>}
box{<0,0,-0.203200><1.034347,0.035000,0.203200> rotate<0,0.000000,0> translate<16.217653,-1.535000,51.079400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.217653,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.564344,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<16.217653,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.470025,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,43.484800>}
box{<0,0,-0.203200><0.781975,0.035000,0.203200> rotate<0,0.000000,0> translate<16.470025,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.481944,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,4.876800>}
box{<0,0,-0.203200><1.298056,0.035000,0.203200> rotate<0,0.000000,0> translate<16.481944,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.876425,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,43.078400>}
box{<0,0,-0.203200><0.375575,0.035000,0.203200> rotate<0,0.000000,0> translate<16.876425,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.888344,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,5.283200>}
box{<0,0,-0.203200><0.891656,0.035000,0.203200> rotate<0,0.000000,0> translate<16.888344,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.899863,-1.535000,6.846475>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.928038,-1.535000,6.874734>}
box{<0,0,-0.203200><0.039905,0.035000,0.203200> rotate<0,-45.082687,0> translate<16.899863,-1.535000,6.846475> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.899863,-1.535000,6.846475>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.002397,-1.535000,6.743944>}
box{<0,0,-0.203200><0.145003,0.035000,0.203200> rotate<0,44.996157,0> translate<16.899863,-1.535000,6.846475> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.928038,-1.535000,6.874734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.950634,-1.535000,6.929522>}
box{<0,0,-0.203200><0.059265,0.035000,0.203200> rotate<0,-67.582045,0> translate<16.928038,-1.535000,6.874734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.942087,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,6.908800>}
box{<0,0,-0.203200><0.837913,0.035000,0.203200> rotate<0,0.000000,0> translate<16.942087,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.950634,-1.535000,6.929522>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.985672,-1.535000,6.977347>}
box{<0,0,-0.203200><0.059286,0.035000,0.203200> rotate<0,-53.769241,0> translate<16.950634,-1.535000,6.929522> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.985672,-1.535000,6.977347>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.007903,-1.535000,7.068369>}
box{<0,0,-0.203200><0.093697,0.035000,0.203200> rotate<0,-76.269712,0> translate<16.985672,-1.535000,6.977347> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.002397,-1.535000,5.397253>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.002397,-1.535000,6.743944>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<17.002397,-1.535000,6.743944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.002397,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,5.689600>}
box{<0,0,-0.203200><0.777603,0.035000,0.203200> rotate<0,0.000000,0> translate<17.002397,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.002397,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,6.096000>}
box{<0,0,-0.203200><0.777603,0.035000,0.203200> rotate<0,0.000000,0> translate<17.002397,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.002397,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,6.502400>}
box{<0,0,-0.203200><0.777603,0.035000,0.203200> rotate<0,0.000000,0> translate<17.002397,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.007903,-1.535000,7.068369>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.043625,-1.535000,7.154972>}
box{<0,0,-0.203200><0.093681,0.035000,0.203200> rotate<0,-67.580474,0> translate<17.007903,-1.535000,7.068369> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.023566,-1.535000,20.481400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.043309,-1.535000,7.364419>}
box{<0,0,-0.203200><13.116996,0.035000,0.203200> rotate<0,89.907824,0> translate<17.023566,-1.535000,20.481400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.023566,-1.535000,20.481400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,19.724966>}
box{<0,0,-0.203200><1.069760,0.035000,0.203200> rotate<0,44.997030,0> translate<17.023566,-1.535000,20.481400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.023809,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.184966,-1.535000,20.320000>}
box{<0,0,-0.203200><0.161156,0.035000,0.203200> rotate<0,0.000000,0> translate<17.023809,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.024422,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.591366,-1.535000,19.913600>}
box{<0,0,-0.203200><0.566944,0.035000,0.203200> rotate<0,0.000000,0> translate<17.024422,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.025034,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,19.507200>}
box{<0,0,-0.203200><0.754966,0.035000,0.203200> rotate<0,0.000000,0> translate<17.025034,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.025644,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,19.100800>}
box{<0,0,-0.203200><0.754356,0.035000,0.203200> rotate<0,0.000000,0> translate<17.025644,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.026256,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,18.694400>}
box{<0,0,-0.203200><0.753744,0.035000,0.203200> rotate<0,0.000000,0> translate<17.026256,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.026869,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,18.288000>}
box{<0,0,-0.203200><0.753131,0.035000,0.203200> rotate<0,0.000000,0> translate<17.026869,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.027481,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,17.881600>}
box{<0,0,-0.203200><0.752519,0.035000,0.203200> rotate<0,0.000000,0> translate<17.027481,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.028091,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,17.475200>}
box{<0,0,-0.203200><0.751909,0.035000,0.203200> rotate<0,0.000000,0> translate<17.028091,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.028703,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,17.068800>}
box{<0,0,-0.203200><0.751297,0.035000,0.203200> rotate<0,0.000000,0> translate<17.028703,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.029316,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,16.662400>}
box{<0,0,-0.203200><0.750684,0.035000,0.203200> rotate<0,0.000000,0> translate<17.029316,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.029928,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,16.256000>}
box{<0,0,-0.203200><0.750072,0.035000,0.203200> rotate<0,0.000000,0> translate<17.029928,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.030538,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,15.849600>}
box{<0,0,-0.203200><0.749462,0.035000,0.203200> rotate<0,0.000000,0> translate<17.030538,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.031150,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,15.443200>}
box{<0,0,-0.203200><0.748850,0.035000,0.203200> rotate<0,0.000000,0> translate<17.031150,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.031762,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,15.036800>}
box{<0,0,-0.203200><0.748238,0.035000,0.203200> rotate<0,0.000000,0> translate<17.031762,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.032375,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,14.630400>}
box{<0,0,-0.203200><0.747625,0.035000,0.203200> rotate<0,0.000000,0> translate<17.032375,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.032984,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,14.224000>}
box{<0,0,-0.203200><0.747016,0.035000,0.203200> rotate<0,0.000000,0> translate<17.032984,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.033597,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,13.817600>}
box{<0,0,-0.203200><0.746403,0.035000,0.203200> rotate<0,0.000000,0> translate<17.033597,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.034209,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,13.411200>}
box{<0,0,-0.203200><0.745791,0.035000,0.203200> rotate<0,0.000000,0> translate<17.034209,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.034822,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,13.004800>}
box{<0,0,-0.203200><0.745178,0.035000,0.203200> rotate<0,0.000000,0> translate<17.034822,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.035431,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,12.598400>}
box{<0,0,-0.203200><0.744569,0.035000,0.203200> rotate<0,0.000000,0> translate<17.035431,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.036044,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,12.192000>}
box{<0,0,-0.203200><0.743956,0.035000,0.203200> rotate<0,0.000000,0> translate<17.036044,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.036656,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,11.785600>}
box{<0,0,-0.203200><0.743344,0.035000,0.203200> rotate<0,0.000000,0> translate<17.036656,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.037269,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,11.379200>}
box{<0,0,-0.203200><0.742731,0.035000,0.203200> rotate<0,0.000000,0> translate<17.037269,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.037878,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,10.972800>}
box{<0,0,-0.203200><0.742122,0.035000,0.203200> rotate<0,0.000000,0> translate<17.037878,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.038491,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,10.566400>}
box{<0,0,-0.203200><0.741509,0.035000,0.203200> rotate<0,0.000000,0> translate<17.038491,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.039103,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,10.160000>}
box{<0,0,-0.203200><0.740897,0.035000,0.203200> rotate<0,0.000000,0> translate<17.039103,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.039716,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,9.753600>}
box{<0,0,-0.203200><0.740284,0.035000,0.203200> rotate<0,0.000000,0> translate<17.039716,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.040325,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,9.347200>}
box{<0,0,-0.203200><0.739675,0.035000,0.203200> rotate<0,0.000000,0> translate<17.040325,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.040938,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,8.940800>}
box{<0,0,-0.203200><0.739062,0.035000,0.203200> rotate<0,0.000000,0> translate<17.040938,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.041550,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,8.534400>}
box{<0,0,-0.203200><0.738450,0.035000,0.203200> rotate<0,0.000000,0> translate<17.041550,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.042162,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,8.128000>}
box{<0,0,-0.203200><0.737838,0.035000,0.203200> rotate<0,0.000000,0> translate<17.042162,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.042772,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,7.721600>}
box{<0,0,-0.203200><0.737228,0.035000,0.203200> rotate<0,0.000000,0> translate<17.042772,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.043309,-1.535000,7.364419>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.057600,-1.535000,7.271831>}
box{<0,0,-0.203200><0.093684,0.035000,0.203200> rotate<0,81.220433,0> translate<17.043309,-1.535000,7.364419> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.043534,-1.535000,7.214250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.043625,-1.535000,7.154972>}
box{<0,0,-0.203200><0.059278,0.035000,0.203200> rotate<0,89.906472,0> translate<17.043534,-1.535000,7.214250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.043534,-1.535000,7.214250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.057600,-1.535000,7.271831>}
box{<0,0,-0.203200><0.059274,0.035000,0.203200> rotate<0,-76.267892,0> translate<17.043534,-1.535000,7.214250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.050906,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,7.315200>}
box{<0,0,-0.203200><0.729094,0.035000,0.203200> rotate<0,0.000000,0> translate<17.050906,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,51.079400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.252000,-1.535000,42.702825>}
box{<0,0,-0.203200><8.376575,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.252000,-1.535000,42.702825> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.564344,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.516597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<17.564344,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.766222,-1.535000,3.598284>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,3.501841>}
box{<0,0,-0.203200><0.097423,0.035000,0.203200> rotate<0,81.864235,0> translate<17.766222,-1.535000,3.598284> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.766222,-1.535000,3.598284>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,3.652062>}
box{<0,0,-0.203200><0.055515,0.035000,0.203200> rotate<0,-75.624749,0> translate<17.766222,-1.535000,3.598284> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,3.404425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.801244,-1.535000,3.353141>}
box{<0,0,-0.203200><0.055510,0.035000,0.203200> rotate<0,67.494528,0> translate<17.780000,-1.535000,3.404425> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,3.501841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,3.404425>}
box{<0,0,-0.203200><0.097416,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780000,-1.535000,3.404425> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,19.724966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,3.652062>}
box{<0,0,-0.203200><16.072903,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780000,-1.535000,3.652062> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.801244,-1.535000,3.353141>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.809094,-1.535000,3.298188>}
box{<0,0,-0.203200><0.055511,0.035000,0.203200> rotate<0,81.864951,0> translate<17.801244,-1.535000,3.353141> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.809094,-1.535000,3.298188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.858722,-1.535000,3.214372>}
box{<0,0,-0.203200><0.097406,0.035000,0.203200> rotate<0,59.365854,0> translate<17.809094,-1.535000,3.298188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.843741,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,54.051200>}
box{<0,0,-0.203200><2.476259,0.035000,0.203200> rotate<0,0.000000,0> translate<17.843741,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.858722,-1.535000,3.214372>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.896006,-1.535000,3.124359>}
box{<0,0,-0.203200><0.097429,0.035000,0.203200> rotate<0,67.495558,0> translate<17.858722,-1.535000,3.214372> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.896006,-1.535000,3.124359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.935266,-1.535000,3.085103>}
box{<0,0,-0.203200><0.055519,0.035000,0.203200> rotate<0,44.994750,0> translate<17.896006,-1.535000,3.124359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.935266,-1.535000,3.085103>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.963544,-1.535000,3.037341>}
box{<0,0,-0.203200><0.055506,0.035000,0.203200> rotate<0,59.368128,0> translate<17.935266,-1.535000,3.085103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.963544,-1.535000,3.037341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.041469,-1.535000,2.978900>}
box{<0,0,-0.203200><0.097404,0.035000,0.203200> rotate<0,36.865994,0> translate<17.963544,-1.535000,3.037341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.041469,-1.535000,2.978900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.110359,-1.535000,2.910006>}
box{<0,0,-0.203200><0.097428,0.035000,0.203200> rotate<0,44.998330,0> translate<18.041469,-1.535000,2.978900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.110359,-1.535000,2.910006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.161650,-1.535000,2.888763>}
box{<0,0,-0.203200><0.055516,0.035000,0.203200> rotate<0,22.497063,0> translate<18.110359,-1.535000,2.910006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.161650,-1.535000,2.888763>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.057472,-1.535000,2.216897>}
box{<0,0,-0.203200><1.119777,0.035000,0.203200> rotate<0,36.867432,0> translate<18.161650,-1.535000,2.888763> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.250141,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,53.644800>}
box{<0,0,-0.203200><2.069859,0.035000,0.203200> rotate<0,0.000000,0> translate<18.250141,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.252000,-1.535000,27.547572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.252000,-1.535000,27.544597>}
box{<0,0,-0.203200><0.002975,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.252000,-1.535000,27.544597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.252000,-1.535000,27.547572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.368006,-1.535000,27.827638>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<18.252000,-1.535000,27.547572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.285256,-1.535000,36.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.509309,-1.535000,36.556206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<18.285256,-1.535000,36.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.368006,-1.535000,27.827638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.658006,-1.535000,28.117634>}
box{<0,0,-0.203200><0.410120,0.035000,0.203200> rotate<0,-44.996721,0> translate<18.368006,-1.535000,27.827638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.509309,-1.535000,36.556206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.513997,-1.535000,36.560897>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-45.016121,0> translate<18.509309,-1.535000,36.556206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.513997,-1.535000,36.560897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.518688,-1.535000,36.556206>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<18.513997,-1.535000,36.560897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.516597,-1.535000,52.157031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.516597,-1.535000,53.378344>}
box{<0,0,-0.203200><1.221312,0.035000,0.203200> rotate<0,90.000000,0> translate<18.516597,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.516597,-1.535000,52.157031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.659991,-1.535000,52.013638>}
box{<0,0,-0.203200><0.202789,0.035000,0.203200> rotate<0,44.997030,0> translate<18.516597,-1.535000,52.157031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.516597,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,52.425600>}
box{<0,0,-0.203200><1.803403,0.035000,0.203200> rotate<0,0.000000,0> translate<18.516597,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.516597,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,52.832000>}
box{<0,0,-0.203200><1.803403,0.035000,0.203200> rotate<0,0.000000,0> translate<18.516597,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.516597,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,53.238400>}
box{<0,0,-0.203200><1.803403,0.035000,0.203200> rotate<0,0.000000,0> translate<18.516597,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.518688,-1.535000,36.556206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.742741,-1.535000,36.463400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<18.518688,-1.535000,36.556206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.654428,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,52.019200>}
box{<0,0,-0.203200><1.665572,0.035000,0.203200> rotate<0,0.000000,0> translate<18.654428,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.658006,-1.535000,28.117638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.658006,-1.535000,28.117634>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.658006,-1.535000,28.117634> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.658006,-1.535000,28.117638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.872359,-1.535000,28.331991>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.658006,-1.535000,28.117638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.659991,-1.535000,52.013638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,51.733572>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,67.495673,0> translate<18.659991,-1.535000,52.013638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.742741,-1.535000,36.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.785256,-1.535000,36.463400>}
box{<0,0,-0.203200><2.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<18.742741,-1.535000,36.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,40.097425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,51.733572>}
box{<0,0,-0.203200><11.636147,0.035000,0.203200> rotate<0,90.000000,0> translate<18.775997,-1.535000,51.733572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,40.097425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.810406,-1.535000,40.131834>}
box{<0,0,-0.203200><0.048662,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.775997,-1.535000,40.097425> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.912169,-1.535000,40.233600>}
box{<0,0,-0.203200><0.136172,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.015200,-1.535000,40.640000>}
box{<0,0,-0.203200><1.239203,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.032600,-1.535000,41.046400>}
box{<0,0,-0.203200><1.256603,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.032600,-1.535000,41.452800>}
box{<0,0,-0.203200><1.256603,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.096822,-1.535000,41.859200>}
box{<0,0,-0.203200><1.320825,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,42.265600>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,42.672000>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,43.078400>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,43.484800>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,43.891200>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,44.297600>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,44.704000>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,45.110400>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,45.516800>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,45.923200>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,46.329600>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,46.736000>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,47.142400>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,47.548800>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,47.955200>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,48.361600>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,48.768000>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,49.174400>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,49.580800>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,49.987200>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,50.393600>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,50.800000>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,51.206400>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.775997,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,51.612800>}
box{<0,0,-0.203200><1.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<18.775997,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.810406,-1.535000,40.131838>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.810406,-1.535000,40.131834>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.810406,-1.535000,40.131834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.810406,-1.535000,40.131838>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.024759,-1.535000,40.346191>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.810406,-1.535000,40.131838> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.872359,-1.535000,28.331991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.152425,-1.535000,28.447997>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<18.872359,-1.535000,28.331991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.024759,-1.535000,40.346191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304825,-1.535000,40.462197>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<19.024759,-1.535000,40.346191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.057472,-1.535000,2.216897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.126359,-1.535000,2.148006>}
box{<0,0,-0.203200><0.097424,0.035000,0.203200> rotate<0,44.998330,0> translate<19.057472,-1.535000,2.216897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.126359,-1.535000,2.148006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.177650,-1.535000,2.126762>}
box{<0,0,-0.203200><0.055516,0.035000,0.203200> rotate<0,22.497063,0> translate<19.126359,-1.535000,2.148006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.152425,-1.535000,28.447997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,28.447997>}
box{<0,0,-0.203200><2.070975,0.035000,0.203200> rotate<0,0.000000,0> translate<19.152425,-1.535000,28.447997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.177650,-1.535000,2.126762>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.222056,-1.535000,2.093456>}
box{<0,0,-0.203200><0.055509,0.035000,0.203200> rotate<0,36.868755,0> translate<19.177650,-1.535000,2.126762> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.222056,-1.535000,2.093456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.316428,-1.535000,2.069281>}
box{<0,0,-0.203200><0.097419,0.035000,0.203200> rotate<0,14.367391,0> translate<19.222056,-1.535000,2.093456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304825,-1.535000,40.462197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.902766,-1.535000,40.462197>}
box{<0,0,-0.203200><0.597941,0.035000,0.203200> rotate<0,0.000000,0> translate<19.304825,-1.535000,40.462197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.316428,-1.535000,2.069281>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.406425,-1.535000,2.032000>}
box{<0,0,-0.203200><0.097413,0.035000,0.203200> rotate<0,22.500321,0> translate<19.316428,-1.535000,2.069281> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.406425,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.461934,-1.535000,2.032000>}
box{<0,0,-0.203200><0.055509,0.035000,0.203200> rotate<0,0.000000,0> translate<19.406425,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.461934,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.515712,-1.535000,2.018222>}
box{<0,0,-0.203200><0.055515,0.035000,0.203200> rotate<0,14.369311,0> translate<19.461934,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.515712,-1.535000,2.018222>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.612159,-1.535000,2.032000>}
box{<0,0,-0.203200><0.097426,0.035000,0.203200> rotate<0,-8.129566,0> translate<19.515712,-1.535000,2.018222> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.612159,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.441572,-1.535000,2.032000>}
box{<0,0,-0.203200><14.829413,0.035000,0.203200> rotate<0,0.000000,0> translate<19.612159,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.902766,-1.535000,40.462197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.015200,-1.535000,40.574631>}
box{<0,0,-0.203200><0.159006,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.902766,-1.535000,40.462197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.015200,-1.535000,40.869472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.015200,-1.535000,40.574631>}
box{<0,0,-0.203200><0.294841,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.015200,-1.535000,40.574631> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.015200,-1.535000,40.869472>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.032600,-1.535000,40.911475>}
box{<0,0,-0.203200><0.045465,0.035000,0.203200> rotate<0,-67.493524,0> translate<20.015200,-1.535000,40.869472> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.032600,-1.535000,41.704156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.032600,-1.535000,40.911475>}
box{<0,0,-0.203200><0.792681,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.032600,-1.535000,40.911475> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.032600,-1.535000,41.704156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.125406,-1.535000,41.928209>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<20.032600,-1.535000,41.704156> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.125406,-1.535000,41.928209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.296888,-1.535000,42.099691>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.125406,-1.535000,41.928209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.296888,-1.535000,42.099691>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,42.109262>}
box{<0,0,-0.203200><0.025016,0.035000,0.203200> rotate<0,-22.495054,0> translate<20.296888,-1.535000,42.099691> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,42.109262>}
box{<0,0,-0.203200><12.500737,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.320000,-1.535000,42.109262> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.785256,-1.535000,36.463400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.009309,-1.535000,36.556206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<20.785256,-1.535000,36.463400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.999347,-1.535000,24.452081>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.009309,-1.535000,24.456206>}
box{<0,0,-0.203200><0.010783,0.035000,0.203200> rotate<0,-22.490648,0> translate<20.999347,-1.535000,24.452081> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.999347,-1.535000,24.452081>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.639431,-1.535000,19.811997>}
box{<0,0,-0.203200><6.562070,0.035000,0.203200> rotate<0,44.997030,0> translate<20.999347,-1.535000,24.452081> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.009309,-1.535000,24.456206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.180791,-1.535000,24.627688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.009309,-1.535000,24.456206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.009309,-1.535000,36.556206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.180791,-1.535000,36.727688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.009309,-1.535000,36.556206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.029103,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.526797,-1.535000,36.576000>}
box{<0,0,-0.203200><3.497694,0.035000,0.203200> rotate<0,0.000000,0> translate<21.029103,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.067428,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.306366,-1.535000,24.384000>}
box{<0,0,-0.203200><2.238938,0.035000,0.203200> rotate<0,0.000000,0> translate<21.067428,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078463,-1.535000,39.482634>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.180791,-1.535000,39.380309>}
box{<0,0,-0.203200><0.144712,0.035000,0.203200> rotate<0,44.996155,0> translate<21.078463,-1.535000,39.482634> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078463,-1.535000,39.482634>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.208838,-1.535000,39.613006>}
box{<0,0,-0.203200><0.184376,0.035000,0.203200> rotate<0,-44.996344,0> translate<21.078463,-1.535000,39.482634> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.140300,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.579172,-1.535000,39.420800>}
box{<0,0,-0.203200><0.438872,0.035000,0.203200> rotate<0,0.000000,0> translate<21.140300,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.180791,-1.535000,24.627688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,24.851741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<21.180791,-1.535000,24.627688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.180791,-1.535000,36.727688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,36.951741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<21.180791,-1.535000,36.727688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.180791,-1.535000,39.380309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,39.156256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<21.180791,-1.535000,39.380309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.208838,-1.535000,39.613006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.369128,-1.535000,39.773300>}
box{<0,0,-0.203200><0.226687,0.035000,0.203200> rotate<0,-44.997589,0> translate<21.208838,-1.535000,39.613006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,28.525256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,28.447997>}
box{<0,0,-0.203200><0.077259,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.223400,-1.535000,28.447997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,28.525256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,28.749309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<21.223400,-1.535000,28.525256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,28.982741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,28.758688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<21.223400,-1.535000,28.982741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,35.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,28.982741>}
box{<0,0,-0.203200><6.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.223400,-1.535000,28.982741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,35.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,35.249309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<21.223400,-1.535000,35.025256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,35.482741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,35.258688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<21.223400,-1.535000,35.482741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,36.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,35.482741>}
box{<0,0,-0.203200><0.542516,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.223400,-1.535000,35.482741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223400,-1.535000,36.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,36.249309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<21.223400,-1.535000,36.025256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.248188,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.899966,-1.535000,24.790400>}
box{<0,0,-0.203200><1.651778,0.035000,0.203200> rotate<0,0.000000,0> translate<21.248188,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,24.851741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,26.416772>}
box{<0,0,-0.203200><1.565031,0.035000,0.203200> rotate<0,90.000000,0> translate<21.273597,-1.535000,26.416772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.493566,-1.535000,25.196800>}
box{<0,0,-0.203200><1.219969,0.035000,0.203200> rotate<0,0.000000,0> translate<21.273597,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.087166,-1.535000,25.603200>}
box{<0,0,-0.203200><0.813569,0.035000,0.203200> rotate<0,0.000000,0> translate<21.273597,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.680766,-1.535000,26.009600>}
box{<0,0,-0.203200><0.407169,0.035000,0.203200> rotate<0,0.000000,0> translate<21.273597,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.274366,-1.535000,26.416000>}
box{<0,0,-0.203200><0.000769,0.035000,0.203200> rotate<0,0.000000,0> translate<21.273597,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,26.416772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.532006,-1.535000,21.158359>}
box{<0,0,-0.203200><7.436516,0.035000,0.203200> rotate<0,44.997047,0> translate<21.273597,-1.535000,26.416772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,36.951741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,37.296800>}
box{<0,0,-0.203200><0.345059,0.035000,0.203200> rotate<0,90.000000,0> translate<21.273597,-1.535000,37.296800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,36.982400>}
box{<0,0,-0.203200><5.604403,0.035000,0.203200> rotate<0,0.000000,0> translate<21.273597,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,37.296800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.446372,-1.535000,37.296800>}
box{<0,0,-0.203200><0.172775,0.035000,0.203200> rotate<0,0.000000,0> translate<21.273597,-1.535000,37.296800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,39.115225>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,39.156256>}
box{<0,0,-0.203200><0.041031,0.035000,0.203200> rotate<0,90.000000,0> translate<21.273597,-1.535000,39.156256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.273597,-1.535000,39.115225>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,41.971631>}
box{<0,0,-0.203200><4.039566,0.035000,0.203200> rotate<0,-44.997062,0> translate<21.273597,-1.535000,39.115225> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,28.749309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.320897,-1.535000,28.754000>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.316206,-1.535000,28.749309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,28.758688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.320897,-1.535000,28.754000>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,44.977939,0> translate<21.316206,-1.535000,28.758688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,35.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.320897,-1.535000,35.254000>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.316206,-1.535000,35.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,35.258688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.320897,-1.535000,35.254000>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,44.977939,0> translate<21.316206,-1.535000,35.258688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.316206,-1.535000,36.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.487687,-1.535000,36.420791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.316206,-1.535000,36.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.369128,-1.535000,39.773300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.563456,-1.535000,39.773300>}
box{<0,0,-0.203200><0.194328,0.035000,0.203200> rotate<0,0.000000,0> translate<21.369128,-1.535000,39.773300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.446372,-1.535000,37.296800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.726437,-1.535000,37.412806>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<21.446372,-1.535000,37.296800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.473828,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.712766,-1.535000,23.977600>}
box{<0,0,-0.203200><2.238937,0.035000,0.203200> rotate<0,0.000000,0> translate<21.473828,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.487687,-1.535000,36.420791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.711741,-1.535000,36.513597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<21.487687,-1.535000,36.420791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.563456,-1.535000,39.773300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.787509,-1.535000,39.866106>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<21.563456,-1.535000,39.773300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.668478,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.903413,-1.535000,37.388800>}
box{<0,0,-0.203200><5.234934,0.035000,0.203200> rotate<0,0.000000,0> translate<21.668478,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.693581,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.985572,-1.535000,39.827200>}
box{<0,0,-0.203200><0.291991,0.035000,0.203200> rotate<0,0.000000,0> translate<21.693581,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.711741,-1.535000,36.513597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.916256,-1.535000,36.513597>}
box{<0,0,-0.203200><2.204516,0.035000,0.203200> rotate<0,0.000000,0> translate<21.711741,-1.535000,36.513597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.726437,-1.535000,37.412806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.940791,-1.535000,37.627159>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.726437,-1.535000,37.412806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.787509,-1.535000,39.866106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.958991,-1.535000,40.037588>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.787509,-1.535000,39.866106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,42.043203>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,54.610000>}
box{<0,0,-0.203200><12.566797,0.035000,0.203200> rotate<0,90.000000,0> translate<21.843997,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,42.043203>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.958991,-1.535000,41.928209>}
box{<0,0,-0.203200><0.162626,0.035000,0.203200> rotate<0,44.997030,0> translate<21.843997,-1.535000,42.043203> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,42.265600>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,42.672000>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,43.078400>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,43.484800>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,43.891200>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,44.297600>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,44.704000>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,45.110400>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,45.516800>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,45.923200>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,46.329600>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,46.736000>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,47.142400>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,47.548800>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,47.955200>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,48.361600>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,48.768000>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,49.174400>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,49.580800>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,49.987200>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,50.393600>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,50.800000>}
box{<0,0,-0.203200><2.286003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.031053,-1.535000,51.206400>}
box{<0,0,-0.203200><2.187056,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.624653,-1.535000,51.612800>}
box{<0,0,-0.203200><1.780656,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.218253,-1.535000,52.019200>}
box{<0,0,-0.203200><1.374256,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.205800,-1.535000,52.425600>}
box{<0,0,-0.203200><1.361803,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.205800,-1.535000,52.832000>}
box{<0,0,-0.203200><1.361803,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.205800,-1.535000,53.238400>}
box{<0,0,-0.203200><1.361803,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472256,-1.535000,53.644800>}
box{<0,0,-0.203200><1.628259,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.878656,-1.535000,54.051200>}
box{<0,0,-0.203200><2.034659,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.235400,-1.535000,54.457600>}
box{<0,0,-0.203200><7.391403,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.843997,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.235400,-1.535000,54.610000>}
box{<0,0,-0.203200><7.391403,0.035000,0.203200> rotate<0,0.000000,0> translate<21.843997,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.880228,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.119166,-1.535000,23.571200>}
box{<0,0,-0.203200><2.238937,0.035000,0.203200> rotate<0,0.000000,0> translate<21.880228,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.940791,-1.535000,37.627159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.537991,-1.535000,41.224359>}
box{<0,0,-0.203200><5.087209,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.940791,-1.535000,37.627159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.958991,-1.535000,40.037588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.051797,-1.535000,40.261641>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<21.958991,-1.535000,40.037588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.958991,-1.535000,41.928209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.051797,-1.535000,41.704156>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<21.958991,-1.535000,41.928209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.987578,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.017572,-1.535000,41.859200>}
box{<0,0,-0.203200><2.029994,0.035000,0.203200> rotate<0,0.000000,0> translate<21.987578,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.040181,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.391972,-1.535000,40.233600>}
box{<0,0,-0.203200><0.351791,0.035000,0.203200> rotate<0,0.000000,0> translate<22.040181,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.051797,-1.535000,40.261641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.051797,-1.535000,41.704156>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<22.051797,-1.535000,41.704156> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.051797,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.798372,-1.535000,40.640000>}
box{<0,0,-0.203200><0.746575,0.035000,0.203200> rotate<0,0.000000,0> translate<22.051797,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.051797,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.204772,-1.535000,41.046400>}
box{<0,0,-0.203200><1.152975,0.035000,0.203200> rotate<0,0.000000,0> translate<22.051797,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.051797,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.611172,-1.535000,41.452800>}
box{<0,0,-0.203200><1.559375,0.035000,0.203200> rotate<0,0.000000,0> translate<22.051797,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.108831,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.316616,-1.535000,37.795200>}
box{<0,0,-0.203200><5.207784,0.035000,0.203200> rotate<0,0.000000,0> translate<22.108831,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.286628,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.525566,-1.535000,23.164800>}
box{<0,0,-0.203200><2.238938,0.035000,0.203200> rotate<0,0.000000,0> translate<22.286628,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.515231,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.753275,-1.535000,38.201600>}
box{<0,0,-0.203200><9.238044,0.035000,0.203200> rotate<0,0.000000,0> translate<22.515231,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.693028,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.931966,-1.535000,22.758400>}
box{<0,0,-0.203200><2.238937,0.035000,0.203200> rotate<0,0.000000,0> translate<22.693028,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.921631,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.381275,-1.535000,38.608000>}
box{<0,0,-0.203200><8.459644,0.035000,0.203200> rotate<0,0.000000,0> translate<22.921631,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.099428,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.338366,-1.535000,22.352000>}
box{<0,0,-0.203200><2.238937,0.035000,0.203200> rotate<0,0.000000,0> translate<23.099428,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.205800,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,51.107453>}
box{<0,0,-0.203200><1.307016,0.035000,0.203200> rotate<0,44.997030,0> translate<23.205800,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.205800,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.205800,-1.535000,52.031653>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.205800,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.205800,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.158053,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.205800,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.328031,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.364400,-1.535000,39.014400>}
box{<0,0,-0.203200><8.036369,0.035000,0.203200> rotate<0,0.000000,0> translate<23.328031,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.505828,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.744766,-1.535000,21.945600>}
box{<0,0,-0.203200><2.238938,0.035000,0.203200> rotate<0,0.000000,0> translate<23.505828,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.734431,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.364400,-1.535000,39.420800>}
box{<0,0,-0.203200><7.629969,0.035000,0.203200> rotate<0,0.000000,0> translate<23.734431,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.912228,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.151166,-1.535000,21.539200>}
box{<0,0,-0.203200><2.238937,0.035000,0.203200> rotate<0,0.000000,0> translate<23.912228,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.916256,-1.535000,36.513597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.140309,-1.535000,36.420791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<23.916256,-1.535000,36.513597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,51.107453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,-1.535000,41.971631>}
box{<0,0,-0.203200><9.135822,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.130000,-1.535000,41.971631> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.140309,-1.535000,36.420791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.311791,-1.535000,36.249309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<24.140309,-1.535000,36.420791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.140831,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.364400,-1.535000,39.827200>}
box{<0,0,-0.203200><7.223569,0.035000,0.203200> rotate<0,0.000000,0> translate<24.140831,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.158053,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.504744,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<24.158053,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.311791,-1.535000,36.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.355500,-1.535000,36.143781>}
box{<0,0,-0.203200><0.114222,0.035000,0.203200> rotate<0,67.496382,0> translate<24.311791,-1.535000,36.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.318628,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.557566,-1.535000,21.132800>}
box{<0,0,-0.203200><2.238938,0.035000,0.203200> rotate<0,0.000000,0> translate<24.318628,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.344806,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.355500,-1.535000,36.169600>}
box{<0,0,-0.203200><0.010694,0.035000,0.203200> rotate<0,0.000000,0> translate<24.344806,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.355500,-1.535000,36.273456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.355500,-1.535000,36.143781>}
box{<0,0,-0.203200><0.129675,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.355500,-1.535000,36.143781> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.355500,-1.535000,36.273456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.448306,-1.535000,36.497509>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<24.355500,-1.535000,36.273456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.382912,-1.535000,27.930397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.404597,-1.535000,27.982741>}
box{<0,0,-0.203200><0.056658,0.035000,0.203200> rotate<0,-67.492851,0> translate<24.382912,-1.535000,27.930397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.382912,-1.535000,27.930397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.945056,-1.535000,27.930397>}
box{<0,0,-0.203200><0.562144,0.035000,0.203200> rotate<0,0.000000,0> translate<24.382912,-1.535000,27.930397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.404597,-1.535000,27.982741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.404597,-1.535000,28.492000>}
box{<0,0,-0.203200><0.509259,0.035000,0.203200> rotate<0,90.000000,0> translate<24.404597,-1.535000,28.492000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.404597,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.704475,-1.535000,28.041600>}
box{<0,0,-0.203200><5.299878,0.035000,0.203200> rotate<0,0.000000,0> translate<24.404597,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.404597,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.651400,-1.535000,28.448000>}
box{<0,0,-0.203200><5.246803,0.035000,0.203200> rotate<0,0.000000,0> translate<24.404597,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.404597,-1.535000,28.492000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.257672,-1.535000,28.492000>}
box{<0,0,-0.203200><1.853075,0.035000,0.203200> rotate<0,0.000000,0> translate<24.404597,-1.535000,28.492000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.448306,-1.535000,36.497509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.619788,-1.535000,36.668991>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.448306,-1.535000,36.497509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.547231,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.423363,-1.535000,40.233600>}
box{<0,0,-0.203200><6.876131,0.035000,0.203200> rotate<0,0.000000,0> translate<24.547231,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.619788,-1.535000,36.668991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.843841,-1.535000,36.761797>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<24.619788,-1.535000,36.668991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.725028,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.356994,-1.535000,20.726400>}
box{<0,0,-0.203200><13.631966,0.035000,0.203200> rotate<0,0.000000,0> translate<24.725028,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.843841,-1.535000,36.761797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.286356,-1.535000,36.761797>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<24.843841,-1.535000,36.761797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.945056,-1.535000,27.930397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.169109,-1.535000,27.837591>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<24.945056,-1.535000,27.930397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.953631,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.600000,-1.535000,40.640000>}
box{<0,0,-0.203200><9.646369,0.035000,0.203200> rotate<0,0.000000,0> translate<24.953631,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.131428,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.167066,-1.535000,20.320000>}
box{<0,0,-0.203200><17.035637,0.035000,0.203200> rotate<0,0.000000,0> translate<25.131428,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.169109,-1.535000,27.837591>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.340591,-1.535000,27.666109>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<25.169109,-1.535000,27.837591> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.340591,-1.535000,27.666109>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.433397,-1.535000,27.442056>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<25.340591,-1.535000,27.666109> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.353397,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.605572,-1.535000,27.635200>}
box{<0,0,-0.203200><4.252175,0.035000,0.203200> rotate<0,0.000000,0> translate<25.353397,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.360031,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223359,-1.535000,41.046400>}
box{<0,0,-0.203200><7.863328,0.035000,0.203200> rotate<0,0.000000,0> translate<25.360031,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.433397,-1.535000,26.368028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.433397,-1.535000,27.442056>}
box{<0,0,-0.203200><1.074028,0.035000,0.203200> rotate<0,90.000000,0> translate<25.433397,-1.535000,27.442056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.433397,-1.535000,26.368028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.944231,-1.535000,25.857197>}
box{<0,0,-0.203200><0.722427,0.035000,0.203200> rotate<0,44.996855,0> translate<25.433397,-1.535000,26.368028> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.433397,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.148000,-1.535000,26.416000>}
box{<0,0,-0.203200><2.714603,0.035000,0.203200> rotate<0,0.000000,0> translate<25.433397,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.433397,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.183931,-1.535000,26.822400>}
box{<0,0,-0.203200><2.750534,0.035000,0.203200> rotate<0,0.000000,0> translate<25.433397,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.433397,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.199172,-1.535000,27.228800>}
box{<0,0,-0.203200><3.765775,0.035000,0.203200> rotate<0,0.000000,0> translate<25.433397,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.504744,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.456997,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<25.504744,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.512425,-1.535000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.493631,-1.535000,22.351997>}
box{<0,0,-0.203200><2.801847,0.035000,0.203200> rotate<0,44.996985,0> translate<25.512425,-1.535000,24.333200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.512425,-1.535000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.294772,-1.535000,24.333200>}
box{<0,0,-0.203200><2.782347,0.035000,0.203200> rotate<0,0.000000,0> translate<25.512425,-1.535000,24.333200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.537828,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.248400,-1.535000,19.913600>}
box{<0,0,-0.203200><12.710572,0.035000,0.203200> rotate<0,0.000000,0> translate<25.537828,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.537991,-1.535000,41.224359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,41.504425>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<25.537991,-1.535000,41.224359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.632613,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.164400,-1.535000,41.452800>}
box{<0,0,-0.203200><7.531788,0.035000,0.203200> rotate<0,0.000000,0> translate<25.632613,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.639431,-1.535000,19.811997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.206313,-1.535000,19.811997>}
box{<0,0,-0.203200><12.566881,0.035000,0.203200> rotate<0,0.000000,0> translate<25.639431,-1.535000,19.811997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,41.504425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,51.228653>}
box{<0,0,-0.203200><9.724228,0.035000,0.203200> rotate<0,90.000000,0> translate<25.653997,-1.535000,51.228653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.718600,-1.535000,41.859200>}
box{<0,0,-0.203200><0.064603,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,42.265600>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,42.672000>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,43.078400>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,43.484800>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,43.891200>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,44.297600>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,44.704000>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,45.110400>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,45.516800>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,45.923200>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,46.329600>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,46.736000>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,47.142400>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,47.548800>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,47.955200>}
box{<0,0,-0.203200><0.025403,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.734388,-1.535000,48.361600>}
box{<0,0,-0.203200><0.080391,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.234688,-1.535000,48.768000>}
box{<0,0,-0.203200><5.580691,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.823034,-1.535000,49.174400>}
box{<0,0,-0.203200><5.169038,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.411378,-1.535000,49.580800>}
box{<0,0,-0.203200><4.757381,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.999722,-1.535000,49.987200>}
box{<0,0,-0.203200><4.345725,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.588066,-1.535000,50.393600>}
box{<0,0,-0.203200><3.934069,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.176413,-1.535000,50.800000>}
box{<0,0,-0.203200><3.522416,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.531053,-1.535000,51.206400>}
box{<0,0,-0.203200><1.877056,0.035000,0.203200> rotate<0,0.000000,0> translate<25.653997,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.653997,-1.535000,51.228653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.456997,-1.535000,52.031653>}
box{<0,0,-0.203200><1.135613,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.653997,-1.535000,51.228653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,41.953841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.772206,-1.535000,41.729788>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<25.679400,-1.535000,41.953841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,48.228856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,41.953841>}
box{<0,0,-0.203200><6.275016,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.679400,-1.535000,41.953841> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,-1.535000,48.228856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.772206,-1.535000,48.452909>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<25.679400,-1.535000,48.228856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.772206,-1.535000,41.729788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.943688,-1.535000,41.558306>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<25.772206,-1.535000,41.729788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.772206,-1.535000,48.452909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.943688,-1.535000,48.624391>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.772206,-1.535000,48.452909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.784141,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.378656,-1.535000,54.051200>}
box{<0,0,-0.203200><1.594516,0.035000,0.203200> rotate<0,0.000000,0> translate<25.784141,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.791828,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979969,-1.535000,26.009600>}
box{<0,0,-0.203200><2.188141,0.035000,0.203200> rotate<0,0.000000,0> translate<25.791828,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.868028,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,23.977600>}
box{<0,0,-0.203200><3.365372,0.035000,0.203200> rotate<0,0.000000,0> translate<25.868028,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.943688,-1.535000,41.558306>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.167741,-1.535000,41.465500>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<25.943688,-1.535000,41.558306> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.943688,-1.535000,48.624391>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.167741,-1.535000,48.717197>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<25.943688,-1.535000,48.624391> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.944231,-1.535000,25.857197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.827566,-1.535000,25.857197>}
box{<0,0,-0.203200><1.883334,0.035000,0.203200> rotate<0,0.000000,0> translate<25.944231,-1.535000,25.857197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.038144,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.124653,-1.535000,51.612800>}
box{<0,0,-0.203200><1.086509,0.035000,0.203200> rotate<0,0.000000,0> translate<26.038144,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.167741,-1.535000,41.465500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.727756,-1.535000,41.465500>}
box{<0,0,-0.203200><0.560016,0.035000,0.203200> rotate<0,0.000000,0> translate<26.167741,-1.535000,41.465500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.167741,-1.535000,48.717197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.472541,-1.535000,48.717197>}
box{<0,0,-0.203200><0.304800,0.035000,0.203200> rotate<0,0.000000,0> translate<26.167741,-1.535000,48.717197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.190541,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.972256,-1.535000,53.644800>}
box{<0,0,-0.203200><0.781716,0.035000,0.203200> rotate<0,0.000000,0> translate<26.190541,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.257672,-1.535000,28.492000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.537738,-1.535000,28.608006>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<26.257672,-1.535000,28.492000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.274428,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,23.571200>}
box{<0,0,-0.203200><2.958972,0.035000,0.203200> rotate<0,0.000000,0> translate<26.274428,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.286356,-1.535000,36.761797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.510409,-1.535000,36.668991>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<26.286356,-1.535000,36.761797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.404897,-1.535000,31.927800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496191,-1.535000,31.836509>}
box{<0,0,-0.203200><0.129107,0.035000,0.203200> rotate<0,44.996050,0> translate<26.404897,-1.535000,31.927800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.404897,-1.535000,31.927800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.981622,-1.535000,31.927800>}
box{<0,0,-0.203200><5.576725,0.035000,0.203200> rotate<0,0.000000,0> translate<26.404897,-1.535000,31.927800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.444544,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.718253,-1.535000,52.019200>}
box{<0,0,-0.203200><0.273709,0.035000,0.203200> rotate<0,0.000000,0> translate<26.444544,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.456997,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.456997,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,90.000000,0> translate<26.456997,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.456997,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705800,-1.535000,52.425600>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.456997,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.456997,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705800,-1.535000,52.832000>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.456997,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.456997,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705800,-1.535000,53.238400>}
box{<0,0,-0.203200><0.248803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.456997,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.472541,-1.535000,48.717197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.474256,-1.535000,48.717197>}
box{<0,0,-0.203200><4.001716,0.035000,0.203200> rotate<0,0.000000,0> translate<26.472541,-1.535000,48.717197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.496191,-1.535000,31.836509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.588997,-1.535000,31.612456>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<26.496191,-1.535000,31.836509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.510409,-1.535000,36.668991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.665203,-1.535000,36.514197>}
box{<0,0,-0.203200><0.218911,0.035000,0.203200> rotate<0,44.997030,0> translate<26.510409,-1.535000,36.668991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.532006,-1.535000,21.158359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.746359,-1.535000,20.944006>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,44.997030,0> translate<26.532006,-1.535000,21.158359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.537738,-1.535000,28.608006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.111228,-1.535000,29.181500>}
box{<0,0,-0.203200><0.811040,0.035000,0.203200> rotate<0,-44.997186,0> translate<26.537738,-1.535000,28.608006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.553069,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,31.699200>}
box{<0,0,-0.203200><5.399331,0.035000,0.203200> rotate<0,0.000000,0> translate<26.553069,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.588997,-1.535000,31.545628>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.588997,-1.535000,31.612456>}
box{<0,0,-0.203200><0.066828,0.035000,0.203200> rotate<0,90.000000,0> translate<26.588997,-1.535000,31.612456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.588997,-1.535000,31.545628>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.721941,-1.535000,31.600697>}
box{<0,0,-0.203200><0.143898,0.035000,0.203200> rotate<0,-22.499120,0> translate<26.588997,-1.535000,31.545628> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.603400,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,36.576000>}
box{<0,0,-0.203200><0.274600,0.035000,0.203200> rotate<0,0.000000,0> translate<26.603400,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.665203,-1.535000,36.514197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,36.514197>}
box{<0,0,-0.203200><0.212797,0.035000,0.203200> rotate<0,0.000000,0> translate<26.665203,-1.535000,36.514197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.680828,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,23.164800>}
box{<0,0,-0.203200><2.552572,0.035000,0.203200> rotate<0,0.000000,0> translate<26.680828,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705800,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.658053,-1.535000,51.079400>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<26.705800,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705800,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705800,-1.535000,52.031653>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.705800,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.705800,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.658053,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.705800,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.721941,-1.535000,31.600697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.764456,-1.535000,31.600697>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<26.721941,-1.535000,31.600697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.727756,-1.535000,41.465500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.758416,-1.535000,41.478200>}
box{<0,0,-0.203200><0.033186,0.035000,0.203200> rotate<0,-22.499266,0> translate<26.727756,-1.535000,41.465500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.746359,-1.535000,20.944006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.026425,-1.535000,20.828000>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,22.498388,0> translate<26.746359,-1.535000,20.944006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.758416,-1.535000,41.478200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.883581,-1.535000,41.478200>}
box{<0,0,-0.203200><3.125166,0.035000,0.203200> rotate<0,0.000000,0> translate<26.758416,-1.535000,41.478200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.784128,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.651400,-1.535000,28.854400>}
box{<0,0,-0.203200><2.867272,0.035000,0.203200> rotate<0,0.000000,0> translate<26.784128,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,37.327456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,36.514197>}
box{<0,0,-0.203200><0.813259,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.878000,-1.535000,36.514197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,37.327456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,-1.535000,37.551509>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<26.878000,-1.535000,37.327456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,-1.535000,37.551509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,-1.535000,37.722991>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.970806,-1.535000,37.551509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.026425,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.270516,-1.535000,20.828000>}
box{<0,0,-0.203200><11.244091,0.035000,0.203200> rotate<0,0.000000,0> translate<27.026425,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.087228,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,22.758400>}
box{<0,0,-0.203200><2.146172,0.035000,0.203200> rotate<0,0.000000,0> translate<27.087228,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.111228,-1.535000,29.181500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.764456,-1.535000,29.181500>}
box{<0,0,-0.203200><0.653228,0.035000,0.203200> rotate<0,0.000000,0> translate<27.111228,-1.535000,29.181500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,-1.535000,37.722991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,-1.535000,37.815797>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<27.142288,-1.535000,37.722991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,-1.535000,37.815797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,-1.535000,37.815797>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<27.366341,-1.535000,37.815797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.493628,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.481394,-1.535000,22.352000>}
box{<0,0,-0.203200><1.987766,0.035000,0.203200> rotate<0,0.000000,0> translate<27.493628,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.493631,-1.535000,22.351997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.481400,-1.535000,22.351997>}
box{<0,0,-0.203200><1.987769,0.035000,0.203200> rotate<0,0.000000,0> translate<27.493631,-1.535000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.658053,-1.535000,51.079400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.893400,-1.535000,51.079400>}
box{<0,0,-0.203200><1.235347,0.035000,0.203200> rotate<0,0.000000,0> translate<27.658053,-1.535000,51.079400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.658053,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.004744,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<27.658053,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.764456,-1.535000,29.181500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.988509,-1.535000,29.274306>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<27.764456,-1.535000,29.181500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.764456,-1.535000,31.600697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.988509,-1.535000,31.507891>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<27.764456,-1.535000,31.600697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.827566,-1.535000,25.857197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.148000,-1.535000,26.177631>}
box{<0,0,-0.203200><0.453163,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.827566,-1.535000,25.857197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.955900,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.671509,-1.535000,29.260800>}
box{<0,0,-0.203200><1.715609,0.035000,0.203200> rotate<0,0.000000,0> translate<27.955900,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.988509,-1.535000,29.274306>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.159991,-1.535000,29.445788>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.988509,-1.535000,29.274306> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.988509,-1.535000,31.507891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.159991,-1.535000,31.336409>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.988509,-1.535000,31.507891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.148000,-1.535000,26.735656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.148000,-1.535000,26.177631>}
box{<0,0,-0.203200><0.558025,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.148000,-1.535000,26.177631> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.148000,-1.535000,26.735656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.240806,-1.535000,26.959709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.148000,-1.535000,26.735656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.159991,-1.535000,29.445788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.252797,-1.535000,29.669841>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.159991,-1.535000,29.445788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.159991,-1.535000,31.336409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.252797,-1.535000,31.112356>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.159991,-1.535000,31.336409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.178056,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,31.292800>}
box{<0,0,-0.203200><3.774344,0.035000,0.203200> rotate<0,0.000000,0> translate<28.178056,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.240806,-1.535000,26.959709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.412288,-1.535000,27.131191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.240806,-1.535000,26.959709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.251700,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059116,-1.535000,29.667200>}
box{<0,0,-0.203200><1.807416,0.035000,0.203200> rotate<0,0.000000,0> translate<28.251700,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.252797,-1.535000,29.669841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.252797,-1.535000,31.112356>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<28.252797,-1.535000,31.112356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.252797,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,30.073600>}
box{<0,0,-0.203200><3.751203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.252797,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.252797,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,30.480000>}
box{<0,0,-0.203200><3.699603,0.035000,0.203200> rotate<0,0.000000,0> translate<28.252797,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.252797,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,30.886400>}
box{<0,0,-0.203200><3.699603,0.035000,0.203200> rotate<0,0.000000,0> translate<28.252797,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.294772,-1.535000,24.333200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.574838,-1.535000,24.449206>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<28.294772,-1.535000,24.333200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.412288,-1.535000,27.131191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.636341,-1.535000,27.223997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<28.412288,-1.535000,27.131191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.417413,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,24.384000>}
box{<0,0,-0.203200><0.815988,0.035000,0.203200> rotate<0,0.000000,0> translate<28.417413,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,-1.535000,37.815797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,-1.535000,37.722991>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<28.513656,-1.535000,37.815797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.563384,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.009541,-1.535000,37.795200>}
box{<0,0,-0.203200><3.446156,0.035000,0.203200> rotate<0,0.000000,0> translate<28.563384,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.574838,-1.535000,24.449206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.225631,-1.535000,25.100000>}
box{<0,0,-0.203200><0.920361,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.574838,-1.535000,24.449206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.636341,-1.535000,27.223997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.194366,-1.535000,27.223997>}
box{<0,0,-0.203200><0.558025,0.035000,0.203200> rotate<0,0.000000,0> translate<28.636341,-1.535000,27.223997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,-1.535000,37.722991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,-1.535000,37.551509>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.737709,-1.535000,37.722991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.893400,-1.535000,51.079400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,48.458197>}
box{<0,0,-0.203200><3.730987,0.035000,0.203200> rotate<0,44.628971,0> translate<28.893400,-1.535000,51.079400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,-1.535000,37.551509>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001222,-1.535000,37.329322>}
box{<0,0,-0.203200><0.240493,0.035000,0.203200> rotate<0,67.495947,0> translate<28.909191,-1.535000,37.551509> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.916031,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.368797,-1.535000,24.790400>}
box{<0,0,-0.203200><0.452766,0.035000,0.203200> rotate<0,0.000000,0> translate<28.916031,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.976588,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.060700,-1.535000,37.388800>}
box{<0,0,-0.203200><0.084112,0.035000,0.203200> rotate<0,0.000000,0> translate<28.976588,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001222,-1.535000,37.329322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.153688,-1.535000,37.481791>}
box{<0,0,-0.203200><0.215621,0.035000,0.203200> rotate<0,-44.997617,0> translate<29.001222,-1.535000,37.329322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.004744,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.235400,-1.535000,54.099938>}
box{<0,0,-0.203200><0.326199,0.035000,0.203200> rotate<0,44.997418,0> translate<29.004744,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.153688,-1.535000,37.481791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.377741,-1.535000,37.574597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.153688,-1.535000,37.481791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.194366,-1.535000,27.223997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.830134,-1.535000,27.859763>}
box{<0,0,-0.203200><0.899111,0.035000,0.203200> rotate<0,-44.996889,0> translate<29.194366,-1.535000,27.223997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.225631,-1.535000,25.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.783656,-1.535000,25.100000>}
box{<0,0,-0.203200><0.558025,0.035000,0.203200> rotate<0,0.000000,0> translate<29.225631,-1.535000,25.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,22.731241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.326206,-1.535000,22.507188>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<29.233400,-1.535000,22.731241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,24.523756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,22.731241>}
box{<0,0,-0.203200><1.792516,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.233400,-1.535000,22.731241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,24.523756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.326206,-1.535000,24.747809>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<29.233400,-1.535000,24.523756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.235400,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.235400,-1.535000,54.099938>}
box{<0,0,-0.203200><0.510062,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.235400,-1.535000,54.099938> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.326206,-1.535000,22.507188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.481400,-1.535000,22.351997>}
box{<0,0,-0.203200><0.219475,0.035000,0.203200> rotate<0,44.996453,0> translate<29.326206,-1.535000,22.507188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.326206,-1.535000,24.747809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.497688,-1.535000,24.919291>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.326206,-1.535000,24.747809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.377741,-1.535000,37.574597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.820256,-1.535000,37.574597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<29.377741,-1.535000,37.574597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.497688,-1.535000,24.919291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.721741,-1.535000,25.012097>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.497688,-1.535000,24.919291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.651400,-1.535000,28.169741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.744206,-1.535000,27.945688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<29.651400,-1.535000,28.169741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.651400,-1.535000,29.212256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.651400,-1.535000,28.169741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.651400,-1.535000,28.169741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.651400,-1.535000,29.212256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.744206,-1.535000,29.436309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<29.651400,-1.535000,29.212256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.721741,-1.535000,25.012097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.964256,-1.535000,25.012097>}
box{<0,0,-0.203200><1.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<29.721741,-1.535000,25.012097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.744206,-1.535000,27.945688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.830134,-1.535000,27.859763>}
box{<0,0,-0.203200><0.121519,0.035000,0.203200> rotate<0,44.995988,0> translate<29.744206,-1.535000,27.945688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.744206,-1.535000,29.436309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.915688,-1.535000,29.607791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.744206,-1.535000,29.436309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.783656,-1.535000,25.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.007709,-1.535000,25.192806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.783656,-1.535000,25.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.883581,-1.535000,41.478200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.914241,-1.535000,41.465500>}
box{<0,0,-0.203200><0.033186,0.035000,0.203200> rotate<0,22.499266,0> translate<29.883581,-1.535000,41.478200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.914241,-1.535000,41.465500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.474256,-1.535000,41.465500>}
box{<0,0,-0.203200><0.560016,0.035000,0.203200> rotate<0,0.000000,0> translate<29.914241,-1.535000,41.465500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.915688,-1.535000,29.607791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.139741,-1.535000,29.700597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.915688,-1.535000,29.607791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.007709,-1.535000,25.192806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.179191,-1.535000,25.364287>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.007709,-1.535000,25.192806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.011703,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.174422,-1.535000,25.196800>}
box{<0,0,-0.203200><12.162719,0.035000,0.203200> rotate<0,0.000000,0> translate<30.011703,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.139741,-1.535000,29.700597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.582256,-1.535000,29.700597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<30.139741,-1.535000,29.700597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.179191,-1.535000,25.364287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,-1.535000,25.588341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<30.179191,-1.535000,25.364287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,-1.535000,25.588341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,-1.535000,26.146366>}
box{<0,0,-0.203200><0.558025,0.035000,0.203200> rotate<0,90.000000,0> translate<30.271997,-1.535000,26.146366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.175034,-1.535000,25.603200>}
box{<0,0,-0.203200><11.903037,0.035000,0.203200> rotate<0,0.000000,0> translate<30.271997,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.175647,-1.535000,26.009600>}
box{<0,0,-0.203200><11.903650,0.035000,0.203200> rotate<0,0.000000,0> translate<30.271997,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,-1.535000,26.146366>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.506991,-1.535000,27.381359>}
box{<0,0,-0.203200><1.746545,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.271997,-1.535000,26.146366> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.474256,-1.535000,41.465500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.698309,-1.535000,41.558306>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<30.474256,-1.535000,41.465500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.474256,-1.535000,48.717197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.698309,-1.535000,48.624391>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<30.474256,-1.535000,48.717197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.541631,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.176259,-1.535000,26.416000>}
box{<0,0,-0.203200><11.634628,0.035000,0.203200> rotate<0,0.000000,0> translate<30.541631,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.698309,-1.535000,41.558306>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.869791,-1.535000,41.729788>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.698309,-1.535000,41.558306> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.698309,-1.535000,48.624391>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.869791,-1.535000,48.452909>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<30.698309,-1.535000,48.624391> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,52.375109>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,54.610000>}
box{<0,0,-0.203200><2.234891,0.035000,0.203200> rotate<0,90.000000,0> translate<30.708597,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,52.375109>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.822256,-1.535000,49.261450>}
box{<0,0,-0.203200><4.403379,0.035000,0.203200> rotate<0,44.997030,0> translate<30.708597,-1.535000,52.375109> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.705800,-1.535000,52.425600>}
box{<0,0,-0.203200><2.997203,0.035000,0.203200> rotate<0,0.000000,0> translate<30.708597,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.705800,-1.535000,52.832000>}
box{<0,0,-0.203200><2.997203,0.035000,0.203200> rotate<0,0.000000,0> translate<30.708597,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.705800,-1.535000,53.238400>}
box{<0,0,-0.203200><2.997203,0.035000,0.203200> rotate<0,0.000000,0> translate<30.708597,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.972256,-1.535000,53.644800>}
box{<0,0,-0.203200><3.263659,0.035000,0.203200> rotate<0,0.000000,0> translate<30.708597,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.378656,-1.535000,54.051200>}
box{<0,0,-0.203200><3.670059,0.035000,0.203200> rotate<0,0.000000,0> translate<30.708597,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.444766,-1.535000,54.457600>}
box{<0,0,-0.203200><7.736169,0.035000,0.203200> rotate<0,0.000000,0> translate<30.708597,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708597,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.292366,-1.535000,54.610000>}
box{<0,0,-0.203200><7.583769,0.035000,0.203200> rotate<0,0.000000,0> translate<30.708597,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.820256,-1.535000,37.574597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.044309,-1.535000,37.481791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<30.820256,-1.535000,37.574597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.869791,-1.535000,41.729788>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,41.953841>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<30.869791,-1.535000,41.729788> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.869791,-1.535000,48.452909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,48.228856>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<30.869791,-1.535000,48.452909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.907613,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,48.361600>}
box{<0,0,-0.203200><0.640887,0.035000,0.203200> rotate<0,0.000000,0> translate<30.907613,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.923394,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.164400,-1.535000,41.859200>}
box{<0,0,-0.203200><2.241006,0.035000,0.203200> rotate<0,0.000000,0> translate<30.923394,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.948031,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.176872,-1.535000,26.822400>}
box{<0,0,-0.203200><11.228841,0.035000,0.203200> rotate<0,0.000000,0> translate<30.948031,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,41.953841>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,48.228856>}
box{<0,0,-0.203200><6.275016,0.035000,0.203200> rotate<0,90.000000,0> translate<30.962597,-1.535000,48.228856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.164400,-1.535000,42.265600>}
box{<0,0,-0.203200><2.201803,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.181278,-1.535000,42.672000>}
box{<0,0,-0.203200><2.218681,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.553284,-1.535000,43.078400>}
box{<0,0,-0.203200><2.590688,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.477094,-1.535000,43.484800>}
box{<0,0,-0.203200><0.514497,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,43.891200>}
box{<0,0,-0.203200><0.338303,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,44.297600>}
box{<0,0,-0.203200><0.338303,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,44.704000>}
box{<0,0,-0.203200><0.338303,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,45.110400>}
box{<0,0,-0.203200><0.338303,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.451700,-1.535000,45.516800>}
box{<0,0,-0.203200><0.489103,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,45.923200>}
box{<0,0,-0.203200><0.585903,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.301994,-1.535000,46.329600>}
box{<0,0,-0.203200><0.339397,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,46.736000>}
box{<0,0,-0.203200><0.338303,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,47.142400>}
box{<0,0,-0.203200><0.338303,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,47.548800>}
box{<0,0,-0.203200><0.338303,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.962597,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.375644,-1.535000,47.955200>}
box{<0,0,-0.203200><0.413047,0.035000,0.203200> rotate<0,0.000000,0> translate<30.962597,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.964256,-1.535000,25.012097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.072894,-1.535000,24.967097>}
box{<0,0,-0.203200><0.117589,0.035000,0.203200> rotate<0,22.498909,0> translate<30.964256,-1.535000,25.012097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.044309,-1.535000,37.481791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.199103,-1.535000,37.326997>}
box{<0,0,-0.203200><0.218911,0.035000,0.203200> rotate<0,44.997030,0> translate<31.044309,-1.535000,37.481791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.064506,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.718253,-1.535000,52.019200>}
box{<0,0,-0.203200><2.653747,0.035000,0.203200> rotate<0,0.000000,0> translate<31.064506,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.072894,-1.535000,24.967097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.694256,-1.535000,24.967097>}
box{<0,0,-0.203200><1.621363,0.035000,0.203200> rotate<0,0.000000,0> translate<31.072894,-1.535000,24.967097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.137300,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,37.388800>}
box{<0,0,-0.203200><0.815100,0.035000,0.203200> rotate<0,0.000000,0> translate<31.137300,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.199103,-1.535000,37.326997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,37.326997>}
box{<0,0,-0.203200><0.753297,0.035000,0.203200> rotate<0,0.000000,0> translate<31.199103,-1.535000,37.326997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.204597,-1.535000,22.351997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.359791,-1.535000,22.507188>}
box{<0,0,-0.203200><0.219475,0.035000,0.203200> rotate<0,-44.996453,0> translate<31.204597,-1.535000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.204597,-1.535000,22.351997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.188400,-1.535000,22.351997>}
box{<0,0,-0.203200><6.983803,0.035000,0.203200> rotate<0,0.000000,0> translate<31.204597,-1.535000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.204600,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.188400,-1.535000,22.352000>}
box{<0,0,-0.203200><6.983800,0.035000,0.203200> rotate<0,0.000000,0> translate<31.204600,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,43.792241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,43.568188>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<31.300900,-1.535000,43.792241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,45.234756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,43.792241>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.300900,-1.535000,43.792241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,45.234756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,45.458809>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<31.300900,-1.535000,45.234756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,46.332241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,46.108187>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<31.300900,-1.535000,46.332241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,47.774756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,46.332241>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.300900,-1.535000,46.332241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.300900,-1.535000,47.774756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,47.998809>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<31.300900,-1.535000,47.774756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.354431,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.177484,-1.535000,27.228800>}
box{<0,0,-0.203200><10.823053,0.035000,0.203200> rotate<0,0.000000,0> translate<31.354431,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.359791,-1.535000,22.507188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.452597,-1.535000,22.731241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<31.359791,-1.535000,22.507188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.364400,-1.535000,38.648741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.457206,-1.535000,38.424688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<31.364400,-1.535000,38.648741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.364400,-1.535000,40.091256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.364400,-1.535000,38.648741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.364400,-1.535000,38.648741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.364400,-1.535000,40.091256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.457206,-1.535000,40.315309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<31.364400,-1.535000,40.091256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,43.568188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.565188,-1.535000,43.396706>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<31.393706,-1.535000,43.568188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,45.458809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,45.613600>}
box{<0,0,-0.203200><0.218909,0.035000,0.203200> rotate<0,-44.996452,0> translate<31.393706,-1.535000,45.458809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,46.108187>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,45.953394>}
box{<0,0,-0.203200><0.218911,0.035000,0.203200> rotate<0,44.997030,0> translate<31.393706,-1.535000,46.108187> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.393706,-1.535000,47.998809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,48.153603>}
box{<0,0,-0.203200><0.218911,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.393706,-1.535000,47.998809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.452597,-1.535000,22.731241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.452597,-1.535000,22.947900>}
box{<0,0,-0.203200><0.216659,0.035000,0.203200> rotate<0,90.000000,0> translate<31.452597,-1.535000,22.947900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.452597,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.188400,-1.535000,22.758400>}
box{<0,0,-0.203200><6.735803,0.035000,0.203200> rotate<0,0.000000,0> translate<31.452597,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.452597,-1.535000,22.947900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.694256,-1.535000,22.947900>}
box{<0,0,-0.203200><1.241659,0.035000,0.203200> rotate<0,0.000000,0> translate<31.452597,-1.535000,22.947900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.457206,-1.535000,38.424688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.628688,-1.535000,38.253206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<31.457206,-1.535000,38.424688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.457206,-1.535000,40.315309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.628688,-1.535000,40.486791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.457206,-1.535000,40.315309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.470906,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.124653,-1.535000,51.612800>}
box{<0,0,-0.203200><2.653747,0.035000,0.203200> rotate<0,0.000000,0> translate<31.470906,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.506991,-1.535000,27.381359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.622997,-1.535000,27.661425>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<31.506991,-1.535000,27.381359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,45.953394>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,45.613600>}
box{<0,0,-0.203200><0.339794,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.548500,-1.535000,45.613600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,48.458197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.548500,-1.535000,48.153603>}
box{<0,0,-0.203200><0.304594,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.548500,-1.535000,48.153603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.565188,-1.535000,43.396706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.789241,-1.535000,43.303900>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.565188,-1.535000,43.396706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.582256,-1.535000,29.700597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.806309,-1.535000,29.607791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.582256,-1.535000,29.700597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.612131,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.928194,-1.535000,27.635200>}
box{<0,0,-0.203200><2.316062,0.035000,0.203200> rotate<0,0.000000,0> translate<31.612131,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.622997,-1.535000,27.661425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.622997,-1.535000,27.698275>}
box{<0,0,-0.203200><0.036850,0.035000,0.203200> rotate<0,90.000000,0> translate<31.622997,-1.535000,27.698275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.622997,-1.535000,27.698275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.806309,-1.535000,27.774206>}
box{<0,0,-0.203200><0.198416,0.035000,0.203200> rotate<0,-22.498709,0> translate<31.622997,-1.535000,27.698275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.628688,-1.535000,38.253206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.852741,-1.535000,38.160400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.628688,-1.535000,38.253206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.628688,-1.535000,40.486791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.852741,-1.535000,40.579597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<31.628688,-1.535000,40.486791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.662884,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.891572,-1.535000,29.667200>}
box{<0,0,-0.203200><0.228687,0.035000,0.203200> rotate<0,0.000000,0> translate<31.662884,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.789241,-1.535000,43.303900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831756,-1.535000,43.303900>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<31.789241,-1.535000,43.303900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.806309,-1.535000,27.774206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.977791,-1.535000,27.945688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.806309,-1.535000,27.774206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.806309,-1.535000,29.607791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.819234,-1.535000,29.594863>}
box{<0,0,-0.203200><0.018281,0.035000,0.203200> rotate<0,45.003955,0> translate<31.806309,-1.535000,29.607791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.819234,-1.535000,29.594863>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,29.779631>}
box{<0,0,-0.203200><0.261300,0.035000,0.203200> rotate<0,-44.997515,0> translate<31.819234,-1.535000,29.594863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.852741,-1.535000,38.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.881966,-1.535000,38.160400>}
box{<0,0,-0.203200><0.029225,0.035000,0.203200> rotate<0,0.000000,0> translate<31.852741,-1.535000,38.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.852741,-1.535000,40.579597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.895256,-1.535000,40.579597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<31.852741,-1.535000,40.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.877306,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.531053,-1.535000,51.206400>}
box{<0,0,-0.203200><2.653747,0.035000,0.203200> rotate<0,0.000000,0> translate<31.877306,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.881966,-1.535000,38.160400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.103134,-1.535000,37.939234>}
box{<0,0,-0.203200><0.312778,0.035000,0.203200> rotate<0,44.996625,0> translate<31.881966,-1.535000,38.160400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,30.414741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,30.290169>}
box{<0,0,-0.203200><0.134836,0.035000,0.203200> rotate<0,67.495294,0> translate<31.952400,-1.535000,30.414741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,31.857256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,30.414741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.952400,-1.535000,30.414741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,31.857256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.981622,-1.535000,31.927800>}
box{<0,0,-0.203200><0.076357,0.035000,0.203200> rotate<0,-67.494369,0> translate<31.952400,-1.535000,31.857256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,37.657256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,37.326997>}
box{<0,0,-0.203200><0.330259,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.952400,-1.535000,37.326997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.952400,-1.535000,37.657256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.045206,-1.535000,37.881309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<31.952400,-1.535000,37.657256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.977791,-1.535000,27.945688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.990384,-1.535000,27.976094>}
box{<0,0,-0.203200><0.032911,0.035000,0.203200> rotate<0,-67.497043,0> translate<31.977791,-1.535000,27.945688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.990384,-1.535000,27.976094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.059091,-1.535000,27.979000>}
box{<0,0,-0.203200><0.068768,0.035000,0.203200> rotate<0,-2.421987,0> translate<31.990384,-1.535000,27.976094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,30.290169>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,29.779631>}
box{<0,0,-0.203200><0.510538,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.004000,-1.535000,29.779631> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.045206,-1.535000,37.881309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.103134,-1.535000,37.939234>}
box{<0,0,-0.203200><0.081921,0.035000,0.203200> rotate<0,-44.995485,0> translate<32.045206,-1.535000,37.881309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.059091,-1.535000,27.979000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.194572,-1.535000,27.979000>}
box{<0,0,-0.203200><0.135481,0.035000,0.203200> rotate<0,0.000000,0> translate<32.059091,-1.535000,27.979000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.194572,-1.535000,27.979000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.209981,-1.535000,27.985384>}
box{<0,0,-0.203200><0.016680,0.035000,0.203200> rotate<0,-22.503602,0> translate<32.194572,-1.535000,27.979000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.209981,-1.535000,27.985384>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.226641,-1.535000,27.986088>}
box{<0,0,-0.203200><0.016674,0.035000,0.203200> rotate<0,-2.416630,0> translate<32.209981,-1.535000,27.985384> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.226641,-1.535000,27.986088>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.349453,-1.535000,28.043156>}
box{<0,0,-0.203200><0.135424,0.035000,0.203200> rotate<0,-24.921797,0> translate<32.226641,-1.535000,27.986088> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.283706,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.768366,-1.535000,50.800000>}
box{<0,0,-0.203200><4.484659,0.035000,0.203200> rotate<0,0.000000,0> translate<32.283706,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.346103,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.777400,-1.535000,28.041600>}
box{<0,0,-0.203200><1.431297,0.035000,0.203200> rotate<0,0.000000,0> translate<32.346103,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.349453,-1.535000,28.043156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.474638,-1.535000,28.095006>}
box{<0,0,-0.203200><0.135497,0.035000,0.203200> rotate<0,-22.497317,0> translate<32.349453,-1.535000,28.043156> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.474638,-1.535000,28.095006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.486434,-1.535000,28.106803>}
box{<0,0,-0.203200><0.016683,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.474638,-1.535000,28.095006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.486434,-1.535000,28.106803>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.501553,-1.535000,28.113828>}
box{<0,0,-0.203200><0.016671,0.035000,0.203200> rotate<0,-24.920519,0> translate<32.486434,-1.535000,28.106803> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.501553,-1.535000,28.113828>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.593187,-1.535000,28.213559>}
box{<0,0,-0.203200><0.135437,0.035000,0.203200> rotate<0,-47.419668,0> translate<32.501553,-1.535000,28.113828> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.593187,-1.535000,28.213559>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.197637,-1.535000,28.818006>}
box{<0,0,-0.203200><0.854819,0.035000,0.203200> rotate<0,-44.996882,0> translate<32.593187,-1.535000,28.213559> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.690106,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.174766,-1.535000,50.393600>}
box{<0,0,-0.203200><4.484659,0.035000,0.203200> rotate<0,0.000000,0> translate<32.690106,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.694256,-1.535000,22.947900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.918309,-1.535000,23.040706>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<32.694256,-1.535000,22.947900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.694256,-1.535000,24.967097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.918309,-1.535000,24.874291>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<32.694256,-1.535000,24.967097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.827628,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.777400,-1.535000,28.448000>}
box{<0,0,-0.203200><0.949772,0.035000,0.203200> rotate<0,0.000000,0> translate<32.827628,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831756,-1.535000,43.303900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055809,-1.535000,43.396706>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<32.831756,-1.535000,43.303900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.895256,-1.535000,40.579597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.119309,-1.535000,40.486791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<32.895256,-1.535000,40.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.918309,-1.535000,23.040706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.089791,-1.535000,23.212188>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.918309,-1.535000,23.040706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.918309,-1.535000,24.874291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.089791,-1.535000,24.702809>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<32.918309,-1.535000,24.874291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.002200,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.242072,-1.535000,24.790400>}
box{<0,0,-0.203200><5.239872,0.035000,0.203200> rotate<0,0.000000,0> translate<33.002200,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.042403,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,23.164800>}
box{<0,0,-0.203200><5.140997,0.035000,0.203200> rotate<0,0.000000,0> translate<33.042403,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055809,-1.535000,43.396706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.210500,-1.535000,43.551397>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.055809,-1.535000,43.396706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.089791,-1.535000,23.212188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.182597,-1.535000,23.436241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.089791,-1.535000,23.212188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.089791,-1.535000,24.702809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.182597,-1.535000,24.478756>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.089791,-1.535000,24.702809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.096506,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.581166,-1.535000,49.987200>}
box{<0,0,-0.203200><4.484659,0.035000,0.203200> rotate<0,0.000000,0> translate<33.096506,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.119309,-1.535000,40.486791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,40.332100>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,44.997030,0> translate<33.119309,-1.535000,40.486791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.143903,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.277094,-1.535000,43.484800>}
box{<0,0,-0.203200><0.133191,0.035000,0.203200> rotate<0,0.000000,0> translate<33.143903,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.164400,-1.535000,41.188741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.257206,-1.535000,40.964688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.164400,-1.535000,41.188741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.164400,-1.535000,42.631256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.164400,-1.535000,41.188741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.164400,-1.535000,41.188741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.164400,-1.535000,42.631256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.257206,-1.535000,42.855309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.164400,-1.535000,42.631256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.182597,-1.535000,23.436241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.182597,-1.535000,24.478756>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<33.182597,-1.535000,24.478756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.182597,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,23.571200>}
box{<0,0,-0.203200><5.000803,0.035000,0.203200> rotate<0,0.000000,0> translate<33.182597,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.182597,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,23.977600>}
box{<0,0,-0.203200><5.000803,0.035000,0.203200> rotate<0,0.000000,0> translate<33.182597,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.182597,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,24.384000>}
box{<0,0,-0.203200><5.000803,0.035000,0.203200> rotate<0,0.000000,0> translate<33.182597,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.197637,-1.535000,28.818006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.396869,-1.535000,29.017241>}
box{<0,0,-0.203200><0.281758,0.035000,0.203200> rotate<0,-44.997479,0> translate<33.197637,-1.535000,28.818006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.210500,-1.535000,43.551397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.365188,-1.535000,43.396706>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<33.210500,-1.535000,43.551397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.234028,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.541578,-1.535000,28.854400>}
box{<0,0,-0.203200><0.307550,0.035000,0.203200> rotate<0,0.000000,0> translate<33.234028,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.257206,-1.535000,40.964688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.428688,-1.535000,40.793206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<33.257206,-1.535000,40.964688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.257206,-1.535000,42.855309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.428688,-1.535000,43.026791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.257206,-1.535000,42.855309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,40.332100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.428688,-1.535000,40.486791>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,-44.997609,0> translate<33.274000,-1.535000,40.332100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.365188,-1.535000,43.396706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.589241,-1.535000,43.303900>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<33.365188,-1.535000,43.396706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.396869,-1.535000,29.017241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401984,-1.535000,29.003622>}
box{<0,0,-0.203200><0.014548,0.035000,0.203200> rotate<0,69.407683,0> translate<33.396869,-1.535000,29.017241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.401984,-1.535000,29.003622>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.410972,-1.535000,28.994016>}
box{<0,0,-0.203200><0.013155,0.035000,0.203200> rotate<0,46.902851,0> translate<33.401984,-1.535000,29.003622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.410972,-1.535000,28.994016>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.416006,-1.535000,28.981859>}
box{<0,0,-0.203200><0.013157,0.035000,0.203200> rotate<0,67.499201,0> translate<33.410972,-1.535000,28.994016> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.416006,-1.535000,28.981859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.514225,-1.535000,28.883641>}
box{<0,0,-0.203200><0.138902,0.035000,0.203200> rotate<0,44.997030,0> translate<33.416006,-1.535000,28.981859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.428688,-1.535000,40.486791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.652741,-1.535000,40.579597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.428688,-1.535000,40.486791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.428688,-1.535000,40.793206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.652741,-1.535000,40.700400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<33.428688,-1.535000,40.793206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.428688,-1.535000,43.026791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.652741,-1.535000,43.119597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.428688,-1.535000,43.026791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.502906,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.987566,-1.535000,49.580800>}
box{<0,0,-0.203200><4.484659,0.035000,0.203200> rotate<0,0.000000,0> translate<33.502906,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.514225,-1.535000,28.883641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.777400,-1.535000,28.602316>}
box{<0,0,-0.203200><0.385233,0.035000,0.203200> rotate<0,46.906057,0> translate<33.514225,-1.535000,28.883641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.589241,-1.535000,43.303900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.225191,-1.535000,43.303900>}
box{<0,0,-0.203200><0.635950,0.035000,0.203200> rotate<0,0.000000,0> translate<33.589241,-1.535000,43.303900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.652741,-1.535000,40.579597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.600000,-1.535000,40.579597>}
box{<0,0,-0.203200><0.947259,0.035000,0.203200> rotate<0,0.000000,0> translate<33.652741,-1.535000,40.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.652741,-1.535000,40.700400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.600000,-1.535000,40.700400>}
box{<0,0,-0.203200><0.947259,0.035000,0.203200> rotate<0,0.000000,0> translate<33.652741,-1.535000,40.700400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.652741,-1.535000,43.119597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.404775,-1.535000,43.119597>}
box{<0,0,-0.203200><0.752034,0.035000,0.203200> rotate<0,0.000000,0> translate<33.652741,-1.535000,43.119597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.705800,-1.535000,52.031653>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.658053,-1.535000,51.079400>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<33.705800,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.705800,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.705800,-1.535000,52.031653>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.705800,-1.535000,52.031653> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.705800,-1.535000,53.378344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.658053,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.705800,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.777400,-1.535000,27.917241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.870206,-1.535000,27.693188>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.777400,-1.535000,27.917241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.777400,-1.535000,28.602316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.777400,-1.535000,27.917241>}
box{<0,0,-0.203200><0.685075,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.777400,-1.535000,27.917241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.822256,-1.535000,49.261450>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,48.990719>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,67.495533,0> translate<33.822256,-1.535000,49.261450> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.858316,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.393966,-1.535000,49.174400>}
box{<0,0,-0.203200><4.535650,0.035000,0.203200> rotate<0,0.000000,0> translate<33.858316,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.870206,-1.535000,27.693188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.041688,-1.535000,27.521706>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<33.870206,-1.535000,27.693188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,46.456597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,48.990719>}
box{<0,0,-0.203200><2.534122,0.035000,0.203200> rotate<0,90.000000,0> translate<33.934397,-1.535000,48.990719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,46.456597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.287578,-1.535000,46.456597>}
box{<0,0,-0.203200><4.353181,0.035000,0.203200> rotate<0,0.000000,0> translate<33.934397,-1.535000,46.456597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.688900,-1.535000,46.736000>}
box{<0,0,-0.203200><4.754503,0.035000,0.203200> rotate<0,0.000000,0> translate<33.934397,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.688900,-1.535000,47.142400>}
box{<0,0,-0.203200><4.754503,0.035000,0.203200> rotate<0,0.000000,0> translate<33.934397,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.688900,-1.535000,47.548800>}
box{<0,0,-0.203200><4.754503,0.035000,0.203200> rotate<0,0.000000,0> translate<33.934397,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.763644,-1.535000,47.955200>}
box{<0,0,-0.203200><4.829247,0.035000,0.203200> rotate<0,0.000000,0> translate<33.934397,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,48.361600>}
box{<0,0,-0.203200><4.927603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.934397,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.934397,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.800366,-1.535000,48.768000>}
box{<0,0,-0.203200><4.865969,0.035000,0.203200> rotate<0,0.000000,0> translate<33.934397,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.041688,-1.535000,27.521706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.265741,-1.535000,27.428900>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<34.041688,-1.535000,27.521706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.225191,-1.535000,43.303900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.404775,-1.535000,43.119597>}
box{<0,0,-0.203200><0.257329,0.035000,0.203200> rotate<0,45.739929,0> translate<34.225191,-1.535000,43.303900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.265741,-1.535000,27.428900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.308256,-1.535000,27.428900>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<34.265741,-1.535000,27.428900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.441572,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.721637,-1.535000,2.148006>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<34.441572,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.441572,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.565909,-1.535000,2.032000>}
box{<0,0,-0.203200><9.124338,0.035000,0.203200> rotate<0,0.000000,0> translate<34.441572,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.600000,-1.535000,40.700400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.600000,-1.535000,40.579597>}
box{<0,0,-0.203200><0.120803,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.600000,-1.535000,40.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.658053,-1.535000,51.079400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.004744,-1.535000,51.079400>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<34.658053,-1.535000,51.079400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.658053,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.004744,-1.535000,54.330597>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<34.658053,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.721637,-1.535000,2.148006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.515638,-1.535000,4.942006>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.721637,-1.535000,2.148006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.012031,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.015172,-1.535000,2.438400>}
box{<0,0,-0.203200><9.003141,0.035000,0.203200> rotate<0,0.000000,0> translate<35.012031,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.308256,-1.535000,27.428900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.532309,-1.535000,27.521706>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.308256,-1.535000,27.428900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.418431,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,2.844800>}
box{<0,0,-0.203200><9.844369,0.035000,0.203200> rotate<0,0.000000,0> translate<35.418431,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.532309,-1.535000,27.521706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.703791,-1.535000,27.693188>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.532309,-1.535000,27.521706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.645803,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178097,-1.535000,27.635200>}
box{<0,0,-0.203200><6.532294,0.035000,0.203200> rotate<0,0.000000,0> translate<35.645803,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.703791,-1.535000,27.693188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.796597,-1.535000,27.917241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<35.703791,-1.535000,27.693188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.796597,-1.535000,27.917241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.796597,-1.535000,29.165772>}
box{<0,0,-0.203200><1.248531,0.035000,0.203200> rotate<0,90.000000,0> translate<35.796597,-1.535000,29.165772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.796597,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178709,-1.535000,28.041600>}
box{<0,0,-0.203200><6.382113,0.035000,0.203200> rotate<0,0.000000,0> translate<35.796597,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.796597,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.179325,-1.535000,28.448000>}
box{<0,0,-0.203200><6.382728,0.035000,0.203200> rotate<0,0.000000,0> translate<35.796597,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.796597,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.179938,-1.535000,28.854400>}
box{<0,0,-0.203200><6.383341,0.035000,0.203200> rotate<0,0.000000,0> translate<35.796597,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.796597,-1.535000,29.165772>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.890359,-1.535000,29.072006>}
box{<0,0,-0.203200><0.132602,0.035000,0.203200> rotate<0,44.997985,0> translate<35.796597,-1.535000,29.165772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.824831,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,3.251200>}
box{<0,0,-0.203200><9.437969,0.035000,0.203200> rotate<0,0.000000,0> translate<35.824831,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.890359,-1.535000,29.072006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.170425,-1.535000,28.956000>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,22.498388,0> translate<35.890359,-1.535000,29.072006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.004744,-1.535000,51.079400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.246856,-1.535000,51.321513>}
box{<0,0,-0.203200><0.342399,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.004744,-1.535000,51.079400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.004744,-1.535000,54.330597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.956997,-1.535000,53.378344>}
box{<0,0,-0.203200><1.346689,0.035000,0.203200> rotate<0,44.997030,0> translate<36.004744,-1.535000,54.330597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.131744,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.361966,-1.535000,51.206400>}
box{<0,0,-0.203200><0.230222,0.035000,0.203200> rotate<0,0.000000,0> translate<36.131744,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.170425,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.262341,-1.535000,28.956000>}
box{<0,0,-0.203200><4.091916,0.035000,0.203200> rotate<0,0.000000,0> translate<36.170425,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.231231,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,3.657600>}
box{<0,0,-0.203200><9.031569,0.035000,0.203200> rotate<0,0.000000,0> translate<36.231231,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.246856,-1.535000,51.321513>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,48.706366>}
box{<0,0,-0.203200><3.698374,0.035000,0.203200> rotate<0,44.997064,0> translate<36.246856,-1.535000,51.321513> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.284141,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.851166,-1.535000,54.051200>}
box{<0,0,-0.203200><2.567025,0.035000,0.203200> rotate<0,0.000000,0> translate<36.284141,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.637631,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,4.064000>}
box{<0,0,-0.203200><8.625169,0.035000,0.203200> rotate<0,0.000000,0> translate<36.637631,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.690541,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.257566,-1.535000,53.644800>}
box{<0,0,-0.203200><2.567025,0.035000,0.203200> rotate<0,0.000000,0> translate<36.690541,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.956997,-1.535000,52.766628>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.956997,-1.535000,53.378344>}
box{<0,0,-0.203200><0.611716,0.035000,0.203200> rotate<0,90.000000,0> translate<36.956997,-1.535000,53.378344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.956997,-1.535000,52.766628>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.055638,-1.535000,49.667991>}
box{<0,0,-0.203200><4.382137,0.035000,0.203200> rotate<0,44.997001,0> translate<36.956997,-1.535000,52.766628> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.956997,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.070366,-1.535000,52.832000>}
box{<0,0,-0.203200><3.113369,0.035000,0.203200> rotate<0,0.000000,0> translate<36.956997,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.956997,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.663966,-1.535000,53.238400>}
box{<0,0,-0.203200><2.706969,0.035000,0.203200> rotate<0,0.000000,0> translate<36.956997,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.044031,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,4.470400>}
box{<0,0,-0.203200><8.218769,0.035000,0.203200> rotate<0,0.000000,0> translate<37.044031,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.298028,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.476766,-1.535000,52.425600>}
box{<0,0,-0.203200><3.178737,0.035000,0.203200> rotate<0,0.000000,0> translate<37.298028,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.450431,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,4.876800>}
box{<0,0,-0.203200><7.812369,0.035000,0.203200> rotate<0,0.000000,0> translate<37.450431,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.515638,-1.535000,4.942006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.729991,-1.535000,5.156359>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.515638,-1.535000,4.942006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.704428,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.883166,-1.535000,52.019200>}
box{<0,0,-0.203200><3.178738,0.035000,0.203200> rotate<0,0.000000,0> translate<37.704428,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.729991,-1.535000,5.156359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.845997,-1.535000,5.436425>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<37.729991,-1.535000,5.156359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782528,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,5.283200>}
box{<0,0,-0.203200><7.480272,0.035000,0.203200> rotate<0,0.000000,0> translate<37.782528,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.845997,-1.535000,5.436425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.845997,-1.535000,6.128659>}
box{<0,0,-0.203200><0.692234,0.035000,0.203200> rotate<0,90.000000,0> translate<37.845997,-1.535000,6.128659> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.845997,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,5.689600>}
box{<0,0,-0.203200><7.416803,0.035000,0.203200> rotate<0,0.000000,0> translate<37.845997,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.845997,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.878653,-1.535000,6.096000>}
box{<0,0,-0.203200><0.032656,0.035000,0.203200> rotate<0,0.000000,0> translate<37.845997,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.845997,-1.535000,6.128659>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.036253,-1.535000,5.938400>}
box{<0,0,-0.203200><0.269065,0.035000,0.203200> rotate<0,44.997501,0> translate<37.845997,-1.535000,6.128659> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.036253,-1.535000,5.938400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.382944,-1.535000,5.938400>}
box{<0,0,-0.203200><1.346691,0.035000,0.203200> rotate<0,0.000000,0> translate<38.036253,-1.535000,5.938400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.110828,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.289566,-1.535000,51.612800>}
box{<0,0,-0.203200><3.178737,0.035000,0.203200> rotate<0,0.000000,0> translate<38.110828,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,23.106241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.193666,-1.535000,23.081463>}
box{<0,0,-0.203200><0.026820,0.035000,0.203200> rotate<0,67.491224,0> translate<38.183400,-1.535000,23.106241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,24.648756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,23.106241>}
box{<0,0,-0.203200><1.542516,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.183400,-1.535000,23.106241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.183400,-1.535000,24.648756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.276206,-1.535000,24.872809>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.183400,-1.535000,24.648756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.188400,-1.535000,23.068756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.188400,-1.535000,22.351997>}
box{<0,0,-0.203200><0.716759,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.188400,-1.535000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.188400,-1.535000,23.068756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.193666,-1.535000,23.081463>}
box{<0,0,-0.203200><0.013754,0.035000,0.203200> rotate<0,-67.485832,0> translate<38.188400,-1.535000,23.068756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.206313,-1.535000,19.811997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.281206,-1.535000,19.992809>}
box{<0,0,-0.203200><0.195710,0.035000,0.203200> rotate<0,-67.495881,0> translate<38.206313,-1.535000,19.811997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.270516,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.281206,-1.535000,20.802188>}
box{<0,0,-0.203200><0.027939,0.035000,0.203200> rotate<0,67.497937,0> translate<38.270516,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.276206,-1.535000,24.872809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.447688,-1.535000,25.044291>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.276206,-1.535000,24.872809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.281206,-1.535000,19.992809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.452688,-1.535000,20.164291>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.281206,-1.535000,19.992809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.281206,-1.535000,20.802188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.452688,-1.535000,20.630706>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<38.281206,-1.535000,20.802188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.287578,-1.535000,46.456597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.366388,-1.535000,46.470925>}
box{<0,0,-0.203200><0.080101,0.035000,0.203200> rotate<0,-10.303567,0> translate<38.287578,-1.535000,46.456597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.292366,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164503,-1.535000,50.737863>}
box{<0,0,-0.203200><5.476029,0.035000,0.203200> rotate<0,44.997030,0> translate<38.292366,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.366388,-1.535000,46.470925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.432684,-1.535000,46.456597>}
box{<0,0,-0.203200><0.067828,0.035000,0.203200> rotate<0,12.194434,0> translate<38.366388,-1.535000,46.470925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.432684,-1.535000,46.456597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.500519,-1.535000,46.456597>}
box{<0,0,-0.203200><0.067834,0.035000,0.203200> rotate<0,0.000000,0> translate<38.432684,-1.535000,46.456597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.447688,-1.535000,25.044291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.671741,-1.535000,25.137097>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<38.447688,-1.535000,25.044291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.452688,-1.535000,20.164291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.676741,-1.535000,20.257097>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<38.452688,-1.535000,20.164291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.452688,-1.535000,20.630706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.676741,-1.535000,20.537900>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<38.452688,-1.535000,20.630706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.469997,-1.535000,40.216103>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.469997,-1.535000,40.555894>}
box{<0,0,-0.203200><0.339791,0.035000,0.203200> rotate<0,90.000000,0> translate<38.469997,-1.535000,40.555894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.469997,-1.535000,40.216103>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.624791,-1.535000,40.061309>}
box{<0,0,-0.203200><0.218911,0.035000,0.203200> rotate<0,44.997030,0> translate<38.469997,-1.535000,40.216103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.469997,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.181256,-1.535000,40.233600>}
box{<0,0,-0.203200><3.711259,0.035000,0.203200> rotate<0,0.000000,0> translate<38.469997,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.469997,-1.535000,40.555894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.624791,-1.535000,40.710687>}
box{<0,0,-0.203200><0.218911,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.469997,-1.535000,40.555894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.500519,-1.535000,46.456597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.574516,-1.535000,46.425944>}
box{<0,0,-0.203200><0.080095,0.035000,0.203200> rotate<0,22.500244,0> translate<38.500519,-1.535000,46.456597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.517228,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.695966,-1.535000,51.206400>}
box{<0,0,-0.203200><3.178737,0.035000,0.203200> rotate<0,0.000000,0> translate<38.517228,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.554103,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.180606,-1.535000,40.640000>}
box{<0,0,-0.203200><3.626503,0.035000,0.203200> rotate<0,0.000000,0> translate<38.554103,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.574516,-1.535000,46.425944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.652813,-1.535000,46.409025>}
box{<0,0,-0.203200><0.080104,0.035000,0.203200> rotate<0,12.192460,0> translate<38.574516,-1.535000,46.425944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.599697,-1.535000,38.145597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.624791,-1.535000,38.170687>}
box{<0,0,-0.203200><0.035486,0.035000,0.203200> rotate<0,-44.993463,0> translate<38.599697,-1.535000,38.145597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.599697,-1.535000,38.145597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.933256,-1.535000,38.145597>}
box{<0,0,-0.203200><0.333559,0.035000,0.203200> rotate<0,0.000000,0> translate<38.599697,-1.535000,38.145597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.624791,-1.535000,38.170687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,38.394741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.624791,-1.535000,38.170687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.624791,-1.535000,40.061309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,39.837256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.624791,-1.535000,40.061309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.624791,-1.535000,40.710687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,40.934741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.624791,-1.535000,40.710687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.637594,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.184497,-1.535000,38.201600>}
box{<0,0,-0.203200><3.546903,0.035000,0.203200> rotate<0,0.000000,0> translate<38.637594,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.652813,-1.535000,46.409025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.688900,-1.535000,46.384038>}
box{<0,0,-0.203200><0.043894,0.035000,0.203200> rotate<0,34.696991,0> translate<38.652813,-1.535000,46.409025> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.671741,-1.535000,25.137097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.414256,-1.535000,25.137097>}
box{<0,0,-0.203200><1.742516,0.035000,0.203200> rotate<0,0.000000,0> translate<38.671741,-1.535000,25.137097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.676741,-1.535000,20.257097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.669256,-1.535000,20.257097>}
box{<0,0,-0.203200><1.992516,0.035000,0.203200> rotate<0,0.000000,0> translate<38.676741,-1.535000,20.257097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.676741,-1.535000,20.537900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.669256,-1.535000,20.537900>}
box{<0,0,-0.203200><1.992516,0.035000,0.203200> rotate<0,0.000000,0> translate<38.676741,-1.535000,20.537900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.687778,-1.535000,42.449241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,42.377256>}
box{<0,0,-0.203200><0.077916,0.035000,0.203200> rotate<0,67.494291,0> translate<38.687778,-1.535000,42.449241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.687778,-1.535000,42.449241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.091503,-1.535000,42.830822>}
box{<0,0,-0.203200><0.555516,0.035000,0.203200> rotate<0,-43.381961,0> translate<38.687778,-1.535000,42.449241> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.688900,-1.535000,47.774756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.688900,-1.535000,46.384038>}
box{<0,0,-0.203200><1.390719,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.688900,-1.535000,46.384038> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.688900,-1.535000,47.774756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.781706,-1.535000,47.998809>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.688900,-1.535000,47.774756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,38.394741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,39.837256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.717597,-1.535000,39.837256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.183847,-1.535000,38.608000>}
box{<0,0,-0.203200><3.466250,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.183200,-1.535000,39.014400>}
box{<0,0,-0.203200><3.465603,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.182553,-1.535000,39.420800>}
box{<0,0,-0.203200><3.464956,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.181903,-1.535000,39.827200>}
box{<0,0,-0.203200><3.464306,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,40.934741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,42.377256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.717597,-1.535000,42.377256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.179959,-1.535000,41.046400>}
box{<0,0,-0.203200><3.462362,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.179309,-1.535000,41.452800>}
box{<0,0,-0.203200><3.461712,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178663,-1.535000,41.859200>}
box{<0,0,-0.203200><3.461066,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.717597,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.178016,-1.535000,42.265600>}
box{<0,0,-0.203200><3.460419,0.035000,0.203200> rotate<0,0.000000,0> translate<38.717597,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.759572,-1.535000,56.133997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.039638,-1.535000,56.017991>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,22.498388,0> translate<38.759572,-1.535000,56.133997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.781706,-1.535000,47.998809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,48.079103>}
box{<0,0,-0.203200><0.113553,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.781706,-1.535000,47.998809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,48.706366>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,48.079103>}
box{<0,0,-0.203200><0.627263,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.862000,-1.535000,48.079103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.882209,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.735734,-1.535000,56.083200>}
box{<0,0,-0.203200><4.853525,0.035000,0.203200> rotate<0,0.000000,0> translate<38.882209,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.923462,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.177366,-1.535000,42.672000>}
box{<0,0,-0.203200><3.253903,0.035000,0.203200> rotate<0,0.000000,0> translate<38.923462,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.923628,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.102366,-1.535000,50.800000>}
box{<0,0,-0.203200><3.178738,0.035000,0.203200> rotate<0,0.000000,0> translate<38.923628,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.933256,-1.535000,38.145597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157309,-1.535000,38.052791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<38.933256,-1.535000,38.145597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.039638,-1.535000,56.017991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.253991,-1.535000,55.803638>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,44.997030,0> translate<39.039638,-1.535000,56.017991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.091503,-1.535000,42.830822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.101450,-1.535000,42.834941>}
box{<0,0,-0.203200><0.010766,0.035000,0.203200> rotate<0,-22.491728,0> translate<39.091503,-1.535000,42.830822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.101450,-1.535000,42.834941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.197738,-1.535000,42.931231>}
box{<0,0,-0.203200><0.136173,0.035000,0.203200> rotate<0,-44.997960,0> translate<39.101450,-1.535000,42.834941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157309,-1.535000,38.052791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.328791,-1.535000,37.881309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<39.157309,-1.535000,38.052791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.197738,-1.535000,42.931231>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.296647,-1.535000,43.024712>}
box{<0,0,-0.203200><0.136095,0.035000,0.203200> rotate<0,-43.381018,0> translate<39.197738,-1.535000,42.931231> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.228297,-1.535000,35.890197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.328791,-1.535000,35.990687>}
box{<0,0,-0.203200><0.142117,0.035000,0.203200> rotate<0,-44.996139,0> translate<39.228297,-1.535000,35.890197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.228297,-1.535000,35.890197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.188184,-1.535000,35.890197>}
box{<0,0,-0.203200><2.959887,0.035000,0.203200> rotate<0,0.000000,0> translate<39.228297,-1.535000,35.890197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.253991,-1.535000,55.803638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.465028,-1.535000,51.592597>}
box{<0,0,-0.203200><5.955309,0.035000,0.203200> rotate<0,44.997051,0> translate<39.253991,-1.535000,55.803638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.296647,-1.535000,43.024712>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.301044,-1.535000,43.034534>}
box{<0,0,-0.203200><0.010761,0.035000,0.203200> rotate<0,-65.879429,0> translate<39.296647,-1.535000,43.024712> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.301044,-1.535000,43.034534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.308656,-1.535000,43.042147>}
box{<0,0,-0.203200><0.010766,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.301044,-1.535000,43.034534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.308656,-1.535000,43.042147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.360756,-1.535000,43.167931>}
box{<0,0,-0.203200><0.136147,0.035000,0.203200> rotate<0,-67.496165,0> translate<39.308656,-1.535000,43.042147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.323672,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.176719,-1.535000,43.078400>}
box{<0,0,-0.203200><2.853047,0.035000,0.203200> rotate<0,0.000000,0> translate<39.323672,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.328791,-1.535000,35.990687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.421597,-1.535000,36.214741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.328791,-1.535000,35.990687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.328791,-1.535000,37.881309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.421597,-1.535000,37.657256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<39.328791,-1.535000,37.881309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.330028,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.165050,-1.535000,50.393600>}
box{<0,0,-0.203200><2.835022,0.035000,0.203200> rotate<0,0.000000,0> translate<39.330028,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.360756,-1.535000,43.167931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.364772,-1.535000,43.176900>}
box{<0,0,-0.203200><0.009827,0.035000,0.203200> rotate<0,-65.875910,0> translate<39.360756,-1.535000,43.167931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.364459,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.185144,-1.535000,37.795200>}
box{<0,0,-0.203200><2.820684,0.035000,0.203200> rotate<0,0.000000,0> translate<39.364459,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.364772,-1.535000,43.176900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.092756,-1.535000,43.176900>}
box{<0,0,-0.203200><0.727984,0.035000,0.203200> rotate<0,0.000000,0> translate<39.364772,-1.535000,43.176900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.380828,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.985147,-1.535000,55.676800>}
box{<0,0,-0.203200><4.604319,0.035000,0.203200> rotate<0,0.000000,0> translate<39.380828,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.382944,-1.535000,5.938400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.246541,-1.535000,6.802000>}
box{<0,0,-0.203200><1.221313,0.035000,0.203200> rotate<0,-44.997134,0> translate<39.382944,-1.535000,5.938400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.402897,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.187738,-1.535000,36.169600>}
box{<0,0,-0.203200><2.784841,0.035000,0.203200> rotate<0,0.000000,0> translate<39.402897,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.421597,-1.535000,36.214741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.421597,-1.535000,37.657256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<39.421597,-1.535000,37.657256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.421597,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.187088,-1.535000,36.576000>}
box{<0,0,-0.203200><2.765491,0.035000,0.203200> rotate<0,0.000000,0> translate<39.421597,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.421597,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.186441,-1.535000,36.982400>}
box{<0,0,-0.203200><2.764844,0.035000,0.203200> rotate<0,0.000000,0> translate<39.421597,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.421597,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.185794,-1.535000,37.388800>}
box{<0,0,-0.203200><2.764197,0.035000,0.203200> rotate<0,0.000000,0> translate<39.421597,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.540541,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,6.096000>}
box{<0,0,-0.203200><5.722259,0.035000,0.203200> rotate<0,0.000000,0> translate<39.540541,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.736428,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.165700,-1.535000,49.987200>}
box{<0,0,-0.203200><2.429272,0.035000,0.203200> rotate<0,0.000000,0> translate<39.736428,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.787228,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,55.270400>}
box{<0,0,-0.203200><5.475572,0.035000,0.203200> rotate<0,0.000000,0> translate<39.787228,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.946941,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,6.502400>}
box{<0,0,-0.203200><5.315859,0.035000,0.203200> rotate<0,0.000000,0> translate<39.946941,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.055638,-1.535000,49.667991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.269991,-1.535000,49.453637>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,44.997030,0> translate<40.055638,-1.535000,49.667991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.092756,-1.535000,43.176900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.316809,-1.535000,43.269706>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<40.092756,-1.535000,43.176900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.142828,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.166347,-1.535000,49.580800>}
box{<0,0,-0.203200><2.023519,0.035000,0.203200> rotate<0,0.000000,0> translate<40.142828,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.193628,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,54.864000>}
box{<0,0,-0.203200><5.069172,0.035000,0.203200> rotate<0,0.000000,0> translate<40.193628,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.246541,-1.535000,6.802000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.061572,-1.535000,6.802000>}
box{<0,0,-0.203200><1.815031,0.035000,0.203200> rotate<0,0.000000,0> translate<40.246541,-1.535000,6.802000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.262341,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.288825,-1.535000,28.947172>}
box{<0,0,-0.203200><0.027917,0.035000,0.203200> rotate<0,18.433732,0> translate<40.262341,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.269991,-1.535000,49.453637>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385997,-1.535000,49.173572>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,67.495673,0> translate<40.269991,-1.535000,49.453637> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.288825,-1.535000,28.947172>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.413041,-1.535000,28.956000>}
box{<0,0,-0.203200><0.124529,0.035000,0.203200> rotate<0,-4.064963,0> translate<40.288825,-1.535000,28.947172> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.304266,-1.535000,45.878906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.311616,-1.535000,45.505441>}
box{<0,0,-0.203200><0.373538,0.035000,0.203200> rotate<0,88.866669,0> translate<40.304266,-1.535000,45.878906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.304266,-1.535000,45.878906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.443809,-1.535000,45.936706>}
box{<0,0,-0.203200><0.151041,0.035000,0.203200> rotate<0,-22.498195,0> translate<40.304266,-1.535000,45.878906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.311394,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.172828,-1.535000,45.516800>}
box{<0,0,-0.203200><1.861434,0.035000,0.203200> rotate<0,0.000000,0> translate<40.311394,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.311616,-1.535000,45.505441>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.316809,-1.535000,45.503291>}
box{<0,0,-0.203200><0.005621,0.035000,0.203200> rotate<0,22.486070,0> translate<40.311616,-1.535000,45.505441> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.316809,-1.535000,43.269706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.488291,-1.535000,43.441188>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.316809,-1.535000,43.269706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.316809,-1.535000,45.503291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.488291,-1.535000,45.331809>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<40.316809,-1.535000,45.503291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385656,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.166994,-1.535000,49.174400>}
box{<0,0,-0.203200><1.781337,0.035000,0.203200> rotate<0,0.000000,0> translate<40.385656,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385997,-1.535000,48.194237>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385997,-1.535000,49.173572>}
box{<0,0,-0.203200><0.979334,0.035000,0.203200> rotate<0,90.000000,0> translate<40.385997,-1.535000,49.173572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385997,-1.535000,48.194237>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.443809,-1.535000,48.170291>}
box{<0,0,-0.203200><0.062576,0.035000,0.203200> rotate<0,22.498645,0> translate<40.385997,-1.535000,48.194237> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385997,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.168291,-1.535000,48.361600>}
box{<0,0,-0.203200><1.782294,0.035000,0.203200> rotate<0,0.000000,0> translate<40.385997,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385997,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.167644,-1.535000,48.768000>}
box{<0,0,-0.203200><1.781647,0.035000,0.203200> rotate<0,0.000000,0> translate<40.385997,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.411200,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.172181,-1.535000,45.923200>}
box{<0,0,-0.203200><1.760981,0.035000,0.203200> rotate<0,0.000000,0> translate<40.411200,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.413041,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.537572,-1.535000,28.956000>}
box{<0,0,-0.203200><0.124531,0.035000,0.203200> rotate<0,0.000000,0> translate<40.413041,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.414256,-1.535000,25.137097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.638309,-1.535000,25.044291>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<40.414256,-1.535000,25.137097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.443809,-1.535000,45.936706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.615291,-1.535000,46.108187>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.443809,-1.535000,45.936706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.443809,-1.535000,48.170291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.615291,-1.535000,47.998809>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<40.443809,-1.535000,48.170291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.488291,-1.535000,43.441188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.581097,-1.535000,43.665241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<40.488291,-1.535000,43.441188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.488291,-1.535000,45.331809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.581097,-1.535000,45.107756>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<40.488291,-1.535000,45.331809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.506353,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.176069,-1.535000,43.484800>}
box{<0,0,-0.203200><1.669716,0.035000,0.203200> rotate<0,0.000000,0> translate<40.506353,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.537572,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.563363,-1.535000,28.966684>}
box{<0,0,-0.203200><0.027916,0.035000,0.203200> rotate<0,-22.501451,0> translate<40.537572,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.563363,-1.535000,28.966684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.591206,-1.535000,28.968663>}
box{<0,0,-0.203200><0.027914,0.035000,0.203200> rotate<0,-4.063412,0> translate<40.563363,-1.535000,28.966684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.580003,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.173478,-1.535000,45.110400>}
box{<0,0,-0.203200><1.593475,0.035000,0.203200> rotate<0,0.000000,0> translate<40.580003,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.581097,-1.535000,43.665241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.581097,-1.535000,45.107756>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<40.581097,-1.535000,45.107756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.581097,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.175422,-1.535000,43.891200>}
box{<0,0,-0.203200><1.594325,0.035000,0.203200> rotate<0,0.000000,0> translate<40.581097,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.581097,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.174775,-1.535000,44.297600>}
box{<0,0,-0.203200><1.593678,0.035000,0.203200> rotate<0,0.000000,0> translate<40.581097,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.581097,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.174125,-1.535000,44.704000>}
box{<0,0,-0.203200><1.593028,0.035000,0.203200> rotate<0,0.000000,0> translate<40.581097,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.591206,-1.535000,28.968663>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.702566,-1.535000,29.024344>}
box{<0,0,-0.203200><0.124504,0.035000,0.203200> rotate<0,-26.563941,0> translate<40.591206,-1.535000,28.968663> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.600028,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,54.457600>}
box{<0,0,-0.203200><4.662772,0.035000,0.203200> rotate<0,0.000000,0> translate<40.600028,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.615291,-1.535000,46.108187>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.708097,-1.535000,46.332241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<40.615291,-1.535000,46.108187> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.615291,-1.535000,47.998809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.708097,-1.535000,47.774756>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<40.615291,-1.535000,47.998809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.633356,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.168941,-1.535000,47.955200>}
box{<0,0,-0.203200><1.535584,0.035000,0.203200> rotate<0,0.000000,0> translate<40.633356,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.638309,-1.535000,25.044291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.809791,-1.535000,24.872809>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<40.638309,-1.535000,25.044291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.669256,-1.535000,20.257097>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.893309,-1.535000,20.164291>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<40.669256,-1.535000,20.257097> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.669256,-1.535000,20.537900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.893309,-1.535000,20.630706>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<40.669256,-1.535000,20.537900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.702566,-1.535000,29.024344>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.817638,-1.535000,29.072006>}
box{<0,0,-0.203200><0.124552,0.035000,0.203200> rotate<0,-22.497737,0> translate<40.702566,-1.535000,29.024344> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.707000,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.171531,-1.535000,46.329600>}
box{<0,0,-0.203200><1.464531,0.035000,0.203200> rotate<0,0.000000,0> translate<40.707000,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.708097,-1.535000,46.332241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.708097,-1.535000,47.774756>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<40.708097,-1.535000,47.774756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.708097,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.170884,-1.535000,46.736000>}
box{<0,0,-0.203200><1.462787,0.035000,0.203200> rotate<0,0.000000,0> translate<40.708097,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.708097,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.170237,-1.535000,47.142400>}
box{<0,0,-0.203200><1.462141,0.035000,0.203200> rotate<0,0.000000,0> translate<40.708097,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.708097,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.169587,-1.535000,47.548800>}
box{<0,0,-0.203200><1.461491,0.035000,0.203200> rotate<0,0.000000,0> translate<40.708097,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.809791,-1.535000,24.872809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.902597,-1.535000,24.648756>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<40.809791,-1.535000,24.872809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.817638,-1.535000,29.072006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.837378,-1.535000,29.091750>}
box{<0,0,-0.203200><0.027920,0.035000,0.203200> rotate<0,-45.001565,0> translate<40.817638,-1.535000,29.072006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.837378,-1.535000,29.091750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.181306,-1.535000,29.763716>}
box{<0,0,-0.203200><1.502558,0.035000,0.203200> rotate<0,-26.563351,0> translate<40.837378,-1.535000,29.091750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.843928,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.173806,-1.535000,24.790400>}
box{<0,0,-0.203200><1.329878,0.035000,0.203200> rotate<0,0.000000,0> translate<40.843928,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.893309,-1.535000,20.164291>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.064791,-1.535000,19.992809>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<40.893309,-1.535000,20.164291> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.893309,-1.535000,20.630706>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.064791,-1.535000,20.802188>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.893309,-1.535000,20.630706> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.902597,-1.535000,23.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.902597,-1.535000,24.648756>}
box{<0,0,-0.203200><1.193756,0.035000,0.203200> rotate<0,90.000000,0> translate<40.902597,-1.535000,24.648756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.902597,-1.535000,23.455000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.064791,-1.535000,23.292809>}
box{<0,0,-0.203200><0.229374,0.035000,0.203200> rotate<0,44.996478,0> translate<40.902597,-1.535000,23.455000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.902597,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.171969,-1.535000,23.571200>}
box{<0,0,-0.203200><1.269372,0.035000,0.203200> rotate<0,0.000000,0> translate<40.902597,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.902597,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.172581,-1.535000,23.977600>}
box{<0,0,-0.203200><1.269984,0.035000,0.203200> rotate<0,0.000000,0> translate<40.902597,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.902597,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.173194,-1.535000,24.384000>}
box{<0,0,-0.203200><1.270597,0.035000,0.203200> rotate<0,0.000000,0> translate<40.902597,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.989003,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.167678,-1.535000,20.726400>}
box{<0,0,-0.203200><1.178675,0.035000,0.203200> rotate<0,0.000000,0> translate<40.989003,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.006428,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,54.051200>}
box{<0,0,-0.203200><4.256372,0.035000,0.203200> rotate<0,0.000000,0> translate<41.006428,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.064791,-1.535000,19.992809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,19.768756>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<41.064791,-1.535000,19.992809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.064791,-1.535000,20.802188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,21.026241>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<41.064791,-1.535000,20.802188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.064791,-1.535000,23.292809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,23.068756>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<41.064791,-1.535000,23.292809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.097603,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.166453,-1.535000,19.913600>}
box{<0,0,-0.203200><1.068850,0.035000,0.203200> rotate<0,0.000000,0> translate<41.097603,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.117816,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.171356,-1.535000,23.164800>}
box{<0,0,-0.203200><1.053541,0.035000,0.203200> rotate<0,0.000000,0> translate<41.117816,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.124978,-1.535000,22.047497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,21.968756>}
box{<0,0,-0.203200><0.085230,0.035000,0.203200> rotate<0,67.493486,0> translate<41.124978,-1.535000,22.047497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.124978,-1.535000,22.047497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,22.126241>}
box{<0,0,-0.203200><0.085232,0.035000,0.203200> rotate<0,-67.494290,0> translate<41.124978,-1.535000,22.047497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,18.959497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,19.768756>}
box{<0,0,-0.203200><0.809259,0.035000,0.203200> rotate<0,90.000000,0> translate<41.157597,-1.535000,19.768756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,18.959497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.165013,-1.535000,18.959497>}
box{<0,0,-0.203200><1.007416,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,18.959497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.165228,-1.535000,19.100800>}
box{<0,0,-0.203200><1.007631,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.165841,-1.535000,19.507200>}
box{<0,0,-0.203200><1.008244,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,21.026241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,21.968756>}
box{<0,0,-0.203200><0.942516,0.035000,0.203200> rotate<0,90.000000,0> translate<41.157597,-1.535000,21.968756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.168291,-1.535000,21.132800>}
box{<0,0,-0.203200><1.010694,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.168903,-1.535000,21.539200>}
box{<0,0,-0.203200><1.011306,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.169519,-1.535000,21.945600>}
box{<0,0,-0.203200><1.011922,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,22.126241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,23.068756>}
box{<0,0,-0.203200><0.942516,0.035000,0.203200> rotate<0,90.000000,0> translate<41.157597,-1.535000,23.068756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.170131,-1.535000,22.352000>}
box{<0,0,-0.203200><1.012534,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.157597,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.170744,-1.535000,22.758400>}
box{<0,0,-0.203200><1.013147,0.035000,0.203200> rotate<0,0.000000,0> translate<41.157597,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.175475,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.180550,-1.535000,29.260800>}
box{<0,0,-0.203200><1.005075,0.035000,0.203200> rotate<0,0.000000,0> translate<41.175475,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.412828,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,53.644800>}
box{<0,0,-0.203200><3.849972,0.035000,0.203200> rotate<0,0.000000,0> translate<41.412828,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.819228,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,53.238400>}
box{<0,0,-0.203200><3.443572,0.035000,0.203200> rotate<0,0.000000,0> translate<41.819228,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.988275,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.181162,-1.535000,29.667200>}
box{<0,0,-0.203200><0.192887,0.035000,0.203200> rotate<0,0.000000,0> translate<41.988275,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.061572,-1.535000,6.802000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.341638,-1.535000,6.918006>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-22.498388,0> translate<42.061572,-1.535000,6.802000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164503,-1.535000,50.737863>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.188184,-1.535000,35.890197>}
box{<0,0,-0.203200><14.847685,0.035000,0.203200> rotate<0,89.902683,0> translate<42.164503,-1.535000,50.737863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.165013,-1.535000,18.959497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.181306,-1.535000,29.763716>}
box{<0,0,-0.203200><10.804231,0.035000,0.203200> rotate<0,-89.907659,0> translate<42.165013,-1.535000,18.959497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.225628,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,52.832000>}
box{<0,0,-0.203200><3.037172,0.035000,0.203200> rotate<0,0.000000,0> translate<42.225628,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.319409,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,6.908800>}
box{<0,0,-0.203200><2.943391,0.035000,0.203200> rotate<0,0.000000,0> translate<42.319409,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.341638,-1.535000,6.918006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.555991,-1.535000,7.132359>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.341638,-1.535000,6.918006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.555991,-1.535000,7.132359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.555991,-1.535000,7.132363>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<42.555991,-1.535000,7.132363> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.555991,-1.535000,7.132363>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.357634,-1.535000,7.934006>}
box{<0,0,-0.203200><1.133695,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.555991,-1.535000,7.132363> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.632028,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,52.425600>}
box{<0,0,-0.203200><2.630772,0.035000,0.203200> rotate<0,0.000000,0> translate<42.632028,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.738828,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,7.315200>}
box{<0,0,-0.203200><2.523972,0.035000,0.203200> rotate<0,0.000000,0> translate<42.738828,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.038428,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,52.019200>}
box{<0,0,-0.203200><2.224372,0.035000,0.203200> rotate<0,0.000000,0> translate<43.038428,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.145228,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,7.721600>}
box{<0,0,-0.203200><2.117572,0.035000,0.203200> rotate<0,0.000000,0> translate<43.145228,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.357634,-1.535000,7.934006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.357638,-1.535000,7.934006>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<43.357634,-1.535000,7.934006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.357638,-1.535000,7.934006>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571991,-1.535000,8.148359>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.357638,-1.535000,7.934006> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.438800,-1.535000,1.322856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.592747,-1.535000,0.951200>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,67.495306,0> translate<43.438800,-1.535000,1.322856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.438800,-1.535000,1.725141>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.438800,-1.535000,1.322856>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.438800,-1.535000,1.322856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.438800,-1.535000,1.725141>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.592747,-1.535000,2.096797>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,-67.495306,0> translate<43.438800,-1.535000,1.725141> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.444828,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,51.612800>}
box{<0,0,-0.203200><1.817972,0.035000,0.203200> rotate<0,0.000000,0> translate<43.444828,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.465028,-1.535000,51.592597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571300,-1.535000,51.486666>}
box{<0,0,-0.203200><0.150050,0.035000,0.203200> rotate<0,44.905066,0> translate<43.465028,-1.535000,51.592597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.551631,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,8.128000>}
box{<0,0,-0.203200><1.711169,0.035000,0.203200> rotate<0,0.000000,0> translate<43.551631,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571300,-1.535000,51.486666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571541,-1.535000,51.486088>}
box{<0,0,-0.203200><0.000626,0.035000,0.203200> rotate<0,67.397681,0> translate<43.571300,-1.535000,51.486666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571541,-1.535000,51.486088>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571991,-1.535000,51.485638>}
box{<0,0,-0.203200><0.000636,0.035000,0.203200> rotate<0,44.997030,0> translate<43.571541,-1.535000,51.486088> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571991,-1.535000,8.148359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,8.428425>}
box{<0,0,-0.203200><0.303141,0.035000,0.203200> rotate<0,-67.495673,0> translate<43.571991,-1.535000,8.148359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.571991,-1.535000,51.485638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.630275,-1.535000,51.344925>}
box{<0,0,-0.203200><0.152306,0.035000,0.203200> rotate<0,67.495771,0> translate<43.571991,-1.535000,51.485638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.592747,-1.535000,0.951200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.629553,-1.535000,0.914397>}
box{<0,0,-0.203200><0.052050,0.035000,0.203200> rotate<0,44.994598,0> translate<43.592747,-1.535000,0.951200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.592747,-1.535000,2.096797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.877200,-1.535000,2.381250>}
box{<0,0,-0.203200><0.402277,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.592747,-1.535000,2.096797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.630275,-1.535000,51.344925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687753,-1.535000,51.206784>}
box{<0,0,-0.203200><0.149621,0.035000,0.203200> rotate<0,67.404131,0> translate<43.630275,-1.535000,51.344925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687753,-1.535000,51.206156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687753,-1.535000,51.206784>}
box{<0,0,-0.203200><0.000628,0.035000,0.203200> rotate<0,90.000000,0> translate<43.687753,-1.535000,51.206784> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687753,-1.535000,51.206156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,51.205572>}
box{<0,0,-0.203200><0.000633,0.035000,0.203200> rotate<0,67.353937,0> translate<43.687753,-1.535000,51.206156> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687753,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,51.206400>}
box{<0,0,-0.203200><1.575047,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687753,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,8.428425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,18.286847>}
box{<0,0,-0.203200><9.858422,0.035000,0.203200> rotate<0,90.000000,0> translate<43.687997,-1.535000,18.286847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,8.534400>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,8.940800>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,9.347200>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,9.753600>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,10.160000>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,10.566400>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,10.972800>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,11.379200>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,11.785600>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,12.192000>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,12.598400>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,13.004800>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,13.411200>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,13.817600>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,14.224000>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,14.630400>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,15.036800>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,15.443200>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,15.849600>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,16.256000>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,16.662400>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,17.068800>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,17.475200>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,17.881600>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,18.286847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713169,-1.535000,34.976075>}
box{<0,0,-0.203200><16.689247,0.035000,0.203200> rotate<0,-89.907649,0> translate<43.687997,-1.535000,18.286847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,18.288000>}
box{<0,0,-0.203200><1.574803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.687997,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,51.053828>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,51.205572>}
box{<0,0,-0.203200><0.151744,0.035000,0.203200> rotate<0,90.000000,0> translate<43.687997,-1.535000,51.205572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.687997,-1.535000,51.053828>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713153,-1.535000,35.280353>}
box{<0,0,-0.203200><15.773495,0.035000,0.203200> rotate<0,89.902689,0> translate<43.687997,-1.535000,51.053828> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688403,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,50.800000>}
box{<0,0,-0.203200><1.574397,0.035000,0.203200> rotate<0,0.000000,0> translate<43.688403,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688609,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,18.694400>}
box{<0,0,-0.203200><1.574191,0.035000,0.203200> rotate<0,0.000000,0> translate<43.688609,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.689050,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,50.393600>}
box{<0,0,-0.203200><1.573750,0.035000,0.203200> rotate<0,0.000000,0> translate<43.689050,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.689222,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,19.100800>}
box{<0,0,-0.203200><1.573578,0.035000,0.203200> rotate<0,0.000000,0> translate<43.689222,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.689700,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,49.987200>}
box{<0,0,-0.203200><1.573100,0.035000,0.203200> rotate<0,0.000000,0> translate<43.689700,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.689834,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,19.507200>}
box{<0,0,-0.203200><1.572966,0.035000,0.203200> rotate<0,0.000000,0> translate<43.689834,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.690347,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,49.580800>}
box{<0,0,-0.203200><1.572453,0.035000,0.203200> rotate<0,0.000000,0> translate<43.690347,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.690450,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,19.913600>}
box{<0,0,-0.203200><1.572350,0.035000,0.203200> rotate<0,0.000000,0> translate<43.690450,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.690997,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,49.174400>}
box{<0,0,-0.203200><1.571803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.690997,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.691063,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,20.320000>}
box{<0,0,-0.203200><1.571738,0.035000,0.203200> rotate<0,0.000000,0> translate<43.691063,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.691644,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,48.768000>}
box{<0,0,-0.203200><1.571156,0.035000,0.203200> rotate<0,0.000000,0> translate<43.691644,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.691675,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,20.726400>}
box{<0,0,-0.203200><1.571125,0.035000,0.203200> rotate<0,0.000000,0> translate<43.691675,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692287,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,21.132800>}
box{<0,0,-0.203200><1.570513,0.035000,0.203200> rotate<0,0.000000,0> translate<43.692287,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692291,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,48.361600>}
box{<0,0,-0.203200><1.570509,0.035000,0.203200> rotate<0,0.000000,0> translate<43.692291,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692800,-1.535000,56.186856>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.846747,-1.535000,55.815200>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,67.495306,0> translate<43.692800,-1.535000,56.186856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692800,-1.535000,56.589141>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692800,-1.535000,56.186856>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.692800,-1.535000,56.186856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692800,-1.535000,56.589141>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.846747,-1.535000,56.960797>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,-67.495306,0> translate<43.692800,-1.535000,56.589141> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692900,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,21.539200>}
box{<0,0,-0.203200><1.569900,0.035000,0.203200> rotate<0,0.000000,0> translate<43.692900,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.692941,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,47.955200>}
box{<0,0,-0.203200><1.569859,0.035000,0.203200> rotate<0,0.000000,0> translate<43.692941,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.693513,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,21.945600>}
box{<0,0,-0.203200><1.569288,0.035000,0.203200> rotate<0,0.000000,0> translate<43.693513,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.693587,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,47.548800>}
box{<0,0,-0.203200><1.569213,0.035000,0.203200> rotate<0,0.000000,0> translate<43.693587,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.694128,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,22.352000>}
box{<0,0,-0.203200><1.568672,0.035000,0.203200> rotate<0,0.000000,0> translate<43.694128,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.694237,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,47.142400>}
box{<0,0,-0.203200><1.568563,0.035000,0.203200> rotate<0,0.000000,0> translate<43.694237,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.694741,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,22.758400>}
box{<0,0,-0.203200><1.568059,0.035000,0.203200> rotate<0,0.000000,0> translate<43.694741,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.694884,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,46.736000>}
box{<0,0,-0.203200><1.567916,0.035000,0.203200> rotate<0,0.000000,0> translate<43.694884,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.695353,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,23.164800>}
box{<0,0,-0.203200><1.567447,0.035000,0.203200> rotate<0,0.000000,0> translate<43.695353,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.695534,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,46.329600>}
box{<0,0,-0.203200><1.567266,0.035000,0.203200> rotate<0,0.000000,0> translate<43.695534,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.695966,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,23.571200>}
box{<0,0,-0.203200><1.566834,0.035000,0.203200> rotate<0,0.000000,0> translate<43.695966,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.696181,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,45.923200>}
box{<0,0,-0.203200><1.566619,0.035000,0.203200> rotate<0,0.000000,0> translate<43.696181,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.696578,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,23.977600>}
box{<0,0,-0.203200><1.566222,0.035000,0.203200> rotate<0,0.000000,0> translate<43.696578,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.696828,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,45.516800>}
box{<0,0,-0.203200><1.565972,0.035000,0.203200> rotate<0,0.000000,0> translate<43.696828,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.697191,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,24.384000>}
box{<0,0,-0.203200><1.565609,0.035000,0.203200> rotate<0,0.000000,0> translate<43.697191,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.697478,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,45.110400>}
box{<0,0,-0.203200><1.565322,0.035000,0.203200> rotate<0,0.000000,0> translate<43.697478,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.697803,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,24.790400>}
box{<0,0,-0.203200><1.564997,0.035000,0.203200> rotate<0,0.000000,0> translate<43.697803,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.698125,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,44.704000>}
box{<0,0,-0.203200><1.564675,0.035000,0.203200> rotate<0,0.000000,0> translate<43.698125,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.698419,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,25.196800>}
box{<0,0,-0.203200><1.564381,0.035000,0.203200> rotate<0,0.000000,0> translate<43.698419,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.698775,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,44.297600>}
box{<0,0,-0.203200><1.564025,0.035000,0.203200> rotate<0,0.000000,0> translate<43.698775,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.699031,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,25.603200>}
box{<0,0,-0.203200><1.563769,0.035000,0.203200> rotate<0,0.000000,0> translate<43.699031,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.699422,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,43.891200>}
box{<0,0,-0.203200><1.563378,0.035000,0.203200> rotate<0,0.000000,0> translate<43.699422,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.699644,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,26.009600>}
box{<0,0,-0.203200><1.563156,0.035000,0.203200> rotate<0,0.000000,0> translate<43.699644,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.700069,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,43.484800>}
box{<0,0,-0.203200><1.562731,0.035000,0.203200> rotate<0,0.000000,0> translate<43.700069,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.700256,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,26.416000>}
box{<0,0,-0.203200><1.562544,0.035000,0.203200> rotate<0,0.000000,0> translate<43.700256,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.700719,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,43.078400>}
box{<0,0,-0.203200><1.562081,0.035000,0.203200> rotate<0,0.000000,0> translate<43.700719,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.700869,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,26.822400>}
box{<0,0,-0.203200><1.561931,0.035000,0.203200> rotate<0,0.000000,0> translate<43.700869,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.701366,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,42.672000>}
box{<0,0,-0.203200><1.561434,0.035000,0.203200> rotate<0,0.000000,0> translate<43.701366,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.701481,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,27.228800>}
box{<0,0,-0.203200><1.561319,0.035000,0.203200> rotate<0,0.000000,0> translate<43.701481,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.702016,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,42.265600>}
box{<0,0,-0.203200><1.560784,0.035000,0.203200> rotate<0,0.000000,0> translate<43.702016,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.702094,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,27.635200>}
box{<0,0,-0.203200><1.560706,0.035000,0.203200> rotate<0,0.000000,0> translate<43.702094,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.702663,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,41.859200>}
box{<0,0,-0.203200><1.560138,0.035000,0.203200> rotate<0,0.000000,0> translate<43.702663,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.702709,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,28.041600>}
box{<0,0,-0.203200><1.560091,0.035000,0.203200> rotate<0,0.000000,0> translate<43.702709,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.703309,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,41.452800>}
box{<0,0,-0.203200><1.559491,0.035000,0.203200> rotate<0,0.000000,0> translate<43.703309,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.703322,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,28.448000>}
box{<0,0,-0.203200><1.559478,0.035000,0.203200> rotate<0,0.000000,0> translate<43.703322,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.703934,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,28.854400>}
box{<0,0,-0.203200><1.558866,0.035000,0.203200> rotate<0,0.000000,0> translate<43.703934,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.703959,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,41.046400>}
box{<0,0,-0.203200><1.558841,0.035000,0.203200> rotate<0,0.000000,0> translate<43.703959,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.704547,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,29.260800>}
box{<0,0,-0.203200><1.558253,0.035000,0.203200> rotate<0,0.000000,0> translate<43.704547,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.704606,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,40.640000>}
box{<0,0,-0.203200><1.558194,0.035000,0.203200> rotate<0,0.000000,0> translate<43.704606,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.705159,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,29.667200>}
box{<0,0,-0.203200><1.557641,0.035000,0.203200> rotate<0,0.000000,0> translate<43.705159,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.705256,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,40.233600>}
box{<0,0,-0.203200><1.557544,0.035000,0.203200> rotate<0,0.000000,0> translate<43.705256,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.705772,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,30.073600>}
box{<0,0,-0.203200><1.557028,0.035000,0.203200> rotate<0,0.000000,0> translate<43.705772,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.705903,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,39.827200>}
box{<0,0,-0.203200><1.556897,0.035000,0.203200> rotate<0,0.000000,0> translate<43.705903,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.706384,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,30.480000>}
box{<0,0,-0.203200><1.556416,0.035000,0.203200> rotate<0,0.000000,0> translate<43.706384,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.706550,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,39.420800>}
box{<0,0,-0.203200><1.556250,0.035000,0.203200> rotate<0,0.000000,0> translate<43.706550,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.707000,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,30.886400>}
box{<0,0,-0.203200><1.555800,0.035000,0.203200> rotate<0,0.000000,0> translate<43.707000,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.707200,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,39.014400>}
box{<0,0,-0.203200><1.555600,0.035000,0.203200> rotate<0,0.000000,0> translate<43.707200,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.707613,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,31.292800>}
box{<0,0,-0.203200><1.555188,0.035000,0.203200> rotate<0,0.000000,0> translate<43.707613,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.707847,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,38.608000>}
box{<0,0,-0.203200><1.554953,0.035000,0.203200> rotate<0,0.000000,0> translate<43.707847,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.708225,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,31.699200>}
box{<0,0,-0.203200><1.554575,0.035000,0.203200> rotate<0,0.000000,0> translate<43.708225,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.708497,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,38.201600>}
box{<0,0,-0.203200><1.554303,0.035000,0.203200> rotate<0,0.000000,0> translate<43.708497,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.708838,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,32.105600>}
box{<0,0,-0.203200><1.553963,0.035000,0.203200> rotate<0,0.000000,0> translate<43.708838,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.709144,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,37.795200>}
box{<0,0,-0.203200><1.553656,0.035000,0.203200> rotate<0,0.000000,0> translate<43.709144,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.709450,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,32.512000>}
box{<0,0,-0.203200><1.553350,0.035000,0.203200> rotate<0,0.000000,0> translate<43.709450,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.709791,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,37.388800>}
box{<0,0,-0.203200><1.553009,0.035000,0.203200> rotate<0,0.000000,0> translate<43.709791,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.710062,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,32.918400>}
box{<0,0,-0.203200><1.552738,0.035000,0.203200> rotate<0,0.000000,0> translate<43.710062,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.710441,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,36.982400>}
box{<0,0,-0.203200><1.552359,0.035000,0.203200> rotate<0,0.000000,0> translate<43.710441,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.710678,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,33.324800>}
box{<0,0,-0.203200><1.552122,0.035000,0.203200> rotate<0,0.000000,0> translate<43.710678,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.711088,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,36.576000>}
box{<0,0,-0.203200><1.551713,0.035000,0.203200> rotate<0,0.000000,0> translate<43.711088,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.711291,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,33.731200>}
box{<0,0,-0.203200><1.551509,0.035000,0.203200> rotate<0,0.000000,0> translate<43.711291,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.711738,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,36.169600>}
box{<0,0,-0.203200><1.551063,0.035000,0.203200> rotate<0,0.000000,0> translate<43.711738,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.711903,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,34.137600>}
box{<0,0,-0.203200><1.550897,0.035000,0.203200> rotate<0,0.000000,0> translate<43.711903,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.712384,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,35.763200>}
box{<0,0,-0.203200><1.550416,0.035000,0.203200> rotate<0,0.000000,0> translate<43.712384,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.712516,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,34.544000>}
box{<0,0,-0.203200><1.550284,0.035000,0.203200> rotate<0,0.000000,0> translate<43.712516,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713031,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,35.356800>}
box{<0,0,-0.203200><1.549769,0.035000,0.203200> rotate<0,0.000000,0> translate<43.713031,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713128,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,34.950400>}
box{<0,0,-0.203200><1.549672,0.035000,0.203200> rotate<0,0.000000,0> translate<43.713128,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713153,-1.535000,35.280353>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,35.279772>}
box{<0,0,-0.203200><0.000630,0.035000,0.203200> rotate<0,67.244585,0> translate<43.713153,-1.535000,35.280353> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713169,-1.535000,34.976075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,34.976625>}
box{<0,0,-0.203200><0.000595,0.035000,0.203200> rotate<0,-67.468207,0> translate<43.713169,-1.535000,34.976075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,34.976625>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,34.977259>}
box{<0,0,-0.203200><0.000634,0.035000,0.203200> rotate<0,90.000000,0> translate<43.713397,-1.535000,34.977259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,34.977259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713638,-1.535000,34.977841>}
box{<0,0,-0.203200><0.000629,0.035000,0.203200> rotate<0,-67.507041,0> translate<43.713397,-1.535000,34.977259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,35.128069>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713625,-1.535000,35.278622>}
box{<0,0,-0.203200><0.150553,0.035000,0.203200> rotate<0,-89.907249,0> translate<43.713397,-1.535000,35.128069> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,35.128069>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713638,-1.535000,34.977841>}
box{<0,0,-0.203200><0.150228,0.035000,0.203200> rotate<0,89.902294,0> translate<43.713397,-1.535000,35.128069> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,35.279172>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,35.279772>}
box{<0,0,-0.203200><0.000600,0.035000,0.203200> rotate<0,90.000000,0> translate<43.713397,-1.535000,35.279772> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713397,-1.535000,35.279172>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.713625,-1.535000,35.278622>}
box{<0,0,-0.203200><0.000595,0.035000,0.203200> rotate<0,67.468207,0> translate<43.713397,-1.535000,35.279172> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.846747,-1.535000,55.815200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.131200,-1.535000,55.530747>}
box{<0,0,-0.203200><0.402277,0.035000,0.203200> rotate<0,44.997030,0> translate<43.846747,-1.535000,55.815200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.846747,-1.535000,56.960797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.087906,-1.535000,57.201953>}
box{<0,0,-0.203200><0.341049,0.035000,0.203200> rotate<0,-44.996659,0> translate<43.846747,-1.535000,56.960797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.877200,-1.535000,2.381250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.248856,-1.535000,2.535197>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,-22.498754,0> translate<43.877200,-1.535000,2.381250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.131200,-1.535000,55.530747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.502856,-1.535000,55.376800>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,22.498754,0> translate<44.131200,-1.535000,55.530747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.248856,-1.535000,2.535197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.651141,-1.535000,2.535197>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,0.000000,0> translate<44.248856,-1.535000,2.535197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.502856,-1.535000,55.376800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.905141,-1.535000,55.376800>}
box{<0,0,-0.203200><0.402284,0.035000,0.203200> rotate<0,0.000000,0> translate<44.502856,-1.535000,55.376800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.651141,-1.535000,2.535197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.022797,-1.535000,2.381250>}
box{<0,0,-0.203200><0.402279,0.035000,0.203200> rotate<0,22.498754,0> translate<44.651141,-1.535000,2.535197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.884828,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,2.438400>}
box{<0,0,-0.203200><0.377972,0.035000,0.203200> rotate<0,0.000000,0> translate<44.884828,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.905141,-1.535000,55.376800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,55.524950>}
box{<0,0,-0.203200><0.387129,0.035000,0.203200> rotate<0,-22.498876,0> translate<44.905141,-1.535000,55.376800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.022797,-1.535000,2.381250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,2.141244>}
box{<0,0,-0.203200><0.339418,0.035000,0.203200> rotate<0,44.997403,0> translate<45.022797,-1.535000,2.381250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,55.524950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.262800,-1.535000,2.141244>}
box{<0,0,-0.203200><53.383706,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.262800,-1.535000,2.141244> }
texture{col_pol}
}
#end
union{
cylinder{<4.127500,0.038000,26.987500><4.127500,-1.538000,26.987500>0.508000}
cylinder{<4.127500,0.038000,24.447500><4.127500,-1.538000,24.447500>0.508000}
cylinder{<4.127500,0.038000,21.907500><4.127500,-1.538000,21.907500>0.508000}
cylinder{<4.127500,0.038000,19.367500><4.127500,-1.538000,19.367500>0.508000}
cylinder{<4.127500,0.038000,16.827500><4.127500,-1.538000,16.827500>0.508000}
cylinder{<4.127500,0.038000,14.287500><4.127500,-1.538000,14.287500>0.508000}
cylinder{<38.709600,0.038000,4.064000><38.709600,-1.538000,4.064000>0.600000}
cylinder{<38.709600,0.038000,7.564000><38.709600,-1.538000,7.564000>0.600000}
cylinder{<16.891000,0.038000,52.705000><16.891000,-1.538000,52.705000>0.600000}
cylinder{<13.391000,0.038000,52.705000><13.391000,-1.538000,52.705000>0.600000}
cylinder{<9.891000,0.038000,52.705000><9.891000,-1.538000,52.705000>0.600000}
cylinder{<6.391000,0.038000,52.705000><6.391000,-1.538000,52.705000>0.600000}
cylinder{<21.590000,0.038000,6.045200><21.590000,-1.538000,6.045200>0.600000}
cylinder{<25.090000,0.038000,6.045200><25.090000,-1.538000,6.045200>0.600000}
cylinder{<28.590000,0.038000,6.045200><28.590000,-1.538000,6.045200>0.600000}
cylinder{<35.331400,0.038000,52.705000><35.331400,-1.538000,52.705000>0.600000}
cylinder{<31.831400,0.038000,52.705000><31.831400,-1.538000,52.705000>0.600000}
cylinder{<28.331400,0.038000,52.705000><28.331400,-1.538000,52.705000>0.600000}
cylinder{<24.831400,0.038000,52.705000><24.831400,-1.538000,52.705000>0.600000}
cylinder{<4.876800,0.038000,6.070600><4.876800,-1.538000,6.070600>0.600000}
cylinder{<8.376800,0.038000,6.070600><8.376800,-1.538000,6.070600>0.600000}
cylinder{<11.876800,0.038000,6.070600><11.876800,-1.538000,6.070600>0.600000}
cylinder{<15.376800,0.038000,6.070600><15.376800,-1.538000,6.070600>0.600000}
//Holes(fast)/Vias
cylinder{<25.527000,0.038000,31.038800><25.527000,-1.538000,31.038800>0.300000 }
cylinder{<40.386000,0.038000,32.004000><40.386000,-1.538000,32.004000>0.300000 }
cylinder{<5.080000,0.038000,43.942000><5.080000,-1.538000,43.942000>0.300000 }
cylinder{<5.080000,0.038000,29.464000><5.080000,-1.538000,29.464000>0.300000 }
cylinder{<29.210000,0.038000,26.162000><29.210000,-1.538000,26.162000>0.300000 }
cylinder{<27.940000,0.038000,36.753800><27.940000,-1.538000,36.753800>0.300000 }
//Holes(fast)/Board
cylinder{<1.524000,0.038000,56.388000><1.524000,-1.538000,56.388000>0.300000 }
cylinder{<44.704000,0.038000,56.388000><44.704000,-1.538000,56.388000>0.300000 }
cylinder{<1.778000,0.038000,1.524000><1.778000,-1.538000,1.524000>0.300000 }
cylinder{<44.450000,0.038000,1.524000><44.450000,-1.538000,1.524000>0.300000 }
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,12.774822>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,12.774822>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.092200,0.000000,12.774822> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,12.537553>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,13.012091>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<1.804006,0.000000,13.012091> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,13.285969>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,13.285969>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.092200,0.000000,13.285969> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,13.285969>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,13.523238>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,44.997030,0> translate<1.566738,0.000000,13.523238> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,13.523238>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,13.760506>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.566738,0.000000,13.523238> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,13.760506>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,13.760506>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.092200,0.000000,13.760506> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,14.508922>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,14.390288>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.685372,0.000000,14.508922> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,14.390288>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,14.153019>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.804006,0.000000,14.153019> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,14.153019>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,14.034384>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.685372,0.000000,14.034384> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,14.034384>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,14.034384>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.566738,0.000000,14.034384> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,14.034384>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,14.153019>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.448103,0.000000,14.153019> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,14.153019>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,14.390288>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.448103,0.000000,14.390288> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,14.390288>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,14.508922>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.329469,0.000000,14.508922> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,14.508922>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,14.508922>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.210834,0.000000,14.508922> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,14.508922>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,14.390288>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.092200,0.000000,14.390288> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,14.390288>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,14.153019>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.092200,0.000000,14.153019> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,14.153019>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,14.034384>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.092200,0.000000,14.153019> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,16.009291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,15.890656>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.685372,0.000000,16.009291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,15.890656>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,15.653388>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.804006,0.000000,15.653388> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,15.653388>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,15.534753>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.685372,0.000000,15.534753> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,15.534753>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,15.534753>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<1.210834,0.000000,15.534753> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,15.534753>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,15.653388>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.092200,0.000000,15.653388> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,15.653388>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,15.890656>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092200,0.000000,15.890656> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,15.890656>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,16.009291>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.092200,0.000000,15.890656> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,16.009291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,16.009291>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<1.210834,0.000000,16.009291> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,16.009291>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,15.772022>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.448103,0.000000,15.772022> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,16.283169>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,16.283169>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.092200,0.000000,16.283169> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,16.283169>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,16.757706>}
box{<0,0,-0.050800><0.855485,0.036000,0.050800> rotate<0,33.687844,0> translate<1.092200,0.000000,16.757706> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,16.757706>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,16.757706>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.092200,0.000000,16.757706> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,17.031584>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,17.031584>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.092200,0.000000,17.031584> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,17.031584>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,17.387488>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092200,0.000000,17.387488> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,17.387488>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,17.506122>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.092200,0.000000,17.387488> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,17.506122>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,17.506122>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<1.210834,0.000000,17.506122> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,17.506122>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,17.387488>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.685372,0.000000,17.506122> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,17.387488>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,17.031584>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.804006,0.000000,17.031584> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,17.896953>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,18.015588>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.685372,0.000000,17.896953> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,18.015588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,18.252856>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.804006,0.000000,18.252856> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,18.252856>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,18.371491>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.685372,0.000000,18.371491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,18.371491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,18.371491>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.566738,0.000000,18.371491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,18.371491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,18.252856>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.448103,0.000000,18.252856> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,18.252856>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,18.134222>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.448103,0.000000,18.134222> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,18.252856>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,18.371491>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.329469,0.000000,18.371491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,18.371491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,18.371491>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.210834,0.000000,18.371491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,18.371491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,18.252856>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.092200,0.000000,18.252856> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,18.252856>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,18.015588>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.092200,0.000000,18.015588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,18.015588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,17.896953>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.092200,0.000000,18.015588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,18.645369>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,18.645369>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<1.329469,0.000000,18.645369> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,18.645369>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,18.882638>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,44.997030,0> translate<1.092200,0.000000,18.882638> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,18.882638>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,19.119906>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.092200,0.000000,18.882638> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,19.119906>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,19.119906>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<1.329469,0.000000,19.119906> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,19.393784>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,19.512419>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.685372,0.000000,19.393784> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,19.512419>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,19.749688>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.804006,0.000000,19.749688> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.804006,0.000000,19.749688>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,19.868322>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.685372,0.000000,19.868322> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.685372,0.000000,19.868322>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,19.868322>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.566738,0.000000,19.868322> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.566738,0.000000,19.868322>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,19.749688>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.448103,0.000000,19.749688> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,19.749688>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,19.631053>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.448103,0.000000,19.631053> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.448103,0.000000,19.749688>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,19.868322>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.329469,0.000000,19.868322> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.329469,0.000000,19.868322>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,19.868322>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.210834,0.000000,19.868322> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,19.868322>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,19.749688>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.092200,0.000000,19.749688> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,19.749688>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,19.512419>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.092200,0.000000,19.512419> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092200,0.000000,19.512419>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.210834,0.000000,19.393784>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.092200,0.000000,19.512419> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117600,0.000000,20.877422>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,20.877422>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.117600,0.000000,20.877422> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,20.640153>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,21.114691>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<1.829406,0.000000,21.114691> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.710772,0.000000,21.863106>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,21.744472>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.710772,0.000000,21.863106> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,21.744472>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,21.507203>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.829406,0.000000,21.507203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,21.507203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.710772,0.000000,21.388569>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.710772,0.000000,21.388569> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.710772,0.000000,21.388569>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.236234,0.000000,21.388569>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<1.236234,0.000000,21.388569> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.236234,0.000000,21.388569>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117600,0.000000,21.507203>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.117600,0.000000,21.507203> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117600,0.000000,21.507203>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117600,0.000000,21.744472>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.117600,0.000000,21.744472> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117600,0.000000,21.744472>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.236234,0.000000,21.863106>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.117600,0.000000,21.744472> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,22.136984>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117600,0.000000,22.136984>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.117600,0.000000,22.136984> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.354869,0.000000,22.136984>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.829406,0.000000,22.611522>}
box{<0,0,-0.050800><0.671097,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.354869,0.000000,22.136984> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.473503,0.000000,22.255619>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117600,0.000000,22.611522>}
box{<0,0,-0.050800><0.503323,0.036000,0.050800> rotate<0,44.997030,0> translate<1.117600,0.000000,22.611522> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.736172,0.000000,24.162691>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,24.044056>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.736172,0.000000,24.162691> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,24.044056>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,23.806788>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.854806,0.000000,23.806788> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,23.806788>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.736172,0.000000,23.688153>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.736172,0.000000,23.688153> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.736172,0.000000,23.688153>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.617538,0.000000,23.688153>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.617538,0.000000,23.688153> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.617538,0.000000,23.688153>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.498903,0.000000,23.806788>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.498903,0.000000,23.806788> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.498903,0.000000,23.806788>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.498903,0.000000,24.044056>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.498903,0.000000,24.044056> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.498903,0.000000,24.044056>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.380269,0.000000,24.162691>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.380269,0.000000,24.162691> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.380269,0.000000,24.162691>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.261634,0.000000,24.162691>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.261634,0.000000,24.162691> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.261634,0.000000,24.162691>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,24.044056>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.143000,0.000000,24.044056> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,24.044056>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,23.806788>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.143000,0.000000,23.806788> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,23.806788>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.261634,0.000000,23.688153>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.143000,0.000000,23.806788> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,24.436569>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,24.436569>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.143000,0.000000,24.436569> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,24.436569>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.380269,0.000000,24.673838>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.143000,0.000000,24.436569> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.380269,0.000000,24.673838>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,24.911106>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,44.997030,0> translate<1.143000,0.000000,24.911106> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,24.911106>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,24.911106>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.143000,0.000000,24.911106> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,25.540888>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,25.303619>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.854806,0.000000,25.303619> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,25.303619>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.736172,0.000000,25.184984>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.736172,0.000000,25.184984> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.736172,0.000000,25.184984>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.261634,0.000000,25.184984>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<1.261634,0.000000,25.184984> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.261634,0.000000,25.184984>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,25.303619>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.143000,0.000000,25.303619> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,25.303619>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,25.540888>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.143000,0.000000,25.540888> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.143000,0.000000,25.540888>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.261634,0.000000,25.659522>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.143000,0.000000,25.540888> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.261634,0.000000,25.659522>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.736172,0.000000,25.659522>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<1.261634,0.000000,25.659522> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.736172,0.000000,25.659522>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.854806,0.000000,25.540888>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.736172,0.000000,25.659522> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,26.444938>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,26.444938>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.244600,0.000000,26.444938> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,26.444938>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,26.919475>}
box{<0,0,-0.050800><0.855485,0.036000,0.050800> rotate<0,33.687844,0> translate<1.244600,0.000000,26.919475> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,26.919475>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,26.919475>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.244600,0.000000,26.919475> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,27.193353>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,27.193353>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.244600,0.000000,27.193353> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,27.193353>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,27.549256>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,90.000000,0> translate<1.956406,0.000000,27.549256> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,27.549256>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.837772,0.000000,27.667891>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.837772,0.000000,27.667891> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.837772,0.000000,27.667891>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.600503,0.000000,27.667891>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<1.600503,0.000000,27.667891> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.600503,0.000000,27.667891>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.481869,0.000000,27.549256>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.481869,0.000000,27.549256> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.481869,0.000000,27.549256>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.481869,0.000000,27.193353>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.481869,0.000000,27.193353> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.481869,0.000000,27.430622>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,27.667891>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,44.997030,0> translate<1.244600,0.000000,27.667891> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.837772,0.000000,28.416306>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,28.297672>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.837772,0.000000,28.416306> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,28.297672>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,28.060403>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.956406,0.000000,28.060403> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,28.060403>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.837772,0.000000,27.941769>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.837772,0.000000,27.941769> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.837772,0.000000,27.941769>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.719137,0.000000,27.941769>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.719137,0.000000,27.941769> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.719137,0.000000,27.941769>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.600503,0.000000,28.060403>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.600503,0.000000,28.060403> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.600503,0.000000,28.060403>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.600503,0.000000,28.297672>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<1.600503,0.000000,28.297672> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.600503,0.000000,28.297672>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.481869,0.000000,28.416306>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.481869,0.000000,28.416306> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.481869,0.000000,28.416306>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.363234,0.000000,28.416306>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<1.363234,0.000000,28.416306> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.363234,0.000000,28.416306>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,28.297672>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.244600,0.000000,28.297672> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,28.297672>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,28.060403>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.244600,0.000000,28.060403> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,28.060403>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.363234,0.000000,27.941769>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<1.244600,0.000000,28.060403> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.244600,0.000000,28.927453>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,28.927453>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<1.244600,0.000000,28.927453> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,28.690184>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.956406,0.000000,29.164722>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<1.956406,0.000000,29.164722> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.230372,0.000000,3.131491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,3.012856>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<44.230372,0.000000,3.131491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,3.012856>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,2.775588>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<44.349006,0.000000,2.775588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,2.775588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.230372,0.000000,2.656953>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<44.230372,0.000000,2.656953> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.230372,0.000000,2.656953>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.755834,0.000000,2.656953>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<43.755834,0.000000,2.656953> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.755834,0.000000,2.656953>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,2.775588>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<43.637200,0.000000,2.775588> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,2.775588>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,3.012856>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<43.637200,0.000000,3.012856> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,3.012856>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.755834,0.000000,3.131491>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.637200,0.000000,3.012856> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.755834,0.000000,3.131491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.993103,0.000000,3.131491>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<43.755834,0.000000,3.131491> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.993103,0.000000,3.131491>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.993103,0.000000,2.894222>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.993103,0.000000,2.894222> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,3.405369>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,3.405369>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<43.637200,0.000000,3.405369> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,3.405369>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,3.879906>}
box{<0,0,-0.050800><0.855485,0.036000,0.050800> rotate<0,33.687844,0> translate<43.637200,0.000000,3.879906> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,3.879906>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,3.879906>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<43.637200,0.000000,3.879906> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,4.153784>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,4.153784>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,0.000000,0> translate<43.637200,0.000000,4.153784> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,4.153784>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,4.509688>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,90.000000,0> translate<43.637200,0.000000,4.509688> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637200,0.000000,4.509688>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.755834,0.000000,4.628322>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.637200,0.000000,4.509688> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.755834,0.000000,4.628322>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.230372,0.000000,4.628322>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<43.755834,0.000000,4.628322> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.230372,0.000000,4.628322>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,4.509688>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<44.230372,0.000000,4.628322> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,4.509688>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.349006,0.000000,4.153784>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,-90.000000,0> translate<44.349006,0.000000,4.153784> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,5.870938>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,6.345475>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<43.891503,0.000000,6.345475> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.128772,0.000000,6.108206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.654234,0.000000,6.108206>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<43.654234,0.000000,6.108206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.128772,0.000000,6.619353>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,6.737988>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<44.128772,0.000000,6.619353> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,6.737988>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,6.975256>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<44.247406,0.000000,6.975256> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,6.975256>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.128772,0.000000,7.093891>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<44.128772,0.000000,7.093891> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.128772,0.000000,7.093891>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.010137,0.000000,7.093891>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<44.010137,0.000000,7.093891> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.010137,0.000000,7.093891>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,6.975256>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.891503,0.000000,6.975256> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,6.975256>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,6.856622>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.891503,0.000000,6.856622> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,6.975256>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,7.093891>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<43.772869,0.000000,7.093891> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,7.093891>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.654234,0.000000,7.093891>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<43.654234,0.000000,7.093891> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.654234,0.000000,7.093891>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,6.975256>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.535600,0.000000,6.975256> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,6.975256>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,6.737988>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.535600,0.000000,6.737988> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,6.737988>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.654234,0.000000,6.619353>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<43.535600,0.000000,6.737988> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,7.367769>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,7.367769>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<43.772869,0.000000,7.367769> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,7.367769>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,7.605038>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,44.997030,0> translate<43.535600,0.000000,7.605038> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,7.605038>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,7.842306>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.535600,0.000000,7.605038> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,7.842306>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,7.842306>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<43.772869,0.000000,7.842306> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.128772,0.000000,8.116184>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,8.234819>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<44.128772,0.000000,8.116184> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,8.234819>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,8.472088>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<44.247406,0.000000,8.472088> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.247406,0.000000,8.472088>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.128772,0.000000,8.590722>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<44.128772,0.000000,8.590722> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.128772,0.000000,8.590722>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.010137,0.000000,8.590722>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<44.010137,0.000000,8.590722> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.010137,0.000000,8.590722>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,8.472088>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.891503,0.000000,8.472088> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,8.472088>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,8.353453>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.891503,0.000000,8.353453> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.891503,0.000000,8.472088>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,8.590722>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<43.772869,0.000000,8.590722> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.772869,0.000000,8.590722>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.654234,0.000000,8.590722>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,0.000000,0> translate<43.654234,0.000000,8.590722> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.654234,0.000000,8.590722>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,8.472088>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<43.535600,0.000000,8.472088> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,8.472088>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,8.234819>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.535600,0.000000,8.234819> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.535600,0.000000,8.234819>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.654234,0.000000,8.116184>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<43.535600,0.000000,8.234819> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.063509,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.182144,0.000000,57.430006>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.063509,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.182144,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.419412,0.000000,57.430006>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<33.182144,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.419412,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.538047,0.000000,57.311372>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<33.419412,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.538047,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.538047,0.000000,56.836834>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.538047,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.538047,0.000000,56.836834>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.419412,0.000000,56.718200>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.419412,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.419412,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.182144,0.000000,56.718200>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<33.182144,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.182144,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.063509,0.000000,56.836834>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<33.063509,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.063509,0.000000,56.836834>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.063509,0.000000,57.074103>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,90.000000,0> translate<33.063509,0.000000,57.074103> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.063509,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.300778,0.000000,57.074103>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<33.063509,0.000000,57.074103> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.789631,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.789631,0.000000,57.430006>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<32.789631,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.789631,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.315094,0.000000,56.718200>}
box{<0,0,-0.050800><0.855485,0.036000,0.050800> rotate<0,-56.306216,0> translate<32.315094,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.315094,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.315094,0.000000,57.430006>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<32.315094,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.041216,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.041216,0.000000,56.718200>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.041216,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.041216,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.685313,0.000000,56.718200>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<31.685313,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.685313,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.566678,0.000000,56.836834>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<31.566678,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.566678,0.000000,56.836834>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.566678,0.000000,57.311372>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<31.566678,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.566678,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.685313,0.000000,57.430006>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<31.566678,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.685313,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.041216,0.000000,57.430006>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<31.685313,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.359559,0.000000,57.379206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.596828,0.000000,57.379206>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<37.359559,0.000000,57.379206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.596828,0.000000,57.379206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.715463,0.000000,57.260572>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<37.596828,0.000000,57.379206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.715463,0.000000,57.260572>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.715463,0.000000,56.786034>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,-90.000000,0> translate<37.715463,0.000000,56.786034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.715463,0.000000,56.786034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.596828,0.000000,56.667400>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<37.596828,0.000000,56.667400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.596828,0.000000,56.667400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.359559,0.000000,56.667400>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<37.359559,0.000000,56.667400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.359559,0.000000,56.667400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.240925,0.000000,56.786034>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<37.240925,0.000000,56.786034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.240925,0.000000,56.786034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.240925,0.000000,57.260572>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<37.240925,0.000000,57.260572> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.240925,0.000000,57.260572>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.359559,0.000000,57.379206>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<37.240925,0.000000,57.260572> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.967047,0.000000,57.379206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.967047,0.000000,56.786034>}
box{<0,0,-0.050800><0.593172,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.967047,0.000000,56.786034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.967047,0.000000,56.786034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.848413,0.000000,56.667400>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<36.848413,0.000000,56.667400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.848413,0.000000,56.667400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.611144,0.000000,56.667400>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<36.611144,0.000000,56.667400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.611144,0.000000,56.667400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.492509,0.000000,56.786034>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<36.492509,0.000000,56.786034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.492509,0.000000,56.786034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.492509,0.000000,57.379206>}
box{<0,0,-0.050800><0.593172,0.036000,0.050800> rotate<0,90.000000,0> translate<36.492509,0.000000,57.379206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.981363,0.000000,56.667400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.981363,0.000000,57.379206>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<35.981363,0.000000,57.379206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.218631,0.000000,57.379206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.744094,0.000000,57.379206>}
box{<0,0,-0.050800><0.474537,0.036000,0.050800> rotate<0,0.000000,0> translate<35.744094,0.000000,57.379206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.470216,0.000000,56.667400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.470216,0.000000,57.379206>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<35.470216,0.000000,57.379206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.470216,0.000000,57.379206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.114313,0.000000,57.379206>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<35.114313,0.000000,57.379206> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.114313,0.000000,57.379206>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.995678,0.000000,57.260572>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.995678,0.000000,57.260572> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.995678,0.000000,57.260572>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.995678,0.000000,57.023303>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.995678,0.000000,57.023303> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.995678,0.000000,57.023303>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.114313,0.000000,56.904669>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<34.995678,0.000000,57.023303> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.114313,0.000000,56.904669>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.470216,0.000000,56.904669>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<35.114313,0.000000,56.904669> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.232947,0.000000,56.904669>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.995678,0.000000,56.667400>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.995678,0.000000,56.667400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.968159,0.000000,57.455406>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.205428,0.000000,57.455406>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<29.968159,0.000000,57.455406> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.205428,0.000000,57.455406>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.324063,0.000000,57.336772>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<30.205428,0.000000,57.455406> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.324063,0.000000,57.336772>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.324063,0.000000,56.862234>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,-90.000000,0> translate<30.324063,0.000000,56.862234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.324063,0.000000,56.862234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.205428,0.000000,56.743600>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<30.205428,0.000000,56.743600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.205428,0.000000,56.743600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.968159,0.000000,56.743600>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<29.968159,0.000000,56.743600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.968159,0.000000,56.743600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.849525,0.000000,56.862234>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<29.849525,0.000000,56.862234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.849525,0.000000,56.862234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.849525,0.000000,57.336772>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<29.849525,0.000000,57.336772> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.849525,0.000000,57.336772>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.968159,0.000000,57.455406>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<29.849525,0.000000,57.336772> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.575647,0.000000,57.455406>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.575647,0.000000,56.862234>}
box{<0,0,-0.050800><0.593172,0.036000,0.050800> rotate<0,-90.000000,0> translate<29.575647,0.000000,56.862234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.575647,0.000000,56.862234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.457013,0.000000,56.743600>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<29.457013,0.000000,56.743600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.457013,0.000000,56.743600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.219744,0.000000,56.743600>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<29.219744,0.000000,56.743600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.219744,0.000000,56.743600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.101109,0.000000,56.862234>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<29.101109,0.000000,56.862234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.101109,0.000000,56.862234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.101109,0.000000,57.455406>}
box{<0,0,-0.050800><0.593172,0.036000,0.050800> rotate<0,90.000000,0> translate<29.101109,0.000000,57.455406> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.589963,0.000000,56.743600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.589963,0.000000,57.455406>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<28.589963,0.000000,57.455406> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.827231,0.000000,57.455406>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.352694,0.000000,57.455406>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<28.352694,0.000000,57.455406> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.078816,0.000000,57.455406>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.078816,0.000000,56.743600>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.078816,0.000000,56.743600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.078816,0.000000,56.743600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.604278,0.000000,56.743600>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<27.604278,0.000000,56.743600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.100372,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219006,0.000000,57.430006>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<26.100372,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219006,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.456275,0.000000,57.430006>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<26.219006,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.456275,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.574909,0.000000,57.311372>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<26.456275,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.574909,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.574909,0.000000,57.192737>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.574909,0.000000,57.192737> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.574909,0.000000,57.192737>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.456275,0.000000,57.074103>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<26.456275,0.000000,57.074103> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.456275,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219006,0.000000,57.074103>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<26.219006,0.000000,57.074103> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219006,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.100372,0.000000,56.955469>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<26.100372,0.000000,56.955469> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.100372,0.000000,56.955469>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.100372,0.000000,56.836834>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.100372,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.100372,0.000000,56.836834>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219006,0.000000,56.718200>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<26.100372,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.219006,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.456275,0.000000,56.718200>}
box{<0,0,-0.050800><0.237269,0.036000,0.050800> rotate<0,0.000000,0> translate<26.219006,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.456275,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.574909,0.000000,56.836834>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<26.456275,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.589225,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.589225,0.000000,57.430006>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<25.589225,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.826494,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.351956,0.000000,57.430006>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<25.351956,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.078078,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.078078,0.000000,57.192737>}
box{<0,0,-0.050800><0.474537,0.036000,0.050800> rotate<0,90.000000,0> translate<25.078078,0.000000,57.192737> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.078078,0.000000,57.192737>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.840809,0.000000,57.430006>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,44.997030,0> translate<24.840809,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.840809,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.603541,0.000000,57.192737>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,-44.997030,0> translate<24.603541,0.000000,57.192737> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.603541,0.000000,57.192737>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.603541,0.000000,56.718200>}
box{<0,0,-0.050800><0.474537,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.603541,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.078078,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.603541,0.000000,57.074103>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,0.000000,0> translate<24.603541,0.000000,57.074103> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.329663,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.329663,0.000000,57.430006>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<24.329663,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.329663,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.855125,0.000000,56.718200>}
box{<0,0,-0.050800><0.855485,0.036000,0.050800> rotate<0,-56.306216,0> translate<23.855125,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.855125,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.855125,0.000000,57.430006>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<23.855125,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.581247,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.581247,0.000000,56.718200>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.581247,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.581247,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.225344,0.000000,56.718200>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<23.225344,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.225344,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.106709,0.000000,56.836834>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<23.106709,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.106709,0.000000,56.836834>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.106709,0.000000,57.311372>}
box{<0,0,-0.050800><0.474538,0.036000,0.050800> rotate<0,90.000000,0> translate<23.106709,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.106709,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.225344,0.000000,57.430006>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<23.106709,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.225344,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.581247,0.000000,57.430006>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<23.225344,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.832831,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.832831,0.000000,57.430006>}
box{<0,0,-0.050800><0.711806,0.036000,0.050800> rotate<0,90.000000,0> translate<22.832831,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.832831,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.476928,0.000000,57.430006>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<22.476928,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.476928,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,57.311372>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.358294,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,57.192737>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.358294,0.000000,57.192737> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,57.192737>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.476928,0.000000,57.074103>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<22.358294,0.000000,57.192737> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.476928,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,56.955469>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.358294,0.000000,56.955469> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,56.955469>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,56.836834>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.358294,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.358294,0.000000,56.836834>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.476928,0.000000,56.718200>}
box{<0,0,-0.050800><0.167774,0.036000,0.050800> rotate<0,44.997030,0> translate<22.358294,0.000000,56.836834> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.476928,0.000000,56.718200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.832831,0.000000,56.718200>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<22.476928,0.000000,56.718200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.832831,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.476928,0.000000,57.074103>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,0.000000,0> translate<22.476928,0.000000,57.074103> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.084416,0.000000,57.430006>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.084416,0.000000,57.311372>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.084416,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.084416,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.847147,0.000000,57.074103>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,-44.997030,0> translate<21.847147,0.000000,57.074103> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.847147,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.609878,0.000000,57.311372>}
box{<0,0,-0.050800><0.335549,0.036000,0.050800> rotate<0,44.997030,0> translate<21.609878,0.000000,57.311372> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.609878,0.000000,57.311372>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.609878,0.000000,57.430006>}
box{<0,0,-0.050800><0.118634,0.036000,0.050800> rotate<0,90.000000,0> translate<21.609878,0.000000,57.430006> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.847147,0.000000,57.074103>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.847147,0.000000,56.718200>}
box{<0,0,-0.050800><0.355903,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.847147,0.000000,56.718200> }
//BOOT0_0 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.391800,-1.536000,34.976000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.679800,-1.536000,34.976000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<6.679800,-1.536000,34.976000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.391800,-1.536000,34.125000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.679800,-1.536000,34.125000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<6.679800,-1.536000,34.125000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<7.623950,-1.536000,34.549100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<6.455550,-1.536000,34.549100>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<7.035800,-1.536000,34.544000>}
//BOOT0_1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.391800,-1.536000,32.182000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.679800,-1.536000,32.182000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<6.679800,-1.536000,32.182000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.391800,-1.536000,31.331000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.679800,-1.536000,31.331000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<6.679800,-1.536000,31.331000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<7.623950,-1.536000,31.755100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<6.455550,-1.536000,31.755100>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<7.035800,-1.536000,31.750000>}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.904500,-1.536000,39.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.304500,-1.536000,39.589000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.304500,-1.536000,39.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.904500,-1.536000,38.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.304500,-1.536000,38.389000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.304500,-1.536000,38.389000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.084000,-1.536000,23.604500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.084000,-1.536000,23.004500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.084000,-1.536000,23.004500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.284000,-1.536000,23.604500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.284000,-1.536000,23.004500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.284000,-1.536000,23.004500> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.023800,-1.536000,26.120800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.623800,-1.536000,26.120800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.023800,-1.536000,26.120800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.023800,-1.536000,27.320800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.623800,-1.536000,27.320800>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.023800,-1.536000,27.320800> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.165100,-1.536000,36.352200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.165100,-1.536000,36.952200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.165100,-1.536000,36.952200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.965100,-1.536000,36.352200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.965100,-1.536000,36.952200>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.965100,-1.536000,36.952200> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443200,-1.536000,30.991100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.843200,-1.536000,30.991100>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.843200,-1.536000,30.991100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.443200,-1.536000,29.791100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.843200,-1.536000,29.791100>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.843200,-1.536000,29.791100> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.442200,-1.536000,41.582900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.842200,-1.536000,41.582900>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.842200,-1.536000,41.582900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.442200,-1.536000,40.382900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.842200,-1.536000,40.382900>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.842200,-1.536000,40.382900> }
//C21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.499000,-1.536000,37.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.499000,-1.536000,37.165000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.499000,-1.536000,37.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.699000,-1.536000,37.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.699000,-1.536000,37.165000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.699000,-1.536000,37.165000> }
//C22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.461000,-1.536000,29.291000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.461000,-1.536000,29.891000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.461000,-1.536000,29.891000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.261000,-1.536000,29.291000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.261000,-1.536000,29.891000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.261000,-1.536000,29.891000> }
//C23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.987000,-1.536000,29.238500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.387000,-1.536000,29.238500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.387000,-1.536000,29.238500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.987000,-1.536000,28.038500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.387000,-1.536000,28.038500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.387000,-1.536000,28.038500> }
//C24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.574000,-1.536000,39.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.974000,-1.536000,39.970000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.974000,-1.536000,39.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.574000,-1.536000,38.770000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.974000,-1.536000,38.770000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.974000,-1.536000,38.770000> }
//C25 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.574000,-1.536000,42.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.974000,-1.536000,42.510000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.974000,-1.536000,42.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.574000,-1.536000,41.310000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.974000,-1.536000,41.310000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.974000,-1.536000,41.310000> }
//C26 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.908000,-1.536000,42.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.308000,-1.536000,42.256000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.308000,-1.536000,42.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.908000,-1.536000,41.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.308000,-1.536000,41.056000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.308000,-1.536000,41.056000> }
//C27 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.908000,-1.536000,39.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.308000,-1.536000,39.716000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.308000,-1.536000,39.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.908000,-1.536000,38.516000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.308000,-1.536000,38.516000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.308000,-1.536000,38.516000> }
//C28 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.510500,-1.536000,47.653500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.910500,-1.536000,47.653500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.910500,-1.536000,47.653500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.510500,-1.536000,46.453500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.910500,-1.536000,46.453500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.910500,-1.536000,46.453500> }
//C29 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.498500,-1.536000,46.453500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.098500,-1.536000,46.453500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.498500,-1.536000,46.453500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.498500,-1.536000,47.653500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.098500,-1.536000,47.653500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.498500,-1.536000,47.653500> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,36.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,36.504000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.018000,-1.536000,36.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,36.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,27.504000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.018000,-1.536000,27.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,27.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,27.258000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,44.997030,0> translate<12.018000,-1.536000,27.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,27.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,27.258000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.264000,-1.536000,27.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,27.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,27.504000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.264000,-1.536000,27.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,27.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,36.504000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.510000,-1.536000,36.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,36.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,36.750000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,44.997030,0> translate<21.264000,-1.536000,36.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,36.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,36.750000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.264000,-1.536000,36.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,36.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,36.504000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.018000,-1.536000,36.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,36.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,36.750000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.264000,-1.536000,36.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,36.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,36.750000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,44.997030,0> translate<21.264000,-1.536000,36.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,27.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,36.504000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.510000,-1.536000,36.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,27.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.510000,-1.536000,27.504000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.264000,-1.536000,27.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,27.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.264000,-1.536000,27.258000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.264000,-1.536000,27.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,27.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.264000,-1.536000,27.258000>}
box{<0,0,-0.076200><0.347897,0.036000,0.076200> rotate<0,44.997030,0> translate<12.018000,-1.536000,27.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,36.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.018000,-1.536000,27.504000>}
box{<0,0,-0.076200><9.000000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.018000,-1.536000,27.504000> }
difference{
cylinder{<13.264000,0,35.504000><13.264000,0.036000,35.504000>0.476200 translate<0,-1.536000,0>}
cylinder{<13.264000,-0.1,35.504000><13.264000,0.135000,35.504000>0.323800 translate<0,-1.536000,0>}}
difference{
cylinder{<13.264000,0,35.504000><13.264000,0.036000,35.504000>0.476200 translate<0,-1.536000,0>}
cylinder{<13.264000,-0.1,35.504000><13.264000,0.135000,35.504000>0.323800 translate<0,-1.536000,0>}}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<13.014000,-1.536000,37.326200>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,35.754000>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<13.014000,-1.536000,26.681800>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,35.754000>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<13.514000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<14.014000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<14.514000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<15.014000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<15.514000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<16.014000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<16.514000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<17.014000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<17.514000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<18.014000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<18.514000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<19.014000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<19.514000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<20.014000,-1.536000,37.326200>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<20.514000,-1.536000,37.326200>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,35.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,34.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,34.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,33.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,33.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,32.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,32.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,31.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,31.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,30.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,30.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,29.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,29.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,28.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<22.086200,-1.536000,28.254000>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<13.514000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<14.014000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<14.514000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<15.014000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<15.514000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<16.014000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<16.514000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<17.014000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<17.514000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<18.014000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<18.514000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<19.014000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<19.514000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<20.014000,-1.536000,26.681800>}
box{<-0.500000,0,-0.110000><0.500000,0.036000,0.110000> rotate<0,-270.000000,0> translate<20.514000,-1.536000,26.681800>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,35.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,34.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,34.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,33.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,33.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,32.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,32.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,31.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,31.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,30.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,30.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,29.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,29.254000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,28.754000>}
box{<-0.110000,0,-0.500000><0.110000,0.036000,0.500000> rotate<0,-270.000000,0> translate<11.441800,-1.536000,28.254000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,20.002500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,18.732500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.397500,0.000000,18.732500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,18.732500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,18.097500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.762500,0.000000,18.097500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,18.097500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,18.097500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.492500,0.000000,18.097500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,18.097500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,18.732500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<2.857500,0.000000,18.732500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,18.097500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,17.462500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.762500,0.000000,18.097500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,17.462500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,16.192500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.397500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,15.557500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.762500,0.000000,15.557500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,15.557500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,15.557500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.492500,0.000000,15.557500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,15.557500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,16.192500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<2.857500,0.000000,16.192500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,16.192500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,17.462500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.857500,0.000000,17.462500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,17.462500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,18.097500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.857500,0.000000,17.462500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,23.177500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,22.542500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.762500,0.000000,23.177500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,22.542500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,21.272500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.397500,0.000000,21.272500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,21.272500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,20.637500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.762500,0.000000,20.637500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,20.637500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,20.637500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.492500,0.000000,20.637500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,20.637500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,21.272500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<2.857500,0.000000,21.272500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,21.272500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,22.542500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.857500,0.000000,22.542500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,22.542500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,23.177500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.857500,0.000000,22.542500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,20.002500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,20.637500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.762500,0.000000,20.637500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,20.637500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,20.002500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.857500,0.000000,20.002500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,18.732500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,20.002500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.857500,0.000000,20.002500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,27.622500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,26.352500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.397500,0.000000,26.352500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,26.352500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,25.717500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.762500,0.000000,25.717500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,25.717500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,25.717500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.492500,0.000000,25.717500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,25.717500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,26.352500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<2.857500,0.000000,26.352500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,25.717500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,25.082500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.762500,0.000000,25.717500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,25.082500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,23.812500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.397500,0.000000,23.812500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,23.812500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,23.177500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.762500,0.000000,23.177500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,23.177500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,23.177500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.492500,0.000000,23.177500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,23.177500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,23.812500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<2.857500,0.000000,23.812500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,23.812500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,25.082500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.857500,0.000000,25.082500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,25.082500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,25.717500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.857500,0.000000,25.082500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,28.257500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,28.257500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.492500,0.000000,28.257500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,27.622500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,28.257500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.762500,0.000000,28.257500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,28.257500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,27.622500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.857500,0.000000,27.622500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,26.352500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,27.622500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.857500,0.000000,27.622500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,14.922500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,13.652500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.397500,0.000000,13.652500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,13.652500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,13.017500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.762500,0.000000,13.017500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,13.017500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,13.017500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.492500,0.000000,13.017500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,13.017500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,13.652500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<2.857500,0.000000,13.652500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.397500,0.000000,14.922500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.762500,0.000000,15.557500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.762500,0.000000,15.557500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.492500,0.000000,15.557500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,14.922500>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.857500,0.000000,14.922500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,13.652500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.857500,0.000000,14.922500>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<2.857500,0.000000,14.922500> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.127500,0.000000,16.827500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.127500,0.000000,19.367500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.127500,0.000000,21.907500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.127500,0.000000,24.447500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.127500,0.000000,26.987500>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<4.127500,0.000000,14.287500>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.309600,0.000000,2.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.309600,0.000000,9.314000>}
box{<0,0,-0.101600><7.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.309600,0.000000,9.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.309600,0.000000,9.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.509600,0.000000,9.314000>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.309600,0.000000,9.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.509600,0.000000,9.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.309600,0.000000,9.314000>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.509600,0.000000,9.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.309600,0.000000,9.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.309600,0.000000,2.314000>}
box{<0,0,-0.101600><7.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<42.309600,0.000000,2.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.309600,0.000000,2.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.509600,0.000000,2.314000>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.509600,0.000000,2.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.509600,0.000000,2.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.309600,0.000000,2.314000>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.309600,0.000000,2.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.509600,0.000000,9.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.509600,0.000000,2.314000>}
box{<0,0,-0.101600><7.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.509600,0.000000,2.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.059600,0.000000,2.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.059600,0.000000,1.914000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.059600,0.000000,1.914000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.059600,0.000000,1.914000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.059600,0.000000,1.914000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.059600,0.000000,1.914000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.059600,0.000000,1.914000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.059600,0.000000,2.314000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<41.059600,0.000000,2.314000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.559600,0.000000,9.314000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.559600,0.000000,9.714000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.559600,0.000000,9.714000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.559600,0.000000,9.714000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.559600,0.000000,9.714000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.559600,0.000000,9.714000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.559600,0.000000,9.714000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.559600,0.000000,9.314000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.559600,0.000000,9.314000> }
difference{
cylinder{<35.709600,0,6.064000><35.709600,0.036000,6.064000>0.346300 translate<0,0.000000,0>}
cylinder{<35.709600,-0.1,6.064000><35.709600,0.135000,6.064000>0.219300 translate<0,0.000000,0>}}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,49.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,49.305000>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.091000,0.000000,49.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,49.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,55.505000>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.091000,0.000000,55.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,55.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,56.305000>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.091000,0.000000,56.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,56.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,56.305000>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.091000,0.000000,56.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,56.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,55.505000>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.191000,0.000000,55.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,55.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,49.305000>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.191000,0.000000,49.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,55.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,55.505000>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.091000,0.000000,55.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,54.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.591000,0.000000,54.055000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<19.191000,0.000000,54.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.591000,0.000000,54.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.591000,0.000000,55.055000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.591000,0.000000,55.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.591000,0.000000,55.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.191000,0.000000,55.055000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<19.191000,0.000000,55.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,49.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.691000,0.000000,49.555000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.691000,0.000000,49.555000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.691000,0.000000,49.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.691000,0.000000,50.555000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<3.691000,0.000000,50.555000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.691000,0.000000,50.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.091000,0.000000,50.555000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.691000,0.000000,50.555000> }
difference{
cylinder{<16.891000,0,52.705000><16.891000,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<16.891000,-0.1,52.705000><16.891000,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<13.391000,0,52.705000><13.391000,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<13.391000,-0.1,52.705000><13.391000,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<9.891000,0,52.705000><9.891000,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<9.891000,-0.1,52.705000><9.891000,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<6.391000,0,52.705000><6.391000,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<6.391000,-0.1,52.705000><6.391000,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,9.445200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,9.445200>}
box{<0,0,-0.101600><11.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<19.290000,0.000000,9.445200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,9.445200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,3.245200>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.890000,0.000000,3.245200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,3.245200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,2.445200>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.890000,0.000000,2.445200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,2.445200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,2.445200>}
box{<0,0,-0.101600><11.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<19.290000,0.000000,2.445200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,2.445200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,3.245200>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.290000,0.000000,3.245200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,3.245200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,9.445200>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.290000,0.000000,9.445200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,3.245200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,3.245200>}
box{<0,0,-0.101600><11.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<19.290000,0.000000,3.245200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,4.695200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.890000,0.000000,4.695200>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.890000,0.000000,4.695200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.890000,0.000000,4.695200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.890000,0.000000,3.695200>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<18.890000,0.000000,3.695200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.890000,0.000000,3.695200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.290000,0.000000,3.695200>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.890000,0.000000,3.695200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,9.195200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.290000,0.000000,9.195200>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.890000,0.000000,9.195200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.290000,0.000000,9.195200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.290000,0.000000,8.195200>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.290000,0.000000,8.195200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.290000,0.000000,8.195200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.890000,0.000000,8.195200>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.890000,0.000000,8.195200> }
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,49.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,49.305000>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.531400,0.000000,49.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,49.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,55.505000>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.531400,0.000000,55.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,55.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,56.305000>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.531400,0.000000,56.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,56.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,56.305000>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.531400,0.000000,56.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,56.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,55.505000>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.631400,0.000000,55.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,55.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,49.305000>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.631400,0.000000,49.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,55.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,55.505000>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.531400,0.000000,55.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,54.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.031400,0.000000,54.055000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.631400,0.000000,54.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.031400,0.000000,54.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.031400,0.000000,55.055000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.031400,0.000000,55.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.031400,0.000000,55.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.631400,0.000000,55.055000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.631400,0.000000,55.055000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,49.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.131400,0.000000,49.555000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.131400,0.000000,49.555000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.131400,0.000000,49.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.131400,0.000000,50.555000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.131400,0.000000,50.555000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.131400,0.000000,50.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.531400,0.000000,50.555000>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<22.131400,0.000000,50.555000> }
difference{
cylinder{<35.331400,0,52.705000><35.331400,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<35.331400,-0.1,52.705000><35.331400,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<31.831400,0,52.705000><31.831400,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<31.831400,-0.1,52.705000><31.831400,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<28.331400,0,52.705000><28.331400,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<28.331400,-0.1,52.705000><28.331400,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<24.831400,0,52.705000><24.831400,0.036000,52.705000>0.425500 translate<0,0.000000,0>}
cylinder{<24.831400,-0.1,52.705000><24.831400,0.135000,52.705000>0.424500 translate<0,0.000000,0>}}
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,9.470600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,9.470600>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.576800,0.000000,9.470600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,9.470600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,3.270600>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.676800,0.000000,3.270600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,3.270600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,2.470600>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.676800,0.000000,2.470600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,2.470600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,2.470600>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.576800,0.000000,2.470600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,2.470600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,3.270600>}
box{<0,0,-0.101600><0.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.576800,0.000000,3.270600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,3.270600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,9.470600>}
box{<0,0,-0.101600><6.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.576800,0.000000,9.470600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,3.270600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,3.270600>}
box{<0,0,-0.101600><15.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.576800,0.000000,3.270600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,4.720600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.176800,0.000000,4.720600>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.176800,0.000000,4.720600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.176800,0.000000,4.720600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.176800,0.000000,3.720600>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.176800,0.000000,3.720600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.176800,0.000000,3.720600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.576800,0.000000,3.720600>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.176800,0.000000,3.720600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,9.220600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.076800,0.000000,9.220600>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.676800,0.000000,9.220600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.076800,0.000000,9.220600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.076800,0.000000,8.220600>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<18.076800,0.000000,8.220600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.076800,0.000000,8.220600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.676800,0.000000,8.220600>}
box{<0,0,-0.101600><0.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.676800,0.000000,8.220600> }
difference{
cylinder{<4.876800,0,6.070600><4.876800,0.036000,6.070600>0.425500 translate<0,0.000000,0>}
cylinder{<4.876800,-0.1,6.070600><4.876800,0.135000,6.070600>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<8.376800,0,6.070600><8.376800,0.036000,6.070600>0.425500 translate<0,0.000000,0>}
cylinder{<8.376800,-0.1,6.070600><8.376800,0.135000,6.070600>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<11.876800,0,6.070600><11.876800,0.036000,6.070600>0.425500 translate<0,0.000000,0>}
cylinder{<11.876800,-0.1,6.070600><11.876800,0.135000,6.070600>0.424500 translate<0,0.000000,0>}}
difference{
cylinder{<15.376800,0,6.070600><15.376800,0.036000,6.070600>0.425500 translate<0,0.000000,0>}
cylinder{<15.376800,-0.1,6.070600><15.376800,0.135000,6.070600>0.424500 translate<0,0.000000,0>}}
//MMC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.487600,-1.536000,23.431500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.815000,-1.536000,23.431500>}
box{<0,0,-0.063500><3.327400,0.036000,0.063500> rotate<0,0.000000,0> translate<40.487600,-1.536000,23.431500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.815000,-1.536000,23.431500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.069000,-1.536000,23.177500>}
box{<0,0,-0.063500><0.359210,0.036000,0.063500> rotate<0,44.997030,0> translate<43.815000,-1.536000,23.431500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.069000,-1.536000,23.177500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.069000,-1.536000,12.509500>}
box{<0,0,-0.063500><10.668000,0.036000,0.063500> rotate<0,-90.000000,0> translate<44.069000,-1.536000,12.509500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.069000,-1.536000,12.509500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.815000,-1.536000,12.255500>}
box{<0,0,-0.063500><0.359210,0.036000,0.063500> rotate<0,-44.997030,0> translate<43.815000,-1.536000,12.255500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.815000,-1.536000,12.255500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.487600,-1.536000,12.255500>}
box{<0,0,-0.063500><3.327400,0.036000,0.063500> rotate<0,0.000000,0> translate<40.487600,-1.536000,12.255500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.549600,-1.536000,23.914100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.549600,-1.536000,13.144500>}
box{<0,0,-0.063500><10.769600,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.549600,-1.536000,13.144500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.608000,-1.536000,23.939500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.766000,-1.536000,23.939500>}
box{<0,0,-0.063500><5.842000,0.036000,0.063500> rotate<0,0.000000,0> translate<32.766000,-1.536000,23.939500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.641800,-1.536000,23.914100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.549600,-1.536000,23.914100>}
box{<0,0,-0.063500><1.092200,0.036000,0.063500> rotate<0,0.000000,0> translate<28.549600,-1.536000,23.914100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.582600,-1.536000,11.976100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.156400,-1.536000,11.976100>}
box{<0,0,-0.063500><6.426200,0.036000,0.063500> rotate<0,0.000000,0> translate<32.156400,-1.536000,11.976100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.327600,-1.536000,11.976100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.743400,-1.536000,11.976100>}
box{<0,0,-0.063500><0.584200,0.036000,0.063500> rotate<0,0.000000,0> translate<29.743400,-1.536000,11.976100> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.020000,-1.536000,28.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.020000,-1.536000,27.640000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.020000,-1.536000,27.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,-1.536000,28.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.220000,-1.536000,27.640000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.220000,-1.536000,27.640000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.939000,-1.536000,36.674500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.539000,-1.536000,36.674500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.939000,-1.536000,36.674500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.939000,-1.536000,37.874500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.539000,-1.536000,37.874500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.939000,-1.536000,37.874500> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.132600,-1.536000,15.738400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.532600,-1.536000,15.738400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.532600,-1.536000,15.738400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.132600,-1.536000,14.538400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.532600,-1.536000,14.538400>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.532600,-1.536000,14.538400> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.920000,-1.536000,22.799600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.320000,-1.536000,22.799600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.320000,-1.536000,22.799600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.920000,-1.536000,21.599600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.320000,-1.536000,21.599600>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.320000,-1.536000,21.599600> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.920000,-1.536000,24.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.320000,-1.536000,24.984000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.320000,-1.536000,24.984000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.920000,-1.536000,23.784000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.320000,-1.536000,23.784000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.320000,-1.536000,23.784000> }
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.371500,-1.536000,43.786500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.971500,-1.536000,43.786500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.371500,-1.536000,43.786500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.371500,-1.536000,44.986500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.971500,-1.536000,44.986500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.371500,-1.536000,44.986500> }
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.510500,-1.536000,45.113500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.910500,-1.536000,45.113500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.910500,-1.536000,45.113500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.510500,-1.536000,43.913500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.910500,-1.536000,43.913500>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.910500,-1.536000,43.913500> }
//U5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.487000,-1.536000,32.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.887000,-1.536000,32.140000>}
box{<0,0,-0.101600><6.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.487000,-1.536000,32.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.887000,-1.536000,32.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.887000,-1.536000,35.932000>}
box{<0,0,-0.101600><3.792000,0.036000,0.101600> rotate<0,90.000000,0> translate<38.887000,-1.536000,35.932000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.887000,-1.536000,35.932000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.487000,-1.536000,35.932000>}
box{<0,0,-0.101600><6.400000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.487000,-1.536000,35.932000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.487000,-1.536000,35.932000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.487000,-1.536000,32.140000>}
box{<0,0,-0.101600><3.792000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.487000,-1.536000,32.140000> }
difference{
cylinder{<33.162000,0,35.336000><33.162000,0.036000,35.336000>0.426600 translate<0,-1.536000,0>}
cylinder{<33.162000,-0.1,35.336000><33.162000,0.135000,35.336000>0.223400 translate<0,-1.536000,0>}}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<32.762000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<33.412000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<34.062000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<34.712000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<35.362000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<36.012000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<36.662000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<37.312000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<37.962000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-0.000000,0> translate<38.612000,-1.536000,36.547000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<38.612000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<37.962000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<37.312000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<36.662000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<36.012000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<35.362000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<34.712000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<34.062000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<33.412000,-1.536000,31.525000>}
box{<-0.150000,0,-0.535000><0.150000,0.036000,0.535000> rotate<0,-180.000000,0> translate<32.762000,-1.536000,31.525000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  STM32F410RB_PCM5100(-23.152100,0,-29.083100,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:

{SinOsc.ar(2)+SinOsc.ar(3)+SinOsc.ar(4)+SinOsc.ar(5)}.plot(1);
{SinOsc.ar(2, 0, 0.4)+SinOsc.ar(3, 0, 0.3)+SinOsc.ar(4, 0, 0.2)+SinOsc.ar(5, 0, 0.1)}.plot(1);
{SinOsc.ar(20)+SinOsc.ar(30)+SinOsc.ar(40)+SinOsc.ar(50)}.plot(1);

2*3*4*5
44100/120

{SinOsc.ar(440, 0, SinOsc.ar(20, 0, 0.18)+SinOsc.ar(30, 0, 0.18)+SinOsc.ar(40, 0, 0.18)+SinOsc.ar(50, 0, 0.18))+SinOsc.ar(550, 0, SinOsc.ar(20, 0, 0.18)+SinOsc.ar(30, 0, 0.18)+SinOsc.ar(40, 0, 0.18)+SinOsc.ar(50, 0, 0.18))+SinOsc.ar(660, 0, SinOsc.ar(20, 0, 0.18)+SinOsc.ar(30, 0, 0.18)+SinOsc.ar(40, 0, 0.18)+SinOsc.ar(50, 0, 0.18))+SinOsc.ar(770, 0, SinOsc.ar(20, 0, 0.18)+SinOsc.ar(30, 0, 0.18)+SinOsc.ar(40, 0, 0.18)+SinOsc.ar(50, 0, 0.18))+SinOsc.ar(880, 0, SinOsc.ar(20, 0, 0.18)+SinOsc.ar(30, 0, 0.18)+SinOsc.ar(40, 0, 0.18)+SinOsc.ar(50, 0, 0.18))+SinOsc.ar(990, 0, SinOsc.ar(20, 0, 0.18)+SinOsc.ar(30, 0, 0.18)+SinOsc.ar(40, 0, 0.18)+SinOsc.ar(50, 0, 0.18))}.scope;

{SinOsc.ar(440, 0, SinOsc.ar(10, 0, 0.18)+SinOsc.ar(20, 0, 0.18)+SinOsc.ar(30, 0, 0.18)+SinOsc.ar(40, 0, 0.18))+SinOsc.ar(550, 0, SinOsc.ar(11, 0, 0.18)+SinOsc.ar(21, 0, 0.18)+SinOsc.ar(31, 0, 0.18)+SinOsc.ar(41, 0, 0.18))+SinOsc.ar(660, 0, SinOsc.ar(12, 0, 0.18)+SinOsc.ar(22, 0, 0.18)+SinOsc.ar(32, 0, 0.18)+SinOsc.ar(42, 0, 0.18))+SinOsc.ar(770, 0, SinOsc.ar(13, 0, 0.18)+SinOsc.ar(23, 0, 0.18)+SinOsc.ar(33, 0, 0.18)+SinOsc.ar(43, 0, 0.18))+SinOsc.ar(880, 0, SinOsc.ar(14, 0, 0.18)+SinOsc.ar(24, 0, 0.18)+SinOsc.ar(34, 0, 0.18)+SinOsc.ar(44, 0, 0.18))+SinOsc.ar(990, 0, SinOsc.ar(15, 0, 0.18)+SinOsc.ar(25, 0, 0.18)+SinOsc.ar(35, 0, 0.18)+SinOsc.ar(45, 0, 0.18))}.scope;

{Out.ar([0,1], SinOsc.ar(440, 0, SinOsc.ar(10, 0, 0.18)+SinOsc.ar(16, 0, 0.18)+SinOsc.ar(22, 0, 0.18)+SinOsc.ar(28, 0, 0.18))+SinOsc.ar(550, 0, SinOsc.ar(11, 0, 0.18)+SinOsc.ar(17, 0, 0.18)+SinOsc.ar(23, 0, 0.18)+SinOsc.ar(29, 0, 0.18))+SinOsc.ar(660, 0, SinOsc.ar(12, 0, 0.18)+SinOsc.ar(18, 0, 0.18)+SinOsc.ar(24, 0, 0.18)+SinOsc.ar(30, 0, 0.18))+SinOsc.ar(770, 0, SinOsc.ar(13, 0, 0.18)+SinOsc.ar(19, 0, 0.18)+SinOsc.ar(25, 0, 0.18)+SinOsc.ar(31, 0, 0.18))+SinOsc.ar(880, 0, SinOsc.ar(14, 0, 0.18)+SinOsc.ar(20, 0, 0.18)+SinOsc.ar(26, 0, 0.18)+SinOsc.ar(32, 0, 0.18))+SinOsc.ar(990, 0, SinOsc.ar(15, 0, 0.18)+SinOsc.ar(21, 0, 0.18)+SinOsc.ar(27, 0, 0.18)+SinOsc.ar(33, 0, 0.18)))}.scope;

{
	var left, right, env, trig;
	trig = Impulse.kr(0.05);
	env = EnvGen.kr(Env([0,1,0], [9.99, 9.99]), trig);
	left = SinOsc.ar(440, 0, SinOsc.ar(10, 0, 0.18)+SinOsc.ar(16, 0, 0.18)+SinOsc.ar(22, 0, 0.18)+SinOsc.ar(28, 0, 0.18))+SinOsc.ar(550, 0, SinOsc.ar(11, 0, 0.18)+SinOsc.ar(17, 0, 0.18)+SinOsc.ar(23, 0, 0.18)+SinOsc.ar(29, 0, 0.18))+SinOsc.ar(660, 0, SinOsc.ar(12, 0, 0.18)+SinOsc.ar(18, 0, 0.18)+SinOsc.ar(24, 0, 0.18)+SinOsc.ar(30, 0, 0.18))+SinOsc.ar(770, 0, SinOsc.ar(13, 0, 0.18)+SinOsc.ar(19, 0, 0.18)+SinOsc.ar(25, 0, 0.18)+SinOsc.ar(31, 0, 0.18))+SinOsc.ar(880, 0, SinOsc.ar(14, 0, 0.18)+SinOsc.ar(20, 0, 0.18)+SinOsc.ar(26, 0, 0.18)+SinOsc.ar(32, 0, 0.18))+SinOsc.ar(990, 0, SinOsc.ar(15, 0, 0.18)+SinOsc.ar(21, 0, 0.18)+SinOsc.ar(27, 0, 0.18)+SinOsc.ar(33, 0, 0.18));
	right = DelayC.ar(left, 0.2, (Stepper.kr(trig, 19, 0, 19, 1)*0.01).poll*env);
		Out.ar(0, [left, right]);
		}.scope;


{
	var left, right, env, trig;
	trig = Impulse.kr(0.05);
	env = EnvGen.kr(Env([0,1,0], [9.99, 9.99]), trig);
	left = SinOsc.ar(199, 0, SinOsc.ar(10, 0, 0.18)+SinOsc.ar(16, 0, 0.18)+SinOsc.ar(22, 0, 0.18)+SinOsc.ar(28, 0, 0.18))+SinOsc.ar(405, 0, SinOsc.ar(11, 0, 0.18)+SinOsc.ar(17, 0, 0.18)+SinOsc.ar(23, 0, 0.18)+SinOsc.ar(29, 0, 0.18))+SinOsc.ar(797, 0, SinOsc.ar(12, 0, 0.18)+SinOsc.ar(18, 0, 0.18)+SinOsc.ar(24, 0, 0.18)+SinOsc.ar(30, 0, 0.18))+SinOsc.ar(1601, 0, SinOsc.ar(13, 0, 0.18)+SinOsc.ar(19, 0, 0.18)+SinOsc.ar(25, 0, 0.18)+SinOsc.ar(31, 0, 0.18))+SinOsc.ar(3198, 0, SinOsc.ar(14, 0, 0.18)+SinOsc.ar(20, 0, 0.18)+SinOsc.ar(26, 0, 0.18)+SinOsc.ar(32, 0, 0.18))+SinOsc.ar(6403, 0, SinOsc.ar(15, 0, 0.18)+SinOsc.ar(21, 0, 0.18)+SinOsc.ar(27, 0, 0.18)+SinOsc.ar(33, 0, 0.18));
	right = DelayC.ar(left, 0.2, (Stepper.kr(trig, 19, 0, 19, 1)*0.01).poll*env);
		Out.ar(0, [left, right]);
		}.scope;


{
	var left, right, env, trig, scale;
	trig = Impulse.kr(0.05);
	env = EnvGen.kr(Env([0,1,0], [9.99, 9.99]), trig);
	//scale = MouseX.kr(0.01, 1).poll;
	scale = MouseX.kr(0.001, 3).poll;
	left = SinOsc.ar(199, 0, SinOsc.ar(10*scale, 0, 0.18)+SinOsc.ar(16*scale, 0, 0.18)+SinOsc.ar(22*scale, 0, 0.18)+SinOsc.ar(28*scale, 0, 0.18))+SinOsc.ar(405, 0, SinOsc.ar(11*scale, 0, 0.18)+SinOsc.ar(17*scale, 0, 0.18)+SinOsc.ar(23*scale, 0, 0.18)+SinOsc.ar(29*scale, 0, 0.18))+SinOsc.ar(797, 0, SinOsc.ar(12*scale, 0, 0.18)+SinOsc.ar(18*scale, 0, 0.18)+SinOsc.ar(24*scale, 0, 0.18)+SinOsc.ar(30*scale, 0, 0.18))+SinOsc.ar(1601, 0, SinOsc.ar(13*scale, 0, 0.18)+SinOsc.ar(19*scale, 0, 0.18)+SinOsc.ar(25*scale, 0, 0.18)+SinOsc.ar(31*scale, 0, 0.18))+SinOsc.ar(3198, 0, SinOsc.ar(14*scale, 0, 0.18)+SinOsc.ar(20*scale, 0, 0.18)+SinOsc.ar(26*scale, 0, 0.18)+SinOsc.ar(32*scale, 0, 0.18))+SinOsc.ar(6403, 0, SinOsc.ar(15*scale, 0, 0.18)+SinOsc.ar(21*scale, 0, 0.18)+SinOsc.ar(27*scale, 0, 0.18)+SinOsc.ar(33*scale, 0, 0.18));
	right = DelayC.ar(left, 0.2, (Stepper.kr(trig, 19, 0, 19, 1)*0.01).poll*env);
		Out.ar(0, [left, right]);
		}.scope;
0.1*0.01

{
	var scale, out, delay;
	scale = MouseX.kr(0.1, 1).poll;
	out = (SinOsc.ar(440, SinOsc.kr(10*scale, 0, scale+0.09)+SinOsc.kr(11*scale, 0, scale+0.08)+SinOsc.kr(12*scale, 0, scale+0.07)+SinOsc.kr(13*scale, 0, scale+0.06)+SinOsc.kr(14*scale, 0, scale+0.05)+SinOsc.kr(15*scale, 0, scale+0.04))+SinOsc.ar(880, SinOsc.kr(16*scale, 0, scale+0.03)+SinOsc.kr(17*scale, 0, scale+0.02)+SinOsc.kr(18*scale, 0, scale+0.01)+SinOsc.kr(19*scale, 0, scale+0.02)+SinOsc.kr(20*scale, 0, scale+0.03)+SinOsc.kr(21*scale, 0, scale+0.04)))*0.1;
	delay = DelayC.ar(out, 0.2, (Stepper.kr(Impulse.kr(0.05), 19, 0, 19, 1)*0.01).poll);
	Out.ar(0, [out, delay]);
}.play
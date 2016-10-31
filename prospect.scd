(
SynthDef(\prospect, { |dur_amp = 15 dur_pan = 20, level_pan = 0.8, freq_pan = 220, freq_pan1 = 879, freq_fix = 230, freq_fix1 = 921, dur_lin = 20, end_lin = 0.5|
	var pan, pan1, fix, fix1, amp_pan, pos_pan, line, in1, in2, in3, in4, pedal, gliss;
	amp_pan = Line.kr(0.0001, 1, dur_amp);
	pos_pan = Line.kr(-1, 1, dur_pan);
	line = Line.kr(0.0001, end_lin, dur_lin);
	in1 = BrownNoise.ar(0.8);
	in2 = BrownNoise.ar(0.8);
	in3 = BrownNoise.ar(0.5);
	in4 = BrownNoise.ar(0.5);
	gliss = XLine.kr(923, 879, 12);
	pan = Pan2.ar(BBandPass.ar(in1, freq_pan, 0.008, amp_pan), pos_pan, level_pan);
	pan1 = Pan2.ar(BBandPass.ar(in2, freq_pan1, 0.004, amp_pan), pos_pan, level_pan);
	fix = Pan2.ar(BBandPass.ar(in3, freq_fix, 0.008, line), pos_pan, level_pan);
	fix1 = Pan2.ar(BBandPass.ar(in4, freq_fix1, 0.004, line), pos_pan, level_pan);
	pedal = Pan2.ar([SinOsc.ar([220, 878], 0, Line.kr(0.0001, 0.001, 12)), SinOsc.ar([221,gliss], 0.5, Line.kr(0.0001, 0.0006, 15))], SinOsc.kr(0.3).range(0.7, 1.0));
	Out.ar(0, Mix.new([pan, fix, pedal]))
}).send(s);
)

a  = Synth(\prospect);
a.free;
(
SynthDef(\prospectClean, { |freq_in1 = 220, freq_in2 = 221, dur_pan = 10|
	var  pan, fix, pos_pan, line;
	pos_pan = Line.kr(-1, 1, dur_pan);
	line = Line.kr(0.001, 0.01, 10);
	pan = GrainSin.ar(2, LFNoise2.kr(100), LFNoise2.kr(10).range(0.01, 0.1), freq_in1, pos_pan, mul:line);
	fix = GrainSin.ar(2, LFNoise2.kr(80), LFNoise2.kr(10).range(0.01, 0.13), freq_in2, 1.0, mul: 0.08);
	Out.ar(0, Mix.new([pan, fix]))
}).send(s);
)

a  = Synth(\prospect);
a.free;
b = Synth(\prospectClean);
b.free;



/*
{
var ampli, ring, trig, imp;
	ampli = Array.rand(3, 0.01, 0.9).postln;
	ring =  Array.rand(3, 0.01, 0.7).postln;
	DynKlank.ar(`[ [878, 882, 885], ampli, ring], Crackle.ar(1.9, 0.7)) }.play;

rrand(0.1, 0.4);
a = Rand(0.1, 0.5);
a.value;
b = { Array.rand(3, 0.01, 0.5) };

{ Impulse.ar(Dwhite(200, 300, inf), 0, 1) }.play;

(
{
Mix.fill(10,{
var freq;

freq= rrand(130,160.3);
Pan2.ar(SinOsc.ar(Gendy1.ar(6.rand,6.rand,SinOsc.kr(0.1,0,0.49,0.51),SinOsc.kr(0.13,0,0.49,0.51),freq ,freq, SinOsc.kr(0.17,0,0.49,0.51), SinOsc.kr(0.19,0,0.49,0.51), 12, 12, 200, 400), 0, 0.1), 1.0.rand2)
});
}.play
)
b.value;
Rand(200.0, 400.0)

{ GrainSin.ar(1, LFNoise2.kr(100), 0.03, 440, mul: 0.1) }.play;
*/

{ Pan2.ar(GrainSin.ar(1, LFNoise2.kr(20), LFNoise2.kr(20).range(0.02, 0.2), 440), Line.kr(-1, 1, 15)) }.play;

{ GrainSin.ar(2, LFNoise2.kr(20), LFNoise2.kr(20).range(0.01, 0.2), 440, -1, mul: 0.3) }.play;
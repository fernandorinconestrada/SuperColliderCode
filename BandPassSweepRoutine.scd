{ SinOsc.ar(1, 2pi, 1) }.plot(1);
{ SinOsc.ar(1, 2pi * 1/6, 1) }.plot(1);
{ SinOsc.ar(1, 2pi * 2/6, 1) }.plot(1);
{ SinOsc.ar(1, 2pi * 3/6, 1) }.plot(1);
{ SinOsc.ar(1, 2pi * 4/6, 1) }.plot(1);
{ SinOsc.ar(1, 2pi * 5/6, 1) }.plot(1);

(
Routine{
var a = { BBandPass.ar(WhiteNoise.ar(1), SinOsc.ar(30).range(440, 880), 0.00001, 1.4) }, b = { BBandPass.ar(WhiteNoise.ar(1), SinOsc.ar(30, 2pi*1/6).range(440, 880), 0.00001, 1.4) }, c = { BBandPass.ar(WhiteNoise.ar(1), SinOsc.ar(30, 2pi*2/6).range(440, 880), 0.00001, 1.4) }, d = { BBandPass.ar(WhiteNoise.ar(1), SinOsc.ar(30, 2pi*3/6).range(440, 880), 0.00001, 1.4) }, e = { BBandPass.ar(WhiteNoise.ar(1), SinOsc.ar(30, 2pi*4/6).range(440, 880), 0.00001, 1.4) }, f = { BBandPass.ar(WhiteNoise.ar(1), SinOsc.ar(30, 2pi*5/6).range(440, 880), 0.00001, 1.4) };
	a.play.postln;
	5.wait;
	b.play.postln;
	5.wait;
	c.play.postln;
	5.wait;
	d.play.postln;
	5.wait;
	e.play.postln;
	5.wait;
	f.play.postln;
}.play;

)
r.stop;

y = FreqScope.new;
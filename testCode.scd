(
SynthDef(\testPan, { |freq, pha = 0, att = 2, dec = 3, ampLo = 0.001, lo, ceiling, gate = 1, pos =0|
	var in, env, left, right, ampHi, amp;
	ampHi = Rand(lo, ceiling);
	amp = LinExp.kr(SinOsc.kr(0.1), -1, 1, ampLo, ampHi);
	//pos = LinExp.kr(LFNoise0.kr(13, 0.7), -1, 1, posL, posR);
	in =  FSinOsc.ar(freq, pha, amp);
	env = EnvGen.kr(Env([0,1,0], [att, dec], [6, -3]), gate, doneAction:2);
	left = Pan2.ar(in, pos);
	Out.ar(0, left*env);
}).add;
)

a = Synth(\testPan);

(
r = Routine {
(
b = Pbind(
	\instrument, \testPan,
	\freq, Prand([55,55.2, 54.9, 55.1, 55.05], inf),
	\dur, Pseq([4,4,4,4], 4),
	//\posL, Pseq([1.0, -0.4], 4),
	//\posR, Pseq([0.6, -0.9], 4),
	\pos, Pseq([[1.0, 0.9, 0.8, 0.7, 0.6], [-0.5, -0.6, -0.7, -0.8, -0.9]],inf),
	\lo, Pseq([0.05, 0.13, 0, 0], 2),
	\ceiling, Pseq([0.19, 0.23, 0, 0], 2),
	\att, Pseq([1.4, 1.3, 1.2, 1.1], 4),
	\dec, Pseq([2.3, 2.1, 1.9, 1.7], 4)
).play;
)
}.play;
)

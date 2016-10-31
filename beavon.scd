(
SynthDef(\circle, { |freq, pha = 0, amp = 0.4, att = 2, dec = 3, period = 0.002, pos = 0.8|
	var in, env, left, right;
	in = Trig.ar(Impulse.ar(period, 0, 0.6), att+dec) * FSinOsc.ar(freq, pha, amp);
	env = EnvGen.kr(Env([0,1,0], [att, dec], [-4, 0]), Impulse.kr(period));
	left = Pan2.ar(in, pos);
	Out.ar(0, left*env)
}).add;
)

(
a = Pbind(
	\instrument, \circle,
	\freq, Prand([55,55.2, 54.9, 55.1, 55.05], inf),
	\dur, Pseq([4,4,4,4,4], inf),
	\pos, Pseq([0.8, -0.8], inf),
	\amp, Pseq( [ rrand(0.3,0.4), rrand(0.3,0.4), 0, 0, 0 ], inf)
).play;
)


 
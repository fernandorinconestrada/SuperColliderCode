s = Server.local.makeGui;
o = Server.local.options;
o.numOutputBusChannels = 31;
o.numInputBusChannels = 2;

(
SynthDef(\circlePanA, { |freq, pha = 0, att = 2, dec = 3, period = 1, posL, posR, ampLo = 0.001, lo, ceiling, gate = 1|
	var in, env, left, right, pos, ampHi, amp;
	ampHi = Rand(lo, ceiling);
	amp = LinExp.kr(SinOsc.kr(0.1), -1, 1, ampLo, ampHi);
	pos = LinExp.kr(LFNoise0.kr(13, 0.7), -1, 1, posL, posR);
	in =  FSinOsc.ar(freq, pha, amp);
	env = EnvGen.kr(Env([0,0.9,0], [att, dec], [6, -3]), gate);
	left = Pan2.ar(in, pos);
	Out.ar(0, left*env);
}).add;
)
(
r = Routine {
(
a = Pbind(
	\instrument, \circlePanA,
	\freq, Prand([55,55.2, 54.9, 55.1, 55.05], inf),
	\dur, Pseq([4,4,4,4], 4),
	\posL, Pseq([1.0, -0.5], 4),
	\posR, Pseq([0.6, -1.0], 4),
	\lo, Pseq([0.6, 0.7, 0, 0], 2),
	\ceiling, Pseq([0.7, 0.8, 0, 0], 2),
	\att, Pseq([1.4, 1.3, 1.2, 1.1], 4),
	\dec, Pseq([2.3, 2.1, 1.9, 1.7], 4)
).play;
);
}.play;
)
s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/beaconBass1.aiff");
s.record;
s.stop;
// 32.wait;
// (
// a.stream = Pbind(
// 	\instrument, \circlePanA,
// 	\freq, Prand([55,55.2, 54.9, 55.1, 55.05], inf),
// 	\dur, Pseq([2,2,2,2], inf),
// 	\posL, Pseq([1.0, -1.0], inf),
// 	\posR, Pseq([0.6, -0.6], inf),
// 	\lo, Pseq([0.8, 0.8, 0, 0], inf),
// 	\ceiling, Pseq([1, 1, 0, 0], inf),
// 	\att, 0.5,
// 	\dec,1
// ).asStream;
// )
// }.play;
// )

r.stop;


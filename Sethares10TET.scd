(
var scale;
scale = { |fund ... deg| fund * (2 ** (deg/10)) };
~scale1 = scale.value(300, -2, -3,2,3, 5,7,8, 12, 15);
)

(
var scale12TET;
scale12TET = { |fund ... deg| fund * (2 ** (deg/12)) };
~scale1TET = scale12TET.value(300, -2, -3,2,3, 5,7,8, 12, 15);
)

(
SynthDef(\ping10TET, { |freq, amp, pos|
	var pan, in;
	//pos = LFNoise0.kr(10).range(-1, 1);
	in = FSinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.sine, 1, doneAction: 2);
	pan = Pan2.ar(in, pos);
	OffsetOut.ar(0, LPF.ar(pan, 3000))
}).add;
)

(
SynthDef(\ring10TET, { |freq, ampIn = 0.8, par #[0,0,0,0,0], amp #[0,0,0,0,0], ring #[0,0,0,0,0], dens = 2|
	var input, dec;
	input = Impulse.ar(freq, 0, ampIn);
	dec = LFNoise0.kr(dens).range(0.1, 2);
	//dec = MouseX.kr(0.1, 1.2);
	OffsetOut.ar(0, DynKlank.ar(`[par, amp, ring], input, decayscale: dec))
}).add(;
)
(
~spec = { |fund ... deg| fund*(2**(deg/10))};
~amp = { | ... amps| 1/amps };
~ringval = { | ring ... dec| ring/dec };
~spec1 = ~spec.value(300, 10, 17, 20, 25, 28);
~spec2 = ~spec.value(300, 17, 20, 25, 28, 30);
~amp1 = ~amp.value(2,3,5,7,11).normalizeSum;
~amp1 = ~amp.value(3,5,7,11,2).normalizeSum;
~ring1 = ~ringval.value(1, 5,3,2,3,5);
)
a = Dissonance.make(~spec1, ~amp1, 0.49, 4.01, 0.01, \parncutt);
a.plot;
a.play;
a.fund * a.scale;
a.harmonicAnalysis;
a.pitchSet;
a.partials;
a.postln;
b.plot;
b.findSpecs = true;



(
a = Synth(\ring10TET, [\par, ~spec1, \amp, ~amp1, \ring, ~ring1, \freq, 1]);
)
(
SynthDef(\chord10TET, { |freq1, freq2, freq3, amp1, amp2, amp3, att, sus, rel|
	var mix, env, in, pan, pos;
	env = EnvGen.kr(Env([0,1,0.5,0], [att,sus,rel]), 1, doneAction:2);
	pos = LFNoise0.kr(10).range(-1,1);
	mix = Mix.new([FSinOsc.ar(freq1, 0, amp1), FSinOsc.ar(freq2, 0, amp2), FSinOsc.ar(freq3, 0, amp3)]);
	in = (AllpassC.ar(mix, 0.02, 0.02, LFNoise0.kr(10).range(0.1, 1)));
	pan = Pan2.ar(in, pos);
	OffsetOut.ar(0, LPF.ar(pan, 3000 ) * env)
}).add;
)
(
a = Pbind(
	\instrument, \chord10TET,
	\freq1, Prand(~spec1, inf),
	\freq2, Prand(~spec1, inf),
	\freq3, Prand(~spec1, inf),
	\dur, Prand([5, 7, 11, 13], inf),
	\amp1, Prand([0.07, 0.13, 0.2], inf),
	\amp2, Prand([0.05, 0.11, 0.17], inf),
	\amp3, Prand([0.07, 0.19, 0.23], inf),
	\att, Prand([0.2, 0.3, 0.5], inf),
	\sus, Prand([0.2, 0.3, 0.5], inf),
	\rel, Prand([2, 3, 5, 7], inf),
	).play;
)


(
b = Pbind(
	\instrument, \ping10TET,
	\freq, Prand(~scale1.postln, inf),
	\dur, Prand([0.5, 0.7, 1.1, 1.7, 2.9], inf),
	\amp, Prand([0.07, 0.21, 0.37], inf),
	\pos, Pfunc({1.0.rand2})
	).play
)

b.stop;

(
c =Pbind(
	\instrument, \ping10TET,
	\freq, Prand(~scale1TET, inf),
	\dur, Prand([1.1, 1.7, 1.9, 2.3], inf),
	\amp, Prand([0.31, 0.13, 0.07], inf),
	\pos, Pfunc({1.0.rand2})
).play;
)
		
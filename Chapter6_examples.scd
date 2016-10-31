(
SynthDef(\osc, { |freq, amp|
	var env, out;
	env = EnvGen.kr(Env.perc(0.02, 0.2).plot, doneAction:2);
	out = Out.ar(0,
		Pan2.ar(
			(Blip.ar(freq, [TRand.kr(7, 17, Dust.kr(3)), TRand.kr(3, 11, Dust.kr(2))], amp) * env),
			[SinOsc.kr(0.01).range(-1.0, 1.0), SinOsc.kr(0.011).range(1.0, -1.0)]));
}).add;
)
(
a = Pbind(*[
	instrument: \osc,
	//freq: 200,
	//root: 12,
	amp: Pshuf(#[0.07, 0.13, 0.05, 0.11, 0.23], inf),
	stepsPerOctave: 23,
	//gtranspose: 2,
	note: Pseq([Pshuf(#[0,2,4,6,8,10,12,14,16,18,20,22]), 1], 19),
	//degree: Pseq([0,1,2], 1, 1),
	dur: Pshuf(#[0.11, 0.07, 0.05, 0.13],inf)
]);
)

(
b = Pbind(*[
	instrument: \osc,
	//freq: 200,
	//root: 12,
	amp: Pshuf(#[0.07, 0.13, 0.05, 0.11, 0.23], inf),
	stepsPerOctave: 23,
	//gtranspose: 2,
	note: Pseq([Pshuf(#[1,3,5,7,9,11,13,15,17,19,21,23]), 1], 21),
	//degree: Pseq([0,1,2], 1, 1),
	dur: Pshuf(#[0.11, 0.07, 0.05, 0.13],inf),
]);
)
(
a.play;
b.play;
)
(
{Out.ar(0,Pan2.ar(Impulse.ar(1, 0, 0.2), SinOsc.kr(0.01).range(-1.0, 1.0)))}.play
)

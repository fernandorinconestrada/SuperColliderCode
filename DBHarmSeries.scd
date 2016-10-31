(
SynthDef(\openSrings, { |freq1, freq2, amp1, amp2, durEnv|
	var env, mix;
	env = EnvGen.kr(Env.sine(durEnv), 1, doneAction:2);
	Out.ar(0, SinOscFB.ar([freq1, freq2], 0.2pi, [amp1, amp2]) * env)
}).add;
)
(
e = (
	Pbind(
		\instrument, \openSrings,
		\freq1, Pseq([32.7, 32.7, 55, 55, 55, 55, 73.42, 73.42, 73.42, 73.42, 98, 98], inf),
		\freq2, Pseq([275, 385, 163.5, 228.9, 367.1, 513.94, 275, 385, 490, 686, 367.1, 513.94], inf),
		\amp1, Pseq([0.4, 0.4, 0.3, 0.3, 0.3, 0.3, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		\amp2, Pseq([0.3, 0.2, 0.3, 0.2, 0.3, 0.2, 0.3, 0.2, 0.2, 0.2, 0.2, 0.2], inf),
		\durEnv, 4.0,
		\dur, 5.0
	).play;
	Pbind(
		\instrument, \bassClarinet,
		\freq1, Pseq([146.83], inf),
		\freq2, Pseq([523.2], inf),
		\amp1, Pseq([0.4], inf),
		\amp2, Pseq([0.2], inf),
		\durEnv, 4.0,
		\dur, 5.0
	).play;
);
)
(
SynthDef(\bassClarinet, { |freq1DB, freq2DB, amp1DB, amp2DB, freq1CB, freq2CB, amp1CB, amp2CB, durEnv|
	var env, mix;
	env = EnvGen.kr(Env.sine(durEnv), 1, doneAction:2);
	mix = Mix.new([SinOscFB.ar([freq1DB, freq2DB], 0.2pi, [amp1DB, amp2DB]), SinOscFB.ar([freq1CB, freq2CB], 0.2pi, [amp1CB, amp2CB])]);
	Out.ar(0, mix * env);
}).add;
)
(
f = (
	Pbind(
		\instrument, \bassClarinet,
		\freq1CB, Pseq([135], inf),
		\freq2CB, Pseq([440], inf),
		\amp1CB, Pseq([0.2], inf),
		\amp2CB, Pseq([0.1], inf),
		\freq1DB, Pseq([32.7], inf),
		\freq2DB, Pseq([385], inf),
		\amp1DB, Pseq([0.4], inf),
		\amp2DB, Pseq([0.2], inf),
		\durEnv, 4.0,
		\dur, 5.0
	).play;
);
)
f.stop;

play{SinOscFB.ar([73.42, 686], [0.2pi, 0.1pi], [0.1, 0.05])};
play{SinOscFB.ar(686, 0.1pi, 0.2) };
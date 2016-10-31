(
SynthDef(\rlpf_test, {arg mul = 0.5;
	var in, freq_cutoff, cue, env;
	env = EnvGen.kr(Env.perc(0.1, 0.3, 0.8, -4), 1, 1, 1);
	freq_cutoff = MouseX.kr(0, 440, lag:0.2);
	cue = MouseY.kr(0, 1, lag: 0.2);
	in = Blip.ar(220, 100, env);
	Out.ar(0,
		RLPF.ar(in, freq_cutoff, cue, mul));
}).send(s)
)
a = Synth(\rlpf_test);
a.play

(
SynthDef(\splay_test, {arg attack = 0.04, release= 0.4, trig = 5, level = 0.5;
	var env, spread, center;
	spread = MouseX.kr(-1, 1, 0, 0.2);
	center = MouseY.kr(0, 1.0, 0, 0.2);
	env = EnvGen.kr(Env.perc(attack, release, 1, -4), Impulse.kr(trig), 1, 0, 1);
	Out.ar(0,
		    Splay.arFill(21, { |i|
			Blip.ar( (i + 2 * 100).postln, 100, 0.2, (i + 0.1 * 0.01).postln) * env},
			spread.postln, level, center));
}).send(s)
)
(
SynthDef(\splay_test_a, {arg attack = 0.04, release= 0.6, trig = 5, level = 0.5;
	var env, spread, center;
	spread = MouseX.kr(-1, 1, 0, 0.2);
	center = MouseY.kr(0, 1.0, 0, 0.2);
	env = EnvGen.kr(Env.perc(attack, release, 1, -4), Impulse.kr(trig), 1, 0, 1);
	Out.ar(0,
		    Splay.arFill(21, { |i|
			Pulse.ar( (i + 2 * 100).postln, (i + 0.02 * 0.01).postln, 0.8) * env},
			spread.postln, level, center));
}).send(s)
)
a = Synth(\splay_test);
b = Synth(\splay_test_a);
b.stop;
a.trace;
a.stop;


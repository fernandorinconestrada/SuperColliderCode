{SinOsc.ar(440, [0,0.5,1,-0.5,-1], 0.5)}.plot;

{SinOsc.ar(440, [0.5pi, -0.5pi], 0.1)}.freqscope;

{SinOsc.ar(440, [0.5pi, -0.5pi], 0.080) }.play; 	{SinOsc.ar(440, [0, pi], 0.080) }.play;
{SinOsc.ar(440, [0, 0.5pi], 0.080) }.play;
{SinOsc.ar(440, [0, -0.5pi], 0.080) }.play;
{SinOsc.ar(110, [pi, 0.5pi], [0.04, 0.08]) }.play; // cancellation 15ª elevation 15º azimuth difference in amplitudes is important //
{SinOsc.ar(110, [pi, -0.5pi], [0.08, 0.08]) }.play; // cancellation when changing position //

(
SynthDef(\sine, { | freq = 130, ph = 0, amp = 0.04, pos = 0|
			Out.ar(0, Pan2.ar(SinOsc.ar(freq, ph, amp), pos)			)
}).add;
)

(SynthDef(\burst, { |pos, freq = 400, rq = 0.1, amp = 0.08|
	var env, in, filter;
	env = EnvGen.kr(Env.sine(0.2), doneAction: 2);
	in = WhiteNoise.ar(amp) * env;
	filter = BPF.ar(in, freq, rq);
	Out.ar(0, Pan2.ar(in, pos)
	)
}).add;
)

(SynthDef(\ping, { |freq = 150, ph = 0, amp = 0.04, pos|
	var env, in;
	env = EnvGen.kr(Env.sine(0.1), doneAction: 2);
	in = SinOsc.ar(freq, ph, amp) * env;
	Out.ar(0, Pan2.ar(in, pos)
	)
}).add;
)

(
SynthDef(\pingTri, { |freq = 150, ph = 0, amp = 0.04, pos, dur|
	var env, in;
	env = EnvGen.kr(Env.triangle(dur), doneAction: 2);
	in = SinOsc.ar(freq, ph, amp) * env;
	OffsetOut.ar(0, Pan2.ar(in, pos)
	)
}).add;
)

(
SynthDef(\click, { |freq = 0, ph = 0, amp = 0.04, pos|
	var in;
	in = Impulse.ar(freq, ph, amp);
	OffsetOut.ar(0, Pan2.ar(in, pos)
	)
}).add;
)

(
Prout({
	Synth(\sine, [\freq, 110, \ph, 0, \pos, -1]);
	0.001.wait;
	Synth(\sine, [\freq, 110, \ph, pi, \pos, 1]);
	}.fork;
)
)

(
Prout({

	3.wait;

	Synth(\ping, [\ph, 0, \amp, 0.1, \pos, -1]);
	0.03.wait;
	Synth(\ping, [\ph, pi, \amp, 0.1, \pos, 1]);

	3.wait;
	Synth(\ping, [\ph, 0, \amp, 0.1, \pos, -1]);
	0.032.wait;
	Synth(\ping, [\ph, 0.5pi, \amp, 0.1, \pos, 1]);

	3.wait;
	Synth(\ping, [\ph, 0, \amp, 0.1, \pos, -1]);
	0.035.wait;
	Synth(\ping, [\ph, -0.5pi, \amp, 0.1, \pos, 1]);

	3.wait;
	Synth(\ping, [\ph, pi, \amp, 0.1, \pos, -1]);
	0.037.wait;
	Synth(\ping, [\ph, -0.5pi, \amp, 0.1, \pos, 1]);

	3.wait;
	Synth(\ping, [\ph, pi, \amp, 0.1, \pos, -1]);
	0.04.wait;
	Synth(\ping, [\ph, 0.5pi, \amp, 0.1, \pos, 1]);

	3.wait;
	Synth(\ping, [\ph, 0.5pi, \amp, 0.1, \pos, -1]);
	0.05.wait;
	Synth(\ping, [\ph, -0.5pi, \amp, 0.1, \pos, 1]);
	}.fork;
)
)

(
Prout({
	Synth(\burst, [\pos, -1]);
	0.00063.wait;
	Synth(\burst, [\pos, 1, \amp, 0.04]);
	}.fork;
)
)

(
Prout({

	Synth(\click, [\pos, -1, \freq, 1]);
	0.0015.wait;
	Synth(\click, [\pos, 1, \freq, 1]);
	}.fork;
)
)

(
Prout({
	Synth(\pingTri, [\pos, -1, \freq, 2000, \dur, 0.1]);
	0.02.wait;
	Synth(\pingTri, [\pos, 1, \freq, 2000, \dur, 0.1]);
	}.fork;
)
)

{ SinOsc.ar(110, [0, pi], EnvGen.kr(Env.sine(0.1), doneAction:2),) }.plot;

{ SinOsc.ar(110, [0.5pi, -0.5pi], EnvGen.kr(Env.sine(1), doneAction:2),) }.plot; 
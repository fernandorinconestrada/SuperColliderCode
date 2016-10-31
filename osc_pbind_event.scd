(
SynthDef(\osc, { |freq, amp|
	var env, out;
	env = EnvGen.kr(Env.perc(0.01, 0.2), doneAction:2);
	out = Out.ar(0,
		Pan2.ar(
			(Blip.ar(freq, [TRand.kr(7, 17, Dust.kr(3)), TRand.kr(3, 11, Dust.kr(2))], amp) * env),
			[SinOsc.kr(0.01).range(-1.0, 1.0), SinOsc.kr(0.011).range(1.0, -1.0)]));
}).add;
// efx synthdef- dig the timing on the delay and the pbind. :-P
SynthDef(\pbindefx, { arg out, in, time1=0.25, time2=0.5;
    var audio, efx;
	audio = In.ar([0,1], 1);
    efx=CombN.ar(audio, 0.5, [time1, time2], 5, 0.3, audio);
    Out.ar(out, efx);
}).add;
)
a = Synth.after(1, \pbindefx);
a.set(\time1, 0.4,\time2, 0.2);
a.free;
b = Synth.after(1, \pbindefx);
b.set(\time1, 0.5,\time2, 0.25);
(
b = Pbind(*[
	instrument: \osc,
	//freq: 200,
	//root: 12,
	amp: Pshuf(#[0.07, 0.13, 0.05, 0.11, 0.23], inf),
	stepsPerOctave: 19,
	//gtranspose: 2,
	note: Pseq([Pshuf(#[0,2,4,8,16]), 1], inf),
	//degree: Pseq([0,1,2], 1, 1),
	dur: Pseq([0.13, Rest(0.13)], inf)
]);
c = Pbind(*[
	instrument: \osc,
	//freq: 200,
	//root: 12,
	amp: Pshuf(#[0.07, 0.13, 0.05, 0.11, 0.23], inf),
	stepsPerOctave: 19,
	//gtranspose: 2,
	note: Pseq([Pshuf(#[3,6,12]), 1], inf),
	//degree: Pseq([0,1,2], 1, 1),
	dur: Pseq([0.05, Rest(0.05)], inf)
]);
d = Pbind(*[
	instrument: \osc,
	//freq: 200,
	//root: 12,
	amp: Pshuf(#[0.07, 0.13, 0.05, 0.11, 0.23], inf),
	stepsPerOctave: 19,
	//gtranspose: 2,
	note: Pseq([Pshuf(#[0,5,10,20]), 1], inf),
	//degree: Pseq([0,1,2], 1, 1),
	dur: Pseq([0.07, Rest(0.07)], inf)
]);
e = Pbind(*[
	instrument: \osc,
	//freq: 200,
	//root: 12,
	amp: Pshuf(#[0.07, 0.13, 0.05, 0.11, 0.23], inf),
	stepsPerOctave: 19,
	//gtranspose: 2,
	note: Pseq([Pshuf(#[7,11,13,15,17,19]), 1], inf),
	//degree: Pseq([0,1,2], 1, 1),
	dur: Pseq([0.11, Rest(0.11)], inf)
]);
)
(
	fork{
	b.play;
	x = b;
	//2.wait;
	c.play;
	y = c;
	//2.wait;
	d.play;
	//2.wait;
	e.play;
	//2.wait;
	Rotate2.ar(x, y, LFSaw.kr(10)).postln;
	[x, y];
	};
)
(
{
var x, y;
x = b + d;
y = c + e;
#x, y = Rotate2.ar(x, y, LFSaw.kr(0.1));
[x,y];
}.play
)
(
Pchain(a, b, c, d).trace.play;
)

(
{
	var x, y, amp;
	amp = SinOsc.ar(1, 0, 0.5);

	x = DynKlank.ar(`[[220, 330, 1760/3], [amp*0.23, amp*0.19, amp*0.07], [0.3, 0.5, 0.7]], Dust.ar(0.3, [0.11, 0.03]), 1, [0, 0.3, 0.1], 4);
	y = DynKlank.ar(`[[330, 445, 990/3], [amp*0.31, amp*0.17, amp*0.05], [0.5, 0.3, 0.7]], Dust.ar(0.7, [0.13, 0.02]), 1, [0, 0.5, 0.2], 3);
	#x, y = Rotate2.ar(x, y, SinOsc.kr(0.4)) * 1.8;
	[x, y]
	}.play;
)

(
{
	var x, env;
	env = EnvGen.kr(Env.perc(0.01, 0.5), doneAction: 2);
	Blip.ar(220, TRand.kr(1, 4, Impulse.kr(3)), Dust.kr(7));
}.play;
)

{
	var env;
	env = EnvGen.kr(Env.perc, Impulse.kr(TRand.kr(0.1, 0.7, Dust.kr(3))), doneAction: 2);
	Blip.ar(440, TRand.kr(0, 4, Impulse.kr(3)), env)
}.play;

e = Pwhite(0, 5, 10);
e.next.value.postln;
5.do({
	e.next.postln;
	}.fork;
)

a = Pseq([1,2,3,4], 2);
b = Pseq([1, a, a, 10, 11, 12], 2);
c = a * b;
c.asStream;
c.play;
c.postln;
d = Pmono(\default, \dur, a.trace(prefix: "a ") + b.trace(prefix:"b "), \freq, c.trace(prefix: "c ") * 100).play;
c.trace(\dur, Post);
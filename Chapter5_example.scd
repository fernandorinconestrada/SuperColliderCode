(
SynthDef(\blah, { |freq|
	Out.ar(0,
		LFTri.ar(freq, 0.5));
}).add;
)

{3 + 5}.def.dumpByteCodes;

a = {LFTri.ar(440, SinOsc.kr(0.5), SinOsc.kr(0.3))}.play.def.dumpByteCodes;
b = {LFTri.ar(440.3, SinOsc.kr(0.5), SinOsc.kr(0.31))}.play.def.dumpByteCodes;
c = {LFTri.ar(439, SinOsc.kr(0.5), SinOsc.kr(0.28))}.play.def.dumpByteCodes;


a.play;

10 do: {|i| [i, i.squared, i.isPrime].postln}

{10.rand * 5}!5;

20.for(35, {|i| i.postln});
2.0.forBy(10, 1.5, {|i| i.postln});
20 do: -10+30.xrand;

(
i = [0, 1, inf].choose;
x = case {i == 0} {\no}
{i == 1} {\yes}
{\infinity};
)

(
SynthDef(\prueba, { |freq, numharm, add, env_freq|
	var env;
	env = EnvGen.kr(Env.perc, doneAction: 2) * SinOsc.ar(env_freq);
	Out.ar(0,
		Blip.ar(freq, numharm, env, add));
}).add;
)
(
fork{
	15.do {
		var i, c, x;
		a = Synth(\prueba);
		c = [220, 330, 440, 550];
		i = c.choose;
		x = case
		{ i == 220 } { a.set(\freq, 220, \numharm, 20, \env_freq, 4) }
		{ i == 330 } { a.set(\freq, 330, \numharm, 40, \env_freq, 3) }
		{ i == 440 } { a.set(\freq, 440, \numharm, 10, \env_freq, 2) }
		{ i == 550 } { a.set(\freq, 550, \numharm, 30, \env_freq, 1) };
		x.postln;
		6.rand.wait;
	}
}
)

(
fork{
	15.do {
		a = Synth(\prueba);
		switch ([220, 330, 440, 550].choose,
		220, { a.set(\freq, 220, \numharm, 20, \env_freq, 4) },
		330, { a.set(\freq, 330, \numharm, 40, \env_freq, 3) },
		440, { a.set(\freq, 440, \numharm, 10, \env_freq, 2) },
		550, { a.set(\freq, 550, \numharm, 30, \env_freq, 1) }
		);
		6.rand.wait;
		}
	}
)

(
fork{
	20.do {
		switch ([1, 2, 3, 4, 5, 6].choose,
			1, {SinOsc.ar(220,   0, SinOsc.ar(0.3, 0, 0.03))}.play,
			2, {SinOsc.ar(221,   0, LFTri.ar(0.4,  0, 0.02))}.play,
			3, {SinOsc.ar(220.3, 0, SinOsc.ar(0.2, 0, 0.01))}.play,
			4, {SinOsc.ar(220.8, 0, LFTri.ar(0.3,  0, 0.03))}.play,
			5, {SinOsc.ar(219,   0, SinOsc.ar(0.5, 0, 0.02))}.play,
			6, {SinOsc.ar(220, 0,   SinOsc.ar(0.3, 0, 0.01))}.play,
		);
		8.rand.wait;
	}
}
)

(
fork{
	20.do {
		switch ([1, 2, 3, 4, 5, 6].choose,
			1, { Out.ar(0,
				SinOsc.ar(220,   0, SinOsc.ar(0.3, 0, 0.03)))}.play,
			2, { Out.ar(1,
				SinOsc.ar(221,   0, LFTri.ar(0.4,  0, 0.02)))}.play,
			3, { Out.ar(0,
				SinOsc.ar(220.3, 0, SinOsc.ar(0.2, 0, 0.01)))}.play,
			4, { Out.ar(1,
				SinOsc.ar(220.8, 0, LFTri.ar(0.3,  0, 0.03)))}.play,
			5, { Out.ar(0,
				SinOsc.ar(219,   0, SinOsc.ar(0.5, 0, 0.02)))}.play,
			6, { Out.ar(1,
				SinOsc.ar(220, 0,   SinOsc.ar(0.3, 0, 0.01)))}.play,
		);
		8.rand.wait;
	};

(
fork{
		20.do {
		switch ([1, 2, 3, 4, 5, 6].choose,
			1, { Pbind(\instrument, \blip, \freq, 220*5, \dur, Prand([Rest([1.9, 2.3].choose), 1.7], 7)).play },
			2, { Pbind(\instrument, \blip, \freq, 221*11, \dur, Prand([Rest([1.7, 2.3].choose), 1.9], 5)).play },
			3, { Pbind(\instrument, \blip, \freq, 220.3*7, \dur, Prand([Rest([1.3, 2.3].choose), 2.9], 11)).play },
			4, { Pbind(\instrument, \blip, \freq, 220.8*13, \dur, Prand([Rest([1.7, 1.9].choose), 1.3], 7)).play },
			5, { Pbind(\instrument, \blip, \freq, 219*3, \dur, Prand([Rest([1.9, 2.3].choose), 3.1], 5)).play },
			6, { Pbind(\instrument, \blip, \freq, 220*11, \dur, Prand([Rest([1.1, 2.3].choose), 1.9], 13)).play },
		);
		8.rand.wait;
	}
}
)

{ var env, amp;
	env = EnvGen.kr(Env.perc, doneAction: 2);
	amp = TRand.kr(
			Out.ar([0,1].choose,
		Blip.ar(220 * 5,    0, SinOsc.ar(3, 0, 0.3) * env))}.play;

(
SynthDef(\blip, { |freq|
	var env;
			env = EnvGen.kr(Env.perc(rrand(0.01, 0.1), rrand(0.5, 1.5), 1, -4), levelScale: 0.3, doneAction: 2) * SinOsc.ar(TRand.kr(0.2, 3, Dust.kr(5)));
				Out.ar([0,1],
			Blip.ar(freq, TRand.kr(0, 20, Dust.kr(30)), env));
		}).add;
)

	Pbind(\instrument, \blip, \freq, 220*5, \dur, Prand([Rest([1.9, 2.3].choose), 1.7], 7)).play;

{
var env;
		env = EnvGen.kr(Env.perc(rrand(0.01, 0.1).poll, rrand(0.5, 1.5).poll, 1, -4), levelScale: 0.5, doneAction: 2) * SinOsc.ar(TRand.ar(0.5, 5, Dust.kr(3)));
	Blip.ar(220, TRand.kr(0, 20, Dust.kr(30)).poll, env);
}.play;

s = Server.local;
		z = s.scope(2);


		(1..5) collect: _.postln;
		(1..5) inject: _.postln;

		[1,2, 3].inject([], {|a, b| a ++ b ++ a});
		[1,2, 3].inject([], {|a, b| a ++ a ++ b});


(
			a = Harmonics(24);
			a.ramp(1, 1);

			b = Buffer.alloc(s, 512, 1);
			b.sine2(a.ramp(1,1).postln, a.ramp(0.5, -0.025).postln, true, true, true);

			(
				z = SynthDef(\hermonics, {| out = 0, bufnum = 0|
					Out.ar(out,
						Osc.ar(bufnum, 200, 0, 0.5)
					)
				});
			)
			y = z.play(s, [\out, 0, \bufnum, b]);
			y.free;

			Set[1,2,3,4,5,6,7,8,9] select: (_>4);
			Bag[1,2,3,4,5,6,7,8,9] select: (_>4);

			Array.series(5, 3, 1.5).postln;

			[10, 20, 30, 40, 50, 60] + [1, 2, 3];
			[10, 20, 30, 40, 50, 60] *.s [1, 2, 3];
			[10, 20, 30, 40, 50, 60, 70, 80, 90] +.f [1, 2, 3];
			ring1(10, 12);// 10*12 +10
			ring2(10, 12); // 10*12 + 10+12
			ring3(11, 13); // 10*12 * 10
			ring4(10, 12);

			(
{
    var a, b;
    a = FSinOsc.ar(800);
    b = FSinOsc.ar(XLine.kr(200,500,5));
    ((a * a * b) - (a * b * b)) * 0.125
}.play)

			Environment make: {~a = 10; ~b = 1 + pi * 7.rand;}


currentEnvironment.dump;

			(1..9).pyramid(11);
			[1, 2, 3, 4].pyramid(1).postln;
			fold(1..9).clump(4);
			[1, 2, 3, 4, 5].fold;
10.do({ arg i;
	[1, 2, 3, 4].pyramid(i + 1).asCompileString.postln;
});
)

Server.internal.boot;

{ Fold.ar(SinOsc.ar(440, 0, 0.2), -0.3, 0.3) }.scope;

		Environment make: {~a = 10; ~b = 1 + pi * 7.rand;};
		currentEnvironment.dump;
		(degree: 5).play.parent.asCompileString;
		(degree: 2, dur: 3).play;

		
(
SynthDef(\spreadTest, { | dur = 1, trig = 1, freq = 440, fb = 7, panPos = -1.0, level = 1, delT = 0.035, decT = 0.1, panPosDel = 1.0, levelDel = 0.5 |
	var amp, in;
	amp = EnvGen.kr(Env.new([0,1,0.85,0],[dur*0.01, dur*0.03, dur*0.95], [8, -1, -8]), 1, 0.2, doneAction: 2);
	in = Pan2.ar(Mix.new(SinOscFB.ar([freq, freq * LFNoise0.kr(20).range(0.99, 1.01), freq * LFNoise0.kr(20).range(0.99, 1.01), freq * LFNoise0.kr(20).range(0.99, 1.01), freq * LFNoise0.kr(20).range(0.99, 1.01), freq * LFNoise0.kr(20).range(0.99, 1.01) ], LFNoise0.kr(fb, 0.6, 0.2), [amp, amp/2, amp/4, amp/8, amp/16, amp/32]), panPos, level));
	OffsetOut.ar(0, in);
	OffsetOut.ar(0, Pan2.ar(AllpassC.ar(in, 0.2, delT, decT), panPosDel, levelDel))
}).add;
)

~pan = 2/19 * (0..19) - 1;

a = Synth(\spreadTest, [\pos, ~pos]);
~level =

~level = 1-0.3 + (0.03* (0..9));
~levels = ~level ++ ~level.reverse;

(
b = Pbind(
	\instrument, \spreadTest,
	\freq, Prand([55, 110.3, 329, 660, 879.8], inf),
	\dur, 0.10526315789474,
	\panPos, Pseq(~pan, inf),
	\panPosDel, Pseq([Pseq(~pan, 1), Pseq(~pan, 1, 1), Pseq(~pan, 1, 2), Pseq(~pan, 1, 3), Pseq(~pan, 1, 4), Pseq(~pan, 1, 5), Pseq(~pan, 1, 6), Pseq(~pan, 1, 7), Pseq(~pan, 1, 8), Pseq(~pan, 1, 9), Pseq(~pan, 1, 10), Pseq(~pan, 1, 11), Pseq(~pan, 1, 12), Pseq(~pan, 1, 13), Pseq(~pan, 1, 14), Pseq(~pan, 1, 15), Pseq(~pan, 1, 16), Pseq(~pan, 1, 17), Pseq(~pan, 1, 18), Pseq(~pan, 1, 19)], inf).trace,
	\level, Pseq(~levels, inf),
	\levelDel, Pseq(~levels * 0.7, inf, 16),
	\delT, 0.052631578947368
).play;
)

2/19;

{EnvGen.kr(Env.new([0,1,0.8,0],[0.01, 0.03, 0.95], [8, -1, -8] ), 1, 0.2, doneAction: 2)}.plot(1);
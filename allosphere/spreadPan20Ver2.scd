(
SynthDef(\spreadTestVer2, { | dur = 1, trig = 1, freq = 440, fb = 7, panPos = -1.0, level = 1, delT = 0.035, decT = 0.1, panPosDel = 1.0, levelDel = 0.5, delTMix = 0.06, decTMix= 0.2, panPosMix = 0, levelDelMix = 0.75 |
	var amp, in, mix;
	amp = EnvGen.kr(Env.new([0,1,0.85,0],[dur*0.01, dur*0.03, dur*0.95], [8, -1, -8]), 1, 0.2, doneAction: 2);
	in = Pan2.ar(Mix.new(SinOscFB.ar([freq, freq * LFNoise0.kr(20).range(2.75, 3.25), freq * LFNoise0.kr(20).range(4.85, 5.25), freq * LFNoise0.kr(20).range(6.85, 7.15), freq * LFNoise0.kr(20).range(8.95, 9.15), freq * LFNoise0.kr(20).range(10.95, 11.05) ], LFNoise0.kr(fb, 0.6, 0.2), [amp, amp/2, amp/4, amp/8, amp/16, amp/32]), panPos, level));
	mix = Mix.new(in, Pan2.ar(AllpassC.ar(in, 0.2, delT, decT), panPosDel, levelDel));
	OffsetOut.ar(0, mix);
	OffsetOut.ar(0, Pan2.ar(AllpassC.ar(mix, 0.2, delTMix, decTMix), panPosMix, levelDelMix))
}).add;
)

(
~pan = 2/19 * (0..19) - 1;
~level = 1-0.3 + (0.03* (0..9));
~levels = ~level ++ ~level.reverse;
)

a = Synth(\spreadTest, [\pos, ~pan]);

(
b = Pbind(
	\instrument, \spreadTestVer2,
	\freq, Prand([55, 110.3, 329, 660, 879.8], inf),
	\dur, 0.10526315789474,
	\panPos, Pseq(~pan, inf, 19),
	\panPosDel, Pseq([Pseq(~pan, 1), Pseq(~pan, 1, 1), Pseq(~pan, 1, 2), Pseq(~pan, 1, 3), Pseq(~pan, 1, 4), Pseq(~pan, 1, 5), Pseq(~pan, 1, 6), Pseq(~pan, 1, 7), Pseq(~pan, 1, 8), Pseq(~pan, 1, 9), Pseq(~pan, 1, 10), Pseq(~pan, 1, 11), Pseq(~pan, 1, 12), Pseq(~pan, 1, 13), Pseq(~pan, 1, 14), Pseq(~pan, 1, 15), Pseq(~pan, 1, 16), Pseq(~pan, 1, 17), Pseq(~pan, 1, 18), Pseq(~pan, 1, 19)], inf).trace,
	\panPosMix, Pseq(~pan, inf, 16),
	\level, Pseq(~levels, inf),
	\levelDel, Pseq(~levels * 0.7, inf),
	\levelDelMix, Pseq(~levels * 0.5, inf),
	\delT, 0.052631578947368
).play;
)

 0.052631578947368/2;
(
SynthDef(\test, { | freq = 1 |
	var trig;
	trig = Impulse.ar(freq);
	OffsetOut.ar([0,1], FreeVerb.ar(Decay2.ar(trig, 0.001, 0.5, DynKlank.ar(`[[330, 660, 990], nil, nil], BBandPass.ar(WhiteNoise.ar(1), 440 * LFNoise1.kr(10).range(1.01, 1.11), 0.001), LFNoise1.ar(10).range(1.001, 1.1), 0, LFNoise1.ar(20).range(0.2, 0.9))), 0.1, 0.2, 0.3));
}).add;
)

a = Synth(\test);

{ Out.ar(0, [HPF.ar(BBandPass.ar(WhiteNoise.ar(1), 440 * LFNoise1.kr(10).range(1.01, 1.11), 0.001), 40), HPF.ar(BBandPass.ar(WhiteNoise.ar(1), 440.3 * LFNoise1.kr(10).range(1.01, 1.11), 0.001), 40)])}.play;

{ Out.ar(0, FreeVerb.ar(Decay2.ar(Impulse.ar(1), 0.01, 0.7, AllpassC.ar([SinOscFB.ar(55 * LFNoise1.kr(10).range(1.01, 1.11), 0.5 * LFNoise1.kr(10).range(1.01, 1.11), 0.05 * LFNoise1.kr(20).range(1.01, 1.1)), SinOscFB.ar(55.2 * LFNoise1.kr(10).range(1.01, 1.11), 0.4 * LFNoise1.kr(10).range(1.01, 1.11), 0.05 * LFNoise1.kr(20).range(1.01, 1.1))], 0.2, 0.06, 0.5)), 0.33, 0.8, 0.2))}.play;
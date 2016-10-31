{
	OffsetOut.ar(0, Pan2.ar(Decay2.ar(Impulse.ar(0.3), 0.01, 0.5, BPF.ar(WhiteNoise.ar(1.0), 55, 1, 0.1)), LFNoise0.ar(20.range(-1.0, 1.0), LFNoise0.kr(20).range(0.2, 0.5))))
}

{
	OffsetOut.ar(0, Pan2.ar(Decay2.ar(Impulse.ar(0.3), 0.01, LFNoise0.kr(20).range(0.3, 0.6), BPF.ar(WhiteNoise.ar(1.0), 55, 1, 0.1)), LFNoise0.kr(20).range(-1.0, 1.0), LFNoise0.kr(20).range(0.2, 0.5)));
OffsetOut.ar(0, DelayC.ar(Pan2.ar(Decay2.ar(Impulse.ar(0.3), 0.01, LFNoise0.kr(20).range(0.3, 0.6), BPF.ar(WhiteNoise.ar(1.0), 55, 1, 0.1)), LFNoise0.kr(20).range(-1.0, 1.0), LFNoise0.kr(20).range(0.2, 0.5)), 0.2, 0.3, 0.75));
}.play;
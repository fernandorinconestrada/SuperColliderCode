{
var trig = Impulse.ar(Line.kr(5, 80, 90));
	var in0 = Decay2.ar(trig, 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	var in1 = Decay2.ar(TDelay.ar(trig, 0.1), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	var in2 = Decay2.ar(TDelay.ar(trig, 0.2), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	var in3 = Decay2.ar(TDelay.ar(trig, 0.3), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	var in4 = Decay2.ar(TDelay.ar(trig, 0.4), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	var in5 = Decay2.ar(TDelay.ar(trig, 0.5), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	var in6 = Decay2.ar(TDelay.ar(trig, 0.6), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	var in7 = Decay2.ar(TDelay.ar(trig, 0.7), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(1.8), LFNoise0.kr(16).range(49, 880), 0.01, 1.8), LFNoise0.kr(8).range(49, 880), 0.001, 1.2));
	OffsetOut.ar(0, AllpassC.ar(in0, 0.2, 0.05, 0.5));
	OffsetOut.ar(1, AllpassC.ar(in1, 0.2, 0.05, 0.5));
	OffsetOut.ar(2, AllpassC.ar(in2, 0.2, 0.05, 0.5));
	OffsetOut.ar(3, AllpassC.ar(in3, 0.2, 0.05, 0.5));
	OffsetOut.ar(4, AllpassC.ar(in4, 0.2, 0.05, 0.5));
	OffsetOut.ar(5, AllpassC.ar(in5, 0.2, 0.05, 0.5));
	OffsetOut.ar(6, AllpassC.ar(in6, 0.2, 0.05, 0.5));
	OffsetOut.ar(7, AllpassC.ar(in7, 0.2, 0.05, 0.5));
	OffsetOut.ar(7, in0);
	OffsetOut.ar(6, in1);
	OffsetOut.ar(5, in2);
	OffsetOut.ar(4, in3);
	OffsetOut.ar(3, in4);
	OffsetOut.ar(2, in5);
	OffsetOut.ar(1, in6);
	OffsetOut.ar(0, in7);
}.play;
// 10 is a good rate for triggering when delay of 100 ms
// 40 is a good rate for formants
1/0.8
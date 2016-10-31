{ LPF.ar(Convolution.ar(Impulse.ar(10), Mix.new(BBandPass.ar(WhiteNoise.ar(2), 440 * [1,3,5,7,9,11,13,15,17,19,23,27], 0.001))), 19000) }.play;

(
SynthDef(\addConvImp, { |left = 0, right = 1, freq = 110, parts = #[0,0,0,0,0,0,0,0,0,0,0,0], bw = 0.001, amp = 1.0, ampParts = #[0,0,0,0,0,0,0,0,0,0,0,0], envTrig = 0.5, att = 0.01, dec = 0.5, freqConv = 8, delT = 0.0006, ampDel = 1.0 |
	var in, kernel;
	kernel = Mix.new(BBandPass.ar(WhiteNoise.ar(2), freq * parts, bw, (LFNoise0.ar(amp).range(0.5, 1.0) * ampParts.normalizeSum.reverse) * 5));
	in = Decay2.ar(Impulse.ar(envTrig), att, dec, LPF.ar(Convolution.ar(Impulse.ar(freqConv), kernel, 512)));
	OffsetOut.ar(left, in);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel));
}).add;
)

(
SynthDef(\addConvSinOsc, { |left = 0, right = 1, freq = 110, parts = #[0,0,0,0,0,0,0,0,0,0,0,0], bwParts = #[0,0,0,0,0,0,0,0,0,0,0,0], ampParts = #[0,0,0,0,0,0,0,0,0,0,0,0], envTrig = 0.5, att = 0.01, dec = 0.5, freqConv = 8, delT = 0.0006, ampDel = 1.0 |
	var in, kernel;
	kernel = Mix.new(SinOscFB.ar(freq * parts, bwParts, LFNoise0.ar(20).range(0.5, 1.0) * ampParts));
	in = Decay2.ar(Impulse.ar(envTrig), att, dec, LPF.ar(Convolution.ar(Impulse.ar(freqConv), kernel, 512)));
	OffsetOut.ar(left, in);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel));
}).add;
)

(1*[1,2,3,4,5,6,7,8,9,10,11,12]).normalizeSum.reverse;

~parts = Array.series(12, 1, 7).normalize(1,5);
~parts = Array.series(12, 1, 1);
~ampParts = Array.series(12, 1, 2);
~bwParts = Array.rand(12, 0.3, 0.9);
~ampParts = Array.rand(12, 0.1, 0.5).normalizeSum;

a = Synth(\addConvSinOsc, [\parts, ~parts, \ampParts, ~ampParts, \bwParts, ~bwParts]);
a.set(\bw, 0.002);
a.set(\freqConv, 440);
a.set(\envTrig, 20);
a.set(\freq, 1320);
a.set(\dec, 0.2);
a.set(\amp, 20);
a.set(\delT, 0.08);
a.set(\parts, ~parts);
a.set(\ampParts, ~ampParts);S
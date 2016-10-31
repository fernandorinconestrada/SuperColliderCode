(
SynthDef(\whiteVoice, { |bus = 0, freq, bw = 0.001, rate1, rate2, ampRate1, ampRate2|
	var mix, amp1, amp2;
	amp1 = FSinOsc.kr(rate1, 0, ampRate1);
	amp2 = FSinOsc.kr(rate2, 0, ampRate2);
	mix = BBandPass.ar(WhiteNoise.ar(1.0), freq, bw, amp1) + BBandPass.ar(WhiteNoise.ar(1.0), (freq * Rand(0.99,1.1)).postln, bw, amp2);
	OffsetOut.ar(bus, mix);
}).add;
)
~valotser = (110 * (1..32));
~valrt = (4..36);
~valampRt = ((0..32)/32).normalize(0.6, 1.5);
~a1 = Synth(\whiteVoice, [\freq, ~valotser.choose.postln, \rate1, ~valrt.choose.postln, \rate2, ~valrt.choose.postln, \ampRate1, ~valampRt.choose.postln, \ampRate2, ~valampRt.choose.postln,]);
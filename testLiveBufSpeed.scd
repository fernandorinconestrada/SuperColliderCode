(
a = Buffer.alloc(s, 22050, 1);
SynthDef(\testLiveBufSpeed, { |rate = 1, rateRead = 0.5, freqTrig = 0.3|
	var in, trig, bufIn, bufOut;
	in = SinOsc.ar(440, 0, 0.6);
	trig  = Impulse.kr(freqTrig);
	bufIn = BufWr.ar(in, a, Phasor.ar(trig, rate));
	bufOut = BufRd.ar(1, a, Phasor.ar(0, rateRead, 0, BufFrames.kr(0)));
	OffsetOut.ar(0, AllpassC.ar(bufOut));
}).add;
)

b = Synth(\testLiveBufSpeed);
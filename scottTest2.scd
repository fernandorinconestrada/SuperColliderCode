(
SynthDef(\test, { |amp= 0.7|
	var in, out1, out2, out3, out4, out5, mix;
	//in = HPF.ar(SinOscFB.ar(Stepper.kr(Impulse.kr(0.5), 1, 16, 1) * 50, 0.4, 0.2), 30);
	in = SoundIn.ar(0);
	out1 = PitchShift.ar(in, 0.2, 0.666, 0, 0, amp);
	out2 = PitchShift.ar(in, 0.2, 1.3, 0, 0, amp);
	out3 = PitchShift.ar(in, 0.2, 1.5, 0, 0, amp);
	out4 = PitchShift.ar(in, 0.2, 2, 0, 0, amp);
	out5 = PitchShift.ar(in, 0.2, 3, 0, 0, amp);
	mix = Mix.new([in, out1, out2, out3, out4, out5]);
	OffsetOut.ar([0,1], mix);
}).add;
)


(
SynthDef(\testScottA, { |out = 0, stretch = 2|
	var in, chain, chain1, chain2, chain3, out1, out2, out3, mix;
	in = SoundIn.ar(0);
	//in = HPF.ar(SinOscFB.ar(Stepper.kr(Impulse.kr(0.5), 1, 16, 1) * 50, 0.4, 0.2), 30);
	//in = HPF.ar(SinOsc.ar(220, 0, 0.1), 30);
	chain = FFT(LocalBuf(512), in);
	chain1 = PV_BinShift(chain, 2, 0);
	chain2 = PV_BinShift(chain, 3, 0);
	chain3 = PV_BinShift(chain, 4, 0);
	out1 = IFFT(chain1) * 0.7;
	out2 = IFFT(chain2) * 0.7;
	out3 = IFFT(chain3) * 0.7;
	mix = Mix.new([in, out1, out2, out3]);
	OffsetOut.ar([0,1], mix);
}).add;
)

a = Synth(\testScottA);
a.set(\stretch, 4);
0.666*2
(
SynthDef(\testScott, { | bus1 = 0, bus2 = 0, bus3 = 0, bus4 = 0, bus5 = 0, bus6 = 0, bus7 = 0, bus8 = 0, pRatio1 = 1, pRatio2 = 1,  pRatio3 = 1, pRatio4 = 1, pRatio5 = 1, pRatio6 = 1,  pRatio7 = 1, pRatio8 = 1, pDisp1 = 0, pDisp2 = 0, pDisp3 = 0, pDisp4 = 0, pDisp5 = 0, pDisp6 = 0, pDisp7 = 0, pDisp8 = 0, timeDisp1 = 0, timeDisp2 = 0, timeDisp3 = 0, timeDisp4 = 0, timeDisp5 = 0, timeDisp6 = 0, timeDisp7 = 0, timeDisp8 = 0, ampP1 = 0.001, ampP2 = 0.001, ampP3 = 0.001, ampP4 = 0.001, ampP5 = 0.001,ampP6 = 0.001, ampP7 = 0.001 |
	var in, p1, p2, p3, p4, p5, p6, p7, mix;
	in = SoundIn.ar(0);
	p1 = PitchShift.ar(in, 0.2, pRatio1, pDisp1, timeDisp1, ampP1);
	p2 = PitchShift.ar(in, 0.2, pRatio2, pDisp2, timeDisp2, ampP2);
	p3 = PitchShift.ar(in, 0.2, pRatio3, pDisp3, timeDisp3, ampP3);
	p4 = PitchShift.ar(in, 0.2, pRatio4, pDisp4, timeDisp4, ampP4);
	p5 = PitchShift.ar(in, 0.2, pRatio5, pDisp5, timeDisp5, ampP5);
	p6 = PitchShift.ar(in, 0.2, pRatio6, pDisp6, timeDisp6, ampP6);
	p7 = PitchShift.ar(in, 0.2, pRatio7, pDisp7, timeDisp7, ampP7);
	mix = Mix.new([in, p1, p2, p3, p4, p5, p6, p7]);
	OffsetOut.ar([0,1], mix);
}).add;
)

(
SynthDef(\testScottA, { |out = 0, stretch = 1|
	var in, chain;
	in = SoundIn.ar(0);
	chain = FFT(LocalBuf(2048), in);
	chain1 = PV_BinShift.ar(chain, stretch, 0);
	chain2 = PV_BinShift.ar(chain, stretch, 0);
	chain3 = PV_BinShift.ar(chain, stretch, 0);
	chain4 = PV_BinShift.ar(chain, stretch, 0);
	mix = Mix.new([chain1, chain2, chain3, chain4]);
})
)

a = Synth(\testScott);

a.set(\pRatio1, 0.666, \pRatio2, 1.5, \pRatio3, 2, \pRatio4, 0.666*2, \pRatio5, 3, \pRatio6, 4, \pRatio7, 0.666*3);
a.set(\amp1, 0.8, \amp2, 0.8, \amp3, 0.8, \amp4, 0.8, \amp5, 0.8, \amp6, 0.8, \amp7, 0.8);


{ SinOsc.ar(110, 0, 0.3) }.play;
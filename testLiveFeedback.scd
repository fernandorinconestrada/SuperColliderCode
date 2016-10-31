(
b = Buffer.alloc(s, s.sampleRate * 2, 2);
(
SynthDef(\testLiveBuf, { |bufnum = 0, rate = 1|
	var in;
	in = SoundIn.ar(0);
	BufWr.ar(in, bufnum, Phasor.ar(0, BufRateScale.kr(0) * rate, 0, BufFrames.kr(0)));
}).add;
);
(
SynthDef(\testLiveBufRd, { |bufnum = 0, rateTrig = 10, rate = 4, delTrig1 = 0.3, delTrig2 = 0.5, delTrig3 = 0.7|
	var trig, in, gr1, gr2, gr3, gr4;
	trig = Impulse.kr(rateTrig);
	in = BufRd.ar(2, bufnum, Phasor.ar(0, BufRateScale.kr(0) * LFNoise0.kr(rate).range(0.5, 1.5), 0, BufFrames.kr(0)));
	gr1 = LPF.ar(GrainIn.ar(2, trig, LFNoise0.kr(8).range(0.02, 0.2), in, LFNoise0.kr(5).range(-1.0, 1.0)), 19000);
	gr2 = LPF.ar(GrainIn.ar(2, TDelay.kr(trig, delTrig1), LFNoise0.kr(8).range(0.02, 0.4), in, LFNoise0.kr(5).range(-1.0, 1.0)), 19000);
	gr3 = LPF.ar(GrainIn.ar(2, TDelay.kr(trig, delTrig2), LFNoise0.kr(12).range(0.02, 0.2), in, LFNoise0.kr(5).range(-1.0, 1.0)), 19000);
	gr4 = LPF.ar(GrainIn.ar(2, TDelay.kr(trig, delTrig3), LFNoise0.kr(10).range(0.02, 0.4), in, LFNoise0.kr(5).range(-1.0, 1.0)), 19000);
	OffsetOut.ar([0,1], HPF.ar(gr1, 40));
	OffsetOut.ar([0,1], HPF.ar(gr2, 40));
	OffsetOut.ar([0,1], HPF.ar(gr3, 40));
	OffsetOut.ar([0,1], HPF.ar(gr4, 40));
	OffsetOut.ar([0,1], Pan2.ar(AllpassC.ar(gr1, 0.2, 0.08, LFNoise0.kr(3).range(0.5, 1), LFNoise0.kr(1).range(0.5, 0.8)), LFNoise0.kr(5).range(-1.0, 1.0)));
	OffsetOut.ar([0,1], Pan2.ar(AllpassC.ar(gr2, 0.2, 0.08, LFNoise0.kr(4).range(0.5, 1), LFNoise0.kr(2).range(0.5, 0.8)), LFNoise0.kr(5).range(-1.0, 1.0)));
	OffsetOut.ar([0,1], Pan2.ar(AllpassC.ar(gr3, 0.2, 0.08, LFNoise0.kr(2).range(0.5, 1), LFNoise0.kr(1).range(0.5, 0.8)), LFNoise0.kr(5).range(-1.0, 1.0)));
	OffsetOut.ar([0,1], Pan2.ar(AllpassC.ar(gr4, 0.2, 0.08, LFNoise0.kr(1).range(0.5, 1), LFNoise0.kr(1).range(0.5, 0.8)), LFNoise0.kr(5).range(-1.0, 1.0)));
}).add;
);
(
SynthDef(\testLiveGrain, { |bufnum = 0, rate 1|
	OffsetOut.ar([0,1], GrainBuf.ar(2, Impulse.kr(30), 0.1, bufnum));
}).add;
);
)


a = Synth(\testLiveBuf);
c = Synth(\testLiveBufRd);
a.set(\bufnum, b);
c.set(\bufnum, b);
a.set(\rate, 4);
d = Synth(\testLiveGrain);
d.set(\bufnum, b);
c.set(\rateTrig, 50);
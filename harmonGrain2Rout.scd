(
SynthDef(\harmonGrain, { |rateRand = 20, decay = 0.1, attack1 = 0.01, multPart1 = 2.0, fund = 55, multFreq1 = 4, multFreq2 = 8, lobw = 0.001, hibw = 0.005, rateAmp1 = 8, loAmp1 = 0.5, hiAmp1 = 0.8, attack2 = 0.01, multPart2 = 1.5, multFreq3 = 6, multFreq4 = 6, rateAmp2 =7, loAmp2 = 0.4, hiAmp2 = 0.7, attack3 = 0.01, multPart3 =1.5, multFreq5 = 15, multFreq6 = 15, rateAmp3 =6, loAmp3 = 0.3, hiAmp3 = 0.5, mixRevIn = 0.4, delT = 0.07, mixRevDel = 0.4, loAmpDel = 0.5, hiAmpDel = 0.75|
	var rand, partial1, partial2, partial3, in;
	rand = LFNoise0.kr(rateRand);
	partial1 = Decay2.ar(Impulse.ar(1/decay), attack1, decay, BBandPass.ar(WhiteNoise.ar(multPart1), rand.range(fund*multFreq1, (fund*multFreq2)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp1).range(loAmp1, hiAmp1)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), attack2, (decay+1), BBandPass.ar(WhiteNoise.ar(multPart2), rand.range(fund*multFreq3, (fund*multFreq4)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp2).range(loAmp2, hiAmp2)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), attack3, (decay+2), BBandPass.ar(WhiteNoise.ar(multPart3), rand.range(fund*multFreq5, (fund*multFreq6)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp3).range(loAmp3, hiAmp3)));
	in = Mix.new([partial1, partial2, partial3]);
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(in, rand.range(-1.0, 1.0)), mixRevIn));
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, delT, rand.range(loAmpDel, hiAmpDel)), rand.range(1.0, -1.0)), mixRevDel))
}).add;
)

a = Synth(\harmonGrain, [\multFreq1, 8]);
a.set(\mixRevIn, 0.6);
a.set(\mixRevDel, 0.8);
a.set(\attack1, 0.001);
a.set(\attack2, 0.001);
a.set(\attack3, 0.001);
a.set(\attack1, 0.01);
a.set(\attack2, 0.01);
a.set(\attack3, 0.01);
a.set(\decay, 5);
a.set(\decay, 0.5);
a.set(\decay, 0.1);
a.set(\mixRevIn, 0.2);
a.set(\mixRevDel, 0.2);
a.set(\mixRevIn, 0.4);
a.set(\mixRevDel, 0.4);
a.set(\multFreq1, 8);
a.set(\multFreq1, 4);
a.set(\multFreq3, 6);
a.free;

b = Synth(\harmonGrain, [\decay, 0.01, \multFreq1, 16, \multFreq2, 16, \multFreq3, 12, \multFreq4, 12, \multFreq5, 30, \multFreq6, 30, \loAmp2, 0.3, \hiAmp2, 0.5, \loAmp3, 0.1, \hiAmp3, 0.2, \mixRevIn, 0.7, \mixRevDel, 0.7, \delT, 0.06]);

c = Synth(\harmonGrain, [\decay, 0.001, \multFreq1, 8, \multFreq2, 8, \multFreq3, 24, \multFreq4, 24, \multFreq5, 60, \multFreq6, 60, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.2, \hiAmp2, 0.4, \loAmp3, 0.1, \hiAmp3, 0.2, \mixRevIn, 0.6, \mixRevDel, 0.6, \delT, 0.04, \multPart1, 0.5]);
c.set(\delT, 0.1);
c.set(\attack, 0.01)

d = Synth(\harmonGrain, [\decay, 1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
d.set(\delT, 0.1);
d.set(\attack, 0.01)
d.set(\multFreq2, 4);
d.set(\multFreq2, 2);
d.set(\decay, 0.1);
d.set(\multFreq6, 110);
d.set(\multFreq4, 110);


(
~routHarmoGrain = Routine({
	a = Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	0.05.yield;
	b =Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	60.yield;
	a.set(\decay, 1);
	60.yield;
	b.set(\decay, 1);
	20.yield;
	a.set(\decay, 0.1);
	b.set(\decay, 0.1);
})
)

~routHarmoGrain.play;
a.set(\multFreq2, 3)

(
~routHarmoGrain1 = Routine({
	1.do{
	a = Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	0.05.yield;
	b =Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	rrand(3.0, 5.0).yield;
	3.do{
			a.set(\decay, 0.5);
			b.set(\decay, 0.5);
			rrand(1.0, 3.0).yield;
			a.set(\decay, 0.1);
			b.set(\decay, 0.1);
			rrand(0.5, 2.0).yield;
		};
	rrand(5.0, 10.0);
	};
		1.do{
	a = Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	0.05.yield;
	b =Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	rrand(3.0, 5.0).yield;
	3.do{
			a.set(\decay, 0.5);
			b.set(\decay, 0.5);
			rrand(1.0, 3.0).yield;
			a.set(\decay, 0.1);
			b.set(\decay, 0.1);
			rrand(0.5, 2.0).yield;
		};
	rrand(5.0, 10.0);
		};
			1.do{
	a = Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	0.05.yield;
	b =Synth(\harmonGrain, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3]);
	rrand(3.0, 5.0).yield;
	3.do{
			a.set(\decay, 0.5);
			b.set(\decay, 0.5);
			rrand(1.0, 3.0).yield;
			a.set(\decay, 0.1);
			b.set(\decay, 0.1);
			rrand(0.5, 2.0).yield;
		};
	rrand(5.0, 10.0);
	}
})
)

~routHarmoGrain1.play;
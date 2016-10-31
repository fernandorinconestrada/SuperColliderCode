(
SynthDef(\addSineGrainDecayFreqRandom, { | loDurDec = 0.2, hiDurDec =  0.4, rateFreq = 5, mutlFreq = 50, addFreq = 440, fb1 = 0.02, fb2 = 0.0201, fb3 = 0.0202, fb4 = 0.0203, fb5 = 0.0204, fb6 = 0.0205, fb7 = 0.0206, fb8 = 0.0207, fb9 = 0.0208, fb10 = 0.0209, fbRange1 = 0.6, fbRange2 = 0.2, fbRange3 = 0.2, fbRange4 = 0.6, fbRange5 = 0.6, fbRange6 = 0.2, fbRange7 = 0.2, fbRange8 = 0.6, fbRange9 = 0.6, fbRange10 = 0.2, fbRange11 = 0.2, fbRange12 = 0.6, fbRange13 = 0.6, fbRange14 = 0.02, fbRange15 = 0.2, fbRange16 = 0.6, fbRange17 = 0.6, fbRange18 = 0.2, fbRange19 = 0.2, fbRange20 = 0.6, amp1 = 0.047, amp2 = 0.043, amp3 = 0.041, amp4 = 0.037, amp5 = 0.031, amp6 = 0.029, amp7 = 0.023, amp8 = 0.019, amp9 = 0.017, amp10 = 0.013, density = 3, attTDec = 0.001, decTDec = 0.7, dens = 20, freqDur = 23, durLow = 0.05, durHigh = 0.2, freqPan = 25, maxDel = 0.2, delT = 10, loDelT = 0.06, hiDelT = 0.12, decT = 0.3, maxDelFB = 0.2, delTfb = 13, loDelTfb = 0.12, hiDelTfb = 0.18, decTfb = 0.3, busA = 0, busB = 1, busC = 2|
	var sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10, mix, trig, grain, filter, feedB;
	sine1  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb1).range(fbRange1, fbRange2),    amp1);
	sine2  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb2).range(fbRange3, fbRange4),    amp2);
	sine3  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb3).range(fbRange5, fbRange6),    amp3);
	sine4  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb4).range(fbRange7, fbRange8),    amp4);
	sine5  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb5).range(fbRange9, fbRange10),   amp5);
	sine6  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb6).range(fbRange11, fbRange12),  amp6);
	sine7  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb7).range(fbRange13, fbRange14),  amp7);
	sine8  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb8).range(fbRange15, fbRange16),  amp8);
	sine9  = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb9).range(fbRange17, fbRange18),  amp9);
	sine10 = SinOscFB.ar(LFNoise0.kr(rateFreq, mutlFreq, addFreq),  SinOsc.kr(fb10).range(fbRange19, fbRange20), amp10);
	mix = Mix.new([sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10]);
	trig = Dust.ar(density);
	//trig = Impulse.ar(density);
	grain = LPF.ar(Decay2.ar(trig, attTDec, TRand.ar(loDurDec, hiDurDec, trig), GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter = LPF.ar(AllpassC.ar(grain, maxDel, LFDNoise1.kr(delT).range(loDelT, hiDelT), decT), 19000);
	feedB = LPF.ar(AllpassC.ar(filter, maxDelFB, LFDNoise1.kr(delTfb).range(loDelTfb, hiDelTfb), decTfb), 19000);
	OffsetOut.ar(busA, HPF.ar(Limiter.ar(grain, 0.9), 50));
	OffsetOut.ar(busB, HPF.ar(Limiter.ar(filter, 0.9), 50));
	OffsetOut.ar(busC, HPF.ar(Limiter.ar(feedB, 0.9), 50));
}).add;
)

a = Synth(\addSineGrainDecayFreqRandom, [\busA, 2, \busB, 1, \busC, 0]);

a.set(\loDurDec, 0.1, \hiDurDec,0.2);//good average for pizz
a.set(\durLow, 0.05, \durHigh, 0.2);//initial param's good for pluck
a.set(\durLow, 0.01, \durHigh, 0.08);// high grain can notbe longer than highDurDec
a.set(\density, 3);
a.set(\density, 6);
a.set(\density, 12);
.aset(\density, 24);
a.set(\density, 48); //trigger of Decay
a.set(\loDelT, 0.02, \hiDelT, 0.06, \loDelTfb, 0.07, \hiDelTfb, 0.1);//softens the attacks
a.set(\loDelT, 0.06, \hiDelT, 0.12, \loDelTfb, 0.12, \hiDelTfb, 0.18);//initial values, pluck effective

a.set(\mutlFreq, 55, \addFreq, 440);// major third
a.set(\mutlFreq, 110, \addFreq, 440); // major third
a.set(\mutlFreq, 220, \addFreq, 440); // fifth
a.set(\mutlFreq, 440, \addFreq, 440); // octave

b = Synth(\addSineGrainDecayFreqRandom, [\busA, 4, \busB, 5, \busC, 6]);
b.set(\mutlFreq, 1760, \addFreq, 220);// twelve range
b.set(\mutlFreq, 880, \addFreq, 220);
b.set(\mutlFreq, 440, \addFreq, 220);
b.set(\mutlFreq, 220, \addFreq, 220);
b.set(\mutlFreq, 110, \addFreq, 220)
b.set(\durLow, 0.002, \durHigh, 0.05);//can not go higher than decTdec
b.set(\loDurDec, 0.1, \hiDurDec,0.2);
b.set(\durLow, 0.01, \durHigh, 0.04);
b.set(\density, 48);
b.set(\density, 24);
b.set(\density, 12);
b.set(\density, 6);
b.set(\density, 3);


c = Synth(\addSineGrainDecayFreqRandom, [\busA, 3, \busB, 5, \busC, 7]);
c.set(\mutlFreq, 220, \addFreq, 110);
c.set(\density, 2); // small density for lower frquencies
c.set(\density, 4);
c.set(\durLow, 0.01, \durHigh, 0.08);
c.set(\loDurDec, 0.1, \hiDurDec,0.2);

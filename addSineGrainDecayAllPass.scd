(
SynthDef(\addSineGrainDecay, { | glissFreq1 = 0.02, glissFreq2 = 0.0201, glissFreq3 = 0.0202, glissFreq4 = 0.0203, glissFreq5 = 0.0204, glissFreq6 = 0.0205, glissFreq7 = 0.0206, glissFreq8 = 0.0207, glissFreq9 = 0.0208, glissFreq10 = 0.0209, freq1 = 440, freq2 = 490, freq3 = 440, freq4 = 490, freq5 = 440, freq6 = 490, freq7 = 440, freq8 = 490, freq9 = 440, freq10 = 490, freq11 = 440, freq12 = 490, freq13 = 440, freq14 = 490, freq15 = 440, freq16 = 490, freq17 = 440, freq18 = 490, freq19 = 440, freq20 = 490, fb1 = 0.02, fb2 = 0.0201, fb3 = 0.0202, fb4 = 0.0203, fb5 = 0.0204, fb6 = 0.0205, fb7 = 0.0206, fb8 = 0.0207, fb9 = 0.0208, fb10 = 0.0209, fbRange1 = 0.6, fbRange2 = 0.2, fbRange3 = 0.2, fbRange4 = 0.6, fbRange5 = 0.6, fbRange6 = 0.2, fbRange7 = 0.2, fbRange8 = 0.6, fbRange9 = 0.6, fbRange10 = 0.2, fbRange11 = 0.2, fbRange12 = 0.6, fbRange13 = 0.6, fbRange14 = 0.02, fbRange15 = 0.2, fbRange16 = 0.6, fbRange17 = 0.6, fbRange18 = 0.2, fbRange19 = 0.2, fbRange20 = 0.6, amp1 = 0.047, amp2 = 0.043, amp3 = 0.041, amp4 = 0.037, amp5 = 0.031, amp6 = 0.029, amp7 = 0.023, amp8 = 0.019, amp9 = 0.017, amp10 = 0.013, density = 3, attTDec = 0.001, decTDec = 0.7, dens = 20, freqDur = 23, durLow = 0.05, durHigh = 0.2, freqPan = 25, maxDel = 0.2, delT = 10, decT = 0.3, maxDelFB = 0.2, delTfb = 13, decTfb = 0.3, busA = 0, busB = 1, busC = 2, delTGrain = 0.05, delTFilter = 0.06, delTdelFB = 0.07 |
	var sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10, mix, grain, filter, feedB, delGrain, delFilt, delFeedB, mixGrain, mixFilter, mixFB;
	sine1  = SinOscFB.ar(SinOsc.kr(glissFreq1).range(freq1, freq2),    SinOsc.kr(fb1).range(fbRange1, fbRange2),    amp1);
	sine2  = SinOscFB.ar(SinOsc.kr(glissFreq2).range(freq3, freq4),    SinOsc.kr(fb2).range(fbRange3, fbRange4),    amp2);
	sine3  = SinOscFB.ar(SinOsc.kr(glissFreq3).range(freq5, freq6),    SinOsc.kr(fb3).range(fbRange5, fbRange6),    amp3);
	sine4  = SinOscFB.ar(SinOsc.kr(glissFreq4).range(freq7, freq8),    SinOsc.kr(fb4).range(fbRange7, fbRange8),    amp4);
	sine5  = SinOscFB.ar(SinOsc.kr(glissFreq5).range(freq9, freq10),   SinOsc.kr(fb5).range(fbRange9, fbRange10),   amp5);
	sine6  = SinOscFB.ar(SinOsc.kr(glissFreq6).range(freq11, freq12),  SinOsc.kr(fb6).range(fbRange11, fbRange12),  amp6);
	sine7  = SinOscFB.ar(SinOsc.kr(glissFreq7).range(freq13, freq14),  SinOsc.kr(fb7).range(fbRange13, fbRange14),  amp7);
	sine8  = SinOscFB.ar(SinOsc.kr(glissFreq8).range(freq15, freq16),  SinOsc.kr(fb8).range(fbRange15, fbRange16),  amp8);
	sine9  = SinOscFB.ar(SinOsc.kr(glissFreq9).range(freq17, freq18),  SinOsc.kr(fb9).range(fbRange17, fbRange18),  amp9);
	sine10 = SinOscFB.ar(SinOsc.kr(glissFreq10).range(freq19, freq20), SinOsc.kr(fb10).range(fbRange19, fbRange20), amp10);
	mix = Mix.new([sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10]);
	grain = Decay2.ar(Dust.ar(density), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix));
	delGrain = AllpassC.ar(grain, maxDel, delTGrain, decT);
	filter = AllpassC.ar(grain, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT);
	delFilt = AllpassC.ar(grain, maxDel, delTFilter, decT);
	feedB = AllpassC.ar(filter, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb);
	delFeedB = AllpassC.ar(filter, maxDelFB, delTdelFB, decTfb);
	mixGrain = Mix.new([grain, delFeedB]);
	mixFilter = Mix.new([filter, delGrain]);
	mixFB = Mix.new([feedB, delFilt]);
	OffsetOut.ar(busA, Limiter.ar(mixGrain, 0.9));
	OffsetOut.ar(busB, Limiter.ar(mixFilter, 0.9));
	OffsetOut.ar(busC, Limiter.ar(mixFB, 0.9));
}).add;
)

a = Synth(\addSineGrainDecay);
a.set(\busA, 0, \busB, 5, \busC, 2);

(
b = Synth(\addSineGrainDecay,  [\busA, 0, \busB, 5, \busC, 2]);
c = Synth(\addSineGrainDecay, [\busA, 4, \busB, 1, \busC, 6, \density, 10, \decTDec, 0.4]);
c.set(\density, 5);

d.set(\decTDec, 0.2);
d = Synth(\addSineGrainDecay, [\busA, 3, \busB, 7, \busC, 3]);
e = Synth(\addSineGrainDecay, [\busA, 7, \busB, 3, \busC, 7]);
)
(
SynthDef(\addSineGrainDecayLLCHStereo, { | glissFreq1 = 0.02, glissFreq2 = 0.0201, glissFreq3 = 0.0202, glissFreq4 = 0.0203, glissFreq5 = 0.0204, glissFreq6 = 0.0205, glissFreq7 = 0.0206, glissFreq8 = 0.0207, glissFreq9 = 0.0208, glissFreq10 = 0.0209, freq1 = 440, freq2 = 490, freq3 = 440, freq4 = 490, freq5 = 440, freq6 = 490, freq7 = 440, freq8 = 490, freq9 = 440, freq10 = 490, freq11 = 440, freq12 = 490, freq13 = 440, freq14 = 490, freq15 = 440, freq16 = 490, freq17 = 440, freq18 = 490, freq19 = 440, freq20 = 490, fb1 = 0.02, fb2 = 0.0201, fb3 = 0.0202, fb4 = 0.0203, fb5 = 0.0204, fb6 = 0.0205, fb7 = 0.0206, fb8 = 0.0207, fb9 = 0.0208, fb10 = 0.0209, fbRange1 = 0.6, fbRange2 = 0.2, fbRange3 = 0.2, fbRange4 = 0.6, fbRange5 = 0.6, fbRange6 = 0.2, fbRange7 = 0.2, fbRange8 = 0.6, fbRange9 = 0.6, fbRange10 = 0.2, fbRange11 = 0.2, fbRange12 = 0.6, fbRange13 = 0.6, fbRange14 = 0.02, fbRange15 = 0.2, fbRange16 = 0.6, fbRange17 = 0.6, fbRange18 = 0.2, fbRange19 = 0.2, fbRange20 = 0.6, amp1 = 0.047, amp2 = 0.043, amp3 = 0.041, amp4 = 0.037, amp5 = 0.031, amp6 = 0.029, amp7 = 0.023, amp8 = 0.019, amp9 = 0.017, amp10 = 0.013, density = 3, attTDec = 0.001, decTDec = 0.7, dens = 20, freqDur = 23, durLow = 0.05, durHigh = 0.2, freqPan = 25, maxDel = 0.2, delT = 10, decT = 0.3, maxDelFB = 0.2, delTfb = 13, decTfb = 0.3, durGrain1 = 0.2, durGrain2 = 0.4, durGrain3 = 0.6, durGrain4 = 0.8, durGrain5 = 1.0, durGrain6 = 1.2, durGrain7 = 1.4 |
	var sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10, mix, grain, filter, feedB, mixOut, mixStereo, out1, out2, out3, out4, out5, out6, out7, out8, trig, grain1, grain2, grain3, grain4, grain5, grain6, grain7, grain8;
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
	trig = Dust.ar(density);
	grain1 = LPF.ar(Decay2.ar(trig, attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	/*grain2 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain1), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	grain3 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain2), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	grain4 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain3), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	grain5 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain4), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	grain6 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain5), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	grain7 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain6), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	grain8 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain7), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);*/
	filter = LPF.ar(AllpassC.ar(grain1, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT), 19000);
	feedB = LPF.ar(AllpassC.ar(filter, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb), 19000);
	mixOut = Mix.new([grain1, filter, feedB]);
	// out1 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50), -1.0);
	// out2 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50), -0.71428571428571);
	// out3 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50), -0.42857142857143);
	// out4 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50), -0.14285714285714);
	// out5 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50),  0.14285714285714);
	// out6 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50),  0.4285714285714);
	// out7 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50),  0.71428571428571);
	// out8 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut, 0.9), 50),  1.0);
	// mixStereo = Mix.new([out1, out2, out3, out4, out5, out6, out7, out8 ]);
	OffsetOut.ar(0, mixOut);
}).add;
)

a = Synth(\addSineGrainDecayLLCHStereo);
a.set(\density, 2);
a.set(\durLow, 0.04, \durHigh, 0.08);
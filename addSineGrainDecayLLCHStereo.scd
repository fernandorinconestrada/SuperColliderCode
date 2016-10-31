(
SynthDef(\addSineGrainDecayLLCHStereoFeb26, { | glissFreq1 = 0.02, glissFreq2 = 0.0201, glissFreq3 = 0.0202, glissFreq4 = 0.0203, glissFreq5 = 0.0204, glissFreq6 = 0.0205, glissFreq7 = 0.0206, glissFreq8 = 0.0207, glissFreq9 = 0.0208, glissFreq10 = 0.0209, freq1 = 440, freq2 = 490, freq3 = 440, freq4 = 490, freq5 = 440, freq6 = 490, freq7 = 440, freq8 = 490, freq9 = 440, freq10 = 490, freq11 = 440, freq12 = 490, freq13 = 440, freq14 = 490, freq15 = 440, freq16 = 490, freq17 = 440, freq18 = 490, freq19 = 440, freq20 = 490, fb1 = 0.02, fb2 = 0.0201, fb3 = 0.0202, fb4 = 0.0203, fb5 = 0.0204, fb6 = 0.0205, fb7 = 0.0206, fb8 = 0.0207, fb9 = 0.0208, fb10 = 0.0209, fbRange1 = 0.6, fbRange2 = 0.2, fbRange3 = 0.2, fbRange4 = 0.6, fbRange5 = 0.6, fbRange6 = 0.2, fbRange7 = 0.2, fbRange8 = 0.6, fbRange9 = 0.6, fbRange10 = 0.2, fbRange11 = 0.2, fbRange12 = 0.6, fbRange13 = 0.6, fbRange14 = 0.02, fbRange15 = 0.2, fbRange16 = 0.6, fbRange17 = 0.6, fbRange18 = 0.2, fbRange19 = 0.2, fbRange20 = 0.6, amp1 = 0.047, amp2 = 0.043, amp3 = 0.041, amp4 = 0.037, amp5 = 0.031, amp6 = 0.029, amp7 = 0.023, amp8 = 0.019, amp9 = 0.017, amp10 = 0.013, density = 3, attTDec = 0.001, decTDec = 0.7, dens = 20, freqDur = 23, durLow = 0.05, durHigh = 0.2, maxDel = 0.2, delT = 10, decT = 0.3, maxDelFB = 0.2, delTfb = 13, decTfb = 0.3, durGrain1 = 0.2, durGrain2 = 0.4, durGrain3 = 0.6, durGrain4 = 0.8, durGrain5 = 1.0, durGrain6 = 1.2, durGrain7 = 1.4 |

	var sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10, mix, trig, grain1, filter1, feedB1, grain2, filter2, feedB2, grain3, filter3, feedB3, grain4, filter4, feedB4, grain5, filter5, feedB5, grain6, filter6, feedB6, grain7, filter7, feedB7, grain8, filter8, feedB8, mixOut1, mixOut2, mixOut3, mixOut4, mixOut5, mixOut6, mixOut7, mixOut8, out1, out2, out3, out4, out5, out6, out7, out8, mixStereo;

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
	filter1 = LPF.ar(AllpassC.ar(grain1, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT *1.2), 19000);
	feedB1 = LPF.ar(AllpassC.ar(filter1, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb), 19000);

	grain2 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain1), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter2 = LPF.ar(AllpassC.ar(grain2, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT), 19000);
	feedB2 = LPF.ar(AllpassC.ar(filter2, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb * 1.2), 19000);

	grain3 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain2), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter3 = LPF.ar(AllpassC.ar(grain3, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT * 1.5), 19000);
	feedB3 = LPF.ar(AllpassC.ar(filter3, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb), 19000);

	grain4 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain3), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter4 = LPF.ar(AllpassC.ar(grain4, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT), 19000);
	feedB4 = LPF.ar(AllpassC.ar(filter4, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb * 1.5), 19000);

	grain5 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain4), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter5 = LPF.ar(AllpassC.ar(grain5, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT * 1.1), 19000);
	feedB5 = LPF.ar(AllpassC.ar(filter5, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb), 19000);

	grain6 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain5), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter6 = LPF.ar(AllpassC.ar(grain6, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT), 19000);
	feedB6 = LPF.ar(AllpassC.ar(filter6, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb * 1.1), 19000);

	grain7 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain6), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter7 = LPF.ar(AllpassC.ar(grain7, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT), 19000);
	feedB7 = LPF.ar(AllpassC.ar(filter7, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb * 0.9), 19000);

	grain8 = LPF.ar(Decay2.ar(TDelay.ar(trig, durGrain7), attTDec, decTDec, GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), mix)), 19000);
	filter8 = LPF.ar(AllpassC.ar(grain3, maxDel, LFDNoise1.kr(delT).range(0.06, 0.12), decT * 0.9), 19000);
	feedB8 = LPF.ar(AllpassC.ar(filter3, maxDelFB, LFDNoise1.kr(delTfb).range(0.12, 0.18), decTfb), 19000);

	mixOut1 = Mix.new([grain1, filter1, feedB1]);
	mixOut2 = Mix.new([grain2, filter2, feedB2]);
	mixOut3 = Mix.new([grain3, filter3, feedB3]);
	mixOut4 = Mix.new([grain4, filter4, feedB4]);
	mixOut5 = Mix.new([grain5, filter5, feedB5]);
	mixOut6 = Mix.new([grain6, filter6, feedB6]);
	mixOut7 = Mix.new([grain7, filter7, feedB7]);
	mixOut8 = Mix.new([grain8, filter8, feedB8]);

	out1 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut1, 0.9), 50), -1.0, 0.75);
	out2 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut2, 0.9), 50), -0.71428571428571, 0.85);
	out3 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut3, 0.9), 50), -0.42857142857143, 0.95);
	out4 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut4, 0.9), 50), -0.14285714285714);
	out5 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut5, 0.9), 50),  0.14285714285714);
	out6 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut6, 0.9), 50),  0.4285714285714, 0.95);
	out7 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut7, 0.9), 50),  0.71428571428571, 0.85);
	out8 =  Pan2.ar(HPF.ar(Limiter.ar(mixOut8, 0.9), 50),  1.0, 0.75);

	mixStereo = Mix.new([out1, out2, out3, out4, out5, out6, out7, out8 ]);

	OffsetOut.ar(0, mixStereo);
}).add;
)
Array.fill(1, { |i| 2/7 * (1..7) -1.0 } )

a = Synth(\addSineGrainDecayLLCHStereoFeb26);

b = Synth(\addSineGrainDecayLLCHStereoFeb26);

c = Synth(\addSineGrainDecayLLCHStereoFeb26);


a.set(\freq1, 55, \freq2, ((55*5)/4), \freq3, 55, \freq4, ((55*5)/4), \freq5, (55*3), \freq6, (((55*3)*5)/4),\freq7, (55*3), \freq8, (((55*3)*5)/4), \freq9, (55*7), \freqe10, (((55*7)*5)/4), \freq11, (55*7), \freq12,(((55*7)*5)/4), \freq13, (55*11), \freq14, (((55*11)*5)/4), \freqe15, (55*11), \freq16, (((55*11)*5)/4), \freq17, (55*13), \freq18, (((55*13)*5)/4), \freq19, (55*13), \freq20, (((55*13)*5)/4));

a.set(\fbRange1, 0.6, \fbRange2, 0.2, \fbRange3, 0.2, \fbRange4, 0.6, \fbRange5, 0.7, \fbRange6, 0.3,\fbRange7, 0.3, \fbRange8, 0.7, \fbRange9, 0.6, \fbRange10, 0.2, \fbRange11, 0.2, \fbRange12, 0.6, \fbRange13, 1.1, \fbRange14, 0.5, \fbRange15, 0.5, \fbRange16, 1.1, \fbRange17, 0.6, \fbRange18, 0.2, \fbRange19, 0.2, \fbRange20, 0.6);

a.set(\density, 3);
a.set(\decTDec, 0.1);
a.set(\dens, 3);
a.set(\durLow, 0.01, \durHigh, 0.05);
b = Synth(\addSineGrainDecay, [\busA, 4, \busB, 5, \busC, 6]);
b.set(\density, 50);
b.set(\dens, 3);
b.set(\decTDec, 0.1);
b.set(\durLow, 0.03, \durHigh, 0.07);


c = Synth(\addSineGrainDecay, [\busA, 3, \busB, 5, \busC, 7]);
c.set(\density, 1);
c.set(\dens, 1);
c.set(\decTDec, 0.1);
b.set(\durLow, 0.01, \durHigh, 0.04);

c.set(\freq1, 660, \freq2, ((660*5)/4), \freq3, 660, \freq4, ((660*5)/4), \freq5, (660*3), \freq6, (((660*3)*5)/4),\freq7, (660*3), \freq8, (((660*3)*5)/4), \freq9, (660*7), \freqe10, (((660*7)*5)/4), \freq11, (660*7), \freq12,(((660*7)*5)/4), \freq13, (660*11), \freq14, (((660*11)*5)/4), \freqe15, (660*11), \freq16, (((660*11)*5)/4), \freq17, (660*13), \freq18, (((660*13)*5)/4), \freq19, (660*13), \freq20, (((660*13)*5)/4));

200/7 * (1..7) - 100
s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/addSineGrainImprovTake 1.aif");
s.record;
s.stopRecording;

a.set(\glissFreq1, 2, \glissFreq2, 2.1, \glissFreq3, 2.2, \glissFreq4, 2.3, \glissFreq5, 2.4, \glissFreq5, 2.5, \glissFreq6, 2.6, \glissFreq7, 2.7, \glissFreq8, 2.8, \glissFreq9, 2.9, \glissFreq10, 3.0 )
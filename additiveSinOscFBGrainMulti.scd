(
SynthDef(\addSineGrainMulti, { | glissFreq1 = 0.02, glissFreq2 = 0.0201, glissFreq3 = 0.0202, glissFreq4 = 0.0203, glissFreq5 = 0.0204, glissFreq6 = 0.0205, glissFreq7 = 0.0206, glissFreq8 = 0.0207, glissFreq9 = 0.0208, glissFreq10 = 0.0209, freq1 = 440, freq2 = 490, freq3 = 440, freq4 = 490, freq5 = 440, freq6 = 490, freq7 = 440, freq8 = 490, freq9 = 440, freq10 = 490, freq11 = 440, freq12 = 490, freq13 = 440, freq14 = 490, freq15 = 440, freq16 = 490, freq17 = 440, freq18 = 490, freq19 = 440, freq20 = 490, fb1 = 0.02, fb2 = 0.0201, fb3 = 0.0202, fb4 = 0.0203, fb5 = 0.0204, fb6 = 0.0205, fb7 = 0.0206, fb8 = 0.0207, fb9 = 0.0208, fb10 = 0.0209, fbRange1 = 0.6, fbRange2 = 0.2, fbRange3 = 0.2, fbRange4 = 0.6, fbRange5 = 0.6, fbRange6 = 0.2, fbRange7 = 0.2, fbRange8 = 0.6, fbRange9 = 0.6, fbRange10 = 0.2, fbRange11 = 0.2, fbRange12 = 0.6, fbRange13 = 0.6, fbRange14 = 0.02, fbRange15 = 0.2, fbRange16 = 0.6, fbRange17 = 0.6, fbRange18 = 0.2, fbRange19 = 0.2, fbRange20 = 0.6, amp1 = 0.047, amp2 = 0.043, amp3 = 0.041, amp4 = 0.037, amp5 = 0.031, amp6 = 0.029, amp7 = 0.023, amp8 = 0.019, amp9 = 0.017, amp10 = 0.013, dens = 20, freqDur = 23, durLow = 0.05, durHigh = 0.2, freqPan = 25, maxDel = 0.2, delT = 0.1, decT = 0.3, maxDelFB = 0.2, delTfb = 0.17, decTfb = 0.3, out1 = 0, out2 = 2, out3 = 3, out4 = 4, out5 = 5 |
	var sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10, mix, grain1, grain2, grain3, grain4, grain5, grain6, grain7, grain8, grain9, grain10, filter, feedB;
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
	//mix = Array.new([sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10]);
	grain1 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), [sine1, sine2], LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain2 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), [sine3, sine4], LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain3 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), [sine5, sine6], LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain4 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), [sine7, sine8], LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain5 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), [sine9, sine10], LFNoise0.kr(freqPan).range(-1.0, 1.0));
	/*grain6 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), sine6, LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain7 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), sine7, LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain8 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), sine8, LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain9 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh), sine9, LFNoise0.kr(freqPan).range(-1.0, 1.0));
	grain10 = GrainIn.ar(1, LFNoise0.kr(dens), LFNoise1.kr(freqDur).range(durLow, durHigh),sine10,LFNoise0.kr(freqPan).range(-1.0, 1.0));*/
	filter = AllpassC.ar([grain1, grain2, grain3, grain4, grain5], maxDel, delT, decT);
	feedB = AllpassC.ar(filter, maxDelFB, delTfb, decTfb);
	Out.ar([out1, out2, out3, out4, out5], Limiter.ar(feedB, 0.9));
}).add;
)

x = Synth(\addSineGrainMulti);

x.free;
o = Server.local.options;
o.numOutputBusChannels = 10;
o.numOutputBusChannels.postln;
s.meter(2, 8);

x.set(\fbRange1, 0.6, \fbRange2, 0.2, \fbRange3, 0.2, \fbRange4, 0.6, \fbRange5, 0.7, \fbRange6, 0.3,\fbRange7, 0.3, \fbRange8, 0.7, \fbRange9, 0.6, \fbRange10, 0.2, \fbRange11, 0.2, \fbRange12, 0.6, \fbRange13, 1.1, \fbRange14, 0.5, \fbRange15, 0.5, \fbRange16, 1.1, \fbRange17, 0.6, \fbRange18, 0.2, \fbRange19, 0.2, \fbRange20, 0.6);

x.set(\freq1, 55, \freq2, ((55*5)/4), \freq3, 55, \freq4, ((55*5)/4), \freq5, (55*3), \freq6, (((55*3)*5)/4),\freq7, (55*3), \freq8, (((55*3)*5)/4), \freq9, (55*7), \freqe10, (((55*7)*5)/4), \freq11, (55*7), \freq12,(((55*7)*5)/4), \freq13, (55*11), \freq14, (((55*11)*5)/4), \freqe15, (55*11), \freq16, (((55*11)*5)/4), \freq17, (55*13), \freq18, (((55*13)*5)/4), \freq19, (55*13), \freq20, (((55*13)*5)/4));

x.set(\durLow, 0.05, \durHigh, 0.13);
x.set(\dens, 65);
x.set(\freqPan, 50);
x.set(\freq1, 110, \freq2, 220, \freq3, 5500, \freq4, 7600);
x.set(\out1, 8);
x.set(\amp1, 0, \amp2, 0, \amp3, 0, \amp4, 0, \amp5, 0, \amp6, 0, \amp7, 0, \amp8, 0, \amp9, 0, \amp10, 0);
x.set(\amp5, 0.05);

s.prepareForRecord;
s.recChannels_(10);
s.record;
s.stopRecording;

o.numOutputBusChannels.postln;
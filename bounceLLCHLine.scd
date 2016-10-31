(
SynthDef(\bounceLLCHLine, { |rateTrig = 0.625, bus0 = 0, dur0 = 0.5, bus1 = 1, dur1 = 0.45, bus2 = 2, dur2 = 0.55, bus3 = 3, dur3 = 0.4, bus4 = 4, dur4 = 0.5, bus5 = 5, dur5 = 0.45, bus6 = 6, dur6 = 0.5, bus7 = 7, dur7 = 0.45, multFreq = 1.05, freqSin = 220, ampRate = 0.4, loAmp = 0.2, hiAmp = 0.5, delT0 = 0.08, decT0 = 0.5 |
	var trig, out0, delay0, out1, delay1, out2, delay2, out3, delay3, out4, delay4, out5, delay5, out6, delay6, out7, delay7;
	trig = Impulse.ar(Line.kr(0.625, 1.785714, 600));
	out0 = OffsetOut.ar(bus0, Decay.ar(trig, dur0, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay0 = OffsetOut.ar(bus1, AllpassC.ar(out0, 0.4, delT0, decT0));
		out1 = OffsetOut.ar(bus1, Decay.ar(TDelay.ar(trig, Line.kr(0.2, 0.07, 600)), dur1, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay1 = OffsetOut.ar(bus2, AllpassC.ar(out1, 0.4, delT0, decT0));
	out2 = OffsetOut.ar(bus2, Decay.ar(TDelay.ar(trig, Line.kr(0.4, 0.14, 600)), dur2, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay2 = OffsetOut.ar(bus3, AllpassC.ar(out2, 0.4, delT0, decT0));
	out3 = OffsetOut.ar(bus3, Decay.ar(TDelay.ar(trig, Line.kr(0.6, 0.21, 600)), dur3, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay3 = OffsetOut.ar(bus4, AllpassC.ar(out3, 0.4, delT0, decT0));
	out4 = OffsetOut.ar(bus4, Decay.ar(TDelay.ar(trig, Line.kr(0.8, 0.28, 600)), dur4, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay4 = OffsetOut.ar(bus5, AllpassC.ar(out4, 0.4, delT0, decT0));
	out5 = OffsetOut.ar(bus5, Decay.ar(TDelay.ar(trig, Line.kr(1.0, 0.35, 600)), dur5, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay5 = OffsetOut.ar(bus6, AllpassC.ar(out5, 0.4, delT0, decT0));
	out6 = OffsetOut.ar(bus6, Decay.ar(TDelay.ar(trig, Line.kr(1.2, 0.42, 600)), dur6, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay6 = OffsetOut.ar(bus7, AllpassC.ar(out6, 0.4, delT0, decT0));
	out7 = OffsetOut.ar(bus7, Decay.ar(TDelay.ar(trig, Line.kr(1.4, 0.49, 600)), dur7, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	//delay7 = OffsetOut.ar(bus0, AllpassC.ar(out7, 0.4, delT0, decT0));
}).add;
)

a = Synth(\bounceLLCHLine);
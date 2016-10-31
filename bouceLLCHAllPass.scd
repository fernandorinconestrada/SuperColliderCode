(
SynthDef(\bounceLLCH, { |rateTrig = 0.625, bus0 = 0, dur0 = 0.5, bus1 = 1, trigDel1 = 0.2, dur1 = 0.55, bus2 = 2, trigDel2 = 0.4, dur2 = 0.65, bus3 = 3, trigDel3 = 0.6, dur3 = 0.5, bus4 = 4, trigDel4 = 0.8, dur4 = 0.5, bus5 = 5, trigDel5 = 1.0, dur5 = 0.6, bus6 = 6, trigDel6 = 1.2, dur6 = 0.55, bus7 = 7, trigDel7 = 1.4, dur7 = 0.65, multFreq = 1.05, freqSin = 220, ampRate = 0.4, loAmp = 0.2, hiAmp = 0.5, delT0 = 0.08, decT0 = 0.5 |
	var trig, out0, delay0, out1, delay1, out2, delay2, out3, delay3, out4, delay4, out5, delay5, out6, delay6, out7, delay7;
	trig = Impulse.ar(rateTrig);
	out0 = OffsetOut.ar(bus0, Decay.ar(trig, dur0, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay0 = OffsetOut.ar(bus1, AllpassC.ar(out0, 0.4, delT0, decT0));
	out1 = OffsetOut.ar(bus1, Decay.ar(TDelay.ar(trig,trigDel1), dur1, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay1 = OffsetOut.ar(bus2, AllpassC.ar(out1, 0.4, delT0, decT0));
	out2 = OffsetOut.ar(bus2, Decay.ar(TDelay.ar(trig,trigDel2), dur2, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay2 = OffsetOut.ar(bus3, AllpassC.ar(out2, 0.4, delT0, decT0));
	out3 = OffsetOut.ar(bus3, Decay.ar(TDelay.ar(trig,trigDel3), dur3, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay3 = OffsetOut.ar(bus4, AllpassC.ar(out3, 0.4, delT0, decT0));
	out4 = OffsetOut.ar(bus4, Decay.ar(TDelay.ar(trig,trigDel4), dur4, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay4 = OffsetOut.ar(bus5, AllpassC.ar(out4, 0.4, delT0, decT0));
	out5 = OffsetOut.ar(bus5, Decay.ar(TDelay.ar(trig,trigDel5), dur5, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay5 = OffsetOut.ar(bus6, AllpassC.ar(out5, 0.4, delT0, decT0));
	out6 = OffsetOut.ar(bus6, Decay.ar(TDelay.ar(trig,trigDel6), dur6, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay6 = OffsetOut.ar(bus7, AllpassC.ar(out6, 0.4, delT0, decT0));
	out7 = OffsetOut.ar(bus7, Decay.ar(TDelay.ar(trig,trigDel7), dur7, SinOscFB.ar(LFNoise2.kr(2, multFreq, freqSin), LFNoise2.kr(4, 0.6, 0.4), SinOsc.kr(ampRate).range(loAmp, hiAmp))));
	delay7 = OffsetOut.ar(bus0, AllpassC.ar(out7, 0.4, delT0, decT0));
}).add;
)

a = Synth(\bounceLLCH);

a.set(\rateTrig, 0.65789473684211, \trigDel1, 0.19, \trigDel2, 0.38, \trigDel3, 0.57, \trigDel4, 0.76, \trigDel5, 0.95, \trigDel6, 1.14, \trigDel7, 1.33);

a.set(\rateTrig, 0.69444444444444, \trigDel1, 0.18, \trigDel2, 0.36, \trigDel3, 0.54, \trigDel4, 0.72, \trigDel5, 0.9, \trigDel6, 1.08, \trigDel7, 1.26);

a.set(\rateTrig, 0.73529411764706, \trigDel1, 0.17, \trigDel2, 0.34, \trigDel3, 0.51, \trigDel4, 0.68, \trigDel5, 0.85, \trigDel6, 1.02, \trigDel7, 1.19);

a.set(\rateTrig, 0.78125, \trigDel1, 0.16, \trigDel2, 0.32, \trigDel3, 0.48, \trigDel4, 0.64, \trigDel5, 0.8, \trigDel6, 0.96, \trigDel7, 1.12);

a.set(\rateTrig, 0.83333333333333, \trigDel1, 0.15, \trigDel2, 0.3, \trigDel3, 0.45, \trigDel4, 0.6, \trigDel5, 0.75, \trigDel6, 0.9, \trigDel7, 1.05);

a.set(\rateTrig, 0.89285714285714, \trigDel1, 0.14, \trigDel2, 0.28, \trigDel3, 0.42, \trigDel4, 0.56, \trigDel5, 0.7, \trigDel6, 0.84, \trigDel7, 0.98);

a.set(\rateTrig, 0.96153846153846, \trigDel1, 0.13, \trigDel2, 0.26, \trigDel3, 0.39, \trigDel4, 0.52, \trigDel5, 0.65, \trigDel6, 0.78, \trigDel7, 0.91);

a.set(\rateTrig, 1.0416666666667, \trigDel1, 0.12, \trigDel2, 0.24, \trigDel3, 0.36, \trigDel4, 0.48, \trigDel5, 0.60, \trigDel6, 0.72, \trigDel7, 0.84);

a.set(\rateTrig, 1.1363636363636, \trigDel1, 0.11, \trigDel2, 0.22, \trigDel3, 0.33, \trigDel4, 0.44, \trigDel5, 0.55, \trigDel6, 0.66, \trigDel7, 0.77);

a.set(\rateTrig, 1.25, \trigDel1, 0.1, \trigDel2, 0.2, \trigDel3, 0.3, \trigDel4, 0.4, \trigDel5, 0.5, \trigDel6, 0.6, \trigDel7, 0.7);

a.set(\rateTrig, 1.3888888888889, \trigDel1, 0.09, \trigDel2, 0.18, \trigDel3, 0.27, \trigDel4, 0.36, \trigDel5, 0.45, \trigDel6, 0.54, \trigDel7, 0.63);


b = Synth(\bounceLLCH, [\rateTrig, 1.25, \trigDel1, 0.1, \trigDel2, 0.2, \trigDel3, 0.3, \trigDel4, 0.4, \trigDel5, 0.5, \trigDel6, 0.6, \trigDel7, 0.7, \freqSin, 330, \multFreq, 1.03]);

a.set(\freqSin, 330, \multFreq, 1.03);

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/bounce0_9secsDelay.aif");
s.record;
s.stopRecording;
	
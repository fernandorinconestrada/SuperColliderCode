{ AllpassC.ar(Decay.ar(Dust.ar(1,0.5), 0.2, WhiteNoise.ar), 0.2, 0.2, 3) }.play;

(
SynthDef(\decaySpread, { | dur = 0.15, delT1 = 0.031, delT2 = 0.043, delT3 = 0.051, delT4 = 0.061, delT5 = 0.073, delT6 = 0.083, delT7 = 0.091, decT = 1, busL = 0, busR = 2, busC = 1, busRr = 5, busLS = 3, busLRr = 4, busRS = 6, busRRr = 7 freqRate = 4, fb = 4, freqAmp = 2|
	var trig, trig2, in, delay1, delay2, delay3, delay4, delay5, delay6, delay7;
	trig = Dust2.ar(0.5, 0.5);
	in = HPF.ar(AllpassC.ar(Decay.ar(trig, dur, SinOscFB.ar(LFNoise2.kr(2, 1.2, 220), LFNoise2.kr(4, 0.6, 0.4), LFNoise2.kr(4, 0.3, 0.3)), 0.2, 0.2, 3)), 70);
	delay1 = AllpassC.ar(in, 0.2, delT1, decT);
	delay2 = AllpassC.ar(in, 0.2, delT2, decT);
	delay3 = AllpassC.ar(in, 0.2, delT3, decT);
	delay4 = AllpassC.ar(in, 0.2, delT4, decT);
	delay5 = AllpassC.ar(in, 0.2, delT5, decT);
	delay6 = AllpassC.ar(in, 0.2, delT6, decT);
	delay7 = AllpassC.ar(in, 0.2, delT7, decT);
    OffsetOut.ar(busL, in);
	OffsetOut.ar(busR, delay1);
	OffsetOut.ar(busC, delay2);
	OffsetOut.ar(busRr, delay3);
	OffsetOut.ar(busLS, delay4);
	OffsetOut.ar(busRS, delay5);
	OffsetOut.ar(busLRr, delay6);
	OffsetOut.ar(busRRr, delay7);
}).add;
)

a = Synth(\decaySpread);
a.set(\dur, 1);

a.set(\busL,7, \busC,0, \busR,1, \busLS,2, \busLRr,3, \busRr,4, \busRRr,5,\busRS, 6);

a.set(\busL,6, \busC,7, \busR,0, \busLS,1, \busLRr,2, \busRr,3, \busRRr,4,\busRS, 5);

a.set(\busL,5, \busC,6, \busR,7, \busLS,0, \busLRr,1, \busRr,2, \busRRr,3,\busRS, 4);

a.set(\delT1, 0.029, \delT2, 0.057, \delT3, 0.0113, \delT4, 0.0223, \delT5, 0.0447, \delT6, 0.0871, \delT7, 0.1711);
(

b = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");

SynthDef(\cloudLLCH, { | dens = 2, dur1 = 0.8, sndbuf, rate1 = 1.0, pos = 0, envbufnum = -1, delT1 = 0.031, delT2 = 0.043, delT3 = 0.051, delT4 = 0.061, delT5 = 0.073, delT6 = 0.083, delT7 = 0.091, decT = 1, decTDec1 = 0.5, decTDec2 = 0.55, decTDec3 = 0.6, decTDec4 = 0.65, decTDec5 = 0.7, decTDec6 = 0.75, decTDec7 = 0.8, busL = 0, busR = 2, busC = 1, busRr = 5, busLS = 3, busLRr = 4, busRS = 6, busRRr = 7|
	var out, trig, delay1, delay2, delay3, delay4, delay5, delay6, delay7;
	trig = Dust.kr(dens);
	out = GrainBuf.ar(1, trig, LFNoise0.kr(dur1).range(0.03, 0.06), sndbuf, LFNoise2.kr(rate1).range(0.8, 1.1), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	delay1 = AllpassC.ar(Decay.ar(Dust.ar(1), decTDec1, out), 0.2, delT1, decT);
	delay2 = AllpassC.ar(Decay.ar(Dust.ar(1), decTDec2, out), 0.2, delT2, decT);
	delay3 = AllpassC.ar(Decay.ar(Dust.ar(1), decTDec3, out), 0.2, delT3, decT);
	delay4 = AllpassC.ar(Decay.ar(Dust.ar(1), decTDec4, out), 0.2, delT4, decT);
	delay5 = AllpassC.ar(Decay.ar(Dust.ar(1), decTDec5, out), 0.2, delT5, decT);
	delay6 = AllpassC.ar(Decay.ar(Dust.ar(1), decTDec6, out), 0.2, delT6, decT);
	delay7 = AllpassC.ar(Decay.ar(Dust.ar(1), decTDec7, out), 0.2, delT7, decT);
	OffsetOut.ar(busL, out);
	OffsetOut.ar(busR, delay1);
	OffsetOut.ar(busC, delay2);
	OffsetOut.ar(busRr, delay3);
	OffsetOut.ar(busLS, delay4);
	OffsetOut.ar(busRS, delay5);
	OffsetOut.ar(busLRr, delay6);
	OffsetOut.ar(busRRr, delay7);
}).add;
)

a = Synth(\cloudLLCH, [\sndbuf, b]);
a.set(\delT1, 0.03, \delT2, 0.03, \delT3, 0.03, \delT4, 0.03, \delT5, 0.03, \delT6, 0.03, \delT7, 0.03 );

a.set(\delT1, 0.029, \delT2, 0.041, \delT3, 0.053, \delT4, 0.061, \delT5, 0.071, \delT6, 0.083, \delT7, 0.097 );

a.set(\delT1, 0.029, \delT2, 0.041, \delT3, 0.053, \delT4, 0.067, \delT5, 0.079, \delT6, 0.087, \delT7, 0.0111);

a.set(\delT1, 0.031, \delT2, 0.051, \delT3, 0.067, \delT4, 0.079, \delT5, 0.087, \delT6, 0.097, \delT7, 0.0121);

a.set(\delT1, 0.029, \delT2, 0.057, \delT3, 0.0113, \delT4, 0.0223, \delT5, 0.0447, \delT6, 0.0871, \delT7, 0.1711);
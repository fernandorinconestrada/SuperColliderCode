(
SynthDef(\testEnvSawUpdate, { | rateTrig = 1, rateAmp = 40, freq = 440, rateDev = 30, loDev = 0.5, hiDev = 2.0, ratePan = 40, envbufnum = -1, delT = 0.05, ratePanDel = 40, rateLevPan = 20 |
	var trig, env, ampGrain, in;
	trig = Impulse.kr(rateTrig);
	env = EnvGen.kr(Env([0, 1, 0.3, 0], [TRand.kr(0.001, 0.01, trig), TRand.kr(0.03, 0.08, trig).poll(10, \sust), TRand.kr(0.1, 0.3, trig)],
		[TIRand.kr(0, 8, trig).poll(10, \curve), TIRand.kr(-8, 0, trig), TIRand.kr(-8, 0, trig)]), trig);
	ampGrain = LFNoise0.kr(rateAmp).range(0.25, 0.65);
	in = SawDPW.ar(freq * LFNoise0.kr(rateDev).range(loDev, hiDev), 0, env * ampGrain);
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(ratePan).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, delT), LFNoise0.kr(ratePanDel).range(-1.0, 1.0), LFNoise0.kr(rateLevPan).range(0.25, 0.85) * ampGrain))
}).add;
)

(
SynthDef(\testEnvSawUpdateA, { | rateTrig = 1, rateAmp = 40, freq = 440, rateDev = 30, loDev = 0.5, hiDev = 2.0, ratePan = 40, envbufnum = -1, delT = 0.05, ratePanDel = 40, rateLevPan = 20 |
	var trig, env, ampGrain, in;
	//trig = Impulse.kr(rateTrig);
	trig = Impulse.kr(SinOsc.kr(rateTrig).range(0.5, 20));
	env = EnvGen.kr(Env([0, 1, 0.3, 0], [TRand.kr(0.001, 0.01, trig), TRand.kr(0.03, 0.08, trig).poll(10, \sust), TRand.kr(0.1, 0.3, trig)], [TIRand.kr(0, 8, trig).poll(10, \curve), TIRand.kr(-8, 0, trig), TIRand.kr(-8, 0, trig)]), trig);
	ampGrain = LFNoise0.kr(rateAmp).range(0.25, 0.65);
	in = Blip.ar(freq * LFNoise0.kr(rateDev).range(loDev, hiDev), TIRand.kr(20, 80, trig), env * ampGrain);
	OffsetOut.ar(0, Pan2.ar(LPF.ar(in, 19000), LFNoise0.kr(ratePan).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, delT), LFNoise0.kr(ratePanDel).range(-1.0, 1.0), LFNoise0.kr(rateLevPan).range(0.25, 0.85) * ampGrain))
}).add;
)


a = Synth(\testEnvSawUpdateA);
a.set(\rateTrig, 0.02);
a.set(\freq, 220);
a.set(\freq, 110);
a.set(\loDev, 0.3, \hiDev, 3);
a.set(\delT, 0.016);
a.set(\delT, 0.02);
a.set(\delT, 0.032);
a.set(\delT, 0.04);
a.set(\delT, 0.05);
a.set(\delT, 0.064);
a.set(\delT, 0.072);
a.set(\delT, 0.08);
a.set(\delT, 0.09);
a.set(\delT, 0.128);

b = Synth(\testEnvSawUpdateA, [\rateTrig, 0.03]);
b.set(\rateTrig, 0.04);
b.set(\freq, 220);
b.set(\freq, 110);
b.set(\loDev, 0.5, \hiDev, 3);
b.set(\delT, 0.016);
b.set(\delT, 0.02);
b.set(\delT, 0.032);
b.set(\delT, 0.04);
b.set(\delT, 0.05);
b.set(\delT, 0.064);
b.set(\delT, 0.072);
b.set(\delT, 0.08);
b.set(\delT, 0.09);
b.set(\delT, 0.128);

4/1000;
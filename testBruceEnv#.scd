(
SynthDef(\testEnvBlip, { | levAtt = 1, levDec = 0.3, att = 0.01, sust = 0.04, dec = 0.12, curveAtt = 8, curveSust = -8, curveDec = -8, rateTrig = 1, freq = 440, rateDev = 30, loDev = 0.9, hiDev = 1.1, numHarm = 20, rateHarm = 40, loHarm = 0.8, hiHarm = 1.2, ampGrain = 1, ratePan = 40, delT = 0.05, ratePanDel = 40, rateLevPan = 20 |
	var trig, env, in;
	//trig = Impulse.kr(rateTrig);
	trig = Impulse.kr(SinOsc.kr(rateTrig).range(0.5, 100));
	env = EnvGen.kr(Env([0, levAtt, levDec, 0], [att, sust, dec], [curveAtt, curveSust, curveDec]), trig);
	in = LPF.ar(Blip.ar(freq * LFNoise0.kr(rateDev).range(loDev, hiDev), (numHarm * LFNoise0.kr(rateHarm).range(loHarm, hiHarm)).round(1), env), 19000, ampGrain);
	OffsetOut.ar(0, Pan2.ar(HPF.ar(in, 30), LFNoise0.kr(ratePan).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, delT), LFNoise0.kr(ratePanDel).range(-1.0, 1.0), LFNoise0.kr(rateLevPan).range(0.25, 0.85) * ampGrain))
}).add;
)

(
SynthDef(\testEnvBlipDec, { | levAtt = 1, levDec = 0.3, att = 0.01, sust = 0.04, dec = 0.12, curveAtt = 8, curveSust = -8, curveDec = -8, rateTrig = 1, trigDec = 0.5, attDec2 = 0.001, decDec2 = 0.3, freq = 440, rateDev = 30, loDev = 0.9, hiDev = 1.1, numHarm = 20, rateHarm = 40, loHarm = 0.8, hiHarm = 1.2, ampGrain = 1, ratePan = 40, delT = 0.05, ratePanDel = 40, rateLevPan = 20 |
	var trig, env, in;
	//trig = Impulse.kr(rateTrig);
	trig = Impulse.kr(SinOsc.kr(rateTrig).range(0.5, 100));
	env = EnvGen.kr(Env([0, levAtt, levDec, 0], [att, sust, dec], [curveAtt, curveSust, curveDec]), trig);
	in = Decay2.ar(Impulse.ar(trigDec), attDec2, decDec2, LPF.ar(Blip.ar(freq * LFNoise0.kr(rateDev).range(loDev, hiDev), (numHarm * LFNoise0.kr(rateHarm).range(loHarm, hiHarm)).round(1), env), 19000, ampGrain));
	OffsetOut.ar(0, Pan2.ar(HPF.ar(in, 30), LFNoise0.kr(ratePan).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, delT), LFNoise0.kr(ratePanDel).range(-1.0, 1.0), LFNoise0.kr(rateLevPan).range(0.25, 0.85) * ampGrain))
}).add;
)

a = Synth(\testEnvBlipDec);
a.set(\rateTrig, 0.05);
a.set(\freq, 55);
a.set(\numHarm, 100);
a.set(\trigDec, 8);
a.set(\delT, 0.08);


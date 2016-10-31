(
SynthDef(\henonTest, { | freqHen = 20, rateEq_a_Var = 4, loVar_a = 1.0, hiVar_a = 0.4 rateEq_b_Var = 4, loVar_b = 0.01, hiVar_b = 0.3, mapInLo = -1.3, mapInHi = 1.3, mapOutLo = 55, mapOutHi = 60, rateFB = 4, loFB = 0.4, hiFB = 0.6, rateAmp = 6, loAmp = 0.05, hiAmp = 0.2 |
	OffsetOut.ar(0, SinOscFB.ar(HenonC.ar(freqHen, LFNoise0.kr(rateEq_a_Var, hiVar_a, loVar_a), LFNoise0.kr(rateEq_b_Var, hiVar_b, loVar_b)).linlin(mapInLo, mapInHi, mapOutLo, mapOutHi).poll, LFNoise0.kr(rateFB, hiFB, loFB), LFNoise0.kr(rateAmp, hiAmp, loAmp)));
}).add;
)

a = Synth(\henonTest);

(
SynthDef(\henonEnv, { | rateTrig = 1.0, freqHen = 20, rateEq_a_Var = 4, loVar_a = 1.0, hiVar_a = 0.4 rateEq_b_Var = 4, loVar_b = 0.01, hiVar_b = 0.3, mapInLo = -1.3, mapInHi = 1.3, mapOutLo = 55, mapOutHi = 60, rateFB = 4, loFB = 0.4, hiFB = 0.6, rateAmp = 6, loAmp = 0.05, hiAmp = 0.2 |
	var trig, env;
	trig = Impulse.ar(rateTrig);
	env = EnvGen.ar(Env.perc, trig);
	OffsetOut.ar(0, HPF.ar(SinOscFB.ar(HenonC.ar(freqHen, LFNoise0.kr(rateEq_a_Var, hiVar_a, loVar_a), LFNoise0.kr(rateEq_b_Var, hiVar_b, loVar_b)).linlin(mapInLo, mapInHi, mapOutLo, mapOutHi).poll, LFNoise0.kr(rateFB, hiFB, loFB), LFNoise0.kr(rateAmp, hiAmp, loAmp)) * env, 30));
}).add;
)

b = Synth(\henonEnv);
b.set(\rateTrig, 6);

(
SynthDef(\henonDecay2, { | rateTrig = 1.0, attTDec = 0.01, decTDec = 0.7, freqHen = 20, rateEq_a_Var = 4, loVar_a = 1.0, hiVar_a = 0.4 rateEq_b_Var = 4, loVar_b = 0.01, hiVar_b = 0.3, mapInLo = -1.3, mapInHi = 1.3, mapOutLo = 55, mapOutHi = 60, rateFB = 4, loFB = 0.4, hiFB = 0.6, rateAmp = 6, loAmp = 0.05, hiAmp = 0.2 |
	var trig;
	trig = Impulse.ar(rateTrig);
	OffsetOut.ar(0, Decay2.ar(trig, attTDec, decTDec, HPF.ar(SinOscFB.ar(HenonC.ar(freqHen, LFNoise0.kr(rateEq_a_Var, hiVar_a, loVar_a), LFNoise0.kr(rateEq_b_Var, hiVar_b, loVar_b)).linlin(mapInLo, mapInHi, mapOutLo, mapOutHi).poll, LFNoise0.kr(rateFB, hiFB, loFB), LFNoise0.kr(rateAmp, hiAmp, loAmp)), 30)));
}).add;
)

(
SynthDef(\henonDecay2Pan, { | rateTrig = 1.0, attTDec = 0.01, decTDec = 0.7, freqHen = 20, rateEq_a_Var = 4, loVar_a = 1.0, hiVar_a = 0.4 rateEq_b_Var = 4, loVar_b = 0.01, hiVar_b = 0.3, mapInLo = -1.3, mapInHi = 1.3, mapOutLo = 55, mapOutHi = 60, rateFB = 4, loFB = 0.4, hiFB = 0.6, rateAmp = 6, loAmp = 0.05, hiAmp = 0.2 |
	var trig, pos, in;
	trig = Impulse.ar(rateTrig);
	pos = Stepper.ar(trig, 0, 0, 7, 1, nil) *  0.28571428571429 -1.0;
	in = Decay2.ar(trig, attTDec, decTDec, HPF.ar(SinOscFB.ar(HenonC.ar(freqHen, LFNoise0.kr(rateEq_a_Var, hiVar_a, loVar_a), LFNoise0.kr(rateEq_b_Var, hiVar_b, loVar_b)).linlin(mapInLo, mapInHi, mapOutLo, mapOutHi).poll, LFNoise0.kr(rateFB, hiFB, loFB), LFNoise0.kr(rateAmp, hiAmp, loAmp)), 30));
	OffsetOut.ar(0, Pan2.ar(in, pos));
}).add;
)

c = Synth(\henonDecay2Pan)
c.set(\decTDec, 0.1)
c.set(\rateTrig, 6)
c.set(\mapOutLo, 55, \mapOutHi, 110)

(
SynthDef(\henonDecay2PanDel, { | rateTrig = 1.0, attTDec = 0.01, decTDec = 0.7, freqHen = 20, rateEq_a_Var = 4, loVar_a = 1.0, hiVar_a = 0.4 rateEq_b_Var = 4, loVar_b = 0.01, hiVar_b = 0.3, mapInLo = -1.3, mapInHi = 1.3, mapOutLo = 55, mapOutHi = 60, rateFB = 4, loFB = 0.4, hiFB = 0.6, rateAmp = 6, loAmp = 0.05, hiAmp = 0.2, maxDel = 0.2, rateDelTAll = 6, rateDecTAll = 5, levDel = 0.75 |
	var trig, pos, posDel,  delT_All, decT_All, in;
	trig = Impulse.ar(rateTrig);
	pos = Stepper.ar(trig, 0, 0, 7, 1, nil) *  0.28571428571429 -1.0;
	posDel = Stepper.ar(trig, 0, 0, 7, -1, nil) *  0.28571428571429 -1.0;
	delT_All = Dwhite(0, 1, inf);
	decT_All = Dwhite(0, 1, inf);
	in = Decay2.ar(trig, attTDec, decTDec, HPF.ar(SinOscFB.ar(HenonC.ar(freqHen, LFNoise0.kr(rateEq_a_Var, hiVar_a, loVar_a), LFNoise0.kr(rateEq_b_Var, hiVar_b, loVar_b)).linlin(mapInLo, mapInHi, mapOutLo, mapOutHi).poll, LFNoise0.kr(rateFB, hiFB, loFB), LFNoise0.kr(rateAmp, hiAmp, loAmp)), 30));
	OffsetOut.ar(0, Pan2.ar(in, pos));
	OffsetOut.ar(0, LPF.ar(AllpassC.ar(Pan2.ar(in, posDel), maxDel, Demand.ar(trig, 0, delT_All).linlin(0, 1, 0.005, 0.06), Demand.ar(trig, 0, decT_All).linlin(0, 1, 0.2, 0.7), levDel), 19000));
}).add;
)

d = Synth(\henonDecay2PanDel)
d.set(\decTDec, 0.4)
d.set(\rateTrig, 8)
d.set(\mapOutLo, 220, \mapOutHi, 880)

e = Synth(\henonDecay2PanDel, [\mapOutLo, 110, \mapOutHi, 220, \decTDec, 0.1,  \rateTrig, 8])

f = Synth(\henonDecay2PanDel, [\mapOutLo, 220, \mapOutHi, 330, \decTDec, 0.03,  \rateTrig, 8])
f.set(\decTDec, 0.04)
f.set(\rateTrig, 16)

(
SynthDef(\henonDecay2PanDelPbind, { | rateTrig = 1.0, dur= 1, attTDec = 0.01, decTDec = 0.7, freqHen = 20, rateEq_a_Var = 4, loVar_a = 1.0, hiVar_a = 0.4 rateEq_b_Var = 4, loVar_b = 0.01, hiVar_b = 0.3, mapInLo = -1.3, mapInHi = 1.3, mapOutLo = 55, mapOutHi = 60, rateFB = 4, loFB = 0.4, hiFB = 0.6, rateAmp = 6, loAmp = 0.05, hiAmp = 0.2, maxDel = 0.2, rateDelTAll = 6, rateDecTAll = 5, levDel = 0.75 |
	var trig, pos, posDel,  delT_All, decT_All, env, in, out, delay;
	trig = Impulse.ar(rateTrig);
	pos = Stepper.ar(trig, 0, 0, 7, 1, nil) *  0.28571428571429 -1.0;
	posDel = Stepper.ar(trig, 0, 0, 7, -1, nil) *  0.28571428571429 -1.0;
	delT_All = Dwhite(0, 1, inf);
	decT_All = Dwhite(0, 1, inf);
	env = EnvGen.ar(Env.linen(dur*0.01, dur*0.98, dur*0.01, 1, -4), trig, doneAction:2);
	in = Pan2.ar(Decay2.ar(trig, attTDec, decTDec, HPF.ar(SinOscFB.ar(HenonC.ar(freqHen, LFNoise0.kr(rateEq_a_Var, hiVar_a, loVar_a), LFNoise0.kr(rateEq_b_Var, hiVar_b, loVar_b)).linlin(mapInLo, mapInHi, mapOutLo, mapOutHi).poll, LFNoise0.kr(rateFB, hiFB, loFB), LFNoise0.kr(rateAmp, hiAmp, loAmp)), 30)), pos) * env;
	out = OffsetOut.ar(0, in);
	//OffsetOut.ar(0, LPF.ar(AllpassC.ar(Pan2.ar(out, posDel), maxDel, Demand.ar(trig, 0, delT_All).linlin(0, 1, 0.005, 0.06), Demand.ar(trig, 0, decT_All).linlin(0, 1, 0.2, 0.7), levDel), 19000));
}).add;
)

(
a = Pbind(
	\instrument, \henonDecay2PanDelPbind,
	\rateTrig, Pseq([6, 7, 8, 9, 10, 11, 12], 2),
	\dur, 1
).play;
)
)
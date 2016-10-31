{
	var trigEnv = Impulse.ar(1);
	var env = EnvGen.ar(Env([1,1,0], [0, 5]), trigEnv, doneAction:2);
	var trig = Dust.ar(20*env);
	var t = TBall.ar()
	Decay2.ar(trigEnv, 0.01, 5, TBall.ar(BPF.ar(WhiteNoise.ar(Decay2.ar(trig, 0.001, 0.01, LFNoise1.ar(8, 0.5, 0.5)) * 0.15), TRand.ar(1000, 15000, trig), 0.5)))
}.play;

(
SynthDef(\sandDisper, { | trigEnvRate = 0.3, durEnv = 5, dens = 40, attEnv = 0.001, attTail = 0.001, durTail = 0.01, rateAmp = 8, multAmp = 0.5, addAmp = 0.5, normVal = 0.15, loFreq = 1000, hiFreq = 15000, bw = 0.5, durDelTrig0 = 0.1, durDelTrig1 = 0.2, durDelTrig2 = 0.3, maxDel = 0.2, decAll = 0.5, delIn0 = 0.085, levAllIn0 = 0.7, delIn1 = 0.09, levAllIn1 = 0.6, delIn2 = 0.1, levAllIn2 = 0.5, delIn3 = 0.11, levAllIn3 = 0.4, bus0 = 0, bus1 = 2, bus2 = 4, bus3 = 6, busDel0 = 7, busDel1 = 5, busDel2 = 3, busDel3 = 1|
	var trigEnv, env, trigDens, in0, in1, in2, in3;
	//trigEnv = Impulse.ar(TRand.ar(0.2, 0.5, Impulse.ar(0.5)));
	trigEnv = Impulse.ar(trigEnvRate);
	env = EnvGen.ar(Env([1,1,0], [0, durEnv]), trigEnv, doneAction:2);
	trigDens = Dust.ar(dens * env);
	//in0 = Decay2.ar(trigEnv, LFNoise0.kr(attEnv, 0.001, 0.001), durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in0 = Decay2.ar(trigEnv, attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in1 = Decay2.ar(TDelay.ar(trigEnv, durDelTrig0), attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in2 = Decay2.ar(TDelay.ar(trigEnv, durDelTrig1), attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in3 = Decay2.ar(TDelay.ar(trigEnv, durDelTrig2), attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	OffsetOut.ar(bus0, in0);
	OffsetOut.ar(busDel0, AllpassC.ar(in0, maxDel, delIn0, decAll, levAllIn0));
	OffsetOut.ar(bus1, in1);
	OffsetOut.ar(busDel1, AllpassC.ar(in1, maxDel, delIn1, decAll, levAllIn1));
	OffsetOut.ar(bus2, in2);
	OffsetOut.ar(busDel2, AllpassC.ar(in2, maxDel, delIn2, decAll, levAllIn2));
	OffsetOut.ar(bus3, in3);
	OffsetOut.ar(busDel3, AllpassC.ar(in3, maxDel, delIn3, decAll, levAllIn3));
}).add;
)
/// mor randomized version
(
SynthDef(\sandDisperRandom, { | /*trigEnvRate = 0.3,*/ loTrigRate = 0.25, hiTrigRate = 0.32, trigTEnv = 0.5, durEnv = 5, dens = 40, attEnv = 0.001, attTail = 0.001, durTail = 0.01, rateAmp = 8, multAmp = 0.5, addAmp = 0.5, normVal = 0.15, loFreq = 1000, hiFreq = 15000, bw = 0.5, durDelTrig0 = 0.1, durDelTrig1 = 0.2, durDelTrig2 = 0.3, maxDel = 0.2, decAll = 0.5, delIn0 = 0.085, levAllIn0 = 0.7, delIn1 = 0.09, levAllIn1 = 0.6, delIn2 = 0.1, levAllIn2 = 0.5, delIn3 = 0.11, levAllIn3 = 0.4, bus0 = 0, bus1 = 2, bus2 = 4, bus3 = 6, busDel0 = 7, busDel1 = 5, busDel2 = 3, busDel3 = 1|
	var trigEnv, env, trigDens, in0, in1, in2, in3;
	trigEnv = Impulse.ar(TRand.ar(loTrigRate, hiTrigRate, Impulse.ar(trigTEnv)));
	//trigEnv = Impulse.ar(trigEnvRate);
	env = EnvGen.ar(Env([1,1,0], [0, durEnv]), trigEnv, doneAction:2);
	trigDens = Dust.ar(dens * env);
	in0 = Decay2.ar(trigEnv, attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in0 = Decay2.ar(trigEnv, attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in1 = Decay2.ar(TDelay.ar(trigEnv, durDelTrig0), attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in2 = Decay2.ar(TDelay.ar(trigEnv, durDelTrig1),attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	in3 = Decay2.ar(TDelay.ar(trigEnv, durDelTrig2), attEnv, durEnv, BPF.ar(WhiteNoise.ar(Decay2.ar(trigDens, attTail, durTail, LFNoise1.ar(rateAmp, multAmp, addAmp)) * normVal), TRand.ar(loFreq, hiFreq, trigDens), bw));
	OffsetOut.ar(bus0, in0);
	OffsetOut.ar(busDel0, AllpassC.ar(in0, maxDel, delIn0, decAll, levAllIn0));
	OffsetOut.ar(bus1, in1);
	OffsetOut.ar(busDel1, AllpassC.ar(in1, maxDel, delIn1, decAll, levAllIn1));
	OffsetOut.ar(bus2, in2);
	OffsetOut.ar(busDel2, AllpassC.ar(in2, maxDel, delIn2, decAll, levAllIn2));
	OffsetOut.ar(bus3, in3);
	OffsetOut.ar(busDel3, AllpassC.ar(in3, maxDel, delIn3, decAll, levAllIn3));
}).add;
)
a = Synth(\sandDisper);
a = Synth(\sandDisperRandom);

a.set(\normVal, 0.3);



a.set(\durTail, 0.08);//larger size more reverberant, for sandDisper
a.set(\durTail, 0.07);//clean
a.set(\durTail, 0.06);//clean
a.set(\durTail, 0.05);//clean
a.set(\durTail, 0.04);//clean synthetic
a.set(\durTail, 0.02);
a.set(\durTail, 0.01)//initial value, very small tail is only effective for sandDisperRandom, large fails


a.set(\decAll, 1);
a.set(\decAll, 0.7);
a.set(\decAll, 0.5);//too dry if grain small


a.set(\dens, 30);
a.set(\dens, 20);


a.set(\hiFreq, 4000);//dark enclosed resonance
a.set(\hiFreq, 5000);//dark plastic surface
a.set(\hiFreq, 6000);//good parameter, lighter plastic surface
a.set(\hiFreq, 7000);//synthetic, lighter plastic surface
a.set(\hiFreq, 15000);// to high, synthetic

a.set(\bw, 0.5)// initial value
a.set(\bw, 0.3);//crisper sound, wood flavor
a.set(\bw, 0.1);// sleigh bells on hiFreq 4000, water on 6000 small grain 0.02, synth texture 15000
a.set(\bw, 0.7);
a.set(\bw, 1);

a.set(\trigEnvRate, 0.5);

a.set(\bus0, 1, \busDel0, 5, \bus1, 0, \busDel1, 2, \bus2, 3, \busDel2, 7, \bus3, 4, \busDel3, 6);// circular balanced
a.set(\bus0, 0, \busDel0, 2, \bus1, 1, \busDel1, 5, \bus2, 3, \busDel2, 7, \bus3, 4, \busDel3, 6);// atttack on ghost center
a.set(\bus0, 4, \busDel0, 6, \bus1, 1, \busDel1, 5, \bus2, 3, \busDel2, 7, \bus3, 0, \busDel3, 2);// atttack on ghost center
a.set(\bus0, 0, \busDel0, 5, \bus1, 1, \busDel1, 0, \bus2, 5, \busDel2, 1, \bus3, 0, \busDel3, 5);// pocketed is effective
a.set(\bus0, 0, \busDel0, 2, \bus1, 1, \busDel1, 0, \bus2, 2, \busDel2, 1, \bus3, 0, \busDel3, 2);// pocketed is effective, ghost surround  for front is good
a.set(\bus0, 0, \busDel0, 3, \bus1, 1, \busDel1, 0, \bus2, 3, \busDel2, 1, \bus3, 0, \busDel3, 3);// pocketed is effective, diagonal less sharp
a.set(\bus0, 0, \busDel0, 4, \bus1, 1, \busDel1, 0, \bus2, 4, \busDel2, 1, \bus3, 0, \busDel3, 4);// pocketed is effective, diagonal, including ghost on opposite rear, right angle vertex on position 6 (fragile)
a.set(\bus0, 0, \busDel0, 5, \bus1, 1, \busDel1, 0, \bus2, 5, \busDel2, 1, \bus3, 0, \busDel3, 5);// pocketed is effective, ghost on center front or center back
a.set(\bus0, 0, \busDel0, 6, \bus1, 1, \busDel1, 0, \bus2, 6, \busDel2, 1, \bus3, 0, \busDel3, 6);// pocketed is effective, ghost on rear more balnace ditributed, less attack
a.set(\bus0, 0, \busDel0, 7, \bus1, 1, \busDel1, 0, \bus2, 7, \busDel2, 1, \bus3, 0, \busDel3, 7);// pocketed is effective, ghost on rear side
a.set(\bus0, 4, \busDel0, 6, \bus1, 5, \busDel1, 4, \bus2, 6, \busDel2, 5, \bus3, 4, \busDel3, 6);//surround ghost on back is good

0.0008 + 0.0005
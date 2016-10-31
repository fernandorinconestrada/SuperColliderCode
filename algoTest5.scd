(
SynthDef(\algoTest5, { | bus = 0, dens = 1, densGr = 10, attT = 0.01, decT = 1, fund = 110, bw = 0.001, rev = -1.0 |
	var trigEnv, ampGray, trigGrain, env, seq, freq, pan, ampPan, delT, in;
	trigEnv = Impulse.ar(dens);
	//trigGrain = Impulse.ar(SinOsc.kr(0.1, 0, densGr, 2));
	trigGrain = Impulse.ar(densGr);
	ampGray = TRand.ar(1.0, 2.0, trigGrain);
	seq = Drand([Dseq([1,3,5,7,9,11,13,15,17,19]), Dseq([1,5,7,9,11,13,15,17,19,21].reverse), Drand([1,3,5,9,11,13,15,17,21,23])].wchoose([0.5, 0.2, 0.3]), inf);
	freq = (Demand.ar(trigGrain, 0, seq * fund)).poll;
	pan = TRand.kr(-1.0, 1.0, trigEnv);
	env = EnvGen.kr(Env.perc(0.01, Rand(0.7, 1)), trigGrain, doneAction:2);
	//env = EnvGen.kr(Env([0, 1, 0.3, 0], [0.01, Rand(0.03, 0.1), Rand(0.4, 0.8)], [8, -4, -8]), trigGrain, doneAction:2);
	ampPan = TRand.ar(1.0, 1.5, trigEnv);
	delT = TRand.ar(0.02, 0.06, trigEnv);
	in = Decay2.ar(trigEnv, attT, decT, BBandPass.ar(GrayNoise.ar(ampGray), freq, bw, env));
	OffsetOut.ar(bus, Pan2.ar(in, pan, ampPan));
	OffsetOut.ar(bus, Pan2.ar(DelayC.ar(in, 0.2, delT, TRand.kr(1.0, 1.5, trigEnv)), pan*rev, ampPan * TRand.kr(1.0, 1.5, trigEnv)));
}).send(s);
)

(
SynthDef(\algoTest5, { | bus = 0, dens = 1, densGr = 10, attT = 0.01, decT = 1, fund = 110, bw = 0.001, rev = -1.0, perm1 = #[0,0,0,0,0], perm2 = #[0,0,0,0,0], perm3 = #[0,0,0,0,0] |
	var trigEnv, ampGray, trigGrain, env, seq, freq, pan, ampPan, delT, in;
	trigEnv = Impulse.ar(dens);
	//trigGrain = Impulse.ar(SinOsc.kr(0.1, 0, densGr, 2));
	trigGrain = Impulse.ar(densGr);
	ampGray = TRand.ar(1.0, 2.0, trigGrain);
	seq = Drand([Dseq([perm1]), Dseq([perm2].reverse), Drand([perm3])].wchoose([0.5, 0.2, 0.3]), inf);
	freq = (Demand.ar(trigGrain, 0, seq)).poll;
	pan = TRand.kr(-1.0, 1.0, trigEnv);
	env = EnvGen.kr(Env.perc(0.01, Rand(0.7, 1)), trigGrain, doneAction:2);
	//env = EnvGen.kr(Env([0, 1, 0.3, 0], [0.01, Rand(0.03, 0.1), Rand(0.4, 0.8)], [8, -4, -8]), trigGrain, doneAction:2);
	ampPan = TRand.ar(1.0, 1.5, trigEnv);
	delT = TRand.ar(0.02, 0.06, trigEnv);
	in = Decay2.ar(trigEnv, attT, decT, BBandPass.ar(GrayNoise.ar(ampGray), freq, bw, env));
	OffsetOut.ar(bus, Pan2.ar(in, pan, ampPan));
	OffsetOut.ar(bus, Pan2.ar(DelayC.ar(in, 0.2, delT, TRand.kr(1.0, 1.5, trigEnv)), pan*rev, ampPan * TRand.kr(1.0, 1.5, trigEnv)));
}).send(s);
)

a = Synth(\algoTest5);

(
~fund = 55;
~ratio = 3/2;
~fifths1 = [1,3,5,8];//[2,2,3] perm1
~fifths2 = [1,3,6,8];//[2,3,2] perm2
~fifths3 = [1,4,6,8];//[3,2,2] perm3
~perm1 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths1.at(0))), ~fund*(~ratio*~ratio.pow(~fifths1.at(1))), ~fund*(~ratio*~ratio.pow(~fifths1.at(2))), ~fund*(~ratio*~ratio.pow(~fifths1.at(3)))];
~perm2 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths2.at(0))), ~fund*(~ratio*~ratio.pow(~fifths2.at(1))), ~fund*(~ratio*~ratio.pow(~fifths2.at(2))), ~fund*(~ratio*~ratio.pow(~fifths2.at(3)))];
~perm3 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths3.at(0))), ~fund*(~ratio*~ratio.pow(~fifths3.at(1))), ~fund*(~ratio*~ratio.pow(~fifths3.at(2))), ~fund*(~ratio*~ratio.pow(~fifths3.at(3)))];
)

(
{
	inf.do{
		Synth(\algoTest5, [\fund, ~perm1.wchoose([0.51612903225806, 0.25806451612903, 0.12903225806452, 0.064516129032258, 0.032258064516129]), \bw, [0.0013, 0.017, 0.019, 0.023].wchoose([0.4, 0.3, 0.2, 0.1]), \densGr, [5, 7, 11, 13].wchoose([0.5, 0.2, 0.1, 0.1]), \decT, [0.77, 0.91, 1.1, 1.3].wchoose([0.3, 0.4, 0.2, 0.1]), \perm1, ~perm1, \perm2, ~perm2, \perm3, ~perm3]);
		rrand(0.1, 1.0).wait;
		Synth(\algoTest5, [\fund, ~perm2.wchoose([0.51612903225806, 0.25806451612903, 0.12903225806452, 0.064516129032258, 0.032258064516129].scramble), \bw, [0.013, 0.017, 0.019, 0.0023].wchoose([0.4, 0.3, 0.2, 0.1]), \densGr, [5, 7, 11, 13].wchoose([0.4, 0.3, 0.2, 0.1]), \decT, [0.77, 0.91, 1.1, 1.3].wchoose([0.3, 0.4, 0.2, 0.1]), \perm1, ~perm1, \perm2, ~perm2, \perm3, ~perm3]);
		rrand(0.2, 3.0).wait;
		Synth(\algoTest5, [\fund, ~perm3.wchoose([0.51612903225806, 0.25806451612903, 0.12903225806452, 0.064516129032258, 0.032258064516129].scramble), \bw, [0.013, 0.017, 0.019, 0.0023].wchoose([0.4, 0.3, 0.2, 0.1]), \densGr, [5, 7, 11, 13].wchoose([0.2, 0.5, 0.1, 0.1]), \decT, [0.77, 0.91, 1.1, 1.3].wchoose([0.3, 0.4, 0.2, 0.1]), \perm1, ~perm1, \perm2, ~perm2, \perm3, ~perm3]);
		rrand(0.3, 5.0).wait;
	};
}.fork;
)


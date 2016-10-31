(
SynthDef(\innerGrain, { |bus = 0, dens = 0.5, att = 0.01, decay = 1, curveAtt = 8, curveDec = -4, loDev = 0.99, hiDev = 1.01, decGrain = 0.08, freqs = #[0,0,0,0,0], fb = #[0,0,0,0,0], amps = #[0,0,0,0,0], rev = -1.0|
	var trigEnv, env, trigGrain, dev, pan, in, delT, ampDel;
	trigEnv = Impulse.ar(dens);
	env = EnvGen.ar(Env([0, 1, 0], [att, decay], [curveAtt, curveDec]), trigEnv, doneAction:2);
	trigGrain = Impulse.ar(TRand.ar(5, 16, trigEnv));
	dev = TRand.ar(loDev, hiDev, trigEnv);
	pan = TRand.ar(-1.0, 1.0, trigEnv);
	delT = TRand.ar(0.02, 0.07, trigEnv);
	ampDel = TRand.ar(0.2, 0.7, trigEnv);
	in =  Decay2.ar(trigGrain, 0.01, decGrain, Mix.new(SinOscFB.ar(freqs * dev, fb, amps))) * env;
	OffsetOut.ar(bus, Pan2.ar(LPF.ar(in, 19000), pan));
	OffsetOut.ar(bus, Pan2.ar(DelayC.ar(in, 0.2, delT, ampDel), pan*rev));
}).send(s);
)

a = Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ]]);

(
~fund = 55;
~ratio = 3/2;
~fifths1 = [1,3,5,8];//[2,2,3] perm1
~fifths2 = [1,3,6,8];//[2,3,2] perm2
~fifths3 = [1,4,6,8];//[3,2,2] perm3
~perm1 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths1.at(0))), ~fund*(~ratio*~ratio.pow(~fifths1.at(1))), ~fund*(~ratio*~ratio.pow(~fifths1.at(2))), ~fund*(~ratio*~ratio.pow(~fifths1.at(3)))];
~perm2 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths2.at(0))), ~fund*(~ratio*~ratio.pow(~fifths2.at(1))), ~fund*(~ratio*~ratio.pow(~fifths2.at(2))), ~fund*(~ratio*~ratio.pow(~fifths2.at(3)))];
~perm3 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths3.at(0))), ~fund*(~ratio*~ratio.pow(~fifths3.at(1))), ~fund*(~ratio*~ratio.pow(~fifths3.at(2))), ~fund*(~ratio*~ratio.pow(~fifths3.at(3)))];
~amps1 = Array.rand(5, 0.08, 0.12);
~amps2 = Array.rand(5, 0.08, 0.12);
~amps3 = Array.rand(5, 0.08, 0.12);
~fb1 = Array.rand(5, 0.3, 0.9);
~fb2 = Array.rand(5, 0.03, 0.9);
~fb3 = Array.rand(5, 0.03, 0.9);
)
(
~delta1 = (0.05, 0.1);
)

(
{
	50.do{
		a.release;
		a = Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ]]);
		rrand(0.1, 0.4).wait;
	};
	5.wait;
	100.do{
		b.release;
		b = Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.05]);
		rrand(0.1, 0.4).wait;
	};
}.fork;
)
//good seq, alt version with no deviation
(
{
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.1]);
		rrand(0.1, 0.3).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.09, \loDev, 0.98, \hiDev, 1.02]);
		rrand(0.1, 0.4).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.08, \loDev, 0.97, \hiDev, 1.03]);
		rrand(0.2, 0.3).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.07, \loDev, 0.96, \hiDev, 1.04]);
		rrand(0.1, 0.5).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.06, \loDev, 0.95, \hiDev, 1.05]);
		rrand(0.05, 0.3).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.05, \loDev, 0.93, \hiDev, 1.07]);
		rrand(0.05, 0.4).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.04, \loDev, 0.9, \hiDev, 1.1]);
		rrand(0.05, 0.2).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [ 55, 123.75, 278.4375, 626.484375, 2114.384765625 ], \amps, [ 0.11213661193848, 0.085096416473389, 0.082322998046875, 0.11321009635925, 0.10414837360382 ], \decGrain, 0.03, \loDev, 0.7, \hiDev, 1.3]);
		rrand(0.1, 0.3).wait;
	};
}.fork;
)

(
{
	20.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([4, 2, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([4,2,1].normalizeSum),  \fb, [~fb1, ~fb2, ~fb3].wchoose([4,2,1].normalizeSum), \decGrain, 0.1, \curveDec, -4]);
		rrand(0.1, 0.5).wait;
	};
	30.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([3.7, 2.3, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([3.8, 2.2, 1].normalizeSum), \fb, [~fb1, ~fb2, ~fb3].wchoose([2,1,4].normalizeSum), \decGrain, 0.09, \loDev, 0.98, \hiDev, 1.02, \curveDec, -4]);
		rrand(0.05, 0.4).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([3.4, 2.6, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([3.8, 2.2, 1].normalizeSum), \fb, [~fb1, ~fb2, ~fb3].wchoose([1,2,4].normalizeSum), \decGrain, 0.08, \loDev, 0.97, \hiDev, 1.03, \curveDec, -5]);
		rrand(0.1, 0.4).wait;
	};
	30.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([3.1, 2.9, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([3.6, 2.4, 1].normalizeSum), \fb, [~fb1, ~fb2, ~fb3].wchoose([4,2,1].normalizeSum), \decGrain, 0.07, \loDev, 0.96, \hiDev, 1.04, \curveDec, -5]);
		rrand(0.05, 0.3).wait;
	};
	20.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([2.8, 3.2, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([3.4, 2.6, 1].normalizeSum), \fb, [~fb1, ~fb2, ~fb3].wchoose([2,1,4].normalizeSum), \decGrain, 0.06, \loDev, 0.95, \hiDev, 1.05, \curveDec, -6]);
		rrand(0.1, 0.3).wait;
	};
	30.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([2.5, 3.5, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([3.2, 2.8, 1].normalizeSum), \fb, [~fb1, ~fb2, ~fb3].wchoose([1,2,4].normalizeSum), \decGrain, 0.05, \loDev, 0.93, \hiDev, 1.07, \curveDec, -6]);
		rrand(0.05, 0.2).wait;
	};
	50.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([2.2, 3.8, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([3, 3, 1].normalizeSum), \fb, [~fb1, ~fb2, ~fb3].wchoose([4,2,1].normalizeSum), \decGrain, 0.04, \loDev, 0.9, \hiDev, 1.1, \curveDec, -7]);
		rrand(0.1, 0.2).wait;
	};
	70.do{
		Synth(\innerGrain, [\freqs, [~perm1, ~perm2, ~perm3 ].wchoose([2, 4, 1].normalizeSum), \amps, [~amps1, ~amps2, ~amps3].wchoose([2.8, 3.2, 1].normalizeSum), \fb, [~fb1, ~fb2, ~fb3].wchoose([2,1,4].normalizeSum), \decGrain, 0.03, \loDev, 0.7, \hiDev, 1.3, \curveDec, -8]);
		rrand(0.05, 0.1).wait;
	};
}.fork;
)



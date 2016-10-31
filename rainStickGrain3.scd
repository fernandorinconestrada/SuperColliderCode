o = Server.local.options;
o.memSize = 180*8192;
o.memSize;
o.numOutputBusChannels = 2;

(
SynthDef(\gamelanRand, { |rateRand = 3, rateImp = 21, fund = 55, multWhite = 3, loFreqDev = 0.98, hiFreqDev = 1.02, loBw = 0.001, hiBw = 0.005, loDurEnv = 0.03, hiDurEnv = 0.05, freqRingz = 3, loLevEnv = 0.9, hiLevEnv = 1.1, loDecRingz = 0.1, hiDecRingz = 0.3, loAmpRingz = 0.25, hiAmpRingz = 0.5, loDelAmp = 0.6, hiDelAmp = 0.9, array = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayLev = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayDel = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], loPanSig = 0.5, hiPanSig = 1.0, loPanDel = -0.5, hiPanDel = -1.0, attEnvLev = 1, decEnvLev = 0.4, attDur = 1, decDur = 5, relDur = 3, levGest = 1|
	var rand, freq, sig, delay, envGest;
	rand = LFNoise0.kr(rateRand);
	//imp = Impulse.kr(rateImp);
	freq = fund*array;
	envGest = EnvGen.kr(Env([0, attEnvLev, decEnvLev, 0], [attDur, decDur, relDur], [2, -6, -8]), 1, levGest, doneAction:2);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(multWhite), rand.range(loFreqDev, hiFreqDev)*freq, rand.range(loBw, hiBw), EnvGen.kr(Env.perc(0.001, rand.range(loDurEnv, hiDurEnv)), rand, rand.range(loLevEnv, hiLevEnv)*arrayLev)), freq*freqRingz, rand.range(loDecRingz, hiDecRingz), rand.range(loAmpRingz, hiAmpRingz));
	delay = DelayC.ar(sig, 0.2, arrayDel*rand.range(0.02, 0.06), arrayDel*rand.range(loDelAmp, hiDelAmp));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(loPanSig, hiPanSig)))*envGest);
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(loPanDel, hiPanDel)))*envGest);
}).add;
)

(
SynthDef(\gamelanImp, { |rateRand = 3, rateImp = 21, fund = 55, multWhite = 3, loFreqDev = 0.98, hiFreqDev = 1.02, loBw = 0.001, hiBw = 0.005, loDurEnv = 0.03, hiDurEnv = 0.05, freqRingz = 3, loLevEnv = 0.9, hiLevEnv = 1.1, loDecRingz = 0.1, hiDecRingz = 0.3, loAmpRingz = 0.25, hiAmpRingz = 0.5, loDelAmp = 0.6, hiDelAmp = 0.9, array = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayLev = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayDel = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], loPanSig = 0.5, hiPanSig = 1.0, loPanDel = -0.5, hiPanDel = -1.0, attEnvLev = 1, decEnvLev = 0.4, attDur = 1, decDur = 5, relDur = 3, levGest = 1, delT = 0.06|
	var rand, freq, sig, delay, imp, envGest;
	rand = LFNoise0.kr(rateRand);
	imp = Impulse.kr(rateImp);
	freq = fund*array;
	envGest = EnvGen.kr(Env([0, attEnvLev, decEnvLev, 0], [attDur, decDur, relDur], [2, -6, -8]), 1, levGest, doneAction:2);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(multWhite), rand.range(loFreqDev, hiFreqDev)*freq, rand.range(loBw, hiBw), EnvGen.kr(Env.perc(0.001, rand.range(loDurEnv, hiDurEnv)), imp, rand.range(loLevEnv, hiLevEnv)*arrayLev)), freq*freqRingz, rand.range(loDecRingz, hiDecRingz), rand.range(loAmpRingz, hiAmpRingz));
	delay = DelayC.ar(sig, 0.2, arrayDel*delT, arrayDel*rand.range(loDelAmp, hiDelAmp));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(loPanSig, hiPanSig)))*envGest);
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(loPanDel, hiPanDel)))*envGest);
}).add;
)

(
SynthDef(\gamelanImpNoRev, { |rateRand = 3, fund = 55, multWhite = 3, loFreqDev = 0.98, hiFreqDev = 1.02, loBw = 0.001, hiBw = 0.005, loDurEnv = 0.03, hiDurEnv = 0.05, freqRingz = 3, loLevEnv = 0.6, hiLevEnv = 0.9, loDecRingz = 0.1, hiDecRingz = 0.3, loAmpRingz = 0.25, hiAmpRingz = 0.5, loDelAmp = 0.6, hiDelAmp = 0.9, array = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayLev = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayDel = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], loPanSig = 0.5, hiPanSig = 1.0, loPanDel = -0.5, hiPanDel = -1.0, attEnvLev = 1, decEnvLev = 0.4, attDur = 1, decDur = 5, relDur = 3, levGest = 1, delT = 0.06|
	var rand, freq, sig, delay, imp, envGest;
	rand = LFNoise0.kr(rateRand);
	imp = Impulse.kr(rateRand);
	freq = fund*array;
	envGest = EnvGen.kr(Env([0, attEnvLev, decEnvLev, 0], [attDur, decDur, relDur], [2, -6, -8]), 1, levGest, doneAction:2);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(multWhite), rand.range(loFreqDev, hiFreqDev)*freq, rand.range(loBw, hiBw), EnvGen.kr(Env.perc(0.001, rand.range(loDurEnv, hiDurEnv)), imp, rand.range(loLevEnv, hiLevEnv)*arrayLev)), freq*freqRingz, rand.range(loDecRingz, hiDecRingz), rand.range(loAmpRingz, hiAmpRingz));
	delay = DelayC.ar(sig, 0.2, arrayDel*delT, arrayDel*rand.range(loDelAmp, hiDelAmp));
	OffsetOut.ar(0, Pan2.ar(Mix(sig), rand.range(loPanSig, hiPanSig))*envGest);
	OffsetOut.ar(0, Pan2.ar(Mix(delay), rand.range(loPanDel, hiPanDel))*envGest);
}).add;
)

(
SynthDef(\revFX, { |roomsize = 10, revtime = 3, damping = 0.5, inputbw = 0.5, spread = 15, drylevel = 1, earlyref = 0.7, taillevel = 0.5|
	var in, rev;
	in = In.ar(0, 2);
	rev = GVerb.ar(in, roomsize, revtime, damping, inputbw,spread, drylevel, earlyref, taillevel);
	OffsetOut.ar(0, rev);
}).add;
)

(
~freq5 = Array.series(20, 1, 5);
~freq7 = Array.series(20, 1, 7);
~freq11 = Array.series(20, 1, 11);
~array = Array.fill(20, 1*1);
~levels = (1..20).normalizeSum.reverse;
)


(
~routGamelanVer3 = Routine({
	var attEnvLev, decEnvLev, attDur, decDur, relDur, levGest;
	attEnvLev = (5..10)*0.1;
	decEnvLev = (3..6)*0.1;
	attDur = (10..60)*0.1;
	decDur = (30..100)*0.1;
	relDur = (20..50)*0.1;
	levGest = (5..10)*0.1;
	1.do{
a = Synth(\gamelanRand, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, 3, \freqRingz, 5, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose]);
		7.3.yield;
b = Synth(\gamelanRand, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.5, \hiPanSig, 1.0, \loPanDel, -0.5, \hiPanDel, -1.0, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose]);
		5.1.yield;
c = Synth(\gamelanRand, [\array, ~freq5, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.25, \hiPanSig, 0.75, \loPanDel, -0.25, \hiPanDel, -0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose]);
		11.7.yield;
d = Synth(\gamelanRand, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 2, \loPanSig, -0.5, \hiPanSig, -1.0, \loPanDel, 0.5, \hiPanDel, 1.0, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose]);
		7.1.yield;
e = Synth(\gamelanRand, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 3,\loPanSig, 0, \hiPanSig, -0.5, \loPanDel, 0, \hiPanDel, 0.5, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose]);
		11.3.yield;
f = Synth(\gamelanRand, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, 3, \freqRingz, 2, \loPanSig, 0, \hiPanSig, 0.5, \loPanDel, 0, \hiPanDel, -0.5, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose]);
		13.7.yield;
g = Synth(\gamelanRand, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 3, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose])
	}
})
)

~routGamelanVer3.play;

(
~routGamelanVer4 = Routine({
	var attEnvLev, decEnvLev, attDur, decDur, relDur, levGest, rateImpRand, delT;
	attEnvLev = (5..10)*0.1;
	decEnvLev = (3..6)*0.1;
	attDur = (10..70)*0.1;
	decDur = (30..130)*0.1;
	relDur = (20..70)*0.1;
	levGest = (5..10)*0.1;
	rateImpRand = (40..200)*0.1;
	delT = (2..8)*0.01;
	1.do{
a = Synth(\gamelanImp, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, rateImpRand.choose, \rateImp, rateImpRand.choose, \freqRingz, 5, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		3.1.yield;
b = Synth(\gamelanImp, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, rateImpRand.choose, \rateImp, rateImpRand.choose, \freqRingz, 5, \loPanSig, 0.5, \hiPanSig, 1.0, \loPanDel, -0.5, \hiPanDel, -1.0, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		5.1.yield;
c = Synth(\gamelanImp, [\array, ~freq5, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, rateImpRand.choose, \rateImp, rateImpRand.choose, \freqRingz, 5, \loPanSig, 0.25, \hiPanSig, 0.75, \loPanDel, -0.25, \hiPanDel, -0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		1.7.yield;
d = Synth(\gamelanImp, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, rateImpRand.choose, \rateImp, rateImpRand.choose, \freqRingz, 2, \loPanSig, -0.5, \hiPanSig, -1.0, \loPanDel, 0.5, \hiPanDel, 1.0, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		4.1.yield;
e = Synth(\gamelanImp, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, rateImpRand.choose, \rateImp, rateImpRand.choose, \freqRingz, 3,\loPanSig, 0, \hiPanSig, -0.5, \loPanDel, 0, \hiPanDel, 0.5, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		1.3.yield;
f = Synth(\gamelanImp, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, rateImpRand.choose, \rateImp, rateImpRand.choose, \freqRingz, 2, \loPanSig, 0, \hiPanSig, 0.5, \loPanDel, 0, \hiPanDel, -0.5, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		5.7.yield;
g = Synth(\gamelanImp, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, rateImpRand.choose, \rateImp, rateImpRand.choose, \freqRingz, 3, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose])
	}
})
)

~routGamelanVer4.play;

(
~routGamelanVer5 = Routine({
	var attEnvLev, decEnvLev, attDur, decDur, relDur, levGest, rateImpRand, rateImpRand1, rateImpRand2, delT;
	attEnvLev = (5..8)*0.1;
	decEnvLev = (3..6)*0.1;
	attDur = (20..70)*0.1;
	decDur = (70..170)*0.1;
	relDur = (30..110)*0.1;
	levGest = (5..10)*0.1;
	rateImpRand = (20..200)*0.1;
	rateImpRand1 = (20..130)*0.1;
	rateImpRand2 = (30..70)*0.1;
	delT = (2..8)*0.01;
	2.do{
		var fxsynth;
		fxsynth = Synth(\revFX);
a = Synth.before(fxsynth, \gamelanImpNoRev, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, rateImpRand.choose.postln, \freqRingz, 5, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		"7step/5freqMult -55Hz".postln;
		3.1.yield;
		fxsynth.set(\revtime, 4, \drylevel, 0.2);
b = Synth.before(fxsynth, \gamelanImpNoRev, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, rateImpRand2.choose.postln, \freqRingz, 5, \loPanSig, 0.5, \hiPanSig, 1.0, \loPanDel, -0.5, \hiPanDel, -1.0, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		"11step/5freqMult -48Hz".postln;
		5.1.yield;
		fxsynth.set(\revtime, 5, \drylevel, 0.3);
c = Synth.before(fxsynth, \gamelanImpNoRev, [\array, ~freq5, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, rateImpRand1.choose.postln, \freqRingz, 5, \loPanSig, 0.25, \hiPanSig, 0.75, \loPanDel, -0.25, \hiPanDel, -0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		"5step/5freqMult -55Hz".postln;
		1.7.yield;
		fxsynth.set(\revtime, 6, \drylevel, 0.5);
d = Synth.before(fxsynth, \gamelanImpNoRev, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, rateImpRand.choose.postln, \freqRingz, 2, \loPanSig, -0.5, \hiPanSig, -1.0, \loPanDel, 0.5, \hiPanDel, 1.0, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		"11step/2freqMult -55Hz".postln;
		4.1.yield;
		fxsynth.set(\revtime, 5, \drylevel, 0.6);
e = Synth.before(fxsynth, \gamelanImpNoRev, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, rateImpRand2.choose.postln, \freqRingz, 3,\loPanSig, 0, \hiPanSig, -0.5, \loPanDel, 0, \hiPanDel, 0.5, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		"11step/3freqMult -48Hz".postln;
		1.3.yield;
		fxsynth.set(\revtime, 4, \drylevel, 0.8);
f = Synth.before(fxsynth, \gamelanImpNoRev, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, rateImpRand.choose.postln, \freqRingz, 2, \loPanSig, 0, \hiPanSig, 0.5, \loPanDel, 0, \hiPanDel, -0.5, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		"7step/2freqMult -55Hz".postln;
		5.7.yield;
		fxsynth.set(\revtime, 3, \drylevel, 0.6);
g = Synth.before(fxsynth, \gamelanImpNoRev, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, rateImpRand1.choose.postln, \freqRingz, 3, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75, \attEnvLev, attEnvLev.choose, \decEnvLev, decEnvLev.choose, \attDur, attDur.choose, \decDur,  decDur.choose, \relDur, relDur.choose, \levGest,  levGest.choose, \delT, delT.choose]);
		"7step/3freqMult -48Hz".postln;
		7.1.yield;
	}
})
)

~routGamelanVer5.play;
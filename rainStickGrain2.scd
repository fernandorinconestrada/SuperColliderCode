o = Server.local.options;
o.memSize = 180*8192;
o.memSize;
o.numOutputBusChannels = 2;


{
	var rand, freq, even, levels, sig, delay, array;
	rand = LFNoise0.kr(7);
	freq = 55*Array.series(20, 1, 4);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = BPF.ar(WhiteNoise.ar(3), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.03, 0.05)), rand, rand.range(0.9, 1.1)*levels));
	delay = DelayC.ar(sig, 0.12, array*rand.range(0.02, 0.06), array*rand.range(0.6, 0.9));
	OffsetOut.ar(0, Mix(sig));
	OffsetOut.ar(1, Mix(delay));
}.play;



{
	var rand, freq, even, levels, sig, delay, array;
	rand = LFNoise0.kr(7);
	freq = 55*Array.series(20, 1, 5);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(3), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.03, 0.05)), rand, rand.range(0.9, 1.1)*levels)), freq*3, rand.range(0.05, 0.1), rand.range(0.5, 1.0));
	delay = DelayC.ar(sig, 0.12, array*rand.range(0.02, 0.06), array*rand.range(0.6, 0.9));
	OffsetOut.ar(0, Mix(sig));
	OffsetOut.ar(1, Mix(delay));
}.play;


{
	var rand, freq, even, levels, sig, delay, array;
	rand = LFNoise0.kr(7);
	freq = 55*Array.series(20, 1, 5);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(3), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.03, 0.05)), rand, rand.range(0.9, 1.1)*levels)), freq*4, rand.range(0.05, 0.1), rand.range(0.5, 1.0));
	delay = DelayC.ar(sig, 0.12, array*rand.range(0.02, 0.06), array*rand.range(0.6, 0.9));
	OffsetOut.ar(0, Pan2.ar(Mix(sig), rand.range(-1.0, -0.5)));
	OffsetOut.ar(0, Pan2.ar(Mix(delay), rand.range(0.5, 1.0)));
}.play;

{
	var rand, freq, even, levels, sig, delay, array;
	rand = LFNoise0.kr(3);
	//rand = Impulse.kr(20);
	freq = 55*Array.series(20, 1, 7);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(3), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.03, 0.05)), rand, rand.range(0.9, 1.1)*levels)), freq*5, rand.range(0.1, 0.3), rand.range(0.25, 0.5));
	delay = DelayC.ar(sig, 0.2, array*rand.range(0.02, 0.06).poll, array*rand.range(0.6, 0.9));
	//delay = DelayC.ar(sig, 0.2, 0.06, array*rand.range(0.6, 0.9));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(-0.5, -1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(0.5, 1.0))));
}.play;
//11,3;7,3;7,5;5,5;11,2;7,2
//Impulse
{
	var rand, freq, even, levels, sig, delay, array, imp;
	rand = LFNoise0.kr(21);
	imp = Impulse.kr(21);
	freq = 48*Array.series(20, 1, 7);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(3), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.03, 0.05)), imp, rand.range(0.9, 1.1)*levels)), freq*3, rand.range(0.1, 0.3), rand.range(0.25, 0.5));
	//delay = DelayC.ar(sig, 0.2, array*rand.range(0.02, 0.06).poll, array*rand.range(0.6, 0.9));
	delay = DelayC.ar(sig, 0.2, 0.06, array*rand.range(0.6, 0.9));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(-0.5, -1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(0.5, 1.0))));
}.play;

{
	var rand, freq, even, levels, sig, delay, array;
	rand = LFNoise0.kr(7);
	freq = 55*Array.series(20, 1, 11);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(3), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.03, 0.05)), rand, rand.range(0.9, 1.1)*levels)), freq*3, rand.range(0.05, 0.1), rand.range(0.5, 1.0));
	delay = DelayC.ar(sig, 0.12, array*rand.range(0.02, 0.06), array*rand.range(0.6, 0.9));
	OffsetOut.ar(rand.range(0,6).round, GVerb.ar(Pan2.ar(Mix(sig), rand.range(-1.0, 0))));
	OffsetOut.ar(rand.range(0,6).round, GVerb.ar(Pan2.ar(Mix(delay), rand.range(0, 1.0))));
}.play;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/rainStick/gamelan_sevenRingz_Take3.aiff");
s.record;
s.stopRecording;

{
	var rand, freq, even, levels, sig, delay, array;
	rand = LFNoise0.kr(3);
	freq = 27.5*Array.series(20, 1, 5);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(3), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.02, 0.03)), rand, rand.range(0.9, 1.1)*levels)), freq*5.03, rand.range(0.01, 0.03), rand.range(0.1, 0.3), rand.range(0.5, 1.0));
	delay = DelayC.ar(sig, 0.12, array*rand.range(0.05, 0.09), array*rand.range(0.6, 0.9));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(-0.25, -1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(0.25, 1.0))));
}.play;

{
	var rand, freq, even, levels, sig, delay, array;
	rand = LFNoise0.kr(3);
	freq = 27.5*Array.series(20, 1, 5);
	//freq = 55*(1..20);
	//even = 440*Array.series(20, 0, 2);
	//freq = even.insert(0, 440);
	levels = (1..20).normalizeSum.reverse;
	array = Array.fill(20, 1*1);
	sig = MembraneCircle.ar(Formlet.ar(BPF.ar(WhiteNoise.ar(1), rand.range(0.98, 1.02)*freq, rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.02, 0.03)), rand, rand.range(0.9, 1.1)*levels)), freq*2.03, rand.range(0.01, 0.03), rand.range(0.1, 0.3), rand.range(0.5, 1.0)));
	delay = DelayC.ar(sig, 0.12, array*rand.range(0.05, 0.09), array*rand.range(0.6, 0.9));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(-0.25, -1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(0.25, 1.0))));
}.play;

(
SynthDef(\gamelanImp, { |rateRand = 21, rateImp = 21, fund = 55, multWhite = 3, loFreqDev = 0.98, hiFreqDev = 1.02, loBw = 0.001, hiBw = 0.005, loDurEnv = 0.03, hiDurEnv = 0.05, freqRingz = 3, loLevEnv = 0.9, hiLevEnv = 1.1, loDecRingz = 0.1, hiDecRingz = 0.3, loAmpRingz = 0.25, hiAmpRingz = 0.5, loDelAmp = 0.6, hiDelAmp = 0.9, array = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayLev = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayDel = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,]|
	var rand, freq, sig, delay, imp;
	rand = LFNoise0.kr(rateRand);
	imp = Impulse.kr(rateImp);
	freq = fund*array;
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(multWhite), rand.range(loFreqDev, hiFreqDev)*freq, rand.range(loBw, hiBw), EnvGen.kr(Env.perc(0.001, rand.range(loDurEnv, hiDurEnv)), imp, rand.range(loLevEnv, hiLevEnv)*arrayLev)), freq*freqRingz, rand.range(loDecRingz, hiDecRingz), rand.range(loAmpRingz, hiAmpRingz));
	//delay = DelayC.ar(sig, 0.2, array*rand.range(0.02, 0.06).poll, array*rand.range(0.6, 0.9));
	delay = DelayC.ar(sig, 0.2, 0.06, arrayDel*rand.range(loDelAmp, hiDelAmp));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(-0.5, -1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(0.5, 1.0))));
}).add;
)

(
SynthDef(\gamelan, { |rateRand = 3, rateImp = 21, fund = 55, multWhite = 3, loFreqDev = 0.98, hiFreqDev = 1.02, loBw = 0.001, hiBw = 0.005, loDurEnv = 0.03, hiDurEnv = 0.05, freqRingz = 3, loLevEnv = 0.9, hiLevEnv = 1.1, loDecRingz = 0.1, hiDecRingz = 0.3, loAmpRingz = 0.25, hiAmpRingz = 0.5, loDelAmp = 0.6, hiDelAmp = 0.9, array = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayLev = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], arrayDel = #[1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1,], loPanSig = 0.5, hiPanSig = 1.0, loPanDel = -0.5, hiPanDel = -1.0|
	var rand, freq, sig, delay, imp;
	rand = LFNoise0.kr(rateRand);
	//imp = Impulse.kr(rateImp);
	freq = fund*array;
	sig = Ringz.ar(BPF.ar(WhiteNoise.ar(multWhite), rand.range(loFreqDev, hiFreqDev)*freq, rand.range(loBw, hiBw), EnvGen.kr(Env.perc(0.001, rand.range(loDurEnv, hiDurEnv)), rand, rand.range(loLevEnv, hiLevEnv)*arrayLev)), freq*freqRingz, rand.range(loDecRingz, hiDecRingz), rand.range(loAmpRingz, hiAmpRingz));
	delay = DelayC.ar(sig, 0.2, arrayDel*rand.range(0.02, 0.06), arrayDel*rand.range(loDelAmp, hiDelAmp));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(sig), rand.range(loPanSig, hiPanSig))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(Mix(delay), rand.range(loPanDel, hiPanDel))));
}).add;
)

~freq5 = Array.series(20, 1, 5);
~freq7 = Array.series(20, 1, 7);
~freq11 = Array.series(20, 1, 11);
~array = Array.fill(20, 1*1);
~levels = (1..20).normalizeSum.reverse;

(
~routGamelan = Routine({
	1.do{
a = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, 3, \freqRingz, 5, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75]);
		7.3.yield;
b = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.5, \hiPanSig, 1.0, \loPanDel, -0.5, \hiPanDel, -1.0]);
		5.1.yield;
c = Synth(\gamelan, [\array, ~freq5, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.25, \hiPanSig, 0.75, \loPanDel, -0.25, \hiPanDel, -0.75]);
		11.7.yield;
d = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 2, \loPanSig, -0.5, \hiPanSig, -1.0, \loPanDel, 0.5, \hiPanDel, 1.0]);
		7.1.yield;
e = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 3,\loPanSig, 0, \hiPanSig, -0.5, \loPanDel, 0, \hiPanDel, 0.5]);
		11.3.yield;
f = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, 3, \freqRingz, 2, \loPanSig, 0, \hiPanSig, 0.5, \loPanDel, 0, \hiPanDel, -0.5]);
		13.7.yield;
g = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 3, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75])
	}
})
)

~routGamelan.play;

(
~routGamelanVer2 = Routine({
	1.do{
a = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, 3, \freqRingz, 5, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75]);
		7.3.yield;
b = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.5, \hiPanSig, 1.0, \loPanDel, -0.5, \hiPanDel, -1.0]);
		5.1.yield;
c = Synth(\gamelan, [\array, ~freq5, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.25, \hiPanSig, 0.75, \loPanDel, -0.25, \hiPanDel, -0.75]);
		11.7.yield;
d = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 2, \loPanSig, -0.5, \hiPanSig, -1.0, \loPanDel, 0.5, \hiPanDel, 1.0]);
		7.1.yield;
e = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 3,\loPanSig, 0, \hiPanSig, -0.5, \loPanDel, 0, \hiPanDel, 0.5]);
		11.3.yield;
f = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 55, \rateRand, 3, \freqRingz, 2, \loPanSig, 0, \hiPanSig, 0.5, \loPanDel, 0, \hiPanDel, -0.5]);
		13.7.yield;
g = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 3, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75]);
		17.1.yield;
h = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 48, \rateRand, 3, \freqRingz, 5, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75]);
		7.3.yield;
i = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.5, \hiPanSig, 1.0, \loPanDel, -0.5, \hiPanDel, -1.0]);
		5.1.yield;
j = Synth(\gamelan, [\array, ~freq5, \arrayLev, ~levels, \arrayDel, ~array, \fund,48, \rateRand, 3, \freqRingz, 5, \loPanSig, 0.25, \hiPanSig, 0.75, \loPanDel, -0.25, \hiPanDel, -0.75]);
		11.7.yield;
k = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 2, \loPanSig, -0.5, \hiPanSig, -1.0, \loPanDel, 0.5, \hiPanDel, 1.0]);
		7.1.yield;
l = Synth(\gamelan, [\array, ~freq11, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 3,\loPanSig, 0, \hiPanSig, -0.5, \loPanDel, 0, \hiPanDel, 0.5]);
		11.3.yield;
m = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund, 48, \rateRand, 3, \freqRingz, 2, \loPanSig, 0, \hiPanSig, 0.5, \loPanDel, 0, \hiPanDel, -0.5]);
		13.7.yield;
n = Synth(\gamelan, [\array, ~freq7, \arrayLev, ~levels, \arrayDel, ~array, \fund,55, \rateRand, 3, \freqRingz, 3, \loPanSig, -0.25, \hiPanSig, -0.75, \loPanDel, 0.25, \hiPanDel, 0.75])
	}
})
)

~routGamelanVer2.play;
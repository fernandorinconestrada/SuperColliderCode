(
b = Buffer.allocConsecutive(8, s, 1024, 1, { |buf, i, j|
	var empty,arr,ind,prime, amps;
	ind = (i+1)**2;
	prime = (0..ind.asInteger).select({ |i| i.isPrime });
	empty = Array.fill(ind, 0);
	amps = Array.fill(ind, { |j| ((ind-j)/ind) }).normalizeSum;
	arr = empty.putEach(prime.asArray,amps);
	buf.sine1Msg(arr).postln }, 0);
)
(
b = Buffer.allocConsecutive(8, s, 1024, 1, { |buf, i|
	var ind, amps;
	ind = (i+1)**2;
	amps = Array.fill(ind, { ind.do({Rand(0.01, 1.0)}) }).normalizeSum;
	buf.sine1Msg(amps).postln }, 0);
)
(
c = Env([0, 0.8, 0], [0.1, 0.5], curve: \sin);
c = c.discretize;
d = Buffer.sendCollection(s, c, 2);
d.plot;
)

(
SynthDef(\VoscAlloc, { |out = 0, bufnum = 0|
	var sweep;
	sweep = SinOsc.kr(0.1).range(b.first.bufnum + 0.1, b.last.bufnum - 0.1);
	OffsetOut.ar(0,
		VOsc.ar(sweep, [440, 441], 0, 0.2))
}).load(s);
)
(
SynthDef(\VoscAllocGrain, { |out = 0, bufnum = 0, freq1 = 440, freq2 = 441, maxDel = 0.3, delT = 0.3, ampF = 0.8, ampMix= 0.8, freqSweep = 0.01, envbuf = -1|
	var sweep, in, trig, dur, pan, amp, filter, decT, del, dens;
	//sweep = Poll.kr(Impulse.kr(1), SinOsc.kr(freqSweep, -1).range(b.first.bufnum + 0.1, b.last.bufnum - 0.1));
	sweep = Poll.kr(Impulse.kr(2), TIRand.kr(0.001, 6.999, Impulse.kr(1)));
	in = VOsc.ar(sweep, [freq1, freq2], 0, 0.2);
	dens = SinOsc.kr(0.1).range(2,20);
	trig = Dust.kr(dens);
	dur = LFNoise0.kr(10).range(0.02, 0.19);
	pan = LFNoise1.kr(20).range(-1.0, 1.0);
	amp = LFNoise2.kr(10).range(0.3, 0.8);
	del = GrainIn.ar(2, trig, dur, in, pan, envbuf, mul:amp);
	decT = SinOsc.ar(0.05).range(0.17, 1.13);
	filter = AllpassC.ar(del, maxDel, delT, decT, ampF);
	OffsetOut.ar(0,
		LPF.ar(filter, 21000, ampMix))
}).load(s);
)
(
d = Synth(\VoscAllocGrain, [\freq1, 55.5, \freq2,55, \freqSweep, 0.002, \ampMix, 0.2, \envbuf, c ]);
e = Synth(\VoscAllocGrain, [\freq1, 55.1, \freq2, 55.5, \freqSweep, 0.003, \ampMix, 0.2]);
e.set(\envbuf, -1);
f = Synth(\VoscAllocGrain, [\freq1, 54.7, \freq2,55.2, \freqSweep, 0.005, \ampMix, 0.2 ]);
g = Synth(\VoscAllocGrain, [\freq1, 54.9, \freq2, 55.3, \freqSweep, 0.007, \ampMix, 0.2]);
)
d.free;
b.do(_.free);
c.do(_.free);


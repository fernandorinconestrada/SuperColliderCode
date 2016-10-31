(
8.do({ |i|
	var a,b,ind,prime, amps;
	s.sendMsg(\b_alloc, i, 1024);
	ind = (i+1)**2;
	prime = (0..ind.asInteger).select({ |i| i.isPrime });
	a = Array.fill(ind, 0);
	amps = Array.fill(ind, { |j| ((ind-j)/ind) }).normalizeSum;
	b = a.putEach(prime.asArray,amps);
	s.performList(\sendMsg, \b_gen, i, \sine1, 7, b);
	b.postln;
	amps.postln;
});
)
(
SynthDef(\VOscPrime,{ arg out=0, bufoffset=0;
    var x;
    // mouse x controls the wavetable position
    x = MouseX.kr(0,7);
	x = Poll.kr(Impulse.kr(10), TIRand.kr(0, 7, Impulse.kr(2)) );
	//x = Stepper.kr(Impulse.kr(0.5), 7, 0, 7, 1);
    Out.ar(out,
		VOsc.ar(bufoffset+x.clip(0, 6.99999), [120,121], 0, 0.3)
    )
}).play(s,[\out, 0, \bufoffset, 0]);
)

(
SynthDef(\VOscPrimeGrain,{ arg out=0, bufoffset = 0, freq1 = 82.41, freq2 = 110, dens = 5, maxDel = 0.2, delT = 0.2, ampDel = 0.8, ampMix = 0.5, freqDec = 0.5, freqAmp = 0.5, freqDur = 1, freqShift = 0.01;
    var x, in, amp, pan, dur, grain, delay, decayT;
    // mouse x controls the wavetable position
    //x = MouseX.kr(0,7);
	//x = Poll.kr(Impulse.kr(10),SinOsc.ar(freqShift).unipolar.range(0,7));
	//x = Stepper.kr(Impulse.kr(1), 7, 0, 7, 1);
	x = Poll.kr(Impulse.kr(10), TIRand.kr(0, 7, Impulse.kr(2)) );
	amp = SinOsc.ar(freqAmp).range(0.3, 0.8);
	pan = LFNoise0.kr(20).range(-1.0, 1.0);
	dur = LFNoise1.kr(freqDur).range(0.01, 0.23);
	decayT = SinOsc.kr(freqDec).range(0.05, 0.7);
	in = VOsc.ar(bufoffset + x.clip(0, 6.9999), [freq1,freq2], 0, 0.3);
	grain = GrainIn.ar(1, Dust.ar(dens, amp), dur, in, pan);
	delay = AllpassC.ar(grain, maxDel, delT, decayT, ampDel);
    Out.ar(out,
		LPF.ar(delay, 22000, ampMix);
    )
}).load(s);
)
w = Synth(\VOscPrimeGrain, [\out, 0]);
w = Synth(\VOscPrimeGrain, [\out, 0, \bufoffset, 48]);
w.trace(10);
w.set(\freq2, 83);
w.set(\freqShift, 0.5);
w.set(\density, 1000);

x = Synth(\VOscPrimeGrain, [\out, 0, \bufoffset, 0, \freq1,55, \freq2, 56]);


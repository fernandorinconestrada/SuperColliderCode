o = Server.local.options;
o.memSize = 40*8192;
o.numOutputBusChannels = 2;
o.memSize;

s.boot;

b = Buffer.alloc(s,2048,1);
c = Buffer.alloc(s,2048,1);

(
SynthDef("help-brick", { arg out=0, bufnum=0, bufnum1=1;
	var in, chain, chain1, sig;
	in = WhiteNoise.ar(0.2);
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, 0.000001);
	chain1 = PV_BrickWall(chain1, 0.0000041);
	sig =  chain + chain1;
	Out.ar(out, IFFT(sig));
}).play(s,[\out, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum,]);
)

b.free;

(
SynthDef("help-brick", { arg out=0, bufnum=0, bufnum1=1;
	var in, chain, chain1, env, sig;
	env = EnvGen.kr(Env.perc(0.001, MouseY.kr(0.002, 0.1)), Impulse.kr(MouseX.kr(0.1, 20, lag:0.01)));
	in = WhiteNoise.ar(0.2)*env;
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, SinOsc.kr(5));
	chain1 = PV_BrickWall(chain1, SinOsc.kr(5.2));
	sig = chain + chain1;
	OffsetOut.ar(out, IFFT(sig));
}).play(s,[\out, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum,]);
)

b.free;

(
SynthDef(\pvBrickWall, { arg outL=0, outR= 0, bufnum=0, bufnum1=1, loRangFreqLo = 880*5, hiRangeFreqLo = 1760*5, loRangeFreqHi = 880*10, hiRangeFreqHi = 1760* 10;
	var in, chain, chain1, env, sigL, sigR;
	env = EnvGen.kr(Env.perc(0.001, MouseY.kr(0.002, 0.03)), Impulse.kr(MouseX.kr(0.1, 20, lag:0.01)));
	in = BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(0.05, 0.2))*env, SinOsc.kr(LFNoise0.kr(0.5).range(0.1, 2)).range(SinOsc.kr(0.2).range(loRangFreqLo, hiRangeFreqLo), SinOsc.kr(0.1).range(loRangeFreqHi, hiRangeFreqHi)), SinOsc.kr(0.31).range(0.001, 0.1));
	in = Decay2.ar(Impulse.ar(LFNoise0.kr(1).range(0.1, 3)), 0.01, 0.5, in);
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	chain1 = PV_BrickWall(chain1, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	sigL = IFFT(chain);
	sigR = DelayC.ar(IFFT(chain1), 0.1, 0.03);
	OffsetOut.ar(outL, Pan2.ar(GVerb.ar(sigL), LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(outR, Pan2.ar(GVerb.ar(sigR), LFNoise0.kr(20).range(1.0, -1.0)));
//}).play(s,[\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum,]);
}).add;
)
s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/rainStick/pvBrickWall_Take1.aiff");
s.record;
s.stopRecording;
d = Synth(\pvBrickWall, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880*2.5, \hiRangeFreqLo, 1760*2.5, \loRangeFreqHi, 880*5, \hiRangeFreqHi,1760* 5]);
d.free;

e = Synth(\pvBrickWall, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880, \hiRangeFreqLo, 1760, \loRangeFreqHi, 880*2.5, \hiRangeFreqHi,1760*2.5])
e.free;

f = Synth(\pvBrickWall, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880*3, \hiRangeFreqLo, 1760*3, \loRangeFreqHi, 880*6, \hiRangeFreqHi,1760* 6]);
f.free;

g = Synth(\pvBrickWall, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 55, \hiRangeFreqLo, 110, \loRangeFreqHi, 440, \hiRangeFreqHi,880])
g.free;

h = Synth(\pvBrickWall, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 55*10, \hiRangeFreqLo, 110*10, \loRangeFreqHi, 440*6, \hiRangeFreqHi,880*6])
h.free;

i = Synth(\pvBrickWall, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 55, \hiRangeFreqLo, 110, \loRangeFreqHi, 220, \hiRangeFreqHi,440])
i.free;

j = Synth(\pvBrickWall, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 55, \hiRangeFreqLo, 110, \loRangeFreqHi, 110, \hiRangeFreqHi,220])
j.free;

(
SynthDef("help-brick", { arg outL=0, outR= 1, bufnum=0, bufnum1=1;
	var in, chain, chain1, env, sigL, sigR;
	env = EnvGen.kr(Env.perc(0.001, LFNoise0.kr(20).range(0.002, 0.03)), Impulse.kr(MouseX.kr(0.1, 20, lag:0.01)));
	in = BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(0.05, 0.2))*env, SinOsc.kr(LFNoise0.kr(0.5).range(0.1,2)).range(SinOsc.kr(0.2).range(55, 110), SinOsc.kr(0.1).range(12000, 18000)), SinOsc.kr(0.31).range(0.001, 0.1));
	in = Decay2.ar(Impulse.ar(LFNoise0.kr(1).range(0.1, 3)), 0.01, 0.5, in);
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	chain1 = PV_BrickWall(chain1, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	sigL = IFFT(chain);
	sigR = DelayC.ar(IFFT(chain1), 0.1, 0.03);
	OffsetOut.ar(outL, Pan2.ar(GVerb.ar(sigL), LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(outR, Pan2.ar(GVerb.ar(sigR), LFNoise0.kr(20).range(1.0, -1.0)));
}).play(s,[\outL, 0, \outR, 1, \bufnum, b.bufnum, \bufnum1, c.bufnum,]);
)

Env([0,1,0.5,0], [0.01, 0.02, 0.01], [2, -2, -2]).plot;
(
SynthDef(\pvBrickWall, { |delT = 0.03, rateImpDec = 1, loRateImpDec = 0.1, hiRateImpDec = 3, bwRate = 0.31, loRateBw = 0.001, hiRateBw = 0.1, loRangeFreqLo = 55, hiRangeFreqLo = 220, loRangeFreqHi = 12000, hiRangeFreqHi = 18000, rateRand = 20, loWhite = 0.05, hiWhite = 0.2, attLev = 1.0, decLev = 0.5, attEnvDur = 0.01, decEnvDur = 0.02, relEnvDur = 0.01, curve1 = 2, curve2 = -2, curve3 = -2, outL=0, outR= 1, bufnum=0, bufnum1=1, rateImp = 5|
	var rand, env, in, white, chain, chain1, sigL, sigR;
	rand = LFNoise0.kr(rateRand);
	env = EnvGen.kr(Env([0,attLev, decLev, 0], [attEnvDur, decEnvDur, relEnvDur], [curve1, curve2, curve3]), Impulse.kr(rateImp), rand.range(0.8, 1.0));
	white = WhiteNoise.ar(rateRand).range(loWhite, hiWhite)*env;
	in = BBandPass.ar(white, SinOsc.kr(LFNoise0.kr(0.5).range(0.1, 2)).range(SinOsc.kr(0.2).range(loRangeFreqLo, hiRangeFreqLo), SinOsc.kr(0.2).range(loRangeFreqHi, hiRangeFreqHi)), SinOsc.kr(bwRate).range(loRateBw, hiRateBw));
	in = Decay2.ar(Impulse.ar(LFNoise0.kr(rateImpDec).range(loRateImpDec, hiRateImpDec)));
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, LFNoise0.kr(2).range(3,5));
	chain1 = PV_BrickWall(chain1, LFNoise0.kr(2).range(3,5));
	sigL = IFFT(chain);
	sigR = DelayC.ar(IFFT(chain1), 0.1, delT);
	OffsetOut.ar(outL, Pan2.ar(sigL, rand.range(-1.0, 1.0)));
	OffsetOut.ar(outR, Pan2.ar(sigR, rand.range(1.0, -1.0)));
}).add;
)

a = Synth(\pvBrickWall,[\outL, 0, \outR, 1, \bufnum, b.bufnum, \bufnum1, c.bufnum]);

(
SynthDef(\pvBrickWallInst, { |rateRand = 20, attLev = 1.0, decLev = 0.5, attEnvDur = 0.01, decEnvDur = 0.02, relEnvDur = 0.01, curve1 = 2, curve2 = -2, curve3 = -2, outL=0, outR= 1, bufnum=0, bufnum1=1, loRangeFreqLo = 55, hiRangeFreqLo = 220, loRangeFreqHi = 12000, hiRangeFreqHi = 18000, rateRangeFreqLo = 0.2, rateRangeFreqHi = 0.1, bwRate = 0.31, loBw = 0.001, hiBw = 0.1, delT = 0.03, rateDec = 1, loRateDec = 0.1, hiRateDec = 5, loWhite = 0.05, hiWhite = 0.2|
	var rand, in, chain, chain1, env, sigL, sigR, white;
	rand = LFNoise0.kr(rateRand);
	env = EnvGen.kr(Env([0,attLev, decLev, 0], [attEnvDur, decEnvDur, relEnvDur], [curve1, curve2, curve3]), Impulse.kr(12), rand.range(0.8, 1.0));
	white = WhiteNoise.ar(rateRand).range(loWhite, hiWhite)*env;
	in = BBandPass.ar(white, SinOsc.kr(rand.range(0.1,2)).range(SinOsc.kr(rateRangeFreqLo).range(loRangeFreqLo, hiRangeFreqLo), SinOsc.kr(rateRangeFreqHi).range(loRangeFreqHi, hiRangeFreqHi)), SinOsc.kr(bwRate).range(loBw, hiBw));
	in = Decay2.ar(Impulse.ar(LFNoise0.kr(rateDec).range(loRateDec, hiRateDec)), 0.01, rand.range(0.3, 0.5), in);
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, SinOsc.kr(rand.range(3,5)));
	chain1 = PV_BrickWall(chain1, SinOsc.kr(rand.range(3,5)));
	sigL = IFFT(chain);
	sigR = DelayC.ar(IFFT(chain1), 0.1, delT);
	OffsetOut.ar(outL, Pan2.ar(GVerb.ar(sigL),rand.range(-1.0, 1.0)));
	OffsetOut.ar(outR, Pan2.ar(GVerb.ar(sigR), rand.range(1.0, -1.0)));
}).play(s,[\outL, 0, \outR, 1, \bufnum, b.bufnum, \bufnum1, c.bufnum,]);
)

(
~routpvBrickWall = Routine({

})
)
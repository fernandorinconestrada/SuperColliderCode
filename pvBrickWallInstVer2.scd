o = Server.local.options;
o.memSize = 180*8192;
o.memSize;
o.numOutputBusChannels = 2;

b = Buffer.alloc(s,2048,1);
c = Buffer.alloc(s,2048,1);
(
SynthDef(\pvBrickWallRout, { arg outL=0, outR= 0, bufnum=0, bufnum1=1, loRangFreqLo = 880*5, hiRangeFreqLo = 1760*5, loRangeFreqHi = 880*10, hiRangeFreqHi = 1760* 10, durXlineAtt = 10, durImpDens = 10, gate = 1, durAttGest = 16, durDecGest = 16;
	var in, chain, chain1, env, sigL, sigR, envGest;
	envGest = EnvGen.kr(Env([0,1,0], [durAttGest, durDecGest], \sine), gate, doneAction:2);
	env = EnvGen.kr(Env.perc(0.001, XLine.kr(LFNoise0.kr(0.5).range(0.002, 0.03), LFNoise0.kr(0.3).range(0.002, 0.03), durXlineAtt)), Impulse.kr(XLine.kr(LFNoise0.kr(0.5).range(0.1, 20), LFNoise0.kr(0.3).range(0.1, 20), durImpDens)));
	in = BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(0.05, 0.2))*env, SinOsc.kr(LFNoise0.kr(0.5).range(0.1, 2)).range(SinOsc.kr(0.2).range(loRangFreqLo, hiRangeFreqLo), SinOsc.kr(0.1).range(loRangeFreqHi, hiRangeFreqHi)), SinOsc.kr(0.31).range(0.001, 0.1));
	in = Decay2.ar(Impulse.ar(LFNoise0.kr(1).range(0.1, 3)), 0.01, 0.5, in);
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	chain1 = PV_BrickWall(chain1, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	sigL = IFFT(chain);
	sigR = DelayC.ar(IFFT(chain1), 0.1, 0.03);
	OffsetOut.ar(outL, Pan2.ar(GVerb.ar(sigL), LFNoise0.kr(20).range(-1.0, 1.0))*envGest);
	OffsetOut.ar(outR, Pan2.ar(GVerb.ar(sigR), LFNoise0.kr(20).range(1.0, -1.0))*envGest);
//}).play(s,[\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum,]);
}).add;
)

(
SynthDef(\pvBrickWallRoutVer2, { arg outL=0, outR= 0, bufnum=0, bufnum1=1, loRangFreqLo = 880*5, hiRangeFreqLo = 1760*5, loRangeFreqHi = 880*10, hiRangeFreqHi = 1760* 10, gate = 1, durGest = 16, divisor = 4,  hiRangeLoImp = 5,  hiRangeHiImp = 6, scale = 0.3;
	var in, chain, chain1, env, sigL, sigR, envGest, durXlineAtt, durImpDens;
	envGest = EnvGen.kr(Env([0,1,0], [durGest/2, durGest/2], \sine), gate, doneAction:2);
	durXlineAtt = durGest/divisor*scale;
	durImpDens = durGest/divisor;
	env = EnvGen.kr(Env.perc(0.001, XLine.kr(LFNoise0.kr(0.5).range(0.002, 0.03), LFNoise0.kr(0.3).range(0.002, 0.03), durXlineAtt)), Impulse.kr(XLine.kr(LFNoise0.kr(0.5).range(0.1, hiRangeLoImp).poll(1, label: \hiRangeLoImp), LFNoise0.kr(0.3).range(0.1, hiRangeHiImp).poll(1, label: \hiRangeHiImp), durImpDens.poll(1, label: \durImpDens))));
	in = BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(0.05, 0.2))*env, SinOsc.kr(LFNoise0.kr(0.5).range(0.1, 2)).range(SinOsc.kr(0.2).range(loRangFreqLo, hiRangeFreqLo), SinOsc.kr(0.1).range(loRangeFreqHi, hiRangeFreqHi)), SinOsc.kr(0.31).range(0.001, 0.1));
	in = Decay2.ar(Impulse.ar(LFNoise0.kr(1).range(0.1, 3)), 0.01, 0.5, in);
	chain = FFT(bufnum, in);
	chain1 = FFT(bufnum1, in);
	chain = PV_BrickWall(chain, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	chain1 = PV_BrickWall(chain1, SinOsc.kr(LFNoise0.kr(2).range(3,5)));
	sigL = IFFT(chain);
	sigR = DelayC.ar(IFFT(chain1), 0.1, 0.03);
	OffsetOut.ar(outL, Pan2.ar(GVerb.ar(sigL), LFNoise0.kr(20).range(-1.0, 1.0))*envGest);
	OffsetOut.ar(outR, Pan2.ar(GVerb.ar(sigR), LFNoise0.kr(20).range(1.0, -1.0))*envGest);
//}).play(s,[\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum,]);
}).add;
)
s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/rainStick/pvBrickWall_Take1.aiff");
s.record;
s.stopRecording;
d = Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880*2.5, \hiRangeFreqLo, 1760*2.5, \loRangeFreqHi, 880*5, \hiRangeFreqHi,1760* 5, \divisor, 12]);
d.free;

e = Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 55, \hiRangeFreqLo, 110, \loRangeFreqHi, 220, \hiRangeFreqHi,440, \divisor, 6, \hiRangeLoImp,10 , \hiRangeHiImp, 12])
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

Env([0,1,0], [0.5, 0.5], [-2,2]).plot;

(
~routpvBrickWall = Routine({
	3.do{
		var durGest, hiRangeLoImp, hiRangeHiImp, divisor, scale;
		durGest = (12..24);
		hiRangeLoImp = (3..8);
		hiRangeHiImp = (3..8);
		divisor = (1..8);
		scale = (5..10)*0.1;
		Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880*5, \hiRangeFreqLo, 1760*5, \loRangeFreqHi, 880*10, \hiRangeFreqHi,1760*10, \divisor, divisor.choose, \durGest, durGest.choose, \scale, scale.choose]);
		"synth 1".postln;
		3.1.yield;
		Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880*3, \hiRangeFreqLo, 1760*3, \loRangeFreqHi, 880*6, \hiRangeFreqHi,1760*6, \divisor, divisor.choose, \hiRangeLoImp,10 , \hiRangeHiImp, 12, \durGest, durGest.choose, \scale, scale.choose]);
		"synth 2".postln;
		3.7.yield;
		Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880*2, \hiRangeFreqLo, 1760*2, \loRangeFreqHi, 880*2, \hiRangeFreqHi,1760*2, \divisor, divisor.choose, \hiRangeLoImp,10 , \hiRangeHiImp, 12, \durGest, durGest.choose, \scale, scale.choose]);
		"synth 3".postln;
		5.7.yield;
	};
	5.yield;
	2.do{
		var durGest, hiRangeLoImp, hiRangeHiImp, divisor, scale;
		durGest = (12..24);
		hiRangeLoImp = (3..8);
		hiRangeHiImp = (3..8);
		divisor = (1..8);
		scale = (5..10)*0.1;
		Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 55, \hiRangeFreqLo, 110, \loRangeFreqHi, 440, \hiRangeFreqHi,880, \divisor, divisor.choose, \durGest, durGest.choose, \scale, scale.choose]);
		3.1.yield;
		Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 55, \hiRangeFreqLo, 110, \loRangeFreqHi, 220, \hiRangeFreqHi,440, \divisor, divisor.choose, \hiRangeLoImp,10 , \hiRangeHiImp, 12, \durGest, durGest.choose, \scale, scale.choose]);
		3.7.yield;
		Synth(\pvBrickWallRoutVer2, [\outL, 0, \outR, 0, \bufnum, b.bufnum, \bufnum1, c.bufnum, \loRangFreqLo, 880, \hiRangeFreqLo, 1760, \loRangeFreqHi, 880*3, \hiRangeFreqHi,1760*3, \divisor, divisor.choose, \hiRangeLoImp,10 , \hiRangeHiImp, 12, \durGest, durGest.choose, \scale, scale.choose]);
		5.7.yield;
	}
})
)

~routpvBrickWall.play;

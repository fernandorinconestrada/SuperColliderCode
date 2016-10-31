(
var winEnv, winEnvA;
b = Buffer.readChannel(s, "/Users/fernandorincon/Music/SuperCollider Recordings/Buf_additiveAM.wav", 0, -1, [0]);
c = Buffer.readChannel(s, "/Users/fernandorincon/Music/SuperCollider Recordings/Buf_additiveAM.wav", 0, -1, [1]);
winEnv = Env([0,1,0], [0.5, 0.5], [-8,8]);
e = Buffer.sendCollection(s, winEnv.discretize, 1);
winEnvA = Env([0,1,0], [0.5, 0.5], [3,-3]);
f = Buffer.sendCollection(s, winEnvA.discretize, 1);
SynthDef(\bufAddNoDel, { |dens = 0.3, ampTr = 0.9, freqDur = 20, freqRate = 20 sndbuf, pos = 0, freqPan = 20, envbufnum = -1, filter = 20000, amp = 0.9|
	var trig, dur, rate, pan, in;
	trig = Dust.kr(dens, ampTr);
	dur = LFNoise0.kr(freqDur).range(0.01, 0.13);
	rate = LFNoise1.kr(freqRate).range(0.98, 1.01);
	pan = LFNoise2.kr(freqPan).range(-1.0, 1.0);
	in = GrainBuf.ar(2, trig, dur, sndbuf, rate, pos, 2, pan, envbufnum);
	//filter = MouseX.kr(100, 20000, lag: 0.2);
	//decT = MouseY.kr(0.01, 0.1, lag: 0.2);
	OffsetOut.ar(0, LPF.ar(in, filter, amp));
}).load(s);
)

z = Synth(\bufAddNoDel, [\sndbuf, b, \envbufnum, -1, \dens, 20]);
z.set(\dens, 40);
z.set(\freqRate, 5);
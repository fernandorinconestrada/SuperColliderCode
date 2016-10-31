(
var winenv;
b = Buffer.readChannel(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/workSpaceFlute/Bounced Files/mixDownHarm.wav", 0, -1, 0);
winenv = Env([0, 1, 0], [0.032, 0.967], [2, -8]);
~z = Buffer.sendCollection(s, winenv.discretize, 1);

SynthDef(\bufGrainAllo, { |sndbuf, rateTrig = 10, ratePos = 0.0057143, pan = 0, envbufnum = -1, posPanS = -1.0, posPanD = 1.0, delT = 0.04, ampDel = 0.75, rate = 1|
	var trig, pos, in;
	trig = LFNoise0.kr(rateTrig);
	//pos = SinOsc.kr(ratePos).range(0, 1);
	pos = LFSaw.kr(ratePos, 1).range(0.0, 1.0);
	in = GrainBuf.ar(1, Impulse.kr(rateTrig), trig.range(0.03, 0.05), sndbuf, rate, pos, 2, pan, envbufnum);
	OffsetOut.ar(0, Pan2.ar(in, trig.range(0.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.1, delT, ampDel), trig.range(-1.0, 0.0)));
}).add;
)

a = Synth(\bufGrainAllo, [\sndbuf, b, \envbufnum, ~z, \rateTrig, 30, \delT, 0.03, \rate, 7]);
a.set(\envbufnum, ~z);
a.set(\rateTrig, 30);
a.set(\delT, 0.03);
a.set(\rate, 7);

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/grainHorn/bufGrainAllo_transp7_take4.aif");
s.record;
s.stopRecording;

1/175
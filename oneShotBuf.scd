s.plotTree;
(
SynthDef(\oneshot, {|bufNum = 0, out = 0, durT, pos|
        var src, env, trig;
	trig= Line.kr(1, 0, durT, doneAction:2);
	env = EnvGen.ar(Env([0, BufFrames.kr(bufNum), 0], [ BufSampleRate.kr(bufNum).reciprocal * BufFrames.kr(bufNum) * pos, 0].poll),  trig, doneAction:2);
	src = BufRd.ar(1, bufNum, env, 0, 2);
	OffsetOut.ar(out, src);
}).store;
)
(
~b = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/DrumSolo.wav");
~c = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/PeriodRythmMod.wav");
~d = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/SineContourSection2.wav");
)
(
a = Pbind(
	\instrument, \oneshot,
	//\bufNum, Pseq([~b,~c, ~d], inf),
	\bufNum, b,
	\durT, Prand([0.2, 0.3, 0.5, 0.7], inf),
	\pos, Pseq([0.2, 0.4, 0.6, 0.8], inf)
).play;
)
a.stop;
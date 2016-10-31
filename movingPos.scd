(
SynthDef(\movingPos, {|bufnum, pos = 0.5, rate = 1|
	var env, trig;
	env = EnvGen.kr(Env.asr(0.01, 1, 0.02), doneAction:2);
	trig = Impulse.kr(1);
	OffsetOut.ar(0, PlayBuf.ar(1, bufnum, rate, trig, BufFrames.kr(bufnum) * pos, doneAction:2) * env)
}).store;
)

~b = RedBuffer(s, "/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/DrumSolo.wav", 0.7, 60);

~pos = Array.series(100, 0, 0.01);

(
Pbind(\instrument, \movingPos,
	\rate, 1,
	\bufnum, b,
	//\t_trig, Pseq([0.5, 0.7, 1.1],inf),
	\pos, Pseq([0.2, 0.4, 0.6, 0.8], 1)
	//\pos, 0.9
).play;
)
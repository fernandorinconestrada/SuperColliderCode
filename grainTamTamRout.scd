(
b = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/inSonic/Samples/Processed/Consolidate/TamTamBrushClipLPF222Hz.aif", 0, -1, 1);
c = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/inSonic/Samples/Processed/Consolidate/TamTamBrushClipLPF467HzFaded.aif", 0, -1, 1);
d = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/inSonic/Samples/Processed/Consolidate/TamTamBrushClipRev60SecPass2.aif",0, -1, 1);
e = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/inSonic/Samples/Processed/Consolidate/TamTamBrushClipRev60SecPass3Faded.aif", 0, -1, 1);
f = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/inSonic/Samples/Processed/Consolidate/TamTamBrushClipRev60SecPass3Tail.aif", 0, -1, 1);
g = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/inSonic/Samples/Processed/Consolidate/TamTamBrushClipRev60SecPass3TailRevPass1.aif", 0, -1, 1);
)
(
SynthDef(\bufGrainTamTam, { |trigGrain = 10, amp = 1, sndbuf, envbufnum = -1, durEnv = 5, durGrain = 0.8, rate = 1, rq = 1.3, delT = 0.04, mix = 0.8, room = 0.8, damp = 0.3|
	var env, in;
	//env = EnvGen.kr(Env([0,0.2,0], [durEnv*0.5, durEnv*0.5], \sin), Impulse.kr(0.2));
	env = EnvGen.kr(Env([0,0.2,0], [durEnv*0.49, durEnv*0.49], \sin), 1, doneAction:2);
	in = GrainBuf.ar(1, Impulse.ar(trigGrain), durGrain, sndbuf, rate, LFNoise2.kr(10).range(0, 1), 2, 0, envbufnum, mul: amp)*env;
	in = FreeVerb.ar(BRF.ar(in, 3000, rq), mix, room, damp);
	in = LPF.ar(in, 16000);
    OffsetOut.ar(0, in);
	OffsetOut.ar(1, DelayC.ar(in, 0.2, delT, 0.75));
    }).add;
)

Env([0,0.2,0], [0.5, 0.5], [-5,5]).plot;

x = Synth(\bufGrainTamTam, [\sndbuf, g, \envbufnum, -1]);
x.set(\room, 1);
x.set(\mix, 1);
x.set(\damp, 1);
x.set(\durGrain, 0.8);
x.set(\sndbuf, f);
x.set(\rq, 1.3);
x.set(\rate, 2);
(7..10)*0.1;

(
r = Routine({
	var delta, durGrain, durEnv, amps1, amps2, rate, delT, room, mix, damp;
	durGrain = (21..31)*0.1;
	durEnv = (9..13);
	amps1 = (4..8)*0.1;
	amps2 = (3..6)*0.1;
	rate = [0.5, 1, 1.005, 1.995, 2, 3, 3.05, 9, 9.1];
	delT = (4..8)*0.01;
	mix = (7..10)*0.1;
	room = (8..10)*0.1;
	damp = (5..10)*0.1;
	loop{
		delta = rrand(3,5);
		~a = Synth(\bufGrainTamTam, [\sndbuf, g, \envbufnum, -1, \rate: rate.wchoose([ 0.16666666666667, 0.16666666666667, 0.16666666666667, 0.11111111111111, 0.11111111111111, 0.11111111111111, 0.055555555555556, 0.055555555555556, 0.055555555555556 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps1.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~b = Synth(\bufGrainTamTam, [\sndbuf, b, \envbufnum, -1, \rate: rate.wchoose([ 0.16666666666667, 0.16666666666667, 0.16666666666667, 0.11111111111111, 0.11111111111111, 0.11111111111111, 0.055555555555556, 0.055555555555556, 0.055555555555556 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~c = Synth(\bufGrainTamTam, [\sndbuf, f, \envbufnum, -1, \rate: rate.wchoose([ 0.16666666666667, 0.16666666666667, 0.16666666666667, 0.11111111111111, 0.11111111111111, 0.11111111111111, 0.055555555555556, 0.055555555555556, 0.055555555555556 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps1.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~d = Synth(\bufGrainTamTam, [\sndbuf, g, \envbufnum, -1, \rate: rate.wchoose([ 0.16666666666667, 0.16666666666667, 0.16666666666667, 0.11111111111111, 0.11111111111111, 0.11111111111111, 0.055555555555556, 0.055555555555556, 0.055555555555556 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~e = Synth(\bufGrainTamTam, [\sndbuf, b, \envbufnum, -1, \rate: rate.wchoose([ 0.16666666666667, 0.16666666666667, 0.16666666666667, 0.11111111111111, 0.11111111111111, 0.11111111111111, 0.055555555555556, 0.055555555555556, 0.055555555555556 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~f = Synth(\bufGrainTamTam, [\sndbuf, c, \envbufnum, -1, \rate: rate.wchoose([ 0.16666666666667, 0.16666666666667, 0.16666666666667, 0.11111111111111, 0.11111111111111, 0.11111111111111, 0.055555555555556, 0.055555555555556, 0.055555555555556 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
	};
})
)
r.play;
r.stop;
//[3,3,3,2,2,2,1,1,1,].normalizeSum;
//.wchoose([ 0.16666666666667, 0.16666666666667, 0.16666666666667, 0.11111111111111, 0.11111111111111, 0.11111111111111, 0.055555555555556, 0.055555555555556, 0.055555555555556 ])

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/inSonicTakes/routineTamTam_AllBuffers_Routiner_Take2_weightedBass.aiff");
s.record;
s.stopRecording;


(
q = Routine({
	var delta, durGrain, durEnv, amps1, amps2, rate, delT, room, mix, damp;
	//durGrain = (21..31)*0.1;
	durGrain = (21..31)*0.001;
	durEnv = (9..13);
	amps1 = (4..8)*0.1;
	amps2 = (3..6)*0.1;
	rate = [1, 1.005, 1.995, 2, 3, 3.05, 9, 9.1];
	delT = (4..8)*0.01;
	mix = (7..10)*0.1;
	room = (8..10)*0.1;
	damp = (5..10)*0.1;
	loop{
		delta = rrand(3,5);
		~a = Synth(\bufGrainTamTam, [\sndbuf, g, \envbufnum, -1, \rate: rate.choose, \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps1.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~b = Synth(\bufGrainTamTam, [\sndbuf, f, \envbufnum, -1, \rate: rate.choose, \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~c = Synth(\bufGrainTamTam, [\sndbuf, e, \envbufnum, -1, \rate: rate.choose, \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps1.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~d = Synth(\bufGrainTamTam, [\sndbuf, d, \envbufnum, -1, \rate: rate.choose, \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~e = Synth(\bufGrainTamTam, [\sndbuf, c, \envbufnum, -1, \rate: rate.choose, \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~f = Synth(\bufGrainTamTam, [\sndbuf, b, \envbufnum, -1, \rate: rate.choose, \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
		~f = Synth(\bufGrainTamTam, [\sndbuf, a, \envbufnum, -1, \rate: rate.choose, \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose]);
		delta.yield;
	};
})
)
q.play;
q.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/inSonicTakes/routineTamTam_AllBuffers_unweightedTake2Grain_02.aiff");
s.record;
s.stopRecording;
(21..31)*0.001
(
t = Routine({
	var delta, durGrain, durEnv, amps1, amps2, rate, delT, room, mix, damp, trigGrain;
	durGrain = (21..31)*0.1;
	trigGrain = (6..12);
	//trigGrain = (3..10);
	//durGrain = (21..31)*0.001;
	durEnv = (9..13);
	amps1 = (4..8)*0.1;
	amps2 = (3..6)*0.1;
	rate = [1, 1.005, 1.995, 2, 3, 3.05, 9, 9.1];
	delT = (4..8)*0.01;
	mix = (7..10)*0.1;
	room = (8..10)*0.1;
	damp = (5..10)*0.1;
	loop{
		//delta = rrand(3,6);
		delta = rrand(4,7);
		~a = Synth(\bufGrainTamTam, [\sndbuf, g, \envbufnum, -1, \rate: rate.wchoose([ 0.04, 0.08, 0.12, 0.16, 0.2, 0.16, 0.12, 0.08, 0.04 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps1.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose, \trigGrain: trigGrain.choose]);
		delta.yield;
		~b = Synth(\bufGrainTamTam, [\sndbuf, f, \envbufnum, -1, \rate: rate.wchoose([ 0.04, 0.08, 0.12, 0.16, 0.2, 0.16, 0.12, 0.08, 0.04 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose, \trigGrain: trigGrain.choose]);
		delta.yield;
		~c = Synth(\bufGrainTamTam, [\sndbuf, e, \envbufnum, -1, \rate: rate.wchoose([ 0.04, 0.08, 0.12, 0.16, 0.2, 0.16, 0.12, 0.08, 0.04 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps1.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose, \trigGrain: trigGrain.choose]);
		delta.yield;
		~d = Synth(\bufGrainTamTam, [\sndbuf, d, \envbufnum, -1, \rate: rate.wchoose([ 0.04, 0.08, 0.12, 0.16, 0.2, 0.16, 0.12, 0.08, 0.04 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose, \trigGrain: trigGrain.choose]);
		delta.yield;
		~e = Synth(\bufGrainTamTam, [\sndbuf, c, \envbufnum, -1, \rate: rate.wchoose([ 0.04, 0.08, 0.12, 0.16, 0.2, 0.16, 0.12, 0.08, 0.04 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose, \trigGrain: trigGrain.choose]);
		delta.yield;
		~f = Synth(\bufGrainTamTam, [\sndbuf, b, \envbufnum, -1, \rate: rate.wchoose([ 0.04, 0.08, 0.12, 0.16, 0.2, 0.16, 0.12, 0.08, 0.04 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose, \trigGrain: trigGrain.choose]);
		delta.yield;
		~f = Synth(\bufGrainTamTam, [\sndbuf, a, \envbufnum, -1, \rate: rate.wchoose([ 0.04, 0.08, 0.12, 0.16, 0.2, 0.16, 0.12, 0.08, 0.04 ]), \durGrain: durGrain.choose, \durEnv: durEnv.choose, \amp: amps2.choose, \delT: delT.choose, \mix: mix.choose, \room: room.choose, \damp: damp.choose, \trigGrain: trigGrain.choose]);
		delta.yield;
	};
})
)
t.play;
t.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/inSonicTakes/routineTamTam_AllBuffers_Routinet_Take3Grain_0_02TrigVar.aiff");
s.record;
s.stopRecording;

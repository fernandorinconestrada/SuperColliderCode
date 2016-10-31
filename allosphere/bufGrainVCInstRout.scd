(
(
var winenv1, winenv2, winenv3;
~buf1 = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/monoEctracts/violoncelloSynthDefInstOnly_Take1-01.wav");
~buf2 = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/monoEctracts/violoncelloSynthDefInstOnly_Take1-02.wav");
~buf3 = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/monoEctracts/violoncelloSynthDefInstOnly_Take1-03.wav");
winenv1 = Env([0,1,0], [0.05, 0.94], [5, -5]);
winenv2 = Env([0,1,0], [0.89, 0.1], [6, -5]);
winenv3 = Env([0,1,0], [0.49, 0.49], [-6, 6]);
~x = Buffer.sendCollection(s, winenv1.discretize, 1);
~y = Buffer.sendCollection(s, winenv2.discretize, 1);
~z = Buffer.sendCollection(s, winenv3.discretize, 1);
);
(
SynthDef(\bufGrainVCInst, {|densAccum = 0.1, changeGr = 0.4, grpos = 8, sndbuf, mix = 0.4, room = 0.6, damp = 0.5, bus1 = 0, bus2 = 1, ampDel = 0.75, delT = 0.06, envbufnum = -1, grPos = 8, durLine = 3, rate = 1, loDurGr = 0.02, hiDurGr = 0.04|
var in, trig, dur, posGr, rev, delay, env;
env = EnvGen.kr(Env([0,1,0.6,0], [durLine*0.14, durLine*0.45, durLine*0.4], [5, 0, -5]), 1, doneAction: 2);
trig = Dust.kr(SinOsc.kr(densAccum).range(0.2, 8));//density of grains
dur = SinOsc.kr(Dust.kr(changeGr).range(1,2)).range(loDurGr, hiDurGr);//grain size
posGr = LFNoise0.kr(grPos).range(0,1);//position in buffer
in = GrainBuf.ar(1, trig, dur, sndbuf, rate, posGr, 2, 0, envbufnum)*env;
rev = FreeVerb.ar(in, mix, room, damp)*env;//variables for reverb
delay = DelayC.ar(rev, 0.1, delT, ampDel);//location of delay
OffsetOut.ar(bus1, LeakDC.ar(rev));
OffsetOut.ar(bus2, LeakDC.ar(delay));
}).add;
);
)

a = Synth(\bufGrainVCInst, [\envbufnum, ~y, \sndbuf, ~buf3, \durLine, 30]);

(
~routGrainVCBuf = Routine({
	var durLine, delta, densAccum, grPos, changeGr, mix, room, damp, ampDel, delT, rate, bus1, bus2, deltaDel;
	//densAccum = rrand(0.1, 0.2);
	densAccum = (10..20)*0.01;
	grPos = (6..12);
	changeGr = (40..50)*0.01;
	//bus1 = (0..26);
	bus1 = (0..7);
	bus2 = (0..7);
	//bus2 = (0..26);

3.do{
	delta = rrand(2,5);
	durLine = rrand(3, 7);
	mix = rrand(0.3, 0.6);
	room = rrand(0.2, 0.8);
	damp = rrand(0.4, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.04, 0.06);
	rate = rrand(0.95, 1.05);
	deltaDel = rrand(0.025, 0.055);

	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
		delta.yield;

		Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
		delta.yield;

	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
		delta.yield;

		Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
		delta.yield;
	};

	5.do{
	delta = rrand(1,3);
	durLine = rrand(3, 7);
	mix = rrand(0.3, 0.6);
	room = rrand(0.2, 0.8);
	damp = rrand(0.4, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.04, 0.06);
	rate = rrand(0.95, 1.05);
	deltaDel = rrand(0.025, 0.055);

	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
		delta.yield;

		Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	delta.yield;

	Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	delta.yield;

		Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	delta.yield;

		Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	deltaDel.yield;
	Synth(\bufGrainVCInst, [\envbufnum, ~z, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos.choose, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose]);
	delta.yield;
	};

})
)

~routGrainVCBuf.play;



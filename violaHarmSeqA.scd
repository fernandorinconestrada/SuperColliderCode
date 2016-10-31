(
(
SynthDef(\violaLoStr, { |dur, levLo, freqLo, fbLo, ampLo, delTLo = 0.07, decTLo = 0.7, mixLo = 0.17, roomLo = 0.17, dampLo = 0.5, busL = 0|
	var envLo, loStr, delLo;
	envLo = EnvGen.ar(Env([0, levLo, 0], [dur/2, dur/2], [-20, 20]), 1, doneAction: 2);
	loStr = LPF.ar(SinOscFB.ar(freqLo, fbLo, envLo), 19000);
	delLo = HPF.ar(AllpassC.ar(loStr, 0.2, delTLo, decTLo), 40);
	OffsetOut.ar(busL, FreeVerb.ar(delLo, mixLo, roomLo, dampLo));
}).add;
);
(
SynthDef(\violaHiStr, { |dur, levHi, freqHi, fbHi, ampHi, delTHi = 0.07, decTHi = 0.5, busR = 1, mixHi = 0.13, roomHi = 0.11, dampHi = 0.3|
	var envHi, hiStr, delHi;
	envHi = EnvGen.ar(Env([0, levHi, 0], [dur/2, dur/2], [-20, 20]), 1, doneAction: 2);
	hiStr = LPF.ar(SinOscFB.ar(freqHi, fbHi, envHi), 19000);
	delHi = HPF.ar(AllpassC.ar(hiStr, 0.2, delTHi, decTHi), 40);
	OffsetOut.ar(busR, FreeVerb.ar(delHi, mixHi, roomHi, dampHi));
}).add;
);
(
~iv = 130.81;
~iv5 = 130.81*5;
~iv7 = 130.81*7;

~iii = 196;
~iii5 = 196*5;
~iii7 = 196*7;

~ii = 293.7;
~ii5 = 293.7*5;
~ii7 = 293.7*7;

~i = 440;
~i5 = 440*5;
~i7 = 440*7;
);
)


(
~strLo1 = Pbind(
	\instrument, \violaLoStr,
	\dur,    Pseq([Pseq([2, Rest(1), 2, 2],     1), Pseq([6, Rest(2), 3],  1), Pseq([2, Rest(1), 1, 3],     1), Pseq([3, Rest(3), 4, Rest(1), 2],   1), Pseq([3, Rest(2), 3, 3], 1)],       1),
	\freqLo, Pseq([Pseq([~ii5, \rest, ~ii7, ~i],1), Pseq([~ii5,\rest, ~ii],1), Pseq([~ii5,\rest, ~ii7, ~i], 1), Pseq([~iv5,\rest, ~ii, \rest, ~iv7],1), Pseq([~iii,\rest, ~iii5, ~iii7],1)], 1),
	\fbLo,   Pseq([Pseq([0.3, \rest, 0.2, 0.4], 1), Pseq([0.3, \rest, 0.4],1), Pseq([0.3, \rest, 0.2, 0.4], 1), Pseq([0.3,\rest, 0.4, \rest, 0.3],  1), Pseq([0.4,\rest, 0.3, 0.2],  1)],   1),
	\levLo,  Pseq([Pseq([0.13, 0.1, 0.1, 0.08], 1), Pseq([0.13, 0.1, 0.1], 1), Pseq([0.13, 0.1, 0.13, 0.07],1), Pseq([0.13, 0.1, 0.07, 0.07, 0.13], 1), Pseq([0.08, 0.1, 0.07, 0.07], 1)],  1),
).play;
~strHi1 = Pbind(
	\instrument, \violaHiStr,
	\dur,    Pseq([Pseq([Rest(1), 4, 2],   1), Pseq([2,     Rest(1), 8], 1), Pseq([Rest(1), 3, 3],   1), Pseq([10, 3],       1),  Pseq([Rest(1), 10],1)],1),
	\freqHi, Pseq([Pseq([\rest, ~i7, ~ii7],1), Pseq([~iii7,  \rest, ~i5],1), Pseq([\rest, ~i7, ~ii7],1), Pseq([~iii5],       2),  Pseq([\rest, ~ii5],1)],1),
	\fbHi,   Pseq([Pseq([0.2], 3),             Pseq([0.2, 0.2, 0.4],     1), Pseq([0.2, 0.2, 0.3],   1), Pseq([0.2, 0.2, 0.3],1), Pseq([0.2],2)],        1),
	\levHi,  Pseq([Pseq([0.13], 3),            Pseq([0.13, 0.08, 0.08],  1), Pseq([0.13, 0.13, 0.13],1), Pseq([0.13],3),          Pseq([0.1],2)],        1)
).play;
)





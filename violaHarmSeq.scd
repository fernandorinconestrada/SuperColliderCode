(
s.boot;
p = ProxySpace.push(s);
)

(
(
SynthDef(\violaLoStr, { |dur, levLo, freqLo, fbLo, ampLo, delTLo = 0.07, decTLo = 0.7, mixLo = 0.17, roomLo = 0.17, dampLo = 0.5, busL = 0|
	var envLo, loStr, delLo;
	envLo = EnvGen.ar(Env([0, levLo, 0], [dur/2, dur/2], [-4, 4]), 1, doneAction: 2);
	loStr = LPF.ar(SinOscFB.ar(freqLo, fbLo, envLo), 19000);
	delLo = HPF.ar(AllpassC.ar(loStr, 0.2, delTLo, decTLo), 40);
	OffsetOut.ar(busL, FreeVerb.ar(delLo, mixLo, roomLo, dampLo));
}).add;
);
(
SynthDef(\violaHiStr, { |dur, levHi, freqHi, fbHi, ampHi, delTHi = 0.07, decTHi = 0.5, busR = 1, mixHi = 0.13, roomHi = 0.11, dampHi = 0.3|
	var envHi, hiStr, delHi;
	envHi = EnvGen.ar(Env([0, levHi, 0], [dur/2, dur/2], \sin), 1, doneAction: 2);
	hiStr = LPF.ar(SinOscFB.ar(freqHi, fbHi, envHi), 19000);
	delHi = HPF.ar(AllpassC.ar(hiStr, 0.2, delTHi, decTHi), 40);
	OffsetOut.ar(busR, FreeVerb.ar(delHi, mixHi, roomHi, dampHi));
}).add;
)
)

a = Synth(\violaHiStr, [\durHi, 10, \freqHi, 130.81, \harmHi, 1, \fbHi, 0.2, \levHi, 0.2]);

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

)

(
(
~strLo1 = Pbind(
	\instrument, \violaLoStr,
	\dur, Pseq([10], 4),
	\freqLo, Pseq([~iii7, ~iii7, ~iii5, ~ii95],1),
	\fbLo, 0.2,
	\levLo, 0.08
).play;
~strHi1 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([10], 4),
	\freqHi, Pseq([~iv5, ~iv7, ~iv5, ~iv7], 1),
	\fbHi, 0.2,
	\levHi, 0.08
).play;
)

(
~strLo1 = Pbind(
	\instrument, \violaLoStr,
	\dur, Pseq([10],2),
	\freqLo, Pseq([~iv],2),
	\fbLo, 0.2,
	\levLo, 0.08
).play;
~strHi1 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([10],2),
	\freqHi, Pseq([~iii7, ~iii7], 1),
	\fbHi, 0.2,
	\levHi, 0.08
).play;
)

~strHi1 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iii5, 0, ~iii7 ], 2),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.02], 2)
)
)

//open String 3, harms 5 String 4, String 2

(
~strLo2 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~iii],1),
	\fbLo, 0.5,
	\levLo, 0.2
);
~strHi2 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iv5, 0, ~ii5], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.02], 2)
)
)

~out = ~strLo1; ~strHi1;
~out.play;

//open String 3, harms 5 String 4, harm 7 String 2

(
~strLo3 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~iii],1),
	\fbLo, 0.5,
	\levLo, 0.2
).play;
~strHi3 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iv5, 0, ~ii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.02], 2)
).play;
)

//open String 3, harms 7 String 4, harm 5 String 2

(
~strLo4 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~iii],1),
	\fbLo, 0.5,
	\levLo, 0.2
).play;
~strHi4 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iv7, 0, ~ii5], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.02], 2)
).play;
)

//open String 3, harms 7 String 4,String 2

(
~strLo5 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~iii],1),
	\fbLo, 0.5,
	\levLo, 0.13
).play;
~strHi5 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iv7, 0, ~ii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.03], 2)
).play;
)

//open String 3, harms 5,7 String 4, harms 5,7 String 2

(
~strLo6 = Pbind(
	\instrument, \violaLoStr,
	\dur, 20,
	\freqLo, Pseq([~iii],1),
	\harmLo, 1,
	\fbLo, 0.5,
	\levLo, 0.13
).play;
~strHi6 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 4),
	\freqHi, Pseq([0, ~iv5, 0, ~iv7, 0, ~ii5, 0, ~ii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.03], 4)
).play;
)

//harm 5 String 4, harms 5,7 String 3,

(
~strLo7 = Pbind(
	\instrument, \violaLoStr,
	\dur, 15,
	\freqLo, Pseq([~iv5],1),
	\fbLo, 0.3,
	\levLo, 0.08
).play;
~strHi7 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 3),
	\freqHi, Pseq([0, ~iii, 0, ~iii5, 0, ~iii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13, 0, 0.08, 0, 0.08], 1)
).play;
)

//harm 7 String 4, open Sting 3, harms 5,7 String 3,

(
~strLo8 = Pbind(
	\instrument, \violaLoStr,
	\dur, 15,
	\freqLo, Pseq([~iv7],1),
	\fbLo, 0.3,
	\levLo, 0.08
).play;
~strHi8 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 3),
	\freqHi, Pseq([0, ~iii, 0, ~iii5, 0, ~iii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.11, 0, 0.07, 0, 0.07], 1)
).play;
)

//open String 2, harms 5,7 String 3,

(
~strLo9 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~ii],1),
	\fbLo, 0.3,
	\levLo, 0.08
).play;
~strHi9 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iii5, 0, ~iii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.11, 0.07, 0.07], 1)
).play;
)

//open String 2, harms 5, String 3, String 1

(
~strLo10 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~ii],1),
	\fbLo, 0.3,
	\levLo, 0.13
).play;
~strHi10 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iii5, 0, ~i5], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.07, 0, 0.07], 1)
).play;
)

//open String 2, harm 7, String 3, harm 5 String 1

(
~strLo11 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~ii],1),
	\fbLo, 0.3,
	\levLo, 0.13
).play;
~strHi11 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iii7, 0, ~i5], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.07, 0, 0.07], 1)
).play;
)

//open String 2, harms 7, String 3, String 1

(
~strLo12 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([293.7],1),
	\fbLo, 0.3,
	\levLo, 0.13
).play;
~strHi12 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iii7, 0, ~i7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.07, 0, 0.07], 1)
).play;
)

//open String 1, harms 5, 7, String 2

(
~strLo13 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~i],1),
	\fbLo, 0.3,
	\levLo, 0.13
).play;
~strHi13 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~ii5, 0, ~ii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.07, 0, 0.07], 1)
).play;
)

//open String 1, open String 2, harms 5, 7, String 2

(
~strLo14 = Pbind(
	\instrument, \violaLoStr,
	\dur, 15,
	\freqLo, Pseq([~i],1),
	\fbLo, 0.3,
	\levLo, 0.13
).play;
~strHi14 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 3),
	\freqHi, Pseq([0, ~ii, 0, ~ii5, 0, ~ii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.1, 0, 0.07, 0, 0.07], 1)
).play;
)

//harm 5 String 3, open String 4, open String 2

(
~strLo15 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~iii5],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi15 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iv, 0, ~ii], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13], 2)
).play;
)

//harm 7 String 3, open String 4, open String 2

(
~strLo16 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~iii7],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi16 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iv, 0, ~ii], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13], 2)
).play;
)

//harm 5 String 2, open String 3, open String 1

(
~strLo17 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~ii5],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi17 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iii, 0, ~i], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13], 2)
).play;
)

//harm 7 String 2, open String 3, open String 1

(
~strLo18 = Pbind(
	\instrument, \violaLoStr,
	\dur, 10,
	\freqLo, Pseq([~ii7],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi18 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 2),
	\freqHi, Pseq([0, ~iii, 0, ~i], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13], 2)
).play;
)

//harm 5 String 3, open String 4, harm 5,7 sting 4 open String 2, harm 5,7

(
~strLo19 = Pbind(
	\instrument, \violaLoStr,
	\dur, 30,
	\freqLo, Pseq([~iii5],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi19 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 6),
	\freqHi, Pseq([0, ~iv, 0, ~iv5, 0, ~iv7, 0, ~ii, 0, ~ii5, 0, ~ii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13, 0, 0.07, 0, 0.06], 2)
).play;
)

//harm 7 String 3, open String 4, harm 5,7 sting 4 open String 2, harm 5,7

(
~strLo20 = Pbind(
	\instrument, \violaLoStr,
	\dur, 30,
	\freqLo, Pseq([~iii7],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi20 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 6),
	\freqHi, Pseq([0, ~iv, 0, ~iv5, 0, ~iv7, 0, ~ii, 0, ~ii5, 0, ~ii7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13, 0, 0.07, 0, 0.06], 2)
).play;
)

//harm 5 String 2, open String 3, harms 5,7 string 3 open String 1, harms 5,7 string 1

(
~strLo21 = Pbind(
	\instrument, \violaLoStr,
	\dur, 30,
	\freqLo, Pseq([~ii5],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi21 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 6),
	\freqHi, Pseq([0, ~iii, 0, ~iii5, 0, ~iii7, 0, ~i, 0, ~i5, 0, ~i7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13, 0, 0.07, 0, 0.06], 2)
).play;
)

//harm 7 String 2, open String 3, harms 5,7 string 3 open String 1, harms 5,7 string 1

(
~strLo22 = Pbind(
	\instrument, \violaLoStr,
	\dur, 30,
	\freqLo, Pseq([~ii7],1),
	\fbLo, 0.3,
	\levLo, 0.07
).play;
~strHi22 = Pbind(
	\instrument, \violaHiStr,
	\dur, Pseq([2, 3], 6),
	\freqHi, Pseq([0, ~iii, 0, ~iii5, 0, ~iii7, 0, ~i, 0, ~i5, 0, ~i7], 1),
	\fbHi, 0.2,
	\levHi, Pseq([0, 0.13, 0, 0.07, 0, 0.06], 2)
).play;
)
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 5, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 7, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 5 String 3
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 7 String 3
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 5 String 2
(
a = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 440, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 7 String 2
(
a = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 440, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics String 1
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 440, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 440, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;

o = Server.local.options;
o.numOutputBusChannels = 8;

s = Server.local;

s.recChannels = 2;
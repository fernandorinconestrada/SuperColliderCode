(
SynthDef(\testLLCHbouncePbind, { |rateTrig = 1, dur = 1, bus = 0, attTDec = 0.01, decTDec = 0.5, rateFreq = 2, mulFreq = 1.05, freq = 200, rateFB = 4, hiFB = 0.6, loFB = 0.4, rateAmp = 4, hiAmp = 0.1, loAmp = 0.2, pos = 0.0, levPos = 0.8, maxDel = 0.2, delT = 0.06, decT = 0.5, posDel = 0.0, levDel = 0.75|
	var trig, env, out, delay;
	trig = Impulse.ar(rateTrig);
	env = EnvGen.kr(Env.linen(dur*0.01, dur*0.98, dur*0.01, 1, -4), trig, doneAction:2);
	out = OffsetOut.ar(bus, Pan2.ar(Decay2.ar(trig, attTDec, decTDec, SinOscFB.ar(LFNoise2.kr(rateFreq, mulFreq, freq), LFNoise2.kr(rateFB, hiFB, loFB), LFNoise2.kr(rateAmp, hiAmp, loAmp))), pos, levPos) * env);
	delay = OffsetOut(bus, Pan2.ar(AllpassC.ar(out, maxDel, delT, decT), posDel, levDel));
}).add;
)

(
~one =    2/7*0-1.0;
~two =    2/7*1-1.0;
~three =  2/7*2-1.0;
~four =   2/7*3-1.0;
~five =   2/7*4-1.0;
~six =    2/7*5-1.0;
~seven =  2/7*6-1.0;
~eight =  2/7*7-1.0;
)

// dur = 1/rateTrig
1/5
1/0.185
~pos = 2/7*(0..7)-1.0;

(
Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 8*6), Pseq([5.1282051282051], 8*4), Pseq([5.2631578947368],8*2)], 1),
	\dur, Pseq([Pseq([0.2], 8*6), Pseq([0.195], 8*4), Pseq([0.19],8*2)], 1),
	\pos, Pseq([ -1, -0.71428571428571, -0.42857142857143, -0.14285714285714, 0.14285714285714, 0.42857142857143, 0.71428571428571, 1 ], inf),
	\pos, Pseq([1, 0.71428571428571, 0.42857142857143, 0.14285714285714, -0.14285714285714, -0.42857142857143, -0.71428571428571, -1], inf),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)

//full circle
(
Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 8*6), Pseq([5.1282051282051], 8*4), Pseq([5.2631578947368],8*2)], 1),
	\dur, Pseq([Pseq([0.2], 8*6), Pseq([0.195], 8*4), Pseq([0.19],8*2)], 1),
	\pos, Pseq([~one, ~two, ~three, ~four, ~five, ~six, ~seven, ~eight], inf),
	\pos, Pseq([~one, ~two, ~three, ~four, ~five, ~six, ~seven, ~eight].reverse, inf),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)

(
~abcdPenta = Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2), Pseq([5.4054054054054],5)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2), Pseq([0.185],5)], 1),
	\pos, Pseq([Pseq([~one, ~two, ~three, ~four, ~five], 5*6), Pseq([~one, ~two, ~three, ~four, ~six], 5*4), Pseq([~one, ~two, ~three, ~four, ~seven], 5*2), Pseq([~one, ~two, ~three, ~four, ~eight], 5)]),
	\posDel,Pseq([Pseq([~eight, ~seven, ~six, ~five, ~four], 5*6), Pseq([~eight, ~seven, ~six, ~five, ~three], 5*4), Pseq([~eight, ~seven, ~six, ~five, ~two], 5*2), Pseq([~eight, ~seven, ~six, ~five, ~one], 5)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)

(
~efgPenta = Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\pos, Pseq([Pseq([~one, ~two, ~three, ~five, ~six], 5*6), Pseq([~one, ~two, ~three, ~five, ~seven], 5*4), Pseq([~one, ~two, ~three, ~five, ~eight], 5*2)]),
	\pos,Pseq([Pseq([~eight, ~seven, ~six, ~four, ~three], 5*6), Pseq([~eight, ~seven, ~six, ~four, ~two], 5*4), Pseq([~eight, ~seven, ~six, ~four, ~one], 5*2)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)
(
~hiPenta = Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\pos, Pseq([Pseq([~one, ~two, ~three, ~six, ~seven], 5*6), Pseq([~one, ~two, ~three, ~six, ~eight], 5*4)]),
	\pos,Pseq([Pseq([~eight, ~seven, ~six, ~three, ~two], 5*6), Pseq([~eight, ~seven, ~six, ~three, ~one], 5*4)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)

(
~jPenta = Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5.1282051282051], 5*4),
	\dur, Pseq([0.195], 5*4),
	\pos, Pseq([~one, ~two, ~three, ~seven, ~eight], 5*4),
	\pos, Pseq([~eight, ~seven, ~six, ~two, ~one], 5*4),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)
(
(
~sequence = (
	abcdPenta: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2), Pseq([5.4054054054054],5)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2), Pseq([0.185],5)], 1),
	\pos, Pseq([Pseq([~one, ~two, ~three, ~four, ~five], 5*6), Pseq([~one, ~two, ~three, ~four, ~six], 5*4), Pseq([~one, ~two, ~three, ~four, ~seven], 5*2), Pseq([~one, ~two, ~three, ~four, ~eight], 5)]),
	\pos,Pseq([Pseq([~eight, ~seven, ~six, ~five, ~four], 5*6), Pseq([~eight, ~seven, ~six, ~five, ~three], 5*4), Pseq([~eight, ~seven, ~six, ~five, ~two], 5*2), Pseq([~eight, ~seven, ~six, ~five, ~one], 5)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
),
	efgPenta: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\pos, Pseq([Pseq([~one, ~two, ~three, ~five, ~six], 5*6), Pseq([~one, ~two, ~three, ~five, ~seven], 5*4), Pseq([~one, ~two, ~three, ~five, ~eight], 5*2)]),
	\pos,Pseq([Pseq([~eight, ~seven, ~six, ~four, ~three], 5*6), Pseq([~eight, ~seven, ~six, ~four, ~two], 5*4), Pseq([~eight, ~seven, ~six, ~four, ~one], 5*2)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, 300
),
	hiPenta: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\pos, Pseq([Pseq([~one, ~two, ~three, ~six, ~seven], 5*6), Pseq([~one, ~two, ~three, ~six, ~eight], 5*4)]),
	\pos,Pseq([Pseq([~eight, ~seven, ~six, ~three, ~two], 5*6), Pseq([~eight, ~seven, ~six, ~three, ~one], 5*4)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, 400
),
	jPenta: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5.1282051282051], 5*4),
	\dur, Pseq([0.195], 5*4),
	\pos, Pseq([~one, ~two, ~three, ~seven, ~eight], 5*4),
	\pos, Pseq([~eight, ~seven, ~six, ~two, ~one], 5*4),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, 500
)
);
TempoClock.default.tempo = 1;
p = Psym(Pxrand(#[abcdPenta, efgPenta, hiPenta, jPenta], inf), ~sequence).play;
);
p.next(());

p.stop;
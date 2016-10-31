(
SynthDef(\LLCHbouncePbindEight, { |rateTrig = 1, dur = 1, busOut = 0, busDel = 1, attTDec = 0.01, decTDec = 0.5, rateFreq = 2, mulFreq = 1.05, freq = 200, rateFB = 4, hiFB = 0.6, loFB = 0.4, rateAmp = 4, hiAmp = 0.1, loAmp = 0.2, pos = 0.0, maxDel = 0.2, delT = 0.06, decT = 0.5, levDel = 0.75|
	var trig, env, out, delay;
	trig = Impulse.ar(rateTrig);
	env = EnvGen.kr(Env.linen(dur*0.01, dur*0.98, dur*0.01, 1, -4), trig, doneAction:2);
	out = OffsetOut.ar(busOut, LeakDC.ar(Decay2.ar(trig, attTDec, decTDec, SinOscFB.ar(LFNoise2.kr(rateFreq, mulFreq, freq), LFNoise2.kr(rateFB, hiFB, loFB), LFNoise2.kr(rateAmp, hiAmp, loAmp))) * env));
	delay = OffsetOut(busDel, AllpassC.ar(out, maxDel, delT, decT, levDel));
}).add;
)

(
~one =    0;
~two =    1;
~three =  2;
~four =   3;
~five =   4;
~six =    5;
~seven =  6;
~eight =  7;
)

// dur = 1/rateTrig
1/5
1/0.185
~pos = 2/7*(0..7)-1.0;



//full circle
(
Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([Pseq([5], 8*6), Pseq([5.1282051282051], 8*4), Pseq([5.2631578947368],8*2)], 1),
	\dur, Pseq([Pseq([0.2], 8*6), Pseq([0.195], 8*4), Pseq([0.19],8*2)], 1),
	\busOut, Pseq([~one, ~two, ~three, ~four, ~five, ~six, ~seven, ~eight], inf),
	\busDel, Pseq([~one, ~two, ~three, ~four, ~five, ~six, ~seven, ~eight].reverse, inf),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)

(
~abcdPenta = Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2), Pseq([5.4054054054054],5)], 2),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2), Pseq([0.185],5)], 2),
	\busDel, Pseq([Pseq([~one, ~two, ~three, ~four, ~five], 6), Pseq([~one, ~two, ~three, ~four, ~six], 4), Pseq([~one, ~two, ~three, ~four, ~seven], 2), Pseq([~one, ~two, ~three, ~four, ~eight], 1)], 2),
	\busOut,Pseq([Pseq([~eight, ~seven, ~six, ~five, ~four], 6), Pseq([~eight, ~seven, ~six, ~five, ~three], 4), Pseq([~eight, ~seven, ~six, ~five, ~two], 2), Pseq([~eight, ~seven, ~six, ~five, ~one], 1)], 2),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, Pseq([800, 400, 400, 400, 200], inf),
	\decTDec, Pseq([0.1, 0.8, 0.8, 0.8, 0.13], inf)
).play;
)

(
~efgPenta = Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\busOut, Pseq([Pseq([~one, ~two, ~three, ~five, ~six], 5*6), Pseq([~one, ~two, ~three, ~five, ~seven], 5*4), Pseq([~one, ~two, ~three, ~five, ~eight], 5*2)]),
	\busDel,Pseq([Pseq([~eight, ~seven, ~six, ~four, ~three], 5*6), Pseq([~eight, ~seven, ~six, ~four, ~two], 5*4), Pseq([~eight, ~seven, ~six, ~four, ~one], 5*2)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)
(
~hiPenta = Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\busOut, Pseq([Pseq([~one, ~two, ~three, ~six, ~seven], 5*6), Pseq([~one, ~two, ~three, ~six, ~eight], 5*4)]),
	\busDel,Pseq([Pseq([~eight, ~seven, ~six, ~three, ~two], 5*6), Pseq([~eight, ~seven, ~six, ~three, ~one], 5*4)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)

(
~jPenta = Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([5.1282051282051], 5*4),
	\dur, Pseq([0.195], 5*4),
	\busOut, Pseq([~one, ~two, ~three, ~seven, ~eight], 5*4),
	\busDel, Pseq([~eight, ~seven, ~six, ~two, ~one], 5*4),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf)
).play;
)

(
~sequence = (
	abcdPenta: Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2), Pseq([5.4054054054054],5)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2), Pseq([0.185],5)], 1),
	\busDel, Pseq([Pseq([~one, ~two, ~three, ~four, ~five], 6), Pseq([~one, ~two, ~three, ~four, ~six], 4), Pseq([~one, ~two, ~three, ~four, ~seven], 2), Pseq([~one, ~two, ~three, ~four, ~eight], 1)]),
	\busOut,Pseq([Pseq([~eight, ~seven, ~six, ~five, ~four], 6), Pseq([~eight, ~seven, ~six, ~five, ~three], 4), Pseq([~eight, ~seven, ~six, ~five, ~two], 2), Pseq([~eight, ~seven, ~six, ~five, ~one], 1)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, Pseq([800, 400, 400, 400, 200], inf),
	\decTDec, Pseq([0.1, 0.8, 0.8, 0.8, 0.13], inf)
),
	efgPenta: Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4), Pseq([5.2631578947368],5*2)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\busDel, Pseq([Pseq([~one, ~two, ~three, ~five, ~six], 6), Pseq([~one, ~two, ~three, ~five, ~seven], 4), Pseq([~one, ~two, ~three, ~five, ~eight], 2)]),
	\busOut,Pseq([Pseq([~eight, ~seven, ~six, ~four, ~three], 6), Pseq([~eight, ~seven, ~six, ~four, ~two], 4), Pseq([~eight, ~seven, ~six, ~four, ~one], 2)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, Pseq([700, 400, 400, 400, 200], inf),
	\decTDec, Pseq([0.1, 0.8, 0.8, 0.8, 0.13], inf)
),
	hiPenta: Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([Pseq([5], 5*6), Pseq([5.1282051282051], 5*4)], 1),
	\dur, Pseq([Pseq([0.2], 5*6), Pseq([0.195], 5*4), Pseq([0.19],5*2)], 1),
	\busDel, Pseq([Pseq([~one, ~two, ~three, ~six, ~seven], 6), Pseq([~one, ~two, ~three, ~six, ~eight], 4)]),
	\busOut,Pseq([Pseq([~eight, ~seven, ~six, ~three, ~two], 6), Pseq([~eight, ~seven, ~six, ~three, ~one], 4)]),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, Pseq([600, 400, 400, 400, 200], inf),
	\decTDec, Pseq([0.1, 0.8, 0.8, 0.8, 0.13], inf)
),
	jPenta: Pbind(
	\instrument, \LLCHbouncePbindEight,
	\rateTrig, Pseq([5.1282051282051], 5*4),
	\dur, Pseq([0.195], 5*4),
	\busDel, Pseq([~one, ~two, ~three, ~seven, ~eight], 4),
	\busOut, Pseq([~eight, ~seven, ~six, ~two, ~one], 4),
	\levDel, Pseq([1, 0.9, 0.8, 0.7, 0.7, 0.8, 0.9, 1], inf),
	\freq, Pseq([500, 400, 400, 400, 200], inf),
	\decTDec, Pseq([0.1, 0.8, 0.8, 0.8, 0.13], inf)
)
);
TempoClock.default.tempo = 2;
p = Psym(Pseq(#[abcdPenta, efgPenta, hiPenta, jPenta], 2), ~sequence).play;
);
p.next(());

p.stop;
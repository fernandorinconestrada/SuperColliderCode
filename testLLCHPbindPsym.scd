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
~sp1 =  2/7*0-1.0;
~sp2 =  2/7*1-1.0;
~sp3 =  2/7*2-1.0;
~sp4 =  2/7*3-1.0;
~sp5 =  2/7*4-1.0;
~sp6 =  2/7*5-1.0;
~sp7 =  2/7*6-1.0;
~sp8 =  2/7*7-1.0;
)

// 3 uniqueComb a-f
(
~mul = 4;
~unComTri_a_u = (
	a_fTri: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5],18 * ~mul),
	\dur, 0.2,
	\pos, Place([~sp1, ~sp2, [~sp3, ~sp4, ~sp5, ~sp6, ~sp7, ~sp8]], 6 * ~mul),
	\posDel, Place([~sp8, ~sp7, [~sp6, ~sp5, ~sp4, ~sp3, ~sp2, ~sp1]], 6 * ~mul),
	\freq, Place([210, 200, [220, 230, 240, 250, 260, 270]], 6 * ~mul)
),
	g_kTri: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5.1282051282051],15 * ~mul),
	\dur, 0.195,
	\pos, Place([~sp1, ~sp3, [~sp4, ~sp5, ~sp6, ~sp7, ~sp8]], 5 * ~mul),
	\posDel, Place([~sp8, ~sp6, [~sp5, ~sp4, ~sp3, ~sp2, ~sp1]], 5 * ~mul),
	\freq, Place([220, 200, [210, 230, 240, 250, 260]], 5 * ~mul)
),
	l_oTri: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5.2631578947368],12 * ~mul),
	\dur, 0.19,
	\pos, Place([~sp1, ~sp4, [~sp5, ~sp6, ~sp7, ~sp8]], 4 * ~mul),
	\posDel, Place([~sp8, ~sp5, [~sp4, ~sp3, ~sp2, ~sp1]], 4 * ~mul),
	\freq, Place([230, 200, [210, 220, 240, 250]], 4 * ~mul)
),
	p_rTri: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5.4054054054054],9 * ~mul),
	\dur, 0.185,
	\pos, Place([~sp1, ~sp5, [~sp6, ~sp7, ~sp8]], 3 * ~mul),
	\posDel, Place([~sp8, ~sp4, [~sp3, ~sp2, ~sp1]], 3 * ~mul),
	\freq, Place([240, 200, [210, 220, 230]], 3 * ~mul)
),
	s_tTri: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5.5555555555556],6 * ~mul),
	\dur, 0.18,
	\pos, Place([~sp1, ~sp6, [~sp7, ~sp8]], 2 * ~mul),
	\posDel, Place([~sp8, ~sp3, [~sp2, ~sp1]], 2 * ~mul),
	\freq, Place([250, 200, [210, 220]], 2 * ~mul)
),
	uTri: Pbind(
	\instrument, \testLLCHbouncePbind,
	\rateTrig, Pseq([5.7142857142857],3 * ~mul),
	\dur, 0.175,
	\pos, Place([~sp1, ~sp6, [~sp7, ~sp8]], 1 * ~mul),
	\posDel, Place([~sp8, ~sp3, [~sp2, ~sp1]], 1 * ~mul),
	\freq, Place([260, 200, 210], 1 * ~mul)
)
);

TempoClock.default.tempo = 2;
p = Psym(Pseq(#[a_fTri, g_kTri, l_oTri, p_rTri, s_tTri, uTri], 1), ~unComTri_a_u).play;
)

1/0.2
1/0.195
1/0.19
1/0.185
1/0.18
1/0.175


a = Place([1,2,[3,4,5,6,7,8]], 6).asStream;
a.next;
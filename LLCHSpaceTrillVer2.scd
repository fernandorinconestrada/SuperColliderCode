(
SynthDef(\LLCHSpreadSpaceTrillTrig, { |busL = 0, busR = 2, busL1 = 4, busR1 = 6, /*gate = 0.5,*/ durDel = 0.05, freqL = 330, fbL = 0.4, lofb = 0.3, hifb = 0.8, ampL = 10, loAmp = 0.02, hiAmp = 0.06, freqR = 331, fbR = 0.42, ampR = 13, maxDel_L = 0.2, delT_L = 0.09, decT_L = 0.5, ampDel_L = 0.5, maxDel_R = 0.2, delT_R = 1.1, decT_R = 0.5, ampDel_R = 0.5, start = 0.5, end = 100, durEnvTrigAtt = 5, durEnvTrigDec = 5, gate = 1|
	var trig, envL, envR, sigL, sigR, delayL, delayR;
	//trig = Impulse.kr(gate);
	trig = Impulse.kr(EnvGen.kr(Env([start, end, start], [durEnvTrigAtt, durEnvTrigDec], 'lin', 2).test(15), gate));
	envL = EnvGen.kr(Env.perc(releaseTime:0.5, curve: -6), trig);
	envR = EnvGen.kr(Env.perc, TDelay.kr(trig, durDel));
	sigL = SinOscFB.ar(freqL, SinOsc.kr(fbL).range(lofb, hifb), LFNoise2.kr(ampL).range(loAmp, hiAmp)) * envL;
	sigR = SinOscFB.ar(freqR, SinOsc.kr(fbR).range(lofb, hifb), LFNoise2.kr(ampR).range(loAmp, hiAmp)) * envR;
	delayL = AllpassC.ar(sigL, maxDel_L, delT_L, decT_L, ampDel_L);
	delayR = AllpassC.ar(sigR, maxDel_R, delT_R, decT_R, ampDel_R);
	OffsetOut.ar(busL, FreeVerb.ar(sigL, 0.1, 0.2, 0.2));
	OffsetOut.ar(busR, FreeVerb.ar(sigR, 0.11, 0.15, 0.3));
	OffsetOut.ar(busL1, FreeVerb.ar(delayL, 0.11, 0.21, 0.4));
	OffsetOut.ar(busR1, FreeVerb.ar(delayR, 0.12, 0.2, 0.3));
}).add;
)
(
a = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq1, \freqR, ~freq2, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6]);
b = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq3, \freqR, ~freq4, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7]);
c = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq5, \freqR, ~freq6, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6]);
d = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq7, \freqR, ~freq8, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7]);
e = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq9, \freqR, ~freq10, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6]);
f = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq11, \freqR, ~freq12, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7]);
g = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq13, \freqR, ~freq14, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6]);
h = Synth(\LLCHSpreadSpaceTrillTrig,[\freqL, ~freq15, \freqR, ~freq16, \start, 0.5, \end, 50, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7]);
)
)
(
~freq1 = rrand(220.0, 230.0);
~freq2 = rrand(220.0, 230.0);
~freq3 = rrand(220.0, 230.0);
~freq4 = rrand(220.0, 230.0);
~freq5 = rrand(220.0, 230.0);
~freq6 = rrand(220.0, 230.0);
~freq7 = rrand(220.0, 230.0);
~freq8 = rrand(220.0, 230.0);
~freq9 = rrand(220.0, 230.0);
~freq10 = rrand(220.0, 230.0);
~freq11 = rrand(220.0, 230.0);
~freq12 = rrand(220.0, 230.0);
~freq13 = rrand(220.0, 230.0);
~freq14 = rrand(220.0, 230.0);
~freq15 = rrand(220.0, 230.0);
~freq16 = rrand(220.0, 230.0);
)
(
a.set(\gate, 0);
b.set(\gate, 0);
c.set(\gate, 0);
d.set(\gate, 0);
e.set(\gate, 0);
f.set(\gate, 0);
g.set(\gate, 0);
h.set(\gate, 0);
)
(
a.set(\freqL, ~freq1, \freqR, ~freq2, \start, 0.5, \end, 20, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6, \gate, 1);
b.set(\freqL, ~freq3, \freqR, ~freq4, \start, 0.51, \end, 21, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7, \gate, 1);
c.set(\freqL, ~freq5, \freqR, ~freq6, \start, 0.52, \end, 22, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6, \gate, 1);
d.set(\freqL, ~freq7, \freqR, ~freq8, \start, 0.53, \end, 23, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7, \gate, 1);
e.set(\freqL, ~freq9, \freqR, ~freq10, \start, 0.54, \end, 24, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6, \gate, 1);
f.set(\freqL, ~freq11, \freqR, ~freq12, \start, 0.55, \end, 25, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7, \gate, 1);
g.set(\freqL, ~freq13, \freqR, ~freq14, \start, 0.56, \end, 26, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 0, \busR, 2, \busL1, 4, \busR1, 6, \gate, 1);
h.set(\freqL, ~freq15, \freqR, ~freq16, \start, 0.57, \end, 27, \durEnvTrigAtt, 5, \durEnvTrigDec, 10, \gate, 1, \busL, 1, \busR, 3, \busL1, 5, \busR1, 7, \gate, 1);
)

rrand(220.0, 222.0)

x = 220.asBark;
x.criticalBW;
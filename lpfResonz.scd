{ Out.ar(0, [Resonz.ar(LPF.ar(Impulse.ar(17, 0, 8), SinOsc.kr(0.2).range(200, 1200)), 600, SinOsc.kr(0.3).range(0.5, 0.1), 4),
	Resonz.ar(LPF.ar(Impulse.ar(19, 0, 8), SinOsc.kr(0.2).range(400, 800)), 602, SinOsc.kr(0.3).range(0.5, 0.1), 4)]);
}.play;

(
SynthDef(\lpfResonz, { |freqLeft, ampLeft, freqRight, ampRight, rateCutOffL = 0.2, rateCutOffR = 0.2, loCutL, hiCutL, loCutR, hiCutR, ampLPLeft = 1, ampLPRight = 1, freqResL, freqResR, rateBwL = 0.3, loBwL = 0.5, hiBwL = 0.001, rateBwR = 0.3, loBwR = 0.5, hiBwR = 0.001, ampResL, ampResR, busL = 0, busR = 1 |
	var left,right;
	left = Resonz.ar(LPF.ar(Impulse.ar(freqLeft, 0, ampLeft), SinOsc.kr(rateCutOffL).range(loCutL, hiCutL), ampLPLeft), freqResL, SinOsc.kr(rateBwL).range(loBwL, hiBwL), ampResL);
	right = Resonz.ar(LPF.ar(Impulse.ar(freqRight, 0, ampRight), SinOsc.kr(rateCutOffR).range(loCutR, hiCutR), ampLPRight), freqResR, SinOsc.kr(rateBwR).range(loBwR, hiBwR), ampResR);
	OffsetOut.ar(busL, left);
	OffsetOut.ar(busR, right);
}).add;
)
(
a = Synth(\lpfResonz, [\freqLeft, 19, \freqRight, 17, \ampLeft, 2, \ampRight, 2, \loCutL, 200, \hiCutL, 1200, \loCutR, 400, \hiCutR, 800, \freqResL, 600, \freqResR, 603, \ampResL, 2, \ampResR, 2]);
b = Synth(\lpfResonz, [\freqLeft, 31, \freqRight, 29, \ampLeft, 2, \ampRight, 2, \loCutL, 200, \hiCutL, 1200, \loCutR, 400, \hiCutR, 800, \freqResL, 597, \freqResR, 605, \ampResL, 2, \ampResR, 2]);
a.set(\busL, 0, \busR, 2);
b.set(\busL, 1, \busR, 5);
)

a.set(\freqRight, 17);
a.set(\rateBwL, 0.3, \rateBwR, 0.3);
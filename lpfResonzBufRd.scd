(
s = Server.local;
b = Buffer.read(s, "/Users/fernandorincon/Documents/Live/MinuteSketching/Samples/Processed/Consolidate/1 10-Audio.aif");

SynthDef(\lpfResonzBufRd, { | rateCutOffL = 0.2, rateCutOffR = 0.2, loCutL, hiCutL, loCutR, hiCutR, ampLPLeft = 1, ampLPRight = 1, freqResL, freqResR, rateBwL = 0.3, loBwL = 0.5, hiBwL = 0.001, rateBwR = 0.3, loBwR = 0.5, hiBwR = 0.001, ampResL, ampResR |
	var left, right, in, delayL, delayR, revR, revL;
	in = BufRd.ar(2, b, Phasor.ar(0, BufRateScale.kr(b), 0, BufFrames.kr(b)));
	left = Resonz.ar(LPF.ar(in, SinOsc.kr(rateCutOffL).range(loCutL, hiCutL), ampLPLeft), freqResL, SinOsc.kr(rateBwL).range(loBwL, hiBwL), ampResL);
	right = Resonz.ar(LPF.ar(in, SinOsc.kr(rateCutOffR).range(loCutR, hiCutR), ampLPRight), freqResR, SinOsc.kr(rateBwR).range(loBwR, hiBwR), ampResR);
	delayL = AllpassC.ar(left, 0.2, 0.2, 0.5);
	delayR = AllpassC.ar(right, 0.2, 0.2, 0.5);
	revL = FreeVerb.ar(left);
	revR = FreeVerb.ar(right);
	OffsetOut.ar(0, [Mix.new([revR,delayL]), Mix.new([revL, delayR])]);
}).add;
)

a = Synth(\lpfResonzBufRd, [ \loCutL, 200, \hiCutL, 1200, \loCutR, 400, \hiCutR, 800, \freqResL, 200, \freqResR, 203, \ampResL, 2, \ampResR, 2]);
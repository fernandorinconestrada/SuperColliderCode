(
SynthDef(\sweepPhase, { | ampWhite = 0.3, phaseSpedd = 0.2, phaseStart, ampPhase = 1.0, bus bw = 0.00001, ampBand = 1.4|
	var out, input, phase1, phaseSpeed, phase2, phase3, phase4, phase5, phase6, phase7, phase8, band1, band2, band3, band4, band5, band6, band7, band8, lo, hi;
	input = WhiteNoise.ar(ampWhite);
	lo = Control.names(\lo).kr();
	hi = Control.names(\hi).kr();
	phase1 = SinOsc.kr(phaseSpeed.range(lo, hi), phaseStart, ampPhase);
	band1 = BBandPass.ar(input, phase1, bw, ampBand);
	OffsetOut.ar(bus, out);
}).add;
)
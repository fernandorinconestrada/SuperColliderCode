(
b = Buffer.readChannel(s, "/Users/fernandorincon/Desktop/Untitled Session 1/Bounced Files/Bounce_1.wav", channels: 1);

SynthDef(\testGrainAdditive, { | rateTransp = 20, ratePos = 20, ratePan = 30, sndbuf, envbuf = -1 |
	var out, pan;
	pan = LFNoise0.kr(ratePan).range(-1.0, 1.0);
	out = GrainBuf.ar(2, Dust.kr(XLine.kr(30, 2, 20, doneAction:2)), LFNoise0.kr(20).range(0.032, 0.05), sndbuf, LFNoise0.kr(rateTransp).range(1.0, 2.0), LFNoise0.kr(ratePos).range(0, 1), 2, pan , envbuf);
	OffsetOut.ar(0, out);
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(out, 0.2, 0.06, SinOsc.kr(0.4, 0, 0.7, 0.1)), pan * (-1)));
}).add;
)

a = Synth(\testGrainAdditive, [\sndbuf, b]);

1*(-1)
(-1)*(-1)
0.1 * (-1);

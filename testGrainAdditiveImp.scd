(
b = Buffer.readChannel(s, "/Users/fernandorincon/Desktop/Untitled Session 1/Bounced Files/Bounce_1.wav", channels: 1);

SynthDef(\testGrainAdditiveImp, { | rateTransp = 20, ratePos = 20, ratePan = 30, sndbuf, envbuf = -1 |
	var out, pan, amp;
	pan = SinOsc.kr(ratePan).range(-1.0, 1.0);
	amp = SinOsc.kr(0.04, 0, 0.7, 0.1).abs;
	out = GrainBuf.ar(2, Impulse.kr(XLine.kr(20, 0.5, 50)), LFNoise0.kr(20).range(0.032, 0.05), sndbuf, LFNoise0.kr(rateTransp).range(0.1, 4.0), LFNoise0.kr(ratePos).range(0, 1), 2, pan , envbuf, 512, amp);
	OffsetOut.ar(0, out);
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(out, 0.2, SinOsc.kr(0.04, 0, 0.06, 0.03).abs.poll, amp * 0.8 ), pan * XLine.kr(-1.0, 0.1, 25)));
}).add;
)

a = Synth(\testGrainAdditiveImp, [\sndbuf, b]);

625* 0.2
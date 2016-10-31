s = Server.local.makeGui;

(
SynthDef(\spray2, { |frq_noise = 10, frq_scale = 0.01, mul_in = 0.2 fr = #[1,1,1,1,1], am = #[1,1,1,1,1], ring = #[1,1,1,1,1], frq_off 0.04, frq_dec = 0.05, bus = 0|
	var in, scale, offset, decay, out;
	in = LFNoise0.ar(frq_noise, mul_in);
	scale = SinOsc.kr(frq_scale).range(0.1, 2) * LFNoise0.ar(frq_noise, 0.2).range(0.1, 1);
	offset = SinOsc.kr(frq_off).range(0.1, 2) * LFNoise0.ar(frq_noise, 0.2).range(0.8, 1.1);
	decay = SinOsc.kr(frq_dec).range(0.1, 2.5);
	out = DynKlank.ar(`[fr, am, ring], in, scale, offset, decay);
	Out.ar(bus, LPF.ar(out, 18000));
}).load(s);
)
(
a = Synth(\spray2, [\fr, [500, 1000, 1200, 1500, 2000], \am, [0.2, 0.1, 0.3, 0.1, 0.3], \ring, [0.2, 0.3, 0.4, 0.3, 0.2]]);
b = Synth(\spray2, [\fr, [501, 1004, 1208, 1510, 2020], \am, [0.2, 0.1, 0.3, 0.1, 0.3], \ring, [0.2, 0.3, 0.4, 0.3, 0.2], \bus, 1, \frq_noise, 8]);
c = Synth(\spray2, [\fr, [502, 1008, 1216, 1520, 2040], \am, [0.2, 0.1, 0.3, 0.1, 0.3], \ring, [0.2, 0.3, 0.4, 0.3, 0.2], \bus, 2, \frq_noise, 9]);
d = Synth(\spray2, [\fr, [501, 1004, 1208, 1510, 2020], \am, [0.2, 0.1, 0.3, 0.1, 0.3], \ring, [0.2, 0.3, 0.4, 0.3, 0.2], \bus, 3, \frq_noise, 10]);
e = Synth(\spray2, [\fr, [502, 1008, 1216, 1520, 2040], \am, [0.2, 0.1, 0.3, 0.1, 0.3], \ring, [0.2, 0.3, 0.4, 0.3, 0.2], \bus, 4, \frq_noise, 9]);
f = Synth(\spray2, [\fr, [501, 1004, 1208, 1510, 2020], \am, [0.2, 0.1, 0.3, 0.1, 0.3], \ring, [0.2, 0.3, 0.4, 0.3, 0.2], \bus, 5, \frq_noise, 11]);
)

s.recChannels = 6;s.prepareForRecord;
s.record;
s.stopRecording;
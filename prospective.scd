o = Server.local.options;
o.sampleRate = 44100;
(
SynthDef(\prospectiveSpace, { |amp_source = 0.8, freq_a = 880, freq_b = 900, bw = 0.002, start = 0, end = 1, dur = 10, amp = 1|
	var source, in_a, in_b, pos;
	source = WhiteNoise.ar(amp_source);
	in_a = BBandPass.ar(source, freq_a, bw);
	in_b = BBandPass.ar(source, freq_b, bw, 0.3);
	pos = Line.kr(start, end, dur, amp).range(-1,1);
	Out.ar(0, Pan2.ar([in_a, in_b], [SinOsc.kr(0.2), 1]))
}).load(s);
)

a = Synth(\prospectiveSpace);
a.set(\bw, 0.002);
a.set(\freq, 880);
a.free;

(
SynthDef(\prospectiveSpaceSine, { |freq_a = 880, freq_b = 980, sta = 0, en = 1, dr = 10, am = 0.5|
	var in_a, in_b;
	in_a = SinOsc.ar(freq_a, 0, Line.kr(0.001, 0.3, 15));
	in_b = SinOsc.ar(freq_b, 0, 0.05);
	Out.ar(0, Pan2.ar([in_a, in_b], [SinOsc.kr(2).range(-1.0, 1.0), 1]))
}).load(s);
)

b = Synth(\prospectiveSpaceSine);
b.free;

{ SinOsc.ar(440, 0, Line.kr(0, 0.3, 20)) }.play;

{ Pan2.ar(SinOsc.ar(440, 0, 0.1), SinOsc.kr(0.01, 0).range(-1,1)) }.play;
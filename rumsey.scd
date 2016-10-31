(
SynthDef(\rumsey, { |amp = 0.1, freq, bw, amp_fil|
	var white;
	white =  WhiteNoise.ar(amp);
	Out.ar(0, BBandPass.ar(white, freq, bw, amp_fil))
}).send;
)

FreqScope.new(400, 200, 0);
s.scope;

a = Synth(\rumsey, [freq: 8000, bw: 0.001, amp_fil: 0.8, amp: 0.8]); // overhead
a.free;

b = Synth(\rumsey, [freq: 450, bw: 0.2, amp_fil: 0.5, amp: 0.5]);// frontal
b.free;

c = Synth(\rumsey, [freq: 4500, bw: 0.23, amp_fil: 0.5, amp: 0.5]);// frontal
c.free;

d = Synth(\rumsey, [freq: 1200, bw: 0.008, amp_fil: 0.8, amp: 0.8]);// rear
d.free;

e = Synth(\rumsey, [freq: 12000, bw: 0.001, amp_fil: 1.0, amp: 1.0]);// rear
e.free;

f = Synth(\rumsey, [freq: 6000, bw: 0.2, amp_fil: 1.0, amp: 0.4]);// front, octave notch
f.free;

g = Synth(\rumsey, [freq: 8000, bw: 0.06, amp_fil: 1.0, amp: 0.4]);// front, quarter octave peak
g.free;

8000*0.12;


s = Server.internal.makeGui;
x = FreqScope.new;


(
SynthDef(\sine, { |freq, pha = 0, amp = 0.2, bus = 0|
	var out;
	out = FSinOsc.ar(freq, pha, amp);
	Out.ar(bus, LPF.ar(out, 22000))
}).load(s);
)

(
SynthDef(\sineMult, { |ratio1, ratio2, pha1 = 0, pha2 = 0 , amp1 = 0.2, amp2 = 0.2 bus = #[0,1], amp = 0.8|
	var out;
	out = FSinOsc.ar(ratio1, pha1, amp1) * FSinOsc.ar(ratio2, pha2, amp2);
	Out.ar(bus, LPF.ar(out, 22000, amp))
}).load(s);
)
(
z = Synth(\sine, [\freq, 5027.01, \amp, 0.03]);
y = Synth(\sine, [\freq, 5521.47, \amp, 0.03, \bus, 1]);
)
(
z.free;y.free;

(
x = Synth(\sineMult, [\ratio1, 82.41, \ratio2, 84.66, \amp1, 0.3, \amp2, 0.2]);
w = Synth(\sineMult, [\ratio1, 82.41, \ratio2, 10466.07, \amp1, 0.3, \amp2, 0.06]);
)
(
x.free;
w.set(\amp, 0.02);
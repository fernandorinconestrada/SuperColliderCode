(
SynthDef(\blauerPhase, { |bus = #[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], freq = 110, pha = #[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], amp = 0.0003|
	OffsetOut.ar(bus, FSinOsc.ar(freq, pha, amp))
}).send(s);
)

~pha = Array.fill(31, { |i| (2pi/31)*i });
(
a = Synth(\blauerPhase, [\freq, 110, \pha, ~pha, \amp, 0.0004]);
b = Synth(\blauerPhase, [\freq, 111, \pha, ~pha, \amp, 0.0004]);
)
(
a.set(\amp, 0.0006);
b.set(\amp, 0.0006);
)
a.free;
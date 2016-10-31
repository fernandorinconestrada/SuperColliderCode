(
SynthDef(\testPhase, { |busL = 0, busR = 1, freq = 20, phaseL = 0, phaseR = 0, amp = 0.1 |
	OffsetOut.ar(busL, SinOsc.ar(freq, phaseL, amp));
	OffsetOut.ar(busR, SinOsc.ar(freq, phaseR, amp));
}).send(s);
)

(
SynthDef(\testPhaseVer, { |busL = 0, busR = 1, freq = 20, phaseL = 0, phaseR = 0, amp = 0.1 |
	OffsetOut.ar(busL, SinOsc.ar(freq, phaseL, amp));
	OffsetOut.ar(busR, SinOsc.ar(freq, SinOsc.kr(0.2).range(-8, 8), amp));
}).send(s);
)

a = Synth(\testPhaseVer, [\freq, 440]);
a.set(\phaseR, -7);
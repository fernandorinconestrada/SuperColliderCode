(
SynthDef(\violaTuning, { |freq, harm, fb, amp|
	Out.ar(0, SinOscFB.ar(freq*harm, fb, amp));
}).add;
)
//Harmonics String 4
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 5, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 7, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 5 String 3
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 7 String 3
(
a = Synth(\violaTuning, [\freq, 130.81, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 196, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 5 String 2
(
a = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 440, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics 7 String 2
(
a = Synth(\violaTuning, [\freq, 196, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 440, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 293.66, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
//Harmonics String 1
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 440, \harm, 5, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;
(
a = Synth(\violaTuning, [\freq, 293.66, \harm, 1, \fb, 0.5, \amp, 0.2]);
b = Synth(\violaTuning, [\freq, 440, \harm, 7, \fb, 0.2, \amp, 0.08]);
)
a.free;b.free;

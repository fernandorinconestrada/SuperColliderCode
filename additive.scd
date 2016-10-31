s = Server.local.makeGui;
s.scope;
(
SynthDef(\square, { |freq = 400, phase 0, ampli = 0.1 |
	Out.ar(0, SinOsc.ar(freq, phase, ampli))
}).send(s);
)
(


a = Synth(\square);
b = Synth(\square, [\freq: 400*3, \amp: 0.1/3].postln);
c = Synth(\square, [\freq, 400*5, \amp, 0.1/5].postln);
d = Synth(\square, [\freq, 400*7, \amp, 0.1/7].postln);
e = Synth(\square, [\freq, 400*9, \amp, 0.1/9].postln);
f = Synth(\square, [\freq, 400*11, \amp, 0.1/11].postln);
g = Synth(\square, [\freq, 400*13, \amp, 0.1/13].postln);
h = Synth(\square, [\freq, 400*15, \amp, 0.1/15].postln);
i = Synth(\square, [\freq, 400*17, \amp, 0.1/17].postln);

(
SynthDef(\triangle, { |freq = 400, phase 0, ampli = 0.1 |
	Out.ar(0, SinOsc.ar(freq, phase, ampli))
}).send(s);
)

a = Synth(\triangle);
b = Synth(\triangle, [\freq: 400*3, \amp:  0.1*1/9].postln);
c = Synth(\triangle, [\freq, 400*5, \amp,  0.1*1/25].postln);
d = Synth(\triangle, [\freq, 400*7, \amp,  0.1*1/49].postln);
e = Synth(\triangle, [\freq, 400*9, \amp,  0.1*1/81].postln);
f = Synth(\triangle, [\freq, 400*11, \amp, 0.1*1/144].postln);
g = Synth(\triangle, [\freq, 400*13, \amp, 0.1*1/169].postln);
h = Synth(\triangle, [\freq, 400*15, \amp, 0.1*1/225].postln);
i = Synth(\triangle, [\freq, 400*17, \amp, 0.1*1/289].postln);

(
SynthDef(\sawtooth, { |freq = 400, phase 0, ampli = 0.1 |
	Out.ar(0, SinOsc.ar(freq, phase, ampli))
}).send(s);
)

a = Synth(\sawtooth);
b = Synth(\sawtooth, [\freq: 400*2, \amp:  0.1/2].postln);
c = Synth(\sawtooth, [\freq: 400*3, \amp:  0.1/3].postln);
d = Synth(\sawtooth, [\freq: 400*4, \amp:  0.1/4].postln);
e = Synth(\sawtooth, [\freq: 400*5, \amp:  0.1/5].postln);
f = Synth(\sawtooth, [\freq: 400*6, \amp:  0.1/6].postln);
g = Synth(\sawtooth, [\freq: 400*7, \amp:  0.1/7].postln);
h = Synth(\sawtooth, [\freq: 400*8, \amp:  0.1/8].postln);
i = Synth(\sawtooth, [\freq: 400*9, \amp:  0.1/9].postln);

{LFTri.ar(44.1)}.plot(0.2);
~tri = {LFTri.ar(441, 0, 0.1)}.play;
~tri.free;
{LFSaw.ar(44.1)}.plot(0.2);
~saw = {LFSaw.ar(441, 0, 0.1)}.play;
~saw.free;
{PulseDPW.ar(44.1)}.plot(0.2);
~square = {PulseDPW.ar(441, 0.25, 0.1)}.play;
~square1 = {PulseDPW.ar(441, 0.5, 0.1)}.play;
~square.free;
~square1.free;


{ SinOsc.ar(440, 0, 0.2) * SinOsc.ar(0.5, 0, 0.2) }.play;
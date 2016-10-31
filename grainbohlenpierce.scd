s = Server.local.makeGui;
s.scope(31);
(
var winenv;
winenv = Env([0, 1, 0.5, 0.8, 0], [0.05, 0.22, 0.47, 0.68], \sine);
z = Buffer.sendCollection(s, winenv.discretize, 1);

SynthDef(\grainBohlenPierce, { |dur = 0.1, freq = 220, amp = 0.2, imp_freq = 10, phase = 0, amp_imp = 0.2, envbuf, gate = 1, bus = #[0,1], reson = #[1,1,1,1], ampli = #[1,1,1,1], ring = #[1,1,1,1] |
	var  trigger, env, in;
	trigger = Impulse.ar(imp_freq, phase, amp_imp);
	env = EnvGen.kr(
        Env([0, 1, 0], [0.1, 0.2], \sin, 1),
        gate,
        levelScale: amp,
        doneAction: 2);
	in = GrainSin.ar(2, trigger, dur, freq, SinOsc.kr(0.2).range(-1,1), envbuf -1, mul: amp) * env ;
	Out.ar(bus,
		DynKlank.ar( `[reson, ampli, ring], in));
}).load(s);
)

a = Synth(\grainBohlenPierce, [\bus, [0, 29], \imp_freq, 11, \reson, Array.fill(4, { |deg| 660*(6**(deg/13)) }).postln, \ampli, Array.fill(4, { rrand(0.8, 0.2) }).postln, \ring, Array.fill(4, { rrand(0.8, 0.2) }).postln ] );
a.set(\envbuf, z);
a.set(\envbuf, -1);
a.free;

b = Synth(\grainBohlenPierce, [\bus, [2,27], \freq, 606.51605368917, \imp_freq, 6]);
b.set(\envbuf, z);
b.set(\envbuf, -1);
b.free;

c = Synth(\grainBohlenPierce, [\bus, [2,28], \freq, 239.40009356193, \imp_freq, 7]);
c.set(\envbuf, z);
c.set(\envbuf, -1);
c.free;

d = Synth(\grainBohlenPierce, [\bus, [3, 27], \freq, 557.36624754952, \imp_freq, 9]);
d.set(\envbuf, z);
d.set(\envbuf, -1);
d.free;

e = Synth(\grainBohlenPierce, [\bus, [4,26], \freq, 260.51093089755, \imp_freq, 5]);
e.set(\envbuf, z);
e.set(\envbuf, -1);
e.free;

f = Synth(\grainBohlenPierce, [\bus, [5,25], \freq, 512.19935897467, \imp_freq, 8]);
f.set(\envbuf, z);
f.set(\envbuf, -1);
f.free;

g = Synth(\grainBohlenPierce, [\bus, [6, 24], \freq, 283.48336923081, \imp_freq, 9]);
g.set(\envbuf, z);
g.set(\envbuf, -1);
g.free;

h = Synth(\grainBohlenPierce, [\bus, [7, 23], \freq, 470.69262713248, \imp_freq, 13]);
h.set(\envbuf, z);
h.set(\envbuf, -1);
h.free;

j = Synth(\grainBohlenPierce, [\bus, [8, 22], \freq, 308.48156871412, \imp_freq, 12]);
j.set(\envbuf, z);
j.set(\envbuf, -1);
j.free;

k = Synth(\grainBohlenPierce, [\bus, [9, 21], \freq, 432.54944652876]);
k.set(\envbuf, z);
k.set(\envbuf, -1);
k.free;

l = Synth(\grainBohlenPierce, [\bus, 20, \freq, 335.68416551042]);
l.set(\envbuf, z);
l.set(\envbuf, -1);
l.free;

m = Synth(\grainBohlenPierce, [\bus, 22, \freq, 397.49724747585]);
m.set(\envbuf, z);
m.set(\envbuf, -1);
m.free;

n = Synth(\grainBohlenPierce, [\bus, 24, \freq, 365.28554832024]);
n.set(\envbuf, z);
n.set(\envbuf, -1);
n.free;

q = Synth(\grainBohlenPierce, [\bus, 26, \freq, 660]);
q.set(\envbuf, z);
q.set(\envbuf, -1);
q.free;

r = Synth(\grainBohlenPierce, [\bus, 28, \freq, 1980]);
r.set(\envbuf, z);
r.set(\envbuf, -1);
r.free;

t = Synth(\grainBohlenPierce, [\bus, 30]);
t.set(\envbuf, z);
t.set(\envbuf, -1);
t.free;

~freq = Array.fill( 27, { |deg| 220*(3**(deg/13)) } );

z.plot;

rrand(24, 30);

Array.fill(13, { |deg| 660*(3**(deg/13)) }).choose.postln;
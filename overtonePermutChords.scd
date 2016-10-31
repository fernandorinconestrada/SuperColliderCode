(
Server.default = Server.local.makeGui;
s = Server.default;
s.boot;
)
(
SynthDef(\ot_chord, { |freq = #[1,1,1,1,1,1,1,1], bus = #[0,1], amps = #[0,0,0,0,0,0,0,0], density = 0.3, maxDel = 0.3, del = 0.3, dec = 0.7, ringFreq = #[1,1,1,1,1,1,1,1], ringDec = #[1,1,1,1,1,1,1,1], ampRing = 0.25, ampMix = 0.4, attTime = 0.04, relTime = 1.2 |
	var out, env, in, mix, ring, mixFilt;
	env = EnvGen.kr(Env.perc(attTime, relTime, curve: -6), Dust.kr(density, 0.1));
	in = Mix.new(FSinOsc.ar(freq, 0, amps));
	mix = AllpassC.ar(in, maxDel, del, dec, ampMix);
	ring = Ringz.ar(mix, ringFreq, ringDec, ampRing);
	mixFilt = Mix.new(ring);
	out = LPF.ar(mixFilt, 20000);
	Out.ar(bus, out * env);
}).load(s);
)
(
h = {|fund ... harms| harms * fund};
j = {|initial ... parts| (1/initial)* parts};
z = {|fund ... compl| fund * compl};
w = {|initAmp ... parts| (1/initAmp)* parts};
)
(
b = h.value(82.41, 2,5,11,17,23,31,41,47);// string 6
c = h.value(110, 3,5,7,11,13,17,19,23);//string 5
d = h.value(146.83, 5,7,11,13,17,19,23,29); //string 4
e = h.value(196, 7,11,13,17,19,23,29,31);// string 3
f = h.value(246.94, 11,13,17,19,23,29,31,37);//string 2
g = h.value(329.63, 13,17,19,23,29,31,37,43); //string 1
)
(
k = j.value(1, 2,11,23,41,59,73, 97,109).normalizeSum.range(0, 0.4).reverse;
l = j.value(0.1, 3,5,7,11,13,17,19,23).normalizeSum.reverse;
m = j.value(0.1, 5,7,11,13,17,19,23,29).normalizeSum.reverse;
n = j.value(0.1, 7,11,13,17,19,23,29,31).normalizeSum.reverse;
o = j.value(0.1, 11,13,17,19,23,29,31,37).normalizeSum.reverse;
p = j.value(0.1, 13,17,19,23,29,31,37,43).normalizeSum.reverse;
)
(
q = z.value(82.41, 3,7,13,19,29,37,43,53);
r = w.value(1, 59,73,97,109,137,157,179,197).normalizeSum.range(0, 0.25).reverse;
)

a = Synth(\ot_chord);
a.set(\freq, b.postln, \amps, k.postln, \density, 1, \ringFreq, q.postln, \ringDec, r.postln);
a.set(\freq, c.postln, \amps, p.postln);
a.set(\freq, d.postln, \amps, p.postln);
a.set(\freq, e.postln, \amps, p.postln);
a.set(\freq, f.postln, \amps, p.postln);
a.set(\freq, g.postln, \amps, p.postln);
a.free;

x = FreqScope.new;
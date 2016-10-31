(
SynthDef(\BPArpWF, { |freq, pha = 0, amp = 0.2, freqAtt = 0.01, freqRel = 0.1, bus|
	var env, out, in, att, rel;
	att = SinOsc.kr(freqAtt).range(0.01, 0.06);
	rel = SinOsc.kr(freqRel).range(0.3, 0.8);
	env = EnvGen.kr(Env.perc(att, rel, curve: \sin), 1, doneAction: 2);
	out = FSinOsc.ar(freq, pha, amp);
	in = LPF.ar(out, 20000, 1);
	OffsetOut.ar(bus, in * env)
}).add;
)

x = Synth(\BPArpWF, [\freq, 179.5]);
y = Synth(\BPArpWF, [\freq, 108.373]);

~speak2 = ((0..15)*2).postln;
~speak1 = ((0..14)*2 + 1).postln;
~wipe = (-10..10)*0.1;
~wipe.mirror;

(
a = Pbind(
	\instrument, \BPArpWF,
	\freq, 110,
	\dur, 0.05,
	\amp, 0.04,
	\bus, Pseq(~speak2, inf)
).play;
b = Pbind(
	\instrument, \BPArpWF,
	\freq, 111,
	\dur, 0.07 ,
	\amp, 0.03,
	\bus, Pseq(~speak1, inf)
).play;
c = Pbind(
	\instrument, \BPArpWF,
	\freq, 110.5,
	\dur, 0.05,
	\amp, 0.05,
	\bus, Pseq(~speak1.mirror, inf)
).play;
d = Pbind(
	\instrument, \BPArpWF,
	\freq, 111.2,
	\dur, 0.051,
	\amp, 0.05,
	\bus, Pseq(~speak2.mirror, inf)
).play;
e = Pbind(
	\instrument, \BPArpWF,
	\freq, 330,
	\dur, 0.19,
	\amp, 0.004,
	\bus, Pseq(~speak2, inf)
).play;
f = Pbind(
	\instrument, \BPArpWF,
	\freq, 331,
	\dur, 0.11 ,
	\amp, 0.002,
	\bus, Pseq(~speak1, inf)
).play;
g = Pbind(
	\instrument, \BPArpWF,
	\freq, 330.5,
	\dur, 0.09,
	\amp, 0.002,
	\bus, Pseq(~speak1.mirror, inf)
).play;
h = Pbind(
	\instrument, \BPArpWF,
	\freq,330.2,
	\dur, 0.08,
	\amp, 0.002,
	\bus, Pseq(~speak2.mirror, inf)
).play;
)

s.recChannels_(31);
s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/recordMulti/test31.aiff");
s.record;
s.stop;



i = [
    Bus(\audio,80,1),
    Bus(\audio,81,1),
    Bus(\audio,82,1),
	Bus(\audio,83,1),
    Bus(\audio,84,1),
    Bus(\audio,85,1),
	Bus(\audio,86,1),
    Bus(\audio,87,1),
    Bus(\audio,88,1),
	Bus(\audio,89,1),
    Bus(\audio,90,1),
    Bus(\audio,91,1),
	Bus(\audio,92,1),
    Bus(\audio,93,1),
    Bus(\audio,94,1),
	Bus(\audio,95,1),
    Bus(\audio,96,1),
    Bus(\audio,97,1),
	Bus(\audio,98,1),
    Bus(\audio,99,1),
    Bus(\audio,100,1),
	Bus(\audio,101,1),
    Bus(\audio,102,1),
    Bus(\audio,103,1),
    Bus(\audio,104,1),
	Bus(\audio,105,1),
    Bus(\audio,106,1),
    Bus(\audio,107,1),
	Bus(\audio,108,1),
    Bus(\audio,109,1),
    Bus(\audio,110,1)
    ];

m = MultiChanRecorder(i);
m.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/recordMulti/test.aiff");
m.record(atTime: 2);
m.stop;
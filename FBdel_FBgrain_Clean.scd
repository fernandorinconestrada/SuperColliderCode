`2
(
g = Buffer.read(s, "/Users/fernandorincon/Music/Misce/chanting1.wav");
h = Buffer.read(s, "/Users/fernandorincon/Music/Misce/chanting2.wav");
(
SynthDef(\playBuf, { |bus = 0, bufnum = 0, rate = 1, trigger = 1, dur = 10, gate = 1, startPos = 0|
	var env;
	env = EnvGen.ar(Env.sine(dur), gate, 0.2, doneAction:2);
	OffsetOut.ar(bus, (PlayBuf.ar(1, bufnum, rate, trigger, startPos) * env)*0.3)
}).add;
);
)

x = Synth(\playBuf, [\bufnum, g, \dur, rrand(6.0,10.0).postln,  \startPos, (g.numFrames*1.0.rand).postln]);

x = Synth(\playBuf, [\bufnum, g, \dur, rrand(6.0,10.0).postln,  \rate, -1, \startPos, (g.numFrames*1.0.rand).postln]);

y = Synth(\playBuf, [\bufnum, h, \dur, rrand(6.0,10.0).postln,  \startPos, (h.numFrames*1.0.rand).postln]);

y = Synth(\playBuf, [\bufnum, h, \dur, rrand(6.0,10.0).postln,  \rate, -1, \startPos, (h.numFrames*1.0.rand).postln]);

(
s.prepareForRecord;
s.record;
);
s.stopRecording;

a.set(\ampWhiteA, 0.4);
b.set(\ampWhiteB, 0.4);

a.set(\del_inDelay, 0.0);
a.set(\del_feedDel, 0.0);
a.set(\delMixFBDel, 0.0);

o = Server.local.options;
o.hardwareBufferSize.postln;

Array.fill(7, {|i = 600, golden = 1.61803398875| (i + i/golden)});
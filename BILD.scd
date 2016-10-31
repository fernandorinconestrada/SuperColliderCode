
b = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/syllables.wav", 0, -1);
(
SynthDef(\bild, { |pos = 0, amp = 0.2, freqFilt = 400, ampFil = 0.8, bufnum|
	var mix, s2, ramp, filter, cue;
	ramp = MouseX.kr(0,1).postln;
	cue = MouseY.kr(0.001, 20);
	filter = BBandPass.ar(WhiteNoise.ar(amp), freqFilt, cue, ampFil);
	s2 = PlayBuf.ar(1, bufnum, 1, 1, 0, 1);
	mix = Mix.new([filter, s2*ramp]);
	OffsetOut.ar(0, Pan2.ar(mix, pos))
}).load(s);
)

a = Synth(\bild, [\bufnum, b]);
a.set(\cue, 0.1);
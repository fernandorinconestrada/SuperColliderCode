(
SynthDef(\ampTrack, { |rq = 0.1|
	var freqs, amps, analysis, attT, relT, synL, synR;
	freqs = [100, 200, 300, 400, 500, 600];
	attT = MouseX.kr(0.01, 0.05, lag:0.2);
	relT = MouseY.kr(0.01, 0.05, lag:0.2);
	analysis = BPF.ar(SoundIn.ar([0,1]), freqs, rq);
	amps = Amplitude.kr(analysis, attT, relT);
	synL = Mix.new(BPF.ar(WhiteNoise.ar(1), 100, rq, amps.at(0)), BPF.ar(WhiteNoise.ar(1), 400, rq, amps.at(3)), BPF.ar(WhiteNoise.ar(1), 500, rq, amps.at(4)));
	synR = Mix.new(BPF.ar(WhiteNoise.ar(1), 200, rq, amps.at(1)), BPF.ar(WhiteNoise.ar(1), 300, rq, amps.at(2)), BPF.ar(WhiteNoise.ar(1), 600, rq, amps.at(5)));
	OffsetOut.ar(0, [synL, synR]);
}).load(s);
)

a = Synth(\ampTrack);

s = Server.local.makeGui;
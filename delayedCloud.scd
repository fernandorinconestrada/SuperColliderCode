(
b = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");

	SynthDef(\delayedCloud, { |dur1 = 0.8, dur2 = 0.8, dur3 = 0.8, sndbuf, rate1 = 1, rate2 = 0.9, rate3 = 1.1, pos = 0.5, delTrig1 = 0.5, delTrig2 = 0.7, delTrig3 = 0.3, envbufnum = -1, bus= 0, delT= 0.05, decT = 0.4, durTrig = 20|
	var trig, clean, grain1, del1, grain2, del2, grain3, del3, mix;
	trig = Dust.kr(XLine.kr(0.4, 40, durTrig, doneAction:2));
	clean = GrainBuf.ar(1, trig, LFNoise0.kr(dur1).range(0.03, 0.06), sndbuf, LFNoise2.kr(rate1).range(0.8, 1.1), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	grain1 = GrainBuf.ar(1, TDelay.kr(trig, delTrig1), LFNoise0.kr(dur1).range(0.03, 0.06), sndbuf, LFNoise2.kr(rate1).range(0.8, 1.1), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	del1 = AllpassC.ar(grain1, 0.2, delT, decT);
	grain2 = GrainBuf.ar(1, TDelay.kr(trig, delTrig2), LFNoise0.kr(dur2).range(0.02, 0.07), sndbuf, LFNoise2.kr(rate2).range(0.9, 1.0), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	del2 = AllpassC.ar(grain2, 0.2, delT, decT);
	grain3 = GrainBuf.ar(1, TDelay.kr(trig, delTrig3), LFNoise0.kr(dur3).range(0.01, 0.08), sndbuf, LFNoise2.kr(rate3).range(1.0, 1.1), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	del3 = AllpassC.ar(grain3, 0.2, delT, decT);
	mix = Mix.new([clean, del1, del2, del3]);
	OffsetOut.ar(bus, AllpassC.ar(mix, 0.2, delT, decT));
}).add;
);

(
b = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");

SynthDef(\delayedCloudStereo, { |dur1 = 0.8, dur2 = 0.8, dur3 = 0.8, sndbuf, rate1 = 1, rate2 = 0.9, rate3 = 1.1, pos = 0.5, delTrig1 = 0.5, delTrig2 = 0.7, delTrig3 = 0.3, envbufnum = -1, bus= #[0,1], delT= 0.05, decT = 0.4, durTrig = 20|
	var trig, clean, grain1, del1, grain2, del2, grain3, del3, mix;
	trig = Dust.kr(XLine.kr(0.4, 40, durTrig, doneAction:2));
	clean = GrainBuf.ar(1, trig, LFNoise0.kr(dur1).range(0.02, 0.07), sndbuf, LFNoise2.kr(rate1).range(0.8, 1.1), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	grain1 = GrainBuf.ar(1, TDelay.kr(trig, delTrig1), LFNoise0.kr(dur1).range(0.03, 0.06), sndbuf, LFNoise2.kr(rate1).range(0.8, 1.1), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	del1 = AllpassC.ar(grain1, 0.2, delT, decT);
	grain2 = GrainBuf.ar(1, TDelay.kr(trig, delTrig2), LFNoise0.kr(dur2).range(0.02, 0.07), sndbuf, LFNoise2.kr(rate2).range(0.9, 1.0), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	del2 = AllpassC.ar(grain2, 0.2, delT, decT);
	grain3 = GrainBuf.ar(1, TDelay.kr(trig, delTrig3), LFNoise0.kr(dur3).range(0.01, 0.08), sndbuf, LFNoise2.kr(rate3).range(1.0, 1.1), LFNoise2.kr(pos).range(0,1), 0, 2, envbufnum);
	del3 = AllpassC.ar(grain3, 0.2, delT, decT);
	mix = Mix.new([clean, del1, del2, del3]);
	OffsetOut.ar(bus, AllpassC.ar(mix, 0.2, delT, decT));
}).add;
)
(
a = Synth(\delayedCloud, [\sndbuf, b]);
b = Synth(\delayedCloudStereo, [\sndbuf, b, \bus, [0,2]]);
)
a.set(\freqTrig, 4);
a.set(\dur1, 5, \dur2, 4, \dur3, 3);


b = Synth(\delayedCloudStereo, [\sndbuf, b]);
b.set(\freqTrig, 4);
b.set(\dur1, 3, \dur2, 4, \dur3, 5);

(
b = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");

SynthDef(\decayTest, { |sndbuf, envbufnum = -1|
	OffsetOut.ar(0, Decay2.ar(Impulse.ar(0.5), 0.01, 1, GrainBuf.ar(1, Impulse.kr(2), LFNoise2.kr(4).range(0.02, 0.08), sndbuf, LFNoise2.kr(4).range(0.95, 1.05), LFNoise0.kr(5).range(0, 1.0), 2, 0, envbufnum))) ;
}).add;
)

c = Synth(\decayTest, [\sndbuf, b]);
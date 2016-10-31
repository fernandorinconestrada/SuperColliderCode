(
SynthDef(\algoTest4, { |bus = 0, decTrig = 1, att = 0.001, decay = 0.03, dens = 10, attT = 0.01, decT = 0.5, fund = 440, arrFreq = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], bw = 0.1, arrBw = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], amp = 1.0, arrAmp = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], rev = -1.0 |
	var in, trig, pan, delT, ampDel, step, freq, env;
	trig = Impulse.ar(decTrig);
	pan = TRand.kr(-1.0, 1.0, trig);
	delT = TRand.kr(0.02, 0.06, trig);
	ampDel = TRand.kr(0.25, 0.75, trig);
	step = Impulse.ar(dens);
	freq = (fund * Stepper.ar(step, 0, 1, dens, 1, 1)).poll;
	env = EnvGen.kr(Env([0, 1, 0], [att, decay], [4, 4]), step);
	in = Decay2.ar(trig, attT, decT, Mix.new(BBandPass.ar(GrayNoise.ar(1.0), freq*arrFreq, bw*arrBw, amp*arrAmp) * env));
	OffsetOut.ar(bus, Pan2.ar(in, pan));
	OffsetOut.ar(bus, Pan2.ar(DelayC.ar(in, 0.2, delT, ampDel), pan*rev));
}).add;
)

(
~arrFreq = Array.series(12, 1, 3);
~arrBw = Array.rand(12, 0.01, 0.04);
~arrAmp = Array.rand(12, 0.8, 1.5);
)

a = Synth(\algoTest4, [\freq, 220, \arrFreq, ~arrFreq,  \arrBw, ~arrBw, \arrAmp, ~arrAmp]);
a.set(\dens, 12);
a.set(\decTrig, 0.5);
a.set(\freq, 110);
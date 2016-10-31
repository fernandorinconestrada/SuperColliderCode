(
SynthDef(\fluteTest, { |freqs = #[0,0,0,0,0,0,0,0,0,0,0,0], amps = #[0,0,0,0,0,0,0,0,0,0,0,0] |
	//OffsetOut.ar(0, Mix.new(SinOsc.ar(freqs, 0, amps)));
	OffsetOut.ar(0, Mix(BBandPass.ar(GrayNoise.ar(1), freqs, Rand(0.001, 0.002), amps)))
}).send(s);
)
(
SynthDef(\fluteTestVer2, { |trigGate = 0.5, dur = 1.8, fund = 392, freqs = #[1,2,3,4,5,6,7,8,9,10,11,12], bws = #[0,0,0,0,0,0,0,0,0,0,0,0], amps = #[0,0,0,0,0,0,0,0,0,0,0,0], delT = 0.05, ampDel = 0.9 |
	var gate, env, in, delay;
	gate = Impulse.ar(trigGate);
	env = EnvGen.ar(Env([0,1,0.8,0], [dur*0.15, dur*0.55, dur*0.3], [8,1,-8]), gate, doneAction:2);
	//in = Mix(BBandPass.ar(GrayNoise.ar(1), fund*freqs, bws, amps)) * env;
	//in = HPF.ar(Mix.new(SinOscFB.ar(fund*freqs, bws, amps))*env, 40);
	in = HPF.ar(Mix.new(SinOsc.ar(fund*freqs, 0, amps) * BBandPass.ar(GrayNoise.ar(1), fund, 0.01))*env, 20);
	//in = Mix(BBandPass.ar(GrayNoise.ar(1), freqs, Rand(0.001, 0.002), amps));
	delay = DelayC.ar(in, 0.2, delT, ampDel);
	OffsetOut.ar(0, FreeVerb.ar(in, 0.8, 0.5));
	OffsetOut.ar(1, DelayC.ar(FreeVerb.ar(in, 0.8, 0.5), 0.2, 0.06));
}).send(s);
)
(Env([0,1,0.8,0],[0.15,0.55,0.3],[8,1,-8]).plot;)
(
~fund = 392;
~freqs = ~fund*(1..12);
~amps = [-70.dbamp, -66.dbamp, -62.dbamp, -60.dbamp, -58.dbamp, -56.dbamp, -54.dbamp, -52.dbamp, -49.dbamp, -45.dbamp, -43.dbamp].reverse;
//~amps = [-10.dbamp, -14.dbamp, -16.dbamp, -20.dbamp, -22.dbamp, -24.dbamp, -26.dbamp, -28.dbamp, -31.dbamp, -35.dbamp, -37.dbamp];
~bws = Array.series(12, 0.0022, -0.0001);
)
(
~bws = Array.series(12, 0.2, -0.01);
)
a = Synth(\fluteTestVer2, [\freqs, ~freqs, \amps, ~amps, \bws, ~bws]);
a.set(\amps, ~amps);

(
{
	inf.do{
		var  trigGate, dur;
		trigGate = rrand(16, 32);
		dur = (1/trigGate.value).postln;
		a = Synth(\fluteTestVer2, [\fund, [392, 588, 784, 1176].choose, \amps, ~amps, \bws, ~bws, \trigGate, trigGate, \dur, dur.value]);
		rrand(0.1, 1).wait;
	};
}.fork;
)

1/0.2
c = ~amps.plot;
c.editMode = true;
c.value;
~amps = c.value * 80;
~amps.ampdb;
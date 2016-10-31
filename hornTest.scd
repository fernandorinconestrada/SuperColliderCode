(
SynthDef(\hornTestVer2, { |trigGate = 0.5, dur = 1.8, fund = 392, freqs = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17], bws = #[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], amps = #[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], delT = 0.05, ampDel = 0.9 |
	var gate, envAtt, env, in, delay;
	gate = Impulse.ar(trigGate);
	envAtt = EnvGen.ar(Env([0,1,0.8,0], [dur*0.1, dur*0.45, dur*0.45], [6,1,-3]), gate, doneAction:2);
	env = EnvGen.ar(Env([0,1,1,0], [0.01, dur*1.4, 0.01]), gate, doneAction:2);
	//in = Mix.new(BBandPass.ar(GrayNoise.ar(1), fund*freqs, bws, amps.dbamp));
	in = Mix.new(BBandPass.ar(WhiteNoise.ar(1), fund*freqs, bws, amps.dbamp), Formant.ar(fund, 175, 250, 0.2), Formant.ar(fund, 900, 660, 0.08), Formant.ar(fund, 2300, 1400, 0.04))*envAtt;
	//in = HPF.ar(Mix.new(SinOscFB.ar(fund*freqs, bws, amps.dbamp))*env, 40);
	//in = HPF.ar(Mix.new(SinOsc.ar(fund*freqs, 0, amps) * BBandPass.ar(GrayNoise.ar(1), fund, 0.01))*env, 20);
	//in = Mix(BBandPass.ar(GrayNoise.ar(1), freqs, Rand(0.001, 0.002), amps));
	delay = DelayC.ar(in, 0.2, delT, ampDel);
	OffsetOut.ar(0, FreeVerb.ar(in, 0.8, 0.5)*env);
	OffsetOut.ar(1, FreeVerb.ar(delay, 0.8, 0.5)*env);
}).send(s);
)
(
SynthDef(\hornTestVer3, { |trigGate = 0.5, dur = 1.8, fund = 392, freqs = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], bws = #[0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0], amps = #[0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0], delT = 0.05, ampDel = 0.9 |
	var gate, envAtt, env, mixNoise, mixSinFB, mixSin, in, delay;
	gate = Impulse.ar(trigGate);
	envAtt = EnvGen.ar(Env([0,1,0.8,0], [dur*0.1, dur*0.45, dur*0.45], [6,1,-3]), gate, doneAction:2);
	//env = EnvGen.ar(Env([0,1,1,0], [0.01, dur*1.4, 0.01]), gate, doneAction:2);
	mixNoise = Mix.new(BBandPass.ar(GrayNoise.ar(1), fund*freqs, bws, amps.dbamp));
	//mixSinFB = HPF.ar(Mix.new(SinOscFB.ar(fund*freqs, bws, amps.dbamp)), 40);
	//mixSin = HPF.ar(Mix.new(SinOsc.ar(fund*freqs, 0, amps.dbamp) * BBandPass.ar(GrayNoise.ar(1), fund*freqs, bws)), 20);
	in = Mix.new(mixNoise, Formant.ar(fund, 175, 250, 0.2), Formant.ar(fund, 900, 660, 0.08), Formant.ar(fund, 2300, 1400, 0.04))*envAtt;
	//in = Mix.new(mixSinFB, Formant.ar(fund, 175, 250, 0.2), Formant.ar(fund, 900, 660, 0.08), Formant.ar(fund, 2300, 1400, 0.04))*envAtt;
	//in = Mix.new(mixSin, Formant.ar(fund, 175, 250, 0.2), Formant.ar(fund, 900, 660, 0.08), Formant.ar(fund, 2300, 1400, 0.04))*envAtt;
	delay = DelayC.ar(in, 0.2, delT, ampDel);
	OffsetOut.ar(0, FreeVerb.ar(in, 0.8, 0.5)*env);
	OffsetOut.ar(1, FreeVerb.ar(delay, 0.8, 0.5)*env);
}).send(s);
)
Env([0,1,0.8,0], [0.1, 0.45, 0.45], [6,1,-3]).plot;
(
~fund = 262;
~freqs = ~fund*(1..20);
~amps = Array.fill(20, { i = -10});
~bws = Array.series(12, 0.0002, 0.0001);
)

c = ~amps.plot(minval: -36, maxval: -6);
c.value;
~amps = c.value+10;
~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ];


a = Synth(\hornTestVer3, [\fund, 65.5, \amps, ~amps, \bws, ~bws]);
a.set(\fund, 65.5);
a.set(\fund, 131);
a.set(\fund, 262);
a.set(\bws, ~bws);
a.set(\amps, ~amps);
a.set(\delT, 0.01);

(
{
	inf.do{
		var  trigGate, dur;
		trigGate = rrand(0.2, 0.5);
		dur = (1/trigGate.value).postln;
		a = Synth(\hornTestVer3, [\fund, [65.5, 131, 65.5*1.5, 65.5*3].choose, \amps, ~amps, \bws, ~bws, \trigGate, trigGate, \dur, dur.value]);
		rrand(0.5, 5).wait;
	};
}.fork;
)

(
{
	inf.do{
		var  trigGate, dur;
		trigGate = rrand(4, 16);
		dur = (1/trigGate.value).postln;
		a = Synth(\hornTestVer3, [\fund, [65.5, 131, 65.5*1.5, 65.5*3].choose, \amps, ~amps, \bws, ~bws, \trigGate, trigGate, \dur, dur.value]);
		rrand(0.5, 5).wait;
	};
}.fork;
)

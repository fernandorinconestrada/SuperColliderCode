(
SynthDef(\trumpetTestVer3, { |trigGate = 0.5, dur = 1.8, fund = 392, freqs = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28], bws = #[0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0], amps = #[0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, 0], delT = 0.05, ampDel = 0.9 |
	var gate, envAtt, env, mixNoise, mixSinFB, mixSin, in, delay;
	//gate = Impulse.ar(trigGate);
	//envAtt = EnvGen.ar(Env([0,1,0.8,0], [dur*0.1, dur*0.45, dur*0.45], [6,1,-3]), gate, doneAction:2);
	//env = EnvGen.ar(Env([0,1,1,0], [0.01, dur*1.4, 0.01]), gate, doneAction:2);
	//mixNoise = Mix.new(BBandPass.ar(GrayNoise.ar(1), fund*freqs, bws, amps.dbamp));
	//mixSinFB = HPF.ar(Mix.new(SinOscFB.ar(fund*freqs, bws, amps.dbamp)), 40);
	mixSinFB = HPF.ar(Mix.new(SinOscFB.ar(fund*(freqs + LFNoise0.kr(20).range(fund*(-0.0001), fund*0.0001)), bws, amps.dbamp)), 40);
	//mixSin = HPF.ar(Mix.new(SinOsc.ar(fund*freqs, 0, amps.dbamp) * BBandPass.ar(GrayNoise.ar(1), fund*freqs, bws)), 20);
	//in = Mix.new(mixNoise, Formant.ar(fund, 1350, 300, 0.3), Formant.ar(fund, 2500, 1000, 0.15));
	in = Mix.new(mixSinFB, Formant.ar(fund, 1350, 300, 0.3), Formant.ar(fund, 2500, 1000, 0.15));
	//in = Mix.new(mixSin, Formant.ar(fund, 175, 250, 0.2), Formant.ar(fund, 900, 660, 0.08), Formant.ar(fund, 2300, 1400, 0.04))*envAtt;
	delay = DelayC.ar(in, 0.2, delT, ampDel);
	OffsetOut.ar(0, FreeVerb.ar(in, 0.8, 0.5));
	OffsetOut.ar(1, FreeVerb.ar(delay, 0.8, 0.5));
}).send(s);
)
(
~amps = Array.fill(28, { i = -10});
~bws = Array.series(12, 0.0002, 0.0001);
)

c = ~amps.plot(minval: -30, maxval: 0);
c.value;
~amps = c.value;
~amps = [ -12.863924050633, -5.4858657243816, -2.3056537102473, -0.079505300353357, -3.370253164557, -10.680379746835, -9.5141342756184, -12.104430379747, -14.382911392405, -15.996835443038, -14.602473498233, -15.806962025316, -13.813291139241, -15.617088607595, -14.655477031802, -13.148734177215, -19.213780918728, -16.946202531646, -21.54593639576, -19.266784452297, -24.93816254417, -26.581272084806, -27.694346289753, -27.906360424028, -26.740282685512, -27.694346289753, -28.118374558304, -28.913427561837 ];

a = Synth(\trumpetTestVer3, [\fund, 698, \amps, ~amps, \bws, ~bws]);
a.set(\fund, 698);

698*(0.0002) + 1 * 698;


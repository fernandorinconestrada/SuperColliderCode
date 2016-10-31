(
~s1 = [0, 5]; ~s2= [45, 4]; ~s3 = [90, 5]; ~s4 = [135, 5]; ~s5 = [180, 5]; ~s6 = [-135, 5]; ~s7 = [-90, 5]; ~s8= [-45, 4];
)

~varese = VBAPSpeakerArray.new(2, [0, 45, 90, 135, 180, -135, -90, -45]);
~geiringer = VBAPSpeakerArray.new(2, [45, 75, 100, 135, -135, -110, -75, -45]);

~varese.speakers[2].dump;

b = ~varese.loadToBuffer;
b = ~geiringer.loadToBuffer;

(
x = { |azi = 0, ele = 0, spr = 0|
VBAP.ar(8, PinkNoise.ar(0.2)*EnvGen.kr(Env.perc(0.01, 0.2), Impulse.kr(12)), b.bufnum, SinOsc.kr(0.2).range(-160, 160), ele, SinOsc.kr(0.1).range(20, 50));
}.scope;
)

{[45, 90, 135, 180, -135, -90, -45, 0].do({|ang| x.set(\azi, ang); 1.wait; }) }.fork;

(
SynthDef(\violoncelloInstEnvVBAP, { |decay = 0.6, durLine = 20, multPink = 1, fund = 83, parts = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], devFreq = 8, bw = 0.0001, amps = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], scaleAmp = 20, bwF1 = 200, ampF1 = 0.02, bwF2 = 400, ampF2 = 0.02, bwF3 = 420, ampF3 = 0.002, bwF4 = 1000, ampF4 = 0.002, cutOffFreq = 5000, decDel = 5, decPar = 1, level = 1, busPar = 0, busIn = 2, bufnumV|
	var scale, env, in, delay, parallel, mix, azi, mixAll;
	//azi = MouseX.kr(-180, 180, lag: 0.02).poll(label: \azi);
	scale = SinOsc.kr(Dust.kr(0.2).range(0.1, 0.3)).range(0, 0.2);
	env = EnvGen.kr(Env([0, 1.0, decay, 0], [durLine*0.16, durLine*0.42, durLine*0.41], [4, 0, -5]), 1, doneAction: 2);
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multPink), fund*parts*LFNoise0.ar(devFreq).range(0.999, 1.001), 0.0001, amps*scaleAmp)), Formant.ar(fund, fund*3, bwF1, ampF1*scale), Formant.ar(fund, fund*5, bwF2, ampF2*scale), Formant.ar(fund, fund*9, bwF3, ampF3*scale), Formant.ar(fund, fund*13, bwF4, ampF4*scale)]), cutOffFreq);
	delay = DelayN.ar(in, 0.06);
	parallel = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), decDel);
	4.do({parallel = Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))});
	//mixAll = Mix([Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))]);
	mix = Mix([LeakDC.ar(parallel, 0.995, 1*level)*env, LeakDC.ar(in, 0.995, 0.75*level)*env ]);
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, azi, 0, 0));
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, SinOsc.kr(0.1).range(-180, 180), 0, SinOsc.kr(0.05).range(20,50)));
	OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, SinOsc.kr(Dust.kr(0.5).range(0.1, 0.4)).range(-180, 180).poll, 0, SinOsc.kr(0.05).range(20,50)));
}).add;
)

a = Synth(\violoncelloInstEnvVBAP, [\bufnumV, b])
// never forget this!!!!!
(
~fundvcE1 = 83;
~partsvcE1 = (1..21) * ~fundvcE1;
~ampsvcE1 = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5, 1]-30).dbamp;
)

(
~routVCVBAP = Routine({
	1.do{
	var delta, durLine, fund, level;
		delta = rrand(7, 12);
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.6, 0.7);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.8);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.2, 0.4);
		fund = rrand(82.5, 83)*3;
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.95);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.2, 0.4);
		fund = rrand(82, 83)*2;
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(40, 60);
		level = rrand(0.3, 0.4);
		fund = rrand(55, 56);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	}
})
)

~routVCVBAP.play;
~routVCVBAP.stop;
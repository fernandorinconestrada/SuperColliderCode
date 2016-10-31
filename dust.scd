(
SynthDef(\dust, { |freqL = 440, freqR = 440.2, rateFb = 30, loAmp = 0.02, hiAmp = 0.2, rateEnv = 40|
	var envL, left, envR, right;
	envL = EnvGen.kr(Env([0, 1, 0], [0.5, 0.5], \sqr), LFNoise0.kr(rateEnv));
	envR = EnvGen.kr(Env([0, 1, 0], [0.5, 0.5], \sqr), LFNoise0.kr(rateEnv));
	left = LPF.ar(SinOscFB.ar(freqL, LFNoise2.kr(rateFb).range(0.1, 0.7), LFNoise0.kr(rateEnv).range(loAmp, hiAmp) * envL), 19000);
	right = LPF.ar(SinOscFB.ar(freqR, LFNoise2.kr(rateFb).range(0.1, 0.7), LFNoise0.kr(rateEnv).range(loAmp, hiAmp) * envR), 19000);
	OffsetOut.ar(0, HPF.ar([left, right], 50));
}).add;
)

(
SynthDef(\dustSine, { |freqL = 440, freqR = 440.2, rateFb = 30, loAmp = 0.02, hiAmp = 0.2, rateEnv = 40|
	var envL, left, envR, right;
	envL = EnvGen.kr(Env([0, 1, 0], [0.5, 0.5], \sqr), LFNoise0.kr(rateEnv));
	envR = EnvGen.kr(Env([0, 1, 0], [0.5, 0.5], \sqr), LFNoise0.kr(rateEnv));
	left = LPF.ar(SinOsc.ar(freqL, LFNoise2.kr(rateFb).range(0.1, 0.7), LFNoise0.kr(rateEnv).range(loAmp, hiAmp) * envL), 19000);
	right = LPF.ar(SinOsc.ar(freqR, LFNoise2.kr(rateFb).range(0.1, 0.7), LFNoise0.kr(rateEnv).range(loAmp, hiAmp) * envR), 19000);
	OffsetOut.ar(0, HPF.ar([left, right], 50));
}).add;
)
a = Synth(\dustSine,  [\freqL, 55, \freqR, 55, \loAmp, 0.166, \hiAmp, 0.312] );
a.set(\rateEnv, 15);
a.set(\freqR, 441);

b = Synth(\dustSine, [\freqL, 55*3, \freqR, 55.1*3, \loAmp, 0.117, \hiAmp, 0.234]);

c = Synth(\dustSine, [\freqL, 55.05*5, \freqR, 55*5, \loAmp, 0.089, \hiAmp, 0.178]);

d = Synth(\dustSine, [\freqL, 55.01*7, \freqR, 55.02*7, \loAmp, 0.067, \hiAmp, 0.134]);

e = Synth(\dustSine, [\freqL, 55*9, \freqR, 55.02*9, \loAmp, 0.053, \hiAmp, 0.106]);

f = Synth(\dustSine, [\freqL, 55*11, \freqR, 55.005*11, \loAmp, 0.04, \hiAmp, 0.08]);

g = Synth(\dustSine, [\freqL, 55.002*13, \freqR, 55.001*13, \loAmp, 0.03, \hiAmp, 0.06]);

c = Synth(\dust, [\freqL, 55.05*5, \freqR, 55*5, \loAmp, 0.02, \hiAmp, 0.1]);

d = Synth(\dust, [\freqL, 55.01*7, \freqR, 55.02*7, \loAmp, 0.02, \hiAmp, 0.04]);

e = Synth(\dust, [\freqL, 55*9, \freqR, 55.02*9, \loAmp, 0.01, \hiAmp, 0.02]);

f = Synth(\dust, [\freqL, 55*11, \freqR, 55.005*11, \loAmp, 0.1, \hiAmp, 0.2]);


{SinOsc.ar()}.play;
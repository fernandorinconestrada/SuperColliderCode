//// upper ring trios
~upRingTrioTri = [[1,2,6], [3,4,11], [7,8,0], [9,10,5]];
~upRingTrioTri2 = [[1,2,8], [3,4,9], [6,7,0], [5,10,11]];
~upRingTrioCon = [[0,1,2], [3,4,5], [6,7,8], [9,10,11]]

~midRingTrioCon = Array.series(10, [16,17,18], 3);

~loRingTrioTri = [[1,2,6], [3,4,11], [7,8,0], [9,10,5]]+49;
~loRingTrioTri2 = [[1,2,8], [3,4,9], [6,7,0], [5,10,11]]+49;
~loRingTrioCon = [[0,1,2], [3,4,5], [6,7,8], [9,10,11]]+49;

(
SynthDef(\violoncelloInstEnv, { |decay = 0.6, durLine = 20, multPink = 1, fund = 83, parts = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], devFreq = 8, bw = 0.0001, amps = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], scaleAmp = 20, bwF1 = 200, ampF1 = 0.02, bwF2 = 400, ampF2 = 0.02, bwF3 = 420, ampF3 = 0.002, bwF4 = 1000, ampF4 = 0.002, cutOffFreq = 5000, decDel = 5, decPar = 1, level = 1, busPar = 0, busIn = 2|
	var scale, env, in, delay, parallel;
	scale = SinOsc.kr(Dust.kr(0.2).range(0.1, 0.3)).range(0, 0.2);
	env = EnvGen.kr(Env([0, 1.0, decay, 0], [durLine*0.16, durLine*0.42, durLine*0.41], [4, 0, -5]), 1, doneAction: 2);
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multPink), fund*parts*LFNoise0.ar(devFreq).range(0.999, 1.001), 0.0001, amps*scaleAmp)), Formant.ar(fund, fund*3, bwF1, ampF1*scale), Formant.ar(fund, fund*5, bwF2, ampF2*scale), Formant.ar(fund, fund*9, bwF3, ampF3*scale), Formant.ar(fund, fund*13, bwF4, ampF4*scale)]), cutOffFreq);
	delay = DelayN.ar(in, 0.06);
	parallel = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), decDel);
	4.do({parallel = AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)});
	OffsetOut.ar(busPar, LeakDC.ar(parallel, 0.995, 1*level)*env);
	OffsetOut.ar(busIn, LeakDC.ar(in, 0.995, 0.75*level)*env);
}).add;
)

// never forget this!!!!!
(
~fundvcE1 = 83;
~partsvcE1 = (1..21) * ~fundvcE1;
~ampsvcE1 = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5, 1]-30).dbamp;
)
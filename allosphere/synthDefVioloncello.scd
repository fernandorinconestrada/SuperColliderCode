{
	var scale, in, delay, parallel1, parallel2, parallel3, parallel4, parallel5, parallel6, parallel7;
	scale = MouseX.kr(0,0.2);
	//scale = 0.08;
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsvcE1* LFNoise0.ar(12).range(0.999, 1.001), 0.0001, ~ampsvcE1*20)), Formant.ar(~fundvcE2, ~fundvcE2*3, 200, 0.02*scale), Formant.ar(~fundvcE1, ~fundvcE1*5,400, 0.02*scale), Formant.ar(~fundvcE1, ~fundvcE1*9, 420, 0.002*scale), Formant.ar(~fundvcE1, ~fundvcE1*13, 1000, 0.002*scale)]), 3500);
	delay = DelayN.ar(in, 0.06);
	parallel1 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel2 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel3 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel4 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel5 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel6 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel7 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	4.do({parallel1 = AllpassN.ar(parallel1, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel2 = AllpassN.ar(parallel2, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel3 = AllpassN.ar(parallel3, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel4 = AllpassN.ar(parallel4, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel5 = AllpassN.ar(parallel5, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel6 = AllpassN.ar(parallel6, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel7 = AllpassN.ar(parallel7, 0.05, [0.05.rand, 0.05.rand], 1)});
	OffsetOut.ar(0, LeakDC.ar(parallel1));
	OffsetOut.ar(2, LeakDC.ar(in*0.75));
	OffsetOut.ar(4, LeakDC.ar(parallel2));
	OffsetOut.ar(6, LeakDC.ar(in*0.75));
	OffsetOut.ar(8, LeakDC.ar(parallel3));
	OffsetOut.ar(10, LeakDC.ar(in*0.75));
	OffsetOut.ar(12, LeakDC.ar(parallel4));
	OffsetOut.ar(14, LeakDC.ar(in*0.75));
	OffsetOut.ar(16, LeakDC.ar(parallel5));
	OffsetOut.ar(18, LeakDC.ar(in*0.75));
	OffsetOut.ar(20, LeakDC.ar(parallel6));
	OffsetOut.ar(22, LeakDC.ar(in*0.75));
	OffsetOut.ar(24, LeakDC.ar(parallel7));
	OffsetOut.ar(26, LeakDC.ar(in*0.75));
}.play;

(
SynthDef(\violoncelloInst, { |multPink = 1, fund = 83, parts = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], devFreq = 12, bw = 0.0001, amps = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], scaleAmp = 20, bwF1 = 200, ampF1 = 0.02, bwF2 = 400, ampF2 = 0.02, bwF3 = 420, ampF3 = 0.002, bwF4 = 1000, ampF4 = 0.002, cutOffFreq = 3500, decDel = 5, decPar = 1, levPar = 1, levIn = 0.75, busPar = 0, busIn = 2|
	var scale, in, delay, parallel;
	scale = SinOsc.kr(Dust.kr(0.2).range(0.1, 0.3)).range(0, 0.2);
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multPink), fund*parts*LFNoise0.ar(devFreq).range(0.999, 1.001), 0.0001, amps*scaleAmp)), Formant.ar(fund, fund*3, bwF1, ampF1*scale), Formant.ar(fund, fund*5, bwF2, ampF2*scale), Formant.ar(fund, fund*9, bwF3, ampF3*scale), Formant.ar(fund, fund*13, bwF4, ampF4*scale)]), cutOffFreq);
	delay = DelayN.ar(in, 0.06);
	parallel = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), decDel);
	4.do({parallel = AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)});
	OffsetOut.ar(busPar, LeakDC.ar(parallel, 0.995, levPar));
	OffsetOut.ar(busIn, LeakDC.ar(in, 0.995, levIn));
}).add;
)

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


(
~fundvcE1 = 83;
~partsvcE1 = (1..21) * ~fundvcE1;
~ampsvcE1 = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5, 1]-30).dbamp;
)

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/violoncelloSynthDefInstOnly55hz_Take1.aif");
s.record;
s.stopRecording;

a = Synth(\violoncelloInst, [\fund, 55, \amps, ~ampsvcE1]);
a.set(\decDel, 3);
a.free;

a = Synth(\violoncelloInstEnv, [\fund, ~fundvcE1, \amps, ~ampsvcE1, \durLine, 40]);
a.free;

(
~routVC = Routine({
	1.do{
	var delta, durLine, fund, busPar, busIn, level;
		delta = rrand(7, 12);
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.6, 0.7);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([2]), \busIn, busIn.at([2]), \level, level]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.8);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([5]), \busIn, busIn.at([5]), \level, level]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82.5, 83)*3;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([1]), \busIn, busIn.at([1]), \level, level]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.95);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([6]), \busIn, busIn.at([6]), \level, level]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([3]), \busIn, busIn.at([3]), \level, level]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82, 83)*2;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([7]), \busIn, busIn.at([7]), \level, level]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([8]), \busIn, busIn.at([8]), \level, level]);
	};
	delta.yield;
	1.do{
		durLine = rrand(40, 60);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.3, 0.4);
		fund = rrand(55, 56);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([4]), \busIn, busIn.at([4]), \level, level]);
	};
	delta.yield;
	}
})
)

~routVC.play;
~routVC.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/violoncelloSynthDefRout_Take5.aif");
s.record;
s.stopRecording;

(
~routVCVer2 = Routine({
	1.do{
	var delta, durLine, fund, busPar, busIn, level, decDel, decPar;
		delta = rrand(7, 12);
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.6, 0.7);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([2]), \busIn, busIn.at([2]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.8);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([5]), \busIn, busIn.at([5]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82.5, 83)*3;
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([1]), \busIn, busIn.at([1]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.95);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([6]), \busIn, busIn.at([6]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([3]), \busIn, busIn.at([3]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82, 83)*2;
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([7]), \busIn, busIn.at([7]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([8]), \busIn, busIn.at([8]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(40, 60);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.3, 0.4);
		fund = rrand(55, 56);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([4]), \busIn, busIn.at([4]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	}
})
)

~routVCVer2.play;
~routVCVer2.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/violoncelloSynthDefRoutVer3_Take1.aif");
s.record;
s.stopRecording;

(
~routVCVer3 = Routine({
	1.do{
	var delta, durLine, fund, busPar, busIn, level, decDel, decPar;
		delta = rrand(7, 12);
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.6, 0.7);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([2]), \busIn, busIn.at([2]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.8);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([5]), \busIn, busIn.at([5]), \level, level, \decDel, decDel, \decPar, decPar]);
		0.5.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([0]), \busIn, busIn.at([0]), \level, 0.3, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82.5, 83)*3;
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([1]), \busIn, busIn.at([1]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.95);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([6]), \busIn, busIn.at([6]), \level, level, \decDel, decDel, \decPar, decPar]);
		1.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([2]), \busIn, busIn.at([2]), \level, 0.4, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([3]), \busIn, busIn.at([3]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82, 83)*2;
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([7]), \busIn, busIn.at([7]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([8]), \busIn, busIn.at([8]), \level, level, \decDel, decDel, \decPar, decPar]);
		2.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([5]), \busIn, busIn.at([5]), \level, 0.3, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(40, 60);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.3, 0.4);
		fund = rrand(55, 56);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([4]), \busIn, busIn.at([4]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	}
})
)

~routVCVer3.play;
~routVCVer3.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/violoncelloSynthDefRoutVer3_Take1.aif");
s.record;
s.stopRecording;

(
~routVCVer4 = Routine({
	1.do{
	var delta, durLine, fund, busPar, busIn, level, decDel, decPar;
		delta = rrand(7, 12);
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.6, 0.7);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([2]), \busIn, busIn.at([2]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.8);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([5]), \busIn, busIn.at([5]), \level, level, \decDel, decDel, \decPar, decPar]);
		0.5.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([0]), \busIn, busIn.at([0]), \level, 0.3, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82.5, 83)*3;
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([1]), \busIn, busIn.at([1]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.95);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([6]), \busIn, busIn.at([6]), \level, level, \decDel, decDel, \decPar, decPar]);
		1.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([2]), \busIn, busIn.at([2]), \level, 0.4, \decDel, decDel, \decPar, decPar]);
		3.yield;
		Synth(\violoncelloInstEnv, [\fund, fund*4/3, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([4]), \busIn, busIn.at([4]), \level, 0.2, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([3]), \busIn, busIn.at([3]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.2, 0.4);
		fund = rrand(82, 83)*2;
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([7]), \busIn, busIn.at([7]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([8]), \busIn, busIn.at([8]), \level, level, \decDel, decDel, \decPar, decPar]);
		2.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([5]), \busIn, busIn.at([5]), \level, 0.3, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	1.do{
		durLine = rrand(40, 60);
		busPar = [0,3,6,9,12,15,18,21,24,27];
		busIn = [2,5,8,11,14,17,20,23,26,30];
		level = rrand(0.3, 0.4);
		fund = rrand(55, 56);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, busPar.at([4]), \busIn, busIn.at([4]), \level, level, \decDel, decDel, \decPar, decPar]);
	};
	delta.yield;
	}
})
)

~routVCVer4.play;
~routVCVer4.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/violoncelloSynthDefRoutVer4_Take2.aif");
s.record;
s.stopRecording;
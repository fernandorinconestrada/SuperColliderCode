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
SynthDef(\violoncelloInstEnv, { |decay = 0.6, durLine = 20, multPink = 1, fund = 83, parts = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], devFreq = 8, bw = 0.0001, amps = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], scaleAmp = 20, bwF1 = 200, ampF1 = 0.02, bwF2 = 400, ampF2 = 0.02, bwF3 = 420, ampF3 = 0.002, bwF4 = 1000, ampF4 = 0.002, cutOffFreq = 5000, decDel = 5, decPar = 1, level = 1, busPar = 0, busIn = 2, envDur = #[0.16, 0.42, 0.41], curve = #[4, 0, -5]|
	var scale, env, in, delay, parallel;
	scale = SinOsc.kr(Dust.kr(0.2).range(0.1, 0.3)).range(0, 0.2);
	env = EnvGen.kr(Env([0, 1.0, decay, 0], envDur*durLine, curve), 1, doneAction: 2);
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multPink), fund*parts*LFNoise0.ar(devFreq).range(0.999, 1.001), 0.0001, amps*scaleAmp)), Formant.ar(fund, fund*3, bwF1, ampF1*scale), Formant.ar(fund, fund*5, bwF2, ampF2*scale), Formant.ar(fund, fund*9, bwF3, ampF3*scale), Formant.ar(fund, fund*13, bwF4, ampF4*scale)]), cutOffFreq);
	delay = DelayN.ar(in, 0.06);
	parallel = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), decDel);
	4.do({parallel = AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)});
	SendTrig.kr(Impulse.kr(1), 0, fund);
	OffsetOut.ar(busPar, LeakDC.ar(parallel, 0.995, 1*level)*env);
	OffsetOut.ar(busIn, LeakDC.ar(in, 0.995, 0.75*level)*env);

	o = OSCFunc({ arg msg, time; [time, msg].postln;},'/tr', s.addr);
}).add;
)
/////Env types
(
//Env([0, 1.0, 0.6, 0], [0.16, 0.42, 0.41], [5, 0, -6]).plot;
~dec1 = [0.16, 0.42, 0.41]; ~cur1 = [5, 0, -6];
//Env([0, 1.0, 0.6, 0], [0.16, 0.35, 0.48], [4, 0, -5]).plot;
~dec2 = [0.16, 0.42, 0.41]; ~cur2 = [4, 0, -5];
//Env([0, 1.0, 0.6, 0], [0.35, 0.16, 0.48], [4, -4, -5]).plot;
~dec3 = [0.35, 0.16, 0.48]; ~cur3 = [4, -4, -5];
//Env([0, 1.0, 0.6, 0], [0.48, 0.16, 0.35], [5, -4, -6]).plot;
~dec4 = [0.48, 0.16, 0.35]; ~cur4 = [4, -4, -5];
//Env([0, 1.0, 0.6, 0], [0.48, 0.16, 0.35], [4, -4, -5]).plot;
~dec5 = [0.48, 0.16, 0.35]; ~cur5 = [4, -4, -5];
~decs = [~dec1, ~dec2, ~dec3, ~dec4, ~dec5];
~curves = [~cur1, ~cur2, ~cur3, ~cur4, ~cur5];
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
0.7*1
(
~miniRoutVC = Routine({
5.do{
	var delta, durLine, fund, busPar, busIn, level, deltaDel, scale, decDel, decPar;
		delta = rrand(17, 19);
		level = rrand(0.3, 0.7);
	1.do{
		durLine = rrand(5, 13);
		deltaDel = rrand(0.02, 0.04);
		fund = rrand(82, 83);
		scale = rrand(0.8, 1.1);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level*scale, \envDur, ~decs.choose, \curves, ~curves.choose, \decDel, decDel, \decPar, decPar]);
		deltaDel.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level*scale, \envDur, ~decs.choose, \curves, ~curves.choose, \decDel, decDel, \decPar, decPar]);
		};
	0.5.rrand(2.0).yield;
	2.do{
		durLine = rrand(7, 17);
		deltaDel = rrand(0.02, 0.04);
		fund = rrand(82, 83);
		scale = rrand(0.8, 1.1);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level*scale, \envDur, ~decs.choose, \curves, ~curves.choose]);
		deltaDel.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level*scale, \envDur, ~decs.choose, \curves, ~curves.choose]);
		deltaDel.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level*scale, \envDur, ~decs.choose, \curves, ~curves.choose]);
		deltaDel.yield;
		};
	delta.yield;
	}
})
)

~miniRoutVC.play;
~miniRoutVC.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/VBAPIndGestures/miniRoutVer1/miniRoutVC_extendedGaps_Take5.aif");
s.record;
s.stopRecording;

(
~miniRoutVCVer2 = Routine({
	10.do{
	var delta, durLine, fund, busPar, busIn, level, deltaDel, decDel, decPar;
		delta = rrand(7, 12);
	1.do{
		durLine = rrand(11, 17);
		level = rrand(0.6, 0.7);
		deltaDel = rrand(0.02, 0.04);
		fund = rrand(82, 83);
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level, \envDur, ~decs.choose, \curves, ~curves.choose]);
		deltaDel.yield;
		Synth(\violoncelloInstEnv, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level, \envDur, ~decs.choose, \curves, ~curves.choose]);
	};
	delta.yield;
	}
})
)

~miniRoutVCVer2.play;
~miniRoutVCVer2.stop;

(
~miniRoutVCVer3 = Routine({
	10.do{
	var delta, durLine, fund, busPar, busIn, level, deltaDel, decDel, decPar;
		delta = rrand(7, 12);
	1.do{
		durLine = rrand(11, 17);
		level = rrand(0.6, 0.7);
		deltaDel = rrand(0.02, 0.04);
		fund = rrand(82, 83)*[1,3,6,7,9,11];
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund.choose, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level, \envDur, ~decs.choose, \curves, ~curves.choose]);
		deltaDel.yield;
		Synth(\violoncelloInstEnv, [\fund, fund.choose, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level, \envDur, ~decs.choose, \curves, ~curves.choose]);
	};
	delta.yield;
	}
})
)

~miniRoutVCVer3.play;
~miniRoutVCVer3.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/violoncelloSynthDefRout_Take5.aif");
s.record;
s.stopRecording;

(
~miniRoutVCVer4 = Routine({
	10.do{
	var delta, durLine, fund, busPar, busIn, level, deltaDel, decDel, decPar;
		delta = rrand(7, 12);
		level = rrand(0.2, 0.7);
	1.do{
		durLine = rrand(11, 17);
		deltaDel = rrand(0.02, 0.04);
		fund = rrand(82, 83)*[1,3,6,7,9,11];
		decDel = rrand(4,8);
		decPar = rrand(0.5, 2);
		Synth(\violoncelloInstEnv, [\fund, fund.choose, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level, \envDur, ~decs.choose, \curves, ~curves.choose]);
		deltaDel.yield;
		Synth(\violoncelloInstEnv, [\fund, fund.choose, \amps, ~ampsvcE1, \durLine, durLine, \busPar, 0, \busIn, 2, \level, level, \envDur, ~decs.choose, \curves, ~curves.choose]);
	};
	delta.yield;
	}
})
)

~miniRoutVCVer4.play;
~miniRoutVCVer4.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/EndRoutine/miniRoutVCVer4_Take6.aif");
s.record;
s.stopRecording;



(
SynthDef(\harmonGrainEnv, { |dur = 15, att = 0.01, dec = 0.49, rel = 0.49, rateRand = 20, decay = 0.1, attack1 = 0.01, multPart1 = 2.0, fund = 55, multFreq1 = 4, multFreq2 = 8, lobw = 0.001, hibw = 0.005, rateAmp1 = 8, loAmp1 = 0.5, hiAmp1 = 0.8, attack2 = 0.01, multPart2 = 1.5, multFreq3 = 6, multFreq4 = 6, rateAmp2 =7, loAmp2 = 0.4, hiAmp2 = 0.7, attack3 = 0.01, multPart3 =1.5, multFreq5 = 15, multFreq6 = 15, rateAmp3 =6, loAmp3 = 0.3, hiAmp3 = 0.5, mixRevIn = 0.4, delT = 0.07, mixRevDel = 0.4, loAmpDel = 0.5, hiAmpDel = 0.75|
	var rand, partial1, partial2, partial3, in, env;
	//env = EnvGen.kr(Env([0,1,0], [dur*att, dur*dec, dur*rel], [-2, -1, -3]), 1, doneAction:2);
	env = EnvGen.kr(Env([0,1,0], [dur*0.5, dur*0.5], [-30, 30]));
	rand = LFNoise0.kr(rateRand);
	partial1 = Decay2.ar(Impulse.ar(1/decay), attack1, decay, BBandPass.ar(WhiteNoise.ar(multPart1), rand.range(fund*multFreq1, (fund*multFreq2)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp1).range(loAmp1, hiAmp1)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), attack2, (decay+1), BBandPass.ar(WhiteNoise.ar(multPart2), rand.range(fund*multFreq3, (fund*multFreq4)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp2).range(loAmp2, hiAmp2)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), attack3, (decay+2), BBandPass.ar(WhiteNoise.ar(multPart3), rand.range(fund*multFreq5, (fund*multFreq6)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp3).range(loAmp3, hiAmp3)));
	in = Mix.new([partial1, partial2, partial3])*env;
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(in, rand.range(-1.0, 1.0)), mixRevIn));
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, delT, rand.range(loAmpDel, hiAmpDel)), rand.range(1.0, -1.0)), mixRevDel))
}).add;
)

(
SynthDef(\harmonGrainEnv1, { |dur = 15, att = 0.001, dec = 0.969, rel = 0.019, rateRand = 20, decay = 0.1, attack1 = 0.01, multPart1 = 2.0, fund = 55, multFreq1 = 4, multFreq2 = 8, lobw = 0.001, hibw = 0.005, rateAmp1 = 8, loAmp1 = 0.5, hiAmp1 = 0.8, attack2 = 0.01, multPart2 = 1.5, multFreq3 = 6, multFreq4 = 6, rateAmp2 =7, loAmp2 = 0.4, hiAmp2 = 0.7, attack3 = 0.01, multPart3 =1.5, multFreq5 = 15, multFreq6 = 15, rateAmp3 =6, loAmp3 = 0.3, hiAmp3 = 0.5, mixRevIn = 0.4, delT = 0.07, mixRevDel = 0.4, loAmpDel = 0.5, hiAmpDel = 0.75|
	var rand, partial1, partial2, partial3, in, env, inComp;
	env = EnvGen.kr(Env([0,1,1,0], [dur*att, dur*dec, dur*rel], [-2, -1, -4]), 1, doneAction:2);
	//env = EnvGen.kr(Env([0,1,0], [dur*0.5, dur*0.5], [-30, 30]));
	rand = LFNoise0.kr(rateRand);
	partial1 = Decay2.ar(Impulse.ar(1/decay), attack1, decay, BBandPass.ar(WhiteNoise.ar(multPart1), rand.range(fund*multFreq1, (fund*multFreq2)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp1).range(loAmp1, hiAmp1)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), attack2, (decay+1), BBandPass.ar(WhiteNoise.ar(multPart2), rand.range(fund*multFreq3, (fund*multFreq4)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp2).range(loAmp2, hiAmp2)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), attack3, (decay+2), BBandPass.ar(WhiteNoise.ar(multPart3), rand.range(fund*multFreq5, (fund*multFreq6)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp3).range(loAmp3, hiAmp3)));
	in = Mix.new([partial1, partial2, partial3])*env;
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(in, rand.range(-1.0, 1.0)), mixRevIn));
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, delT, rand.range(loAmpDel, hiAmpDel)), rand.range(1.0, -1.0)), mixRevDel))
}).add;
)

(
SynthDef(\harmonGrainEnv1Comp, { |dur = 15, att = 0.001, dec = 0.969, rel = 0.019, rateRand = 20, decay = 0.1, attack1 = 0.01, multPart1 = 2.0, fund = 55, multFreq1 = 4, multFreq2 = 8, lobw = 0.001, hibw = 0.005, rateAmp1 = 8, loAmp1 = 0.5, hiAmp1 = 0.8, attack2 = 0.01, multPart2 = 1.5, multFreq3 = 6, multFreq4 = 6, rateAmp2 =7, loAmp2 = 0.4, hiAmp2 = 0.7, attack3 = 0.01, multPart3 =1.5, multFreq5 = 15, multFreq6 = 15, rateAmp3 =6, loAmp3 = 0.3, hiAmp3 = 0.5, mixRevIn = 0.4, delT = 0.07, mixRevDel = 0.4, loAmpDel = 0.5, hiAmpDel = 0.75|
	var rand, partial1, partial2, partial3, in, env, inComp;
	env = EnvGen.kr(Env([0,1,1,0], [dur*att, dur*dec, dur*rel], [-2, -1, -4]), 1, doneAction:2);
	//env = EnvGen.kr(Env([0,1,0], [dur*0.5, dur*0.5], [-30, 30]));
	rand = LFNoise0.kr(rateRand);
	partial1 = Decay2.ar(Impulse.ar(1/decay), attack1, decay, BBandPass.ar(WhiteNoise.ar(multPart1), rand.range(fund*multFreq1, (fund*multFreq2)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp1).range(loAmp1, hiAmp1)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), attack2, (decay+1), BBandPass.ar(WhiteNoise.ar(multPart2), rand.range(fund*multFreq3, (fund*multFreq4)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp2).range(loAmp2, hiAmp2)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), attack3, (decay+2), BBandPass.ar(WhiteNoise.ar(multPart3), rand.range(fund*multFreq5, (fund*multFreq6)+10), rand.range(lobw, hibw), SinOsc.kr(rateAmp3).range(loAmp3, hiAmp3)));
	in = Mix.new([partial1, partial2, partial3])*env;
	inComp = Compander.ar(in, in, -10.dbamp, 0.5, 1.5);
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(inComp, rand.range(-1.0, 1.0)), mixRevIn));
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(DelayC.ar(inComp, 0.2, delT, rand.range(loAmpDel, hiAmpDel)), rand.range(1.0, -1.0)), mixRevDel))
}).add;
)

(
SynthDef(\revFX, { |roomsize = 3, revtime = 0.75, damping = 0.5, inputbw = 0.5, spread = 10, drylevel = 1, earlyref = 0.5, taillevel = 0.75|
	var in, rev;
	in = In.ar(0, 2);
	rev = GVerb.ar(in, roomsize, revtime, damping, inputbw,spread, drylevel, earlyref, taillevel);
	OffsetOut.ar(0, rev);
}).add;
)

a = Synth(\harmonGrainEnv);
b = Synth(\harmonGrainEnv1);

Env([0,1,1,0], [0.01, 0.975, 0.014], [-2, 1, -3]).plot
Env([0,1,0], [0.49, 0.49], [-30,30]).plot


(
~routHarmoGrainEnv = Routine({
	1.do{
	a = Synth(\harmonGrainEnv, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 20]);
	0.05.yield;
	b =Synth(\harmonGrainEnv, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 19.5]);
	}
})
)

~routHarmoGrainEnv.play;

(
~routHarmoGrainEnv1 = Routine({
	1.do{
	a = Synth(\harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 17]);
	0.05.yield;
	b =Synth(\harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 16.5]);
	};
	19.yield;
	1.do{
	a = Synth(\harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.5, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 15.3]);
	0.02.yield;
	b =Synth(\harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 14.7]);
	};
	17.yield;
	1.do{
	a = Synth(\harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.25, \multFreq3, 5, \multFreq4, 5.2, \multFreq5, 120, \multFreq6, 130, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 20]);
	0.01.yield;
	b =Synth(\harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 19.5]);
	};
})
)

~routHarmoGrainEnv1.play;

(
~routHarmoGrainEnv1Comp = Routine({
	1.do{
	a = Synth(\harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 17]);
	0.05.yield;
	b =Synth(\harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 16.5]);
	};
	19.yield;
	1.do{
	a = Synth(\harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.5, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 15.3]);
	0.02.yield;
	b =Synth(\harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 14.7]);
	};
	17.yield;
	1.do{
	a = Synth(\harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.25, \multFreq3, 5, \multFreq4, 5.2, \multFreq5, 120, \multFreq6, 130, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 20]);
	0.01.yield;
	b =Synth(\harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 19.5]);
	};
})
)

~routHarmoGrainEnv1Comp.play;

(
~routHarmoGrainEnv1CompFX = Routine({
	var fxsynth;
	fxsynth = Synth(\revFX);
	1.do{
	a = Synth.before(fxsynth, \harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 17]);
	0.05.yield;
	b =Synth.before(fxsynth, \harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 16.5]);
	};
	19.yield;
	1.do{
	a = Synth.before(fxsynth, \harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.5, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 15.3]);
	0.02.yield;
	b =Synth.before(fxsynth, \harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 14.7]);
	};
	17.yield;
	1.do{
	a = Synth.before(fxsynth, \harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.25, \multFreq3, 5, \multFreq4, 5.2, \multFreq5, 120, \multFreq6, 130, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 20]);
	0.01.yield;
	b =Synth.before(fxsynth, \harmonGrainEnv1Comp, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 19.5]);
	};
})
)

~routHarmoGrainEnv1CompFX.play;

(
~routHarmoGrainEnv1FX = Routine({
	var fxsynth;
	fxsynth = Synth(\revFX);
	1.do{
	a = Synth.before(fxsynth, \harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 17]);
	0.05.yield;
	b =Synth.before(fxsynth, \harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 16.5]);
	};
	19.yield;
	1.do{
	a = Synth.before(fxsynth, \harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.5, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 15.3]);
	0.02.yield;
	b =Synth.before(fxsynth, \harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 14.7]);
	};
	17.yield;
	1.do{
	a = Synth.before(fxsynth, \harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2.25, \multFreq3, 5, \multFreq4, 5.2, \multFreq5, 120, \multFreq6, 130, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 20]);
	0.01.yield;
	b =Synth.before(fxsynth, \harmonGrainEnv1, [\decay, 0.1, \multFreq1, 2, \multFreq2, 2, \multFreq3, 5, \multFreq4, 5, \multFreq5, 120, \multFreq6, 120, \loAmp1, 0.4, \hiAmp1, 0.6, \loAmp2, 0.1, \hiAmp2, 0.3, \loAmp3, 0.05, \hiAmp3, 0.1, \mixRevIn, 0.33, \mixRevDel, 0.33, \delT, 0.05, \multPart1, 3, \dur, 19.5]);
	};
})
)

~routHarmoGrainEnv1FX.play;
o = Server.local.options;
o.memSize = 180*8192;
o.memSize;
o.numOutputBusChannels = 2;

{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*37, (55*37)+10), LFNoise0.kr(17).range(55*41, (55*41)+10), LFNoise0.kr(11).range(55*43, (55*43)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/3).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(7.3))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(1.0, -1.0)), 7, 5));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.05, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(-1.0, 1.0)), 7, 5));
}.play;

(
SynthDef(\fryingPan, { |ratePan = 20, rateFreq1 = 17, freq1 = 880, rateFreq2 = 19, freq2 = 935, rateFreq3 = 23, freq3 = 1045, lobw = 0.008, hibw = 0.01, rateCycleDur = 0.3333, loDur = 0.01, hiDur = 0.03, rateDens = 5.3, delT = 0.4, leftPan = 1.0, rightPan = -1.0, leftDel = -1.0, rightDel = 1.0, loLevPanDel = 0.5, hiLevPanDel = 0.8, roomsize = 10, revtime = 3|
	var randPan, white, freqArray, cycleDur, grainLevel, attackDens, in, del;
	randPan = LFNoise0.kr(ratePan);
	white = WhiteNoise.ar(LFNoise0.ar(19).range(0.5,1.0));
	freqArray = [LFNoise0.kr(rateFreq1).range(freq1, freq1+10), LFNoise0.kr(rateFreq2).range(freq2, freq2+10), LFNoise0.kr(rateFreq3).range(freq3, freq3+10)];
	cycleDur = SinOsc.kr(rateCycleDur).range(loDur, hiDur).poll;
	grainLevel = randPan.range(0.2, 0.3);
	attackDens = Impulse.kr(rateDens);
	in = Mix(BBandPass.ar(white, freqArray, randPan.range(lobw, hibw), EnvGen.kr(Env.perc(0.001, cycleDur, grainLevel), attackDens)));
	del = DelayC.ar(in, 0.2, delT, LFNoise0.kr(20).range(0.5, 0.8));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, randPan.range(leftPan, rightPan), roomsize, revtime)));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(del, randPan.range(leftDel, rightDel), randPan.range(loLevPanDel, hiLevPanDel)), roomsize, revtime))
}).add;
)
(
a = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*16, \rateFreq2, 17, \freq2, 55*17, \rateFreq3, 19, \freq3, 55*19, \rateCycleDur, 1/5, \rateDens, 11, \delT, 0.04]);
b = Synth(\fryingPan, [\ratePan, 17, \rateFreq1, 19, \freq1, 55*23, \rateFreq2, 23, \freq2, 55*29, \rateFreq3, 17, \freq3, 55*31, \rateDens, 13, \rateCycleDur, 1/4, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.06]);
c = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*37, \rateFreq2, 17, \freq2, 55*41, \rateFreq3, 11, \freq3, 55*43, \rateDens, 7, \rateCycleDur, 1/3, \leftPan, 1.0, \rightPan, -1.0, \leftDel, -1.0, \rightDel, 1.0, \delT, 0.05]);
//d = Synth(\fryingPan, [\rateFreq1, 11, \freq1, 55*47, \freq2, 55*51, \rateFreq2, 17, \freq3, 55*53, \rateFreq3, 19, \rateDens, 11.1, \rateCycleDur, 1/7, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.07]);
)

(
a = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*16, \rateFreq2, 17, \freq2, 55*17, \rateFreq3, 19, \freq3, 55*19, \rateCycleDur, 1/5, \rateDens, 10, \delT, 0.04]);
b = Synth(\fryingPan, [\ratePan, 17, \rateFreq1, 19, \freq1, 55*23, \rateFreq2, 23, \freq2, 55*29, \rateFreq3, 17, \freq3, 55*31, \rateDens, 12, \rateCycleDur, 1/4, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.06]);
c = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*37, \rateFreq2, 17, \freq2, 55*41, \rateFreq3, 11, \freq3, 55*43, \rateDens, 6, \rateCycleDur, 1/3, \leftPan, 1.0, \rightPan, -1.0, \leftDel, -1.0, \rightDel, 1.0, \delT, 0.05]);
//d = Synth(\fryingPan, [\rateFreq1, 11, \freq1, 55*47, \freq2, 55*51, \rateFreq2, 17, \freq3, 55*53, \rateFreq3, 19, \rateDens, 11.1, \rateCycleDur, 1/7, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.07]);
)

a.free;
b.free;
c.free;
d.free;

(
a = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*16, \rateFreq2, 17, \freq2, 55*17, \rateFreq3, 19, \freq3, 55*19, \rateCycleDur, 1/5, \rateDens, 10, \delT, 0.04, \leftPan, -1.0, \rightPan, 0.5, \leftDel, -0.5, \rightDel, -1.0,]);
b = Synth(\fryingPan, [\ratePan, 17, \rateFreq1, 19, \freq1, 55*23, \rateFreq2, 23, \freq2, 55*29, \rateFreq3, 17, \freq3, 55*31, \rateDens, 12, \rateCycleDur, 1/4, \leftPan, -0.5, \rightPan, 0.0, \leftDel, 0.0, \rightDel, 0.5, \delT, 0.06]);
c = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*37, \rateFreq2, 17, \freq2, 55*41, \rateFreq3, 11, \freq3, 55*43, \rateDens, 6, \rateCycleDur, 1/3, \leftPan, -1.0, \rightPan, 0, \leftDel, 0, \rightDel, 1.0, \delT, 0.05]);
d = Synth(\fryingPan, [\ratePan, 13, \rateFreq1, 11, \freq1, 55*47, \rateFreq2, 13, \freq2, 55*51, \rateFreq3, 17,\freq3, 55*53, \rateDens, 7, \rateCycleDur, 1/7, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.07]);
)

(
e = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*8, \rateFreq2, 17, \freq2, 55*8.5, \rateFreq3, 19, \freq3, 55*9.5, \rateCycleDur, 1/5, \rateDens, 10, \delT, 0.04, \leftPan, -1.0, \rightPan, 0.5, \leftDel, -0.5, \rightDel, -1.0,]);
f = Synth(\fryingPan, [\ratePan, 17, \rateFreq1, 19, \freq1, 55*11.5, \rateFreq2, 23, \freq2, 55*14.5, \rateFreq3, 17, \freq3, 55*15.5, \rateDens, 12, \rateCycleDur, 1/4, \leftPan, -0.5, \rightPan, 0.0, \leftDel, 0.0, \rightDel, 0.5, \delT, 0.06]);
g = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*18.5, \rateFreq2, 17, \freq2, 55*20.5, \rateFreq3, 11, \freq3, 55*22.5, \rateDens, 6, \rateCycleDur, 1/3, \leftPan, -1.0, \rightPan, 0, \leftDel, 0, \rightDel, 1.0, \delT, 0.05]);
h = Synth(\fryingPan, [\ratePan, 13, \rateFreq1, 11, \freq1, 55*23.5, \rateFreq2, 13, \freq2, 55*25.5, \rateFreq3, 17,\freq3, 55*21.5, \rateDens, 7, \rateCycleDur, 1/7, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.07]);
)

(
~routFryPan = Routine({
	1.do{
		a = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*16, \rateFreq2, 17, \freq2, 55*17, \rateFreq3, 19, \freq3, 55*19, \rateCycleDur, 1/5, \rateDens, 10, \delT, 0.04, \leftPan, -1.0, \rightPan, 0.5, \leftDel, -0.5, \rightDel, -1.0,]);
b = Synth(\fryingPan, [\ratePan, 17, \rateFreq1, 19, \freq1, 55*23, \rateFreq2, 23, \freq2, 55*29, \rateFreq3, 17, \freq3, 55*31, \rateDens, 12, \rateCycleDur, 1/4, \leftPan, -0.5, \rightPan, 0.0, \leftDel, 0.0, \rightDel, 0.5, \delT, 0.06]);
c = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*37, \rateFreq2, 17, \freq2, 55*41, \rateFreq3, 11, \freq3, 55*43, \rateDens, 6, \rateCycleDur, 1/3, \leftPan, -1.0, \rightPan, 0, \leftDel, 0, \rightDel, 1.0, \delT, 0.05]);
d = Synth(\fryingPan, [\ratePan, 13, \rateFreq1, 11, \freq1, 55*47, \rateFreq2, 13, \freq2, 55*51, \rateFreq3, 17,\freq3, 55*53, \rateDens, 7, \rateCycleDur, 1/7, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.07]);
	};
	23.yield;
	1.do{
		e = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*8, \rateFreq2, 17, \freq2, 55*8.5, \rateFreq3, 19, \freq3, 55*9.5, \rateCycleDur, 1/5, \rateDens, 10, \delT, 0.04, \leftPan, -1.0, \rightPan, 0.5, \leftDel, -0.5, \rightDel, -1.0,]);
f = Synth(\fryingPan, [\ratePan, 17, \rateFreq1, 19, \freq1, 55*11.5, \rateFreq2, 23, \freq2, 55*14.5, \rateFreq3, 17, \freq3, 55*15.5, \rateDens, 12, \rateCycleDur, 1/4, \leftPan, -0.5, \rightPan, 0.0, \leftDel, 0.0, \rightDel, 0.5, \delT, 0.06]);
g = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*18.5, \rateFreq2, 17, \freq2, 55*20.5, \rateFreq3, 11, \freq3, 55*22.5, \rateDens, 6, \rateCycleDur, 1/3, \leftPan, -1.0, \rightPan, 0, \leftDel, 0, \rightDel, 1.0, \delT, 0.05]);
h = Synth(\fryingPan, [\ratePan, 13, \rateFreq1, 11, \freq1, 55*23.5, \rateFreq2, 13, \freq2, 55*25.5, \rateFreq3, 17,\freq3, 55*21.5, \rateDens, 7, \rateCycleDur, 1/7, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.07]);
	};
	37.yield;
	1.do{
i = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*4, \rateFreq2, 17, \freq2, 55*4.25, \rateFreq3, 19, \freq3, 55*(9.5/2), \rateCycleDur, 1/5, \rateDens, 10, \delT, 0.04, \leftPan, -1.0, \rightPan, 0.5, \leftDel, -0.5, \rightDel, -1.0, \hiDur, 0.23]);
j = Synth(\fryingPan, [\ratePan, 17, \rateFreq1, 19, \freq1, 55*(11.5)/2, \rateFreq2, 23, \freq2, 55*(14.5)/2, \rateFreq3, 17, \freq3, 55*(15.5)/2, \rateDens, 12, \rateCycleDur, 1/4, \leftPan, -0.5, \rightPan, 0.0, \leftDel, 0.0, \rightDel, 0.5, \delT, 0.06,\hiDur, 0.19]);
k = Synth(\fryingPan, [\ratePan, 19, \rateFreq1, 23, \freq1, 55*(18.5)/2, \rateFreq2, 17, \freq2, 55*(20.5)/2, \rateFreq3, 11, \freq3, 55*(22.5)/2, \rateDens, 6, \rateCycleDur, 1/3, \leftPan, -1.0, \rightPan, 0, \leftDel, 0, \rightDel, 1.0, \delT, 0.05, \hiDur, 0.17]);
l = Synth(\fryingPan, [\ratePan, 13, \rateFreq1, 11, \freq1, 55*(23.5)/2, \rateFreq2, 13, \freq2, 55*(25.5)/2, \rateFreq3, 17,\freq3, 55*(21.5)/2, \rateDens, 7, \rateCycleDur, 1/7, \leftPan, -1.0, \rightPan, 1.0, \leftDel, 1.0, \rightDel, -1.0, \delT, 0.07, \hiDur, 0.29]);
	}
})
)

~routFryPan.play;

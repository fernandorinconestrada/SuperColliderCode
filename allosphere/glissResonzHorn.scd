(
SynthDef(\glissResonz, { |durLine = 10, gate = 1, multPink = 1.5, startFreq = 55, endFreq = 5280, bw = 0.001, rateAmpMod = 0.2666,  loAmp = 0.8, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.7, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, busS = 9, busD = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(PinkNoise.ar(multPink), XLine.kr(startFreq, endFreq, durLine), bw, SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busS, FreeVerb.ar(source, mix, room, damp));
	OffsetOut.ar(busD, FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev));
}).add;
)

(
SynthDef(\glissResonzStereo, { |durLine = 10, gate = 1, multPink = 1.5, startFreq = 55, endFreq = 5280, bw = 0.0008, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, busS = 9, busD = 1, posS = 0, posD = 0|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(PinkNoise.ar(multPink), XLine.kr(startFreq, endFreq, durLine), bw, SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(0, Pan2.ar(FreeVerb.ar(source, mix, room, damp), posS));
	OffsetOut.ar(0, Pan2.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev), posD));
}).add;
)

(2/22)*(0..22) - 1.0;
a = Synth(\glissResonz);
(
~fund = (0..20)*0.1+54;
~freq= (1..24)*~fund;
//~bus = (0..22);
//~bus1 = (0..22).scramble;
~posS = (2/22)*(0..22) - 1.0;
~posD = (2/22)*(0..22) - 1.0;
)

(
~routGlisResonz = Routine({
	var delta, durLine, rateRand;
	30.do{
		delta = rrand(1, 3);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		Synth(\glissResonz, [\startFreq, ~fund.choose, \endFreq, ~freq.choose, \busS, ~bus.choose, \busD, ~bus1.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose]);
		delta.yield;
	};
	45.do{
		delta = rrand(0.5, 1.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		Synth(\glissResonz, [\startFreq, ~fund.choose, \endFreq, ~freq.choose, \busS, ~bus.choose, \busD, ~bus1.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose]);
		delta.yield;
	};
})
)

~routGlisResonz.play;

(
~routGlisResonzSt = Routine({
	var delta, durLine, rateRand, loAmp, hiAmp, delT;
	20.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		Synth(\glissResonzStereo, [\startFreq, ~fund.choose, \endFreq, ~freq.choose, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose]);
		delta.yield;
	};
	45.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		Synth(\glissResonzStereo, [\startFreq, ~fund.choose, \endFreq, ~freq.choose, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose]);
		delta.yield;
	};
	110.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		Synth(\glissResonzStereo, [\startFreq, ~fund.choose, \endFreq, ~freq.choose, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose]);
		delta.yield;
	};
})
)

~routGlisResonzSt.play;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/glissResonzRoutStereo_Take7.aif");
s.record;
s.stopRecording;
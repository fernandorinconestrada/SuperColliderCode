(
SynthDef(\glissResonzStVer2, { |durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, busS = 9, busD = 1, posS = 0, posD = 0, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(source, mix, room, damp), posS)));
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev), posD)));
}).add;
)
(
SynthDef(\glissClarinetTest, { |durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT1 = 0.04, delT2 = 0.05, delT3 = 0.06, delT4 = 0.07, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, posS = 0, posD = 0, amp = 1, partsB2 = #[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19], ampsB2 = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], factor = 5|
	var source, env, deviation;
	deviation = LFNoise0.kr(12).range(0.999, 1.001);
	//env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	env = EnvGen.ar(Env([0,1,0], [durLine*0.2, durLine*0.8], [5, -3]), gate, doneAction:2);
	//source = Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB2*SinOsc.kr(4).range(0.999, 1.001), 0.0001, (~ampsB2*LFNoise0.kr(12).range(0.9, 1.0))*20))* env;
	source =  LPF.ar(Mix.new(BBandPass.ar(PinkNoise.ar(multPink), XLine.kr(partsB2*deviation, ((partsB2*factor)*deviation).clip(55, 19000), durLine, doneAction:2), bw, ampsB2*LFNoise0.kr(12).range(0.9, 0.99))), 19000)*env;
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(source, mix, room, damp), posS)));
	//OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev), posD)));
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(Mix.new(DelayC.ar(source, 0.1, [delT1, delT2, delT3, delT4], ampDel), mixDelRev, roomDelRev, dampDelRev)), posD)));
}).add;
)
Env([0,1,0], [0.2, 1.0], [5,-3]).plot;
(
~fundB2 = 55;
~partsB2 = ~fundB2 * (1..19);
//~ampsB2 = [30, 23, 25, 19.5, 24, 19.3, 18.7, 21, 18, 20, 17, 19.5, 10, 14, 15, 14, 5, 6.5, 5].normalizeSum;
~ampsB2 = ([30, 23, 25, 19.5, 24, 19.3, 18.7, 21, 18, 20, 17, 19.5, 10, 14, 15, 14, 5, 6.5, 5]-30).dbamp;
~posS = (2/22)*(0..22) - 1.0;
~posD = (2/22)*(0..22) - 1.0;
)

(
~fundG3 = 392;
~partsG3 = ~fundG3 * (1..12);
~ampsG3 = ([30, 27, 22, 20.5, 19.7, 18.8, 17, 15, 13, 10.5, 7, 3]-30).dbamp;
~posS = (2/22)*(0..22) - 1.0;
~posD = (2/22)*(0..22) - 1.0;
)
 a = Synth(\glissClarinetTest, [\partsB2, ~partsB2, \ampsB2, ~ampsB2])

(
~routGlissClar = Routine({
	var delta, durLine, factor, fund, parts, delT1, delT2, delT3, delT4;
	20.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 25);
		factor = rrand(1,7);
		fund = 55*(1..3);
		parts = (1..19);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsB2, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
	45.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		fund = 55*(1..5);
		factor = rrand(1,12);
		parts = (1..19);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsB2, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
	55.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(7, 15);
		fund = 55*(1..7);
		factor = rrand(1,17);
		parts = (1..19);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsB2, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
	55.do{
		delta = rrand(0.1, 0.3);
		durLine = rrand(5, 12);
		fund = 55*(1..7);
		factor = rrand(1,20);
		parts = (1..19);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsB2, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
})
)

~routGlissClar.play;

(
~routGlissFlute = Routine({
	var delta, durLine, factor, fund, parts, delT1, delT2, delT3, delT4;
	20.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 25);
		factor = rrand(1,7);
		fund = 55*(1..3);
		parts = (1..12);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsG3, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
	45.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		fund = 55*(1..5);
		factor = rrand(1,12);
		parts = (1..12);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsG3, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
	55.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(7, 15);
		fund = 55*(1..7);
		factor = rrand(1,17);
		parts = (1..12);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsG3, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
	55.do{
		delta = rrand(0.1, 0.3);
		durLine = rrand(5, 12);
		fund = 55*(1..7);
		factor = rrand(1,20);
		parts = (1..12);
		delT1 = rrand(0.02, 0.03);
		delT2 = rrand(0.03, 0.04);
		delT3 = rrand(0.04, 0.05);
		delT4 = rrand(0.05, 0.06);
		Synth(\glissClarinetTest, [\partsB2, fund*parts, \factor, factor, \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine,  \amp, ~ampsG3, \delT1, delT1, \delT2, delT2, \delT3, delT3, \delT4, delT4]);
		delta.yield;
	};
})
)

~routGlissFlute.play;
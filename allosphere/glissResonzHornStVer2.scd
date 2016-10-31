(
SynthDef(\glissResonzStVer2, { |durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, busS = 9, busD = 1, posS = 0, posD = 0, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(source, mix, room, damp), posS)));
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev), posD)));
}).add;
)
// subset 8 speakers
(
SynthDef(\glissResonzSubSet8, { |busArrIn = #[0,1,2,3,4,5,6,7], busArrDel = #[7,6,5,4,3,2,1,0,], durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
)
// subset 6 speakers
(
SynthDef(\glissResonzSubSet6, { |busArrIn = #[0,1,2,3,4,5], busArrDel = #[5,4,3,2,1,0,], durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
)
//subset  5 speakers
(
SynthDef(\glissResonzSubSet5, { |busArrIn = #[0,1,2,3,4], busArrDel = #[4,3,2,1,0,], durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
)
//subset 4 speakers
(
SynthDef(\glissResonzSubSet4, { |busArrIn = #[0,1,2,3], busArrDel = #[3,2,1,0,], durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
)
// global var
(
~fund = (0..20)*0.1+54;
~freq= (1..20)*~fund;
//~freq = ((1..20)*2)*~fund;
//~bus = (0..22);
//~bus1 = (0..22).scramble;
~posS = (2/22)*(0..22) - 1.0;
~posD = (2/22)*(0..22) - 1.0;
~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+12;
)
// routine stereo version, do not change
(
~routGlisResonzSt = Routine({
	var delta, durLine, rateRand, loAmp, hiAmp, delT, index;
	20.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		Synth(\glissResonzStVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index])]);
		delta.yield;
	};
	45.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		Synth(\glissResonzStVer2, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]), \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index])]);
		delta.yield;
	};
	110.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		Synth(\glissResonzStVer2, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]), \posS, ~posS.choose, \posD, ~posD.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index])]);
		delta.yield;
	};
})
)

~routGlisResonzSt.play;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/glissResonzRoutStVer2_Take3.aif");
s.record;
s.stopRecording;
// subsets

(
//full subset array
~subsetSpeak = [
//subset 0 - central front
~frUpCent = [0,11,12,13,40,41],
~frLoCent = [12,13,40,41,42,53],
~frFullCent = [0,11,12,13,40,41,42,53],
//subset 1 - left front
~frUpLt = [1,14,15,16],
~frLoLt = [14,15,16,43],
~frFullLt = [1,14,15,16,43],
//subset 2 - door front
~frUpDoor = [2,17,18,19],
~frLoDoor = [17,18,19,44],
~frFullDoor = [2,17,18,19,44],
// subset 3 - door rear
~rrUpDoor = [3,19,20,21],
~rrLoDoor = [19,20,21,45],
~rrFullDoor = [3,19,20,21,45],
//susbet 4 - rear left
~rrUpLt = [4,22,23,24],
~rrLoLt = [22,23,24,46],
~rrFullLt = [4,22,23,24,46],
//subset 5 - rear central
~rrUpCent = [5,6,25,26,27,28],
~rrLoCent = [25,26,27,28,47,48],
~rrFullCent = [5,6,25,26,27,28,47,48],
//subset 6 - rear right
~rrUpRt = [7,29,30,31],
~rrLoRt = [29,30,31,49],
~rrFullCent = [7,29,30,31,49],
//subset 7 - Ctrl room rear
~rrUpCR = [8, 32, 33, 34],
~rrLoCR = [32,33,34,50],
~rrFullCR = [8,32,33,34,50],
// subset 8 - Ctrl room front
~frUpCR = [9,34,35,36],
~frLoCR = [34,35,36,51],
~frFullCR = [9,34,35,36,51],
//subset 9 - front right
~frupRt = [10,37,38,39],
~frLoRt = [37,38,39,52],
~frFullRt = [10,37,38,39,52]
];
~fullSubSetSpeaker = ~subsetSpeak.at([2,5,8,11,14,17,20,23,26,29]);
~upSubsetSpeaker = ~subsetSpeak.at([0,3,6,9,12,15,18,21,24,27]);
~loSubsetSpeaker = ~subsetSpeak.at([1,4,7,10,13,16,19,22,25,28]);
~fullSubSet_8_Speaker = ~fullSubSetSpeaker.at([0,5]);
~upSubSet_6_Speaker = ~upSubsetSpeaker.at([0,5]);
~loSubSet_6_Speaker =~loSubsetSpeaker.at([0,5]);
~fullSubset_5_Speaker =  ~fullSubSetSpeaker.at([1,2,3,4,6,7,8,9]);
~upSubset_4_Speaker = ~upSubsetSpeaker.at([1,2,3,4,6,7,8,9]);
~loSubset_4_Speaker = ~loSubsetSpeaker.at([1,2,3,4,6,7,8,9]);
)
//new global variable for routine
(
~fund = (0..20)*0.1+54;
~freq= (1..20)*~fund;
~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+12;
)
(
~routGlisResonzAllo = Routine({
	var delta, durLine, rateRand, loAmp, hiAmp, delT, index, busArr;
	3.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	3.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
})
)

~routGlisResonzAllo.play;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/glissResonz/TakesRoutAllo/Section1RoutAllo_Take1.aif");
s.record;
s.stopRecording;
5280/55;
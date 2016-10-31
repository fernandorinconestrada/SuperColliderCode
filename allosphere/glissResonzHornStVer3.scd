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
SynthDef(\glissReson8ChannVer2, { |durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, busS = 9, busD = 1, posS = 0, posD = 0, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(posS, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(posD, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
)

(// subset 8 speakers
(
SynthDef(\glissResonzSubSet8, { |busArrIn = #[0,1,2,3,4,5,6,7], busArrDel = #[7,6,5,4,3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
);
// subset 6 speakers
(
SynthDef(\glissResonzSubSet6, { |busArrIn = #[0,1,2,3,4,5], busArrDel = #[5,4,3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
);
//subset  5 speakers
(
SynthDef(\glissResonzSubSet5, { |busArrIn = #[0,1,2,3,4], busArrDel = #[4,3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
);
//subset 4 speakers
(
SynthDef(\glissResonzSubSet4, { |busArrIn = #[0,1,2,3], busArrDel = #[3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
)
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

(
~routGlisResonz8Chann = Routine({
	var delta, durLine, rateRand, loAmp, hiAmp, delT, index, pos;
	20.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		pos = (0..7);
		Synth(\glissReson8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \posS, pos.choose, \posD, pos.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index])]);
		delta.yield;
	};
	45.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		pos = (0..7);
		Synth(\glissReson8ChannVer2, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]), \posS, pos.choose, \posD, pos.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index])]);
		delta.yield;
	};
	110.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		pos = (0..7);
		Synth(\glissReson8ChannVer2, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]), \posS, pos.choose, \posD, pos.choose, \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index])]);
		delta.yield;
	};
})
)

~routGlisResonz8Chann.play;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/glissResonzRoutStVer2_Take3.aif");
s.record;
s.stopRecording;
// subsets

(
//full subset array
~subsetSpeak = [
//subset 0 - door
~upDoor = [5,6,25,26,27,28],
~loDoor = [25,26,27,28,47,48],
~fullDoor = [5,6,25,26,27,28,47,48],
//subset 1 - front right
~frUpRt = [4,22,23,24],
~frLoRt = [22,23,24,46],
~frFullRt = [4,22,23,24,46],
// subset 2 - front center right
~frUpCentRt = [3,19,20,21],
~frLoCentRt = [19,20,21,45],
~frFullCentRt = [3,19,20,21,45],
//subset 3 - front center left
~frUpCentLt = [2,17,18,19],
~frLoCentLt = [17,18,19,44],
~frFullCentLt = [2,17,18,19,44],
//susbet 4 - front left
~frUpLt = [1,14,15,16],
~frLoLt = [14,15,16,43],
~frFullLt = [1,14,15,16,43],
//subset 5 - control room
~upCtrlRm = [0,11,12,13,40,41],
~loCtrlRm = [12,13,40,41,42,53],
~fullCtrlRm = [0,11,12,13,40,41,42,53],
//subset 6 - rear left
~rrUpLt = [10,37,38,39],
~rrLoLt = [37,38,39,52],
~rrFullLt = [10,37,38,39,52],
//subset 7 - rear center left
~rrUpCentLt = [9,34,35,36],
~rrLoCentLt = [34,35,36,51],
~rrFullCentLt = [9,34,35,36,51],
// subset 8 - rear center right
~rrUpCentRt = [8,32,33,34],
~rrLoCentRt = [32,33,34, 50],
~rrFullCentRt = [8,32,33,34,50],
//subset 9 - rear right
~rrUpRt = [7,29,30,31],
~rrLoRt = [29,30,31,49],
~rrFullRt = [7,29,30,31,49]
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
	//section 1 - part 1
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
		busArr = ~fullSubSet_5_Speaker.at([3]);
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.04.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([2]), \busArrDel, ~fullSubSet_5_Speaker.at([2]).reverse]);
		delta.yield;
	};
	// section 1 - part 2
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
		busArr = ~fullSubSet_5_Speaker.at([7]);
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.03.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([7]), \busArrDel, ~fullSubSet_5_Speaker.at([7]).reverse]);
		delta.yield;
	};
	//section 1 - part 3
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
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
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
	//section 2 - part 1
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_5_Speaker.at([8]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 2 part 2
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_5_Speaker.at([3]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 2 - part 3
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_5_Speaker.at([2]);
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_5_Speaker.at([3]);
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 2 - part 4
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 2 - part 5
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	// section 3 part 1 (a)
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	// section 3 - part 2 (a')
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	3.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//Section 3 - part 3 (b)
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 3 part 4 (c)
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 3 part 5 (d)
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 3 part 6 (e)
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 3 part 7 (e')
	3.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 3 part 8 (f)
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 3 part 9 (e)
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	//section 3 part 10 (a")
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	3.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([1]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;
	};
})
)

~routGlisResonzAllo.play;
~routGlisResonzAllo.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/glissResonz/TakesRoutAllo/RoutAllo_Take2.aif");
s.record;
s.stopRecording;
5280/55;

(200/11)*(0..11)-100
(200/29)*(0..29)-100

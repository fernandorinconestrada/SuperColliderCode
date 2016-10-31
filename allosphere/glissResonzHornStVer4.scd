(
SynthDef(\glissResonzStVer2, { |durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, busS = 9, busD = 1, posS = 0, posD = 0, amp = 1, ramp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine*ramp), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(source, mix, room, damp), posS)));
	OffsetOut.ar(0, LeakDC.ar(Pan2.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev), posD)));
}).add;
)

(
SynthDef(\glissResonz8ChannVer2, { |durLine = 10, gate = 1, multPink = 20, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, busS = 9, busD = 1, busArrIn = 0, busArrDel = 0, amp = 1, ramp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine*ramp), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	//source = FreeVerb.ar(source, mix, room, damp);
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	//OffsetOut.ar(busArrIn, LeakDC.ar(source));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayL.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
	//OffsetOut.ar(busArrDel, LeakDC.ar(DelayL.ar(source, 0.1, delT, ampDel)));
}).add;
)

(// subset 8 speakers
(
SynthDef(\glissResonzSubSet8, { |busArrIn = #[0,1,2,3,4,5,6,7], busArrDel = #[7,6,5,4,3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1, ramp = 1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine*ramp), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
);
// subset 6 speakers
(
SynthDef(\glissResonzSubSet6, { |busArrIn = #[0,1,2,3,4,5], busArrDel = #[5,4,3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1, ramp =1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine*ramp), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
);
//subset  5 speakers
(
SynthDef(\glissResonzSubSet5, { |busArrIn = #[0,1,2,3,4], busArrDel = #[4,3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1, ramp =1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine*ramp), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
	OffsetOut.ar(busArrIn, LeakDC.ar(FreeVerb.ar(source, mix, room, damp)));
	OffsetOut.ar(busArrDel, LeakDC.ar(FreeVerb.ar(DelayC.ar(source, 0.1, delT, ampDel), mixDelRev, roomDelRev, dampDelRev)));
}).add;
);
//subset 4 speakers
(
SynthDef(\glissResonzSubSet4, { |busArrIn = #[0,1,2,3], busArrDel = #[3,2,1,0,], durLine = 10, gate = 1, multPink = 12, startFreq = 55, endFreq = 5280, bw = 0.0002, rateAmpMod = 0.2666,  loAmp = 0.2, hiAmp = 1.5, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.04, ampDel = 0.8, mixDelRev = 0.8, roomDelRev = 0.5, dampDelRev = 0.5, amp = 1, ramp =1|
	var source, env;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	source = Resonz.ar(LPF.ar(PinkNoise.ar(multPink), 12000), XLine.kr(startFreq, endFreq, durLine*ramp), bw, amp* SinOsc.kr(rateAmpMod).range(loAmp, hiAmp))* env;
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
/*~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+12;*/
~amps = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5]-30);
)
// routine stereo version, do not change
(
~routGlisResonzSt = Routine({
	var delta, durLine, rateRand, loAmp, hiAmp, delT, index, ramp;
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
~fullSubset_5_Speaker =  ~fullSubSetSpeaker.at([1,2,3,4,6,7,8,9]);//frnt substs = 2rt,3lt -index 1 and 2; rear 7lt, 8rt - index 5-6
~upSubset_4_Speaker = ~upSubsetSpeaker.at([1,2,3,4,6,7,8,9]);
~loSubset_4_Speaker = ~loSubsetSpeaker.at([1,2,3,4,6,7,8,9]);
)


//8 chann mockup
(
~fullSubSet_8_Speaker = [2,6];
~upSubSet_6_Speaker =  [2,6];
~loSubSet_6_Speaker = [2,6];
~fullSubset_5_Speaker =  [0,1,3,4,5,7];//front index 0, rear index 3
~upSubset_4_Speaker = [0,1,3,4,5,7];
~loSubset_4_Speaker = [0,1,3,4,5,7];
)

//new global variable for routine
(
~fund = (0..20)*0.1+54;
~freq= (1..20)*~fund;
~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+9;
)

(
~routGlisResonzAllo1 = Routine({
	var delta, durLine, rateRand, loAmp, hiAmp, delT, index, busArr, ramp;
	//section 1 - part 1, lo density, discrete single lines
	3.do{
		delta = rrand(1.5, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	//compressing events
	2.do{
		delta = rrand(1, 2);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 1.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 3.5);//more waiting time for next section
		durLine = rrand(15, 20);//durLine changes for ramp
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubSet_5_Speaker.at([3]);
		busArr = ~fullSubset_5_Speaker.at([0]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.7]);
		0.04.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([2]), \busArrDel, ~fullSubSet_5_Speaker.at([2]).reverse, \ramp, 0.7]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.7]);
		0.04.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([0]), \busArrDel, ~fullSubset_5_Speaker.at([0]), \ramp, 0.7]);
		delta.yield;
	};
	// section 1 - part 2
	3.do{
		delta = rrand(1.5, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		/*busArr = ~upSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(1, 2);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		/*busArr = ~loSubset_4_Speaker.choose;
		Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 1.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 3);//more waiting time for next section
		durLine = rrand(15, 25);//durLine changes for ramp
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubSet_6_Speaker.at([1]);
		/*Synth(\glissResonzSubSet6, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.7]);
		0.03.yield;
		Synth(\glissResonzSubSet6, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([1]), \busArrDel, ~loSubSet_6_Speaker.at([1]).reverse, \ramp, 0.7]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.7]);
		0.04.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~loSubSet_6_Speaker.at([1]), \busArrDel, ~loSubSet_6_Speaker.at([1]), \ramp, 0.7]);
		delta.yield;
	};
	//section 1 - part 3
	2.do{
		delta = rrand(1.5, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubSet_8_Speaker.at([1]);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 2);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(1, 1.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{//ramp cut
		delta = rrand(1, 2.5);
		durLine = rrand(10, 20);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(2,20);//narrow to higher partials
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.6]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.6]);
		delta.yield;
	};
	1.do{//ramp cut
		delta = rrand(1, 3.5);
		durLine = rrand(10, 20);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(3,20);//narrow to higher partials
		//busArr = ~fullSubset_5_Speaker.at([1]);
		busArr = ~fullSubset_5_Speaker.at([0]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.6]);
		0.03.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([2]), \busArrDel, ~fullSubSet_5_Speaker.at([2]).reverse, \ramp, 0.6]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.6]);
		0.03.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.6]);
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
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubset_5_Speaker.at([2]);
	      busArr = ~fullSubset_5_Speaker.at([0]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.05.yield;
	    Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([1]), \busArrDel, ~fullSubSet_5_Speaker.at([1]).reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.6]);
		0.05.yield;
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.6]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
		//section 2 part 2
	2.do{
		delta = rrand(0.3, 1.1);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.1);//time more compaact
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.0);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.0);//time narrow more compact
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.0);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubset_5_Speaker.at([5]);
	    busArr = ~fullSubset_5_Speaker.at([4]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.02.yield;
	Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([6]), \busArrDel, ~fullSubSet_5_Speaker.at([6]).reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.02.yield;
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.0);
		durLine = rrand(15, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.9]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.at([2]);//front
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.06.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([1]), \busArrDel, ~fullSubset_5_Speaker.at([1]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.06.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{//ramp cut
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubSet_8_Speaker.at([5]);//door
		busArr = ~fullSubSet_8_Speaker.at([1]);
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.7]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.7]);
		delta.yield;
	};
	1.do{//ramp cut
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 25);//longer tail
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubSet_8_Speaker.at([0]);//ctrl room
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.7]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.7]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.3, 1.1);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubset_5_Speaker.at([7]);
		busArr = ~fullSubset_5_Speaker.at([3]);//rear
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.03.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([8]), \busArrDel, ~fullSubset_5_Speaker.at([8]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.03.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.1);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.3, 1.0);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	//section 2 - part 5
	1.do{
		delta = rrand(0.5, 1.0);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.5, 1.0);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(2,20);
		busArr = ~fullSubset_5_Speaker.at([0]);//front
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.01.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([1]), \busArrDel, ~fullSubset_5_Speaker.at([1]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.01.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.4, 0.9);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(3,20);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.4, 0.9);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.4, 0.9);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(2,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{//ramp cut, sustain towards bridge
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 20);
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(3,23);//narrowing and tranposing partials higher, birghter color
		//busArr = ~fullSubSet_8_Speaker.at([5]);//door
		busArr = ~fullSubSet_8_Speaker.at([1]);
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.7]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.6]);
		delta.yield;
	};
	1.do{//ramp cut
		delta = rrand(0.3, 1.2);
		durLine = rrand(10, 25);//longer tail
		//rateRand = [2,3,4,5,6];
		rateRand = (4..10);
		delT = (4..8)*0.01;
		index = rrand(3,23);
		busArr = ~fullSubSet_8_Speaker.at([0]);//ctrl room
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose,  \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.7]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.6]);
		delta.yield;
};

//bridge sustain long notes

	3.do{
		delta = rrand(0.5, 1.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
	    ramp = rrand(0.5, 0.9);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	//compressing events
	3.do{
		delta = rrand(0.5, 1.2);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(2,20);
	    ramp = rrand(0.5, 0.9);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	5.do{
		delta = rrand(0.5, 1);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(3,20);
	    ramp = rrand(0.5, 0.9);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	4.do{
		delta = rrand(1, 3.5);//more waiting time for next section
		durLine = rrand(15, 20);//durLine changes for ramp
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(4,20);
	    ramp = rrand(0.5, 0.9);
		//busArr = ~fullSubSet_5_Speaker.at([3]);
		busArr = ~fullSubset_5_Speaker.at([0]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, 0.7]);
		0.04.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_5_Speaker.at([2]), \busArrDel, ~fullSubSet_5_Speaker.at([2]).reverse, \ramp, 0.7]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.7]);
		0.04.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([0]), \busArrDel, ~fullSubset_5_Speaker.at([0]), \ramp, 0.7]);
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
		//busArr = ~fullSubset_5_Speaker.at([5]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);//rear
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.05.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([6]), \busArrDel, ~fullSubset_5_Speaker.at([6]).reverse]);
		delta.yield;*/
				Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.04.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([3]), \busArrDel, ~fullSubset_5_Speaker.at([3])]);
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
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~fullSubset_5_Speaker.at([2]);//front
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.01.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([1]), \busArrDel, ~fullSubset_5_Speaker.at([1]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, 0.7]);
		0.01.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	// section 3 - part 2 (a')
	2.do{//ramp cut for whole section
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubset_5_Speaker.at([3]);//front
	    busArr = ~fullSubset_5_Speaker.at([0]);//front
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.04.yield;
	Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([3]), \busArrDel, ~fullSubset_5_Speaker.at([3]).reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.04.yield;
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubset_5_Speaker.at([5]);//front+rear
	busArr = ~fullSubset_5_Speaker.at([0]);//front+rear
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.01.yield;
	Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([6]), \busArrDel, ~fullSubset_5_Speaker.at([6]).reverse]);
		0.03.yield;
	Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([3]), \busArrDel, ~fullSubset_5_Speaker.at([3]).reverse]);
		0.04.yield;
	Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([5]), \busArrDel, ~fullSubset_5_Speaker.at([5]).reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.01.yield;
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([3]), \busArrDel, ~fullSubset_5_Speaker.at([3])]);
		0.04.yield;
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([0]), \busArrDel, ~fullSubset_5_Speaker.at([0])]);
	    0.06.yield;
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([3]), \busArrDel, ~fullSubset_5_Speaker.at([3])]);
		delta.yield;
	};
	3.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
	ramp = rrand(0.8, 0.9);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubset_5_Speaker.at([5]);//rear
	    busArr = ~fullSubset_5_Speaker.at([3]);//rear
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.02.yield;
	Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([5]), \busArrDel, ~fullSubset_5_Speaker.at([5]).reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.02.yield;
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(15, 25);//longer
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubSet_8_Speaker.at([0]);
		busArr = ~fullSubSet_8_Speaker.at([0]);
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.02.yield;
	Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([1]), \busArrDel, ~fullSubSet_8_Speaker.at([1]).reverse]);
		delta.yield;*/
	Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.02.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([6]), \busArrDel, ~fullSubSet_8_Speaker.at([1])]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.7, 0.9);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.02.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		//busArr = ~fullSubset_5_Speaker.at([5]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);//rear
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.08.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([6]), \busArrDel, ~fullSubset_5_Speaker.at([6]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.08.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.6, 0.9);
		busArr = ~fullSubSet_8_Speaker.at([0]);//door + ctrl room
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.08.yield;
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([1]), \busArrDel, ~fullSubSet_8_Speaker.at([1]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.08.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr = ~fullSubSet_8_Speaker.at([1]), \busArrDel, busArr = ~fullSubSet_8_Speaker.at([1]), \ramp, ramp]);
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
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		//busArr = ~fullSubset_5_Speaker.at([1]);//front
		busArr = ~fullSubset_5_Speaker.at([0]);//front
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.02.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([2]), \busArrDel, ~fullSubset_5_Speaker.at([2]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.02.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.7, 0.9);
		//busArr = ~fullSubset_5_Speaker.at([6]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.01.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([5]), \busArrDel, ~fullSubSet_8_Speaker.at([5]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr,\ramp, ramp]);
		0.01.yield;
				Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr,\ramp, ramp]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
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
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	//section 3 part 6 (e)
	2.do{//check ramp
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.8, 1.0);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.8, 1.0);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.9, 1.0);
		//busArr = ~fullSubset_5_Speaker.at([5]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.01.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([6]), \busArrDel, ~fullSubSet_8_Speaker.at([6]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.01.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.8, 1.0);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.9, 1.0);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.8, 1.0);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.9, 1.0);
		//busArr = ~fullSubset_5_Speaker.at([5]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.01.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([6]), \busArrDel, ~fullSubSet_8_Speaker.at([6]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.01.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
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
		ramp = rrand(0.8, 1.0);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.7, 1.0);
		//busArr = ~fullSubset_5_Speaker.at([5]); //rear+front
		busArr = ~fullSubset_5_Speaker.at([3]);
		/*Synth(\glissResonzSubset5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.01.yield;
		Synth(\glissResonzSubset5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([6]), \busArrDel, ~fullSubset_5_Speaker.at([6]).reverse, \ramp, ramp]);
		0.03.yield;
		Synth(\glissResonzSubset5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([2]), \busArrDel, ~fullSubset_5_Speaker.at([2]).reverse, \ramp, ramp]);
		0.05.yield;
		Synth(\glissResonzSubset5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([1]), \busArrDel, ~fullSubset_5_Speaker.at([1]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.01.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([0]), \busArrDel, ~fullSubset_5_Speaker.at([0]), \ramp, ramp]);
		0.03.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([0]), \busArrDel, ~fullSubset_5_Speaker.at([0]), \ramp, ramp]);
		0.05.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([3]), \busArrDel, ~fullSubset_5_Speaker.at([3]), \ramp, ramp]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.7, 1.0);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.6, 0.9);
		busArr = ~fullSubSet_8_Speaker.at([0]);//door + ctrl room
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.08.yield;
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([1]), \busArrDel, ~fullSubSet_8_Speaker.at([1]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.08.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr = ~fullSubSet_8_Speaker.at([1]), \busArrDel, busArr = ~fullSubSet_8_Speaker.at([1]), \ramp, ramp]);
		delta.yield;
			};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.7, 0.8);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	//section 3 part 8 (f)
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(2,21);//increasing partial
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(2,21);
		//busArr = ~fullSubset_5_Speaker.at([2]);//front
		busArr = ~fullSubset_5_Speaker.at([0]);//front
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.02.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([2]), \busArrDel, ~fullSubset_5_Speaker.at([2]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.02.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(2,22);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,23);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(4,24);
		//busArr = ~fullSubset_5_Speaker.at([6]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		0.04.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([5]), \busArrDel, ~fullSubset_5_Speaker.at([5]).reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		0.04.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(3,22);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr]);
		delta.yield;
	};
	//section 3 part 9 (e)
	2.do{//cut ramp range rrand(0.7,1.0),
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.7, 1.0);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.7, 1.0);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.6, 0.9);
		//busArr = ~fullSubSet_8_Speaker.at([0]);//ctrl room+ door
		busArr = ~fullSubSet_8_Speaker.at([2]);
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]]);
		0.02.yield;
	    Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([1]), \busArrDel, ~fullSubSet_8_Speaker.at([1]).reverse, \ramp, ramp]]);
		0.04.yield;
	    Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([1]), \busArrDel, ~fullSubSet_8_Speaker.at([1]).reverse, \ramp, ramp]]);
		0.06.yield;
	    Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([0]), \busArrDel, ~fullSubSet_8_Speaker.at([0]).reverse, \ramp, ramp]]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.02.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([6]), \busArrDel, ~fullSubSet_8_Speaker.at([6]), \ramp, ramp]);
		0.04.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([6]), \busArrDel,~fullSubSet_8_Speaker.at([6]), \ramp, ramp]);
		0.06.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([2]), \busArrDel, ~fullSubSet_8_Speaker.at([2]), \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.6, 0.9);
		busArr = ~fullSubset_5_Speaker.choose;
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.6, 0.9);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.6, 0.9);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,20);
		ramp = rrand(0.6, 0.9);
		//busArr = ~fullSubset_5_Speaker.at([1]);//front
		busArr = ~fullSubset_5_Speaker.at([0]);
	/*	Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.03.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([2]), \busArrDel, ~fullSubset_5_Speaker.at([2]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.03.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	//section 3 part 10 (a")
	2.do{//ramp cut to range rrand(0.4, 0.7), increasing also partial for sustained frequencies
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(4,25);
		ramp = rrand(0.5, 0.8);
		busArr = ~loSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(3,21);
		ramp = rrand(0.5, 0.8);
		//busArr = ~fullSubset_5_Speaker.at([6]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.08.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([5]), \busArrDel, ~fullSubset_5_Speaker.at([5]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.08.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	2.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(3,22);
		ramp = rrand(0.5, 0.8);
		busArr = ~upSubset_4_Speaker.choose;
		/*Synth(\glissResonzSubSet4, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	3.do{
		var delta1;
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(1,23);
		ramp = rrand(0.4, 0.7);
		delta1 = rrand(0.02, 0.08);
		//busArr = ~fullSubSet_8_Speaker.at([1]);//ctrl room and door
		busArr = ~fullSubSet_8_Speaker.at([1]);
		/*Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		delta1.yield;
		Synth(\glissResonzSubSet8, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([0]), \busArrDel, ~fullSubSet_8_Speaker.at([0]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta1.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubSet_8_Speaker.at([0]), \busArrDel, ~fullSubSet_8_Speaker.at([0]), \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(2,22);
		ramp = rrand(0.7, 0.7);
		//busArr = ~fullSubset_5_Speaker.at([6]);//rear
		busArr = ~fullSubset_5_Speaker.at([3]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.02.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([6]), \busArrDel, ~fullSubset_5_Speaker.at([5]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.02.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
	1.do{
		delta = rrand(0.1, 0.5);
		durLine = rrand(10, 25);
		//rateRand = [2,3,4,5,6];
		rateRand = (5..16);
		delT = (4..8)*0.01;
		index = rrand(4,23);
		ramp = rrand(0.4, 0.7);
		//busArr = ~fullSubset_5_Speaker.at([2]);//front
		busArr = ~fullSubset_5_Speaker.at([0]);
		/*Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr.reverse, \ramp, ramp]);
		0.06.yield;
		Synth(\glissResonzSubSet5, [\startFreq, ~fund.choose, \endFreq,~freq.at([index]),\durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, ~fullSubset_5_Speaker.at([1]), \busArrDel, ~fullSubset_5_Speaker.at([1]).reverse, \ramp, ramp]);
		delta.yield;*/
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		0.02.yield;
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArrIn, busArr, \busArrDel, busArr, \ramp, ramp]);
		delta.yield;
	};
})
)

~routGlisResonzAllo1.play;
~routGlisResonzAllo1.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/glissResonz/TakesRoutAllo/RoutAllo_Take2.aif");
s.record;
s.stopRecording;
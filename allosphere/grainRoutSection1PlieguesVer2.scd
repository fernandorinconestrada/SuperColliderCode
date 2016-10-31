(//// plotting;
//Env([0,1,0], [0.5, 0.5], [-5, 5]).plot;
//Env([0,1,0.9,0], [0.5, 0.05, 0.44], [5, -8, -4]).plot;
//~buf1.plot(\buf1);//1,583,833 samples 890,000 - 1,380,000, high partial
~buf1pos = [(890000/48000)/(1583833/48000), (1380000/48000)/(1583833/48000)];
//~buf2.plot(\buf2);
~buf2pos = [(1373000/48000)/(2773588/48000), (2272105/48000)/(2773588/48000)];//high partial content
//~buf3.plot(\buf3);
~buf3pos = [(1272761/48000)/(2781504/48000), (1744726/48000)/(2781504/48000)];//high partial content
//~buf4.plot(\bus4);
~buf4pos = [(1973606/48000)/(2421540/48000), (2337342/48000)/(2421540/48000)];//high partial content is flat
//~buf5.plot(\bus5);
~buf5pos = [(818987/48000)/(1369423/48000), (1068493/48000)/(1369423/48000)];//high partial content
//~buf6.plot(\bus6);
~buf6pos = [(1965388/48000)/(2492265/48000), (2260023/48000)/(2492265/48000)];//mid partial content
//~buf7.plot(\bus7);
//~buf7pos = [(/48000)/(/48000), (/48000)/(/48000)];//mid partial content
//~buf8.plot(\bus8);
//~buf8pos = [(/48000)/(/48000), (/48000)/(/48000)];//mid partial content
//~buf9.plot(\bus9);
//~buf9pos = [(/48000)/(/48000), (/48000)/(/48000)];//mid partial content
//~buf10.plot(\buf10);//0.5, 0.7
~buf10pos = [(1221009/48000)/(1810115/48000), (1523115/48000)/(1810115/48000)];//full spectrum gliss hi to lo
//~buf11.plot(\buf11);//0.25, 0.5 - interesting timbre in 1,3M-end
~buf11pos = [(135865/48000)/(1915425/48000), (463538/48000)/(1915425/48000)];//gliss overtone series, nid high partials
//~buf12.plot(\buf12);//interesting timbre in 1,5M-end
~buf12pos = [(1471891/48000)/(2875787/48000), (1943856/48000)/(2875787/48000)];//slow overtone gliss upwards
//~buf13.plot(\bus13);
~buf13pos = [(933828/48000)/(1554219/48000), (1182417/48000)/(1554219/48000)];//deep slow glissando with beating
//~buf14.plot(\bus14);
~buf14pos = [(2061238/48000)/(2632380/48000), (2474950/48000)/(2632380/48000)];//fast overton gliss, beating sforzato bass
//~buf15.plot(\bus15);// take has a lot of good material
~buf15pos = [(921486/48000)/(2528811/48000), (1529948/48000)/(2528811/48000)];//steady overtone with background gliss
//~buf16.plot(\bus16);
~buf16pos = [(1300205/48000)/(1808216/48000), (1591934/48000)/(1808216/48000)];//flat
//~buf17.plot(\bus17);//take has good harmonic material
~buf17pos = [(1276297/48000)/(1892078/48000), (1728922/48000)/(1892078/48000)];//high partial oscillation in steady state, two partials mainly
//~buf18.plot(\bus18);//take has good harmonic material
~buf18pos = [(1495131/48000)/(2897572/48000), (2176202/48000)/(2897572/48000)];//overtone gliss and sforzato
)


(
var winenv1, winenv2, winenv3;

//buffer combination 55 hz chan 3 dark to bright
~buf1 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly55hz_Take1 [chan 3]_2_12db.wav");
~buf2 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly55hz_Take1 [chan 3]_3_12db.wav");
~buf3 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly55hz_Take1 [chan 3]_1_12db.wav");

//buffer combination chan 3 dark to bright
~buf4 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_2.wav");
~buf5 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_3.wav");
~buf6 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_1.wav");

//buffer combination 55hz 2chan mono mix dark to bright
~buf7 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef55hzChan1_2MonoMix_1db_3.wav");
~buf8 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef55hzChan1_2MonoMix_1db_2.wav");
~buf9 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef55hzChan1_2MonoMix_1db_1.wav");

//buffer combination 2chan mono mix dark to bright
~buf10 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_3.wav");
~buf11 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_2.wav");
~buf12 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_1.wav");

//buffer combination 55 hz 3chan mono mix dark to bright
~buf13 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef55hz3ChanMonoMix_6db_3.wav");
~buf14 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef55hz3ChanMonoMix_6db_2.wav");
~buf15 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef55hz3ChanMonoMix_6db_1.wav");

//buffer combination 3chan mono mix dark to bright
~buf16 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef3ChanMonoMix_6db_3.wav");
~buf17 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef3ChanMonoMix_6db_2.wav");
~buf18 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef3ChanMonoMix_6db_1.wav");


winenv1 = Env([0,1,0], [0.05, 0.94], [5, -5]);
winenv2 = Env([0,1,0], [0.89, 0.1], [6, -5]);
winenv3 = Env([0,1,0], [0.49, 0.49], [-6, 6]);
~x = Buffer.sendCollection(s, winenv1.discretize, 1);
~y = Buffer.sendCollection(s, winenv2.discretize, 1);
~z = Buffer.sendCollection(s, winenv3.discretize, 1);

(
SynthDef(\bufGrainVCInstVer3, {|densAccum = 0.1, changeGr = 0.4, grpos = 8, sndbuf, mix = 0.4, room = 0.6, damp = 0.5, bus1 = 0, bus2 = 1, ampDel = 0.75, delT = 0.06, envbufnum = -1, grPos = 8, durLine = 3, rate = 1, loDurGr = 0.02, hiDurGr = 0.04, loDens = 0.2, hiDens = 8, loChangeGrDur = 1, hiChangeGrDur = 2, tail = 1.1, posLo = 0, posHi = 1|
var in, trig, dur, posGr, rev, delay, env, envRev;
env = EnvGen.kr(Env([0,1,0.6,0], [durLine*0.14, durLine*0.45, durLine*0.4], [5, 0, -5]), 1, doneAction: 2);
//env = EnvGen.kr(Env([0,1,0.9,0], [durLine*0.6, durLine*0.1, durLine*0.29], [-5, -1, -4]), 1, doneAction: 2);
envRev = EnvGen.kr(Env([0,1,0], [durLine*0.5, (durLine*0.5)*tail], [-5, -5]), 1, doneAction: 2);
trig = Dust.kr(SinOsc.kr(densAccum).range(loDens, hiDens));//density of grains
dur = SinOsc.kr(Dust.kr(changeGr).range(loChangeGrDur,hiChangeGrDur)).range(loDurGr, hiDurGr);//grain size
posGr = LFNoise0.kr(grPos).range(posLo, posHi);//position in buffer
in = GrainBuf.ar(1, trig, dur, sndbuf, rate, posGr, 2, 0, envbufnum)*env;
//in = GrainBuf.ar(1, Impulse.ar(dens), dur, sndbuf, XLine.kr(2, 1, durLine, doneAction:2), posGr, 2, 0, envbufnum)*env;
rev = FreeVerb.ar(in, mix, room, damp)*env;//variables for reverb
delay = DelayC.ar(rev, 0.1, delT, ampDel)*env;//location of delay
OffsetOut.ar(bus1, LeakDC.ar(rev));
OffsetOut.ar(bus2, LeakDC.ar(FreeVerb.ar(delay)*envRev));
}).add;
);

(
SynthDef(\bufGrainVCInstVer3RampRhy, {|densAccum = 0.1, changeGr = 0.4, grpos = 8, sndbuf, mix = 0.4, room = 0.6, damp = 0.5, bus1 = 0, bus2 = 1, ampDel = 0.75, delT = 0.06, envbufnum = -1, grPos = 8, durLine = 3, rate = 1, loDurGr = 0.02, hiDurGr = 0.04, loDens = 0.2, hiDens = 8, loChangeGrDur = 1, hiChangeGrDur = 2, tail = 1.1, posLo = 0, posHi = 1, transpLo = 1, transpHi = 1, dens = 5|
var in, trig, dur, posGr, rev, delay, env, envRev;
//env = EnvGen.kr(Env([0,1,0.6,0], [durLine*0.14, durLine*0.45, durLine*0.4], [5, 0, -5]), 1, doneAction: 2);
env = EnvGen.kr(Env([0,1,0.9,0], [durLine*0.5, durLine*0.05, durLine*0.44], [5, -8, -4]), 1, doneAction: 2);
envRev = EnvGen.kr(Env([0,1,0], [durLine*0.5, (durLine*0.5)*tail], [-5, -5]), 1, doneAction: 2);
//trig = Dust.kr(SinOsc.kr(densAccum).range(loDens, hiDens));//density of grains
dur = SinOsc.kr(Dust.kr(changeGr).range(loChangeGrDur,hiChangeGrDur)).range(loDurGr, hiDurGr);//grain size
posGr = LFNoise0.kr(grPos).range(posLo, posHi);//position in buffer
//in = GrainBuf.ar(1, trig, dur, sndbuf, rate, posGr, 2, 0, envbufnum)*env;
in = GrainBuf.ar(1, Impulse.ar(dens), dur, sndbuf, XLine.kr(transpLo, transpHi, durLine, doneAction:2), posGr, 2, 0, envbufnum)*env;
rev = FreeVerb.ar(in, mix, room, damp)*env;//variables for reverb
delay = DelayC.ar(rev, 0.1, delT, ampDel)*env;//location of delay
OffsetOut.ar(bus1, LeakDC.ar(rev));
OffsetOut.ar(bus2, LeakDC.ar(FreeVerb.ar(delay)*envRev));
}).add;
);

/*(
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
)*/
)


// (
// SynthDef(\bufGrainVCInstVer2, {|densAccum = 0.1, changeGr = 0.4, grpos = 8, sndbuf, mix = 0.4, room = 0.6, damp = 0.5, bus1 = 0, bus2 = 1, ampDel = 0.75, delT = 0.06, envbufnum = -1, grPos = 8, durLine = 3, rate = 1, loDurGr = 0.02, hiDurGr = 0.04, loDens = 0.2, hiDens = 8, loChangeGrDur = 1, hiChangeGrDur = 2|
// 	var in, trig, dur, posGr, rev, delay, env;
// 	env = EnvGen.kr(Env([0,1,0.6,0], [durLine*0.14, durLine*0.45, durLine*0.4], [5, 0, -5]), 1, doneAction: 2);
// 	trig = Dust.kr(SinOsc.kr(densAccum).range(loDens, hiDens));//density of grains
// 	dur = SinOsc.kr(Dust.kr(changeGr).range(loChangeGrDur,hiChangeGrDur)).range(loDurGr, hiDurGr);//grain size
// 	posGr = LFNoise0.kr(grPos).range(0,1);//position in buffer
// 	in = GrainBuf.ar(1, trig, dur, sndbuf, rate, posGr, 2, 0, envbufnum)*env;
// 	rev = FreeVerb.ar(in, mix, room, damp)*env;//variables for reverb
// 	delay = DelayC.ar(rev, 0.1, delT, ampDel);//location of delay
// 	OffsetOut.ar(bus1, LeakDC.ar(rev));
// 	OffsetOut.ar(bus2, LeakDC.ar(delay));
// }).add;
// )



a = Synth(\bufGrainVCInstVer3, [\envbufnum, ~y, \sndbuf, ~buf3, \durLine, 2, \hiDurGr, 0.04, \delT, 0.05, \dens, 24]);

a = Synth(\bufGrainVCInstVer3, [\envbufnum, ~y, \sndbuf, ~buf3, \durLine, 60]);
a.set(\dens, 24);
a.set(\sndbuf, ~buf2);

/*(
~fund = (0..20)*0.1+54;
~freq= (1..20)*~fund;
//~freq = ((1..20)*2)*~fund;
//~bus = (0..22);
//~bus1 = (0..22).scramble;
/*~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+12;*/
~amps = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5]-30);
);*/
(
~routGrainVCBufVer2 = Routine({
	var durLine, delta, densAccum, grPos, changeGr, mix, room, damp, ampDel, delT, rate, bus1, bus2, deltaDel, loDens, hiDens, loChangeDur, hiChangeDur, hiDurGr, hiDurGr1, hiDurGr2, dens, busArr, busIn, index, rateRand, durLine1, transpLoAbs, transpHiAbs;
	//densAccum = rrand(0.1, 0.2);
	//densAccum = (10..20)*0.01;
	grPos = (6..12);
	//bus1 = (0..26);
	bus1 = (0..7);
	bus2 = (0..7);
	//bus2 = (0..26);
/*
// gesture 1 - dark timbre rhythmic reps, noise, percussive, short delay, same buffer
2.do{
	3.do{
	delta = rrand(0.8, 1.2);//narrow wait times between synth reps
	durLine = rrand(3, 5); // narrow durLine
	mix = rrand(0.3, 0.4);//low mix
	room = rrand(0.2, 0.3);// small room
	damp = rrand(0.4, 0.8);// large range damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.02);
	rate = rrand(0.95, 1.1);//opening frequency variation
	hiDurGr = rrand(0.011, 0.021); //grain duration
	deltaDel = rrand(0.02, 0.023);//very narrow
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	changeGr = rrand(0.4, 0.5);//rate of change in speed of cgange in range of grain size
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf1pos.at([0]), \posHi, ~buf1pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf2pos.at([0]), \posHi, ~buf2pos.at([1]), \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	2.yield;//wait time between events not reps
	};
	3.yield;
1.do{// buffer change full 55hz chan 3 plus darker 83hz, one more synth
	2.do{
	delta = rrand(1.5,2);// wider range
	durLine = rrand(3, 5);//high range +1
	mix = rrand(0.3, 0.4);//little more wet
	room = rrand(0.2, 0.6);//mid size room
	damp = rrand(0.4, 0.5);//mid damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.02);
	rate = rrand(0.95, 1.2);//wider range frequency shift
	hiDurGr = rrand(0.021, 0.023); //grain duration bigger
	deltaDel = rrand(0.025, 0.035);// synth delay + 0.01
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	changeGr = rrand(0.4, 0.5);//rate of change in speed of change in range of grain size
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf1pos.at([0]), \posHi,  ~buf1pos.at([1]), \grPos, grPos]);//large content of partials
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf2pos.at([0]), \posHi, ~buf2pos.at([1]), \grPos, grPos]);//large content of partials
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf3pos.at([0]), \posHi, ~buf3pos.at([1]), \grPos, grPos]);// no wait
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf4, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo,~buf4pos.at([0]), \posHi, ~buf4pos.at([1]), \grPos, grPos]); //dark color buffer
	delta.yield;
		};
	};
	2.yield;// 25 secs aprox
	//gesture 2
1.do{// buffer change to chann 3 all takes, one more synth longer envelopes
	3.do{
	delta = rrand(1.5,2);// wider range
	durLine = rrand(4, 7);//longer durations
	mix = rrand(0.3, 0.5);// bit more wet
	room = rrand(0.2, 0.8);
	damp = rrand(0.4, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.025);//+0.005 on hi range
	rate = rrand(0.95, 1.2);//wider range frequency shift
	hiDurGr = rrand(0.021, 0.023); //grain duration bigger
	deltaDel = rrand(0.03, 0.045);// synth delay range wider
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12)*0.01;//rate change position of grain
	changeGr = rrand(0.4, 0.5);
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf6, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf6pos.at([0]), \posHi, ~buf6pos.at([1]), \grPos, grPos]);//dark in partials buffer
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf5, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf5pos.at([0]), \posHi, ~buf5pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~y, \sndbuf, ~buf4, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf4pos.at([0]), \posHi, ~buf4pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf5, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf5pos.at([0]), \posHi, ~buf5pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf6, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf6pos.at([0]), \posHi, ~buf6pos.at([1]), \grPos, grPos]);
	delta.yield;
		};
	3.yield;
	};	/////gesture 1 ramp
4.do{
	delta = rrand(1.5,2);// wider range
	durLine = rrand(2, 9);//short envelope
	mix = rrand(0.1, 0.3);//super dry rev
	room = rrand(0.2, 0.5);
	damp = rrand(0.6, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.03);//dry
	rate = rrand(0.95, 1.2);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.023); //grain duration bigger
	deltaDel = rrand(0.03, 0.04);// narrow range
	densAccum = (10..15)*0.01;
	dens = rrand(11, 18);
	transpHiAbs = rrand(1.8, 2.0);
	transpLoAbs = rrand(0.9, 1.0);
	changeGr = rrand(0.4, 0.5);
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \dens, dens]);//dark in partials buffer
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \dens, dens]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,  ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpHiAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,  ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpLoAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,  ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \dens, dens]);
	delta.yield;
		};
	1.5.rrand(0.5).yield;// ca. 40 secs
/*20.do{
		delta = rrand(1, 2.5);
		durLine = rrand(10, 15);
		rateRand = [2,3,4,5,6];
		delT = (4..8)*0.01;
		index = rrand(1,20);
		busArr = rrand(0,3);
		busIn = rrand(4,7);
		Synth(\glissResonz8ChannVer2, [\startFreq, ~fund.choose, \endFreq, ~freq.at([index]), \durLine, durLine, \rateAmpMod, (1/durLine)*rateRand.choose, \delT, delT.choose, \amp, ~amps.dbamp.at([index]), \busArr, busArr, \busIn, busIn]);
		delta.yield;
	};
	3.yield;*/
3.do{ //rhythm pattern
	// gesture 1 repeated
	1.do{//gesture 1 a
	delta = rrand(0.8, 1.2);//narrow wait times between synth reps
	durLine = rrand(3, 5); // narrow durLine
	mix = rrand(0.3, 0.4);//low mix
	room = rrand(0.2, 0.3);// small room
	damp = rrand(0.4, 0.8);// large range damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.02);
	rate = rrand(0.95, 1.1);//opening frequency variation
	hiDurGr = rrand(0.011, 0.021); //grain duration
	deltaDel = rrand(0.02, 0.023);//very narrow
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	changeGr = rrand(0.4, 0.5);//rate of change in speed of cgange in range of grain size
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf1pos.at([0]), \posHi, ~buf1pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf2pos.at([0]), \posHi, ~buf2pos.at([1]), \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	0.1.rrand(0.2).yield;
//buffer combination used in ramp
	2.do{
	delta = rrand(0.8, 1.2);//narrow wait times between synth reps
	durLine = rrand(4, 7); // narrow durLine
	mix = rrand(0.3, 0.4);//low mix
	room = rrand(0.2, 0.4);// larger room
	damp = rrand(0.4, 0.8);// large range damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.02);
	rate = rrand(0.95, 1.3);//opening frequency variation
	hiDurGr = rrand(0.011, 0.021); //grain duration
	deltaDel = rrand(0.02, 0.023);//very narrow
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	changeGr = rrand(0.4, 0.5);//rate of change in speed of cgange in range of grain size
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf10, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf10pos.at([0]), \posHi, ~buf10pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf12, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf12pos.at([0]), \posHi, ~buf12pos.at([1]), \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	0.1.rrand(0.5).yield;
	2.do{
	delta = rrand(0.8, 1.2);//narrow wait times between synth reps
	durLine = rrand(3, 5); // narrow durLine
	mix = rrand(0.3, 0.4);//low mix
	room = rrand(0.2, 0.3);// small room
	damp = rrand(0.4, 0.8);// large range damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.03);//longer delay time to previous gesture 1a
	rate = rrand(0.95, 1.3);//opening frequency variation to gesture 1
	hiDurGr = rrand(0.011, 0.021); //grain duration
	deltaDel = rrand(0.02, 0.023);//very narrow
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	changeGr = rrand(0.4, 0.5);//rate of change in speed of change in range of grain size
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf1pos.at([0]), \posHi, ~buf1pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf2pos.at([0]), \posHi, ~buf2pos.at([1]), \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	0.1.rrand(0.5).yield;
	3.do{//repetition of buffer combination used in ramp +1 rep
	delta = rrand(0.8, 1.2);//narrow wait times between synth reps
	durLine = rrand(7, 14); // longer durLine
	mix = rrand(0.3, 0.4);//low mix
	room = rrand(0.4, 0.6);// longer reverb
	damp = rrand(0.4, 0.8);// large range damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.02);
	rate = rrand(0.95, 1.1);//opening frequency variation
	hiDurGr = rrand(0.011, 0.021); //grain duration
	deltaDel = rrand(0.02, 0.023);//very narrow
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	changeGr = rrand(0.4, 0.5);//rate of change in speed of change in range of grain size
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf10, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf10pos.at([0]), \posHi, ~buf10pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf12, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf12pos.at([0]), \posHi, ~buf12pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf11, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \grPos, grPos]);
	deltaDel.yield;
	delta.yield;//wait time between reps
		};
	};
	1.0.rrand(1.5).yield;
/////gesture mix ramp and burst
4.do{
	delta = rrand(1,1.2);// wider range
	durLine = rrand(0.5, 2);//short envelope
	durLine1 = rrand(3, 7);
	mix = rrand(0.1, 0.3);//super dry rev
	room = rrand(0.2, 0.5);
	damp = rrand(0.6, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.03);//dry
	rate = rrand(0.95, 1.2);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.023); //grain duration bigger
	deltaDel = rrand(0.03, 0.04);// narrow range
	densAccum = (10..15)*0.01;//rate change in grain density
	dens = rrand(7, 11);
	hiDens = rrand(8,12);
	transpHiAbs = rrand(1.5, 2.0);
	transpLoAbs = rrand(0.9, 1.1);
		Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf13, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf13pos.at([0]), \posHi, ~buf13pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf11, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \dens, dens]);//dark in partials buffer
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf14, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf12, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf12pos.at([0]), \posHi, ~buf12pos.at([1]), \dens, dens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf15, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;//wait time between reps

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf10, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf10pos.at([0]), \posHi, ~buf10pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpLoAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf11, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf11pos.at([0]), \posHi, ~buf11pos.at([1]), \dens, dens, \transpLo, transpLoAbs, \transpHi, transpHiAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf12, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf12pos.at([0]), \posHi, ~buf12pos.at([1]), \dens, dens]);
	delta.yield;
		};
	0.1.rrand(0.5).yield;
6.do{
	delta = rrand(1, 1.2);// wider range
	durLine = rrand(0.5, 1.5);//short envelope
	durLine1 = rrand(3, 12);
	mix = rrand(0.1, 0.4);//super dry rev
	room = rrand(0.2, 0.6);
	damp = rrand(0.4, 0.7);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.04);//dry
	rate = rrand(0.95, 1.3);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.03); //grain duration bigger
	deltaDel = rrand(0.03, 0.06);// narrow range
	densAccum = (10..15)*0.01;//rate change in grain density
	dens = rrand(7, 11);
	hiDens = rrand(5,12);
	transpHiAbs = rrand(1.5, 2.0);
	transpLoAbs = rrand(0.9, 1.1);
		Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf16, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf16pos.at([0]), \posHi, ~buf16pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf14, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \dens, dens]);//dark in partials buffer
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf17, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo,  ~buf17pos.at([0]), \posHi,  ~buf17pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf15, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \dens, dens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf18, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf18pos.at([0]), \posHi, ~buf18pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;//wait time between reps

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf13, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf13pos.at([0]), \posHi, ~buf13pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpLoAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf14, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \dens, dens, \transpLo, transpLoAbs, \transpHi, transpHiAbs]);
		deltaDel.yield;//buffer didn't change ~buf12
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf12, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf12pos.at([0]), \posHi, ~buf12pos.at([1]), \dens, dens]);
	delta.yield;
		};
	delta.yield;
/////// version 2  gesture mix ramp and burst
4.do{
	delta = rrand(1,1.2);// wider range
	durLine = rrand(0.5, 2);//short envelope
	durLine1 = rrand(3, 7);
	mix = rrand(0.1, 0.3);//super dry rev
	room = rrand(0.2, 0.5);
	damp = rrand(0.6, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.03);//dry
	rate = rrand(0.95, 1.4);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.023); //grain duration bigger
	hiDurGr1 = rrand(0.023, 0.028); //grain duration bigger
	hiDurGr2 = rrand(0.028, 0.032); //grain duration bigger
	deltaDel = rrand(0.01, 0.03);// narrow range
	densAccum = (10..15)*0.01;//rate change in grain density
	dens = rrand(7, 11);
	hiDens = rrand(8,12);
	transpHiAbs = rrand(1.5, 2.0);
	transpLoAbs = rrand(0.9, 1.1);
		Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf18, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf18pos.at([0]), \posHi, ~buf18pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf16, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf16pos.at([0]), \posHi, ~buf16pos.at([1]), \dens, dens]);//dark in partials buffer
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf14, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr1, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf17, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf17pos.at([0]), \posHi, ~buf17pos.at([1]), \dens, dens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf15, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr2, \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;//wait time between reps

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf15, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpLoAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf16, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf16pos.at([0]), \posHi, ~buf16pos.at([1]), \dens, dens, \transpLo, transpLoAbs, \transpHi, transpHiAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf17, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf17pos.at([0]), \posHi, ~buf17pos.at([1]), \dens, dens]);
	delta.yield;
		};
	0.1.rrand(0.5).yield;
6.do{
	delta = rrand(1, 1.2);// wider range
	durLine = rrand(0.5, 1.5);//short envelope
	durLine1 = rrand(3, 12);
	mix = rrand(0.1, 0.4);//super dry rev
	room = rrand(0.2, 0.6);
	damp = rrand(0.4, 0.7);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.04);//dry
	rate = rrand(0.95, 1.3);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.03); //grain duration bigger
	hiDurGr1 = rrand(0.023, 0.028); //grain duration bigger
	hiDurGr2 = rrand(0.028, 0.032); //grain duration bigger
	deltaDel = rrand(0.03, 0.06);// narrow range
	densAccum = (10..15)*0.01;//rate change in grain density
	dens = rrand(7, 6);
	hiDens = rrand(5,12);
	transpHiAbs = rrand(1.5, 2.0);
	transpLoAbs = rrand(0.9, 1.1);
		Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf16, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf16pos.at([0]), \posHi, ~buf16pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

		Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf13, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf13pos.at([0]), \posHi, ~buf13pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpLoAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf14, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \dens, dens, \transpLo, transpLoAbs, \transpHi, transpHiAbs]);
		deltaDel.yield;//buffer didn't change ~buf12
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf,~buf12, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf12pos.at([0]), \posHi, ~buf12pos.at([1]), \dens, dens]);
	delta.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf17, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo,  ~buf17pos.at([0]), \posHi,  ~buf17pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf15, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \dens, dens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf18, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf18pos.at([0]), \posHi, ~buf18pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;//wait time between reps

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf14, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \dens, dens]);//dark in partials buffer
	deltaDel.yield;
	};*/
	/////// version 3  gesture mix ramp and burst transition
4.do{
	delta = rrand(1,1.2);// wider range
	durLine = rrand(0.5, 2);//short envelope
	durLine1 = rrand(3, 7);
	mix = rrand(0.1, 0.3);//super dry rev
	room = rrand(0.2, 0.5);
	damp = rrand(0.6, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.03);//dry
	rate = rrand(0.95, 1.4);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.023); //grain duration bigger
	hiDurGr1 = rrand(0.023, 0.028); //grain duration bigger
	hiDurGr2 = rrand(0.028, 0.032); //grain duration bigger
	deltaDel = rrand(0.01, 0.03);// narrow range
	densAccum = (10..15)*0.01;//rate change in grain density
	dens = rrand(7, 11);
	hiDens = rrand(8,12);
	transpHiAbs = rrand(1.5, 4.0);
	transpLoAbs = rrand(0.9, 1.1);
		Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf18, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf18pos.at([0]), \posHi, ~buf18pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~y, \sndbuf, ~buf16, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf16pos.at([0]), \posHi, ~buf16pos.at([1]), \dens, dens]);//dark in partials buffer
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf14, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr1, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~y, \sndbuf, ~buf17, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf17pos.at([0]), \posHi, ~buf17pos.at([1]), \dens, dens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf15, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr2, \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;//wait time between reps

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~y, \sndbuf,~buf15, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpLoAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~z, \sndbuf,~buf16, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf16pos.at([0]), \posHi, ~buf16pos.at([1]), \dens, dens, \transpLo, transpLoAbs, \transpHi, transpHiAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~y, \sndbuf,~buf17, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf17pos.at([0]), \posHi, ~buf17pos.at([1]), \dens, dens]);
	delta.yield;
		};
	0.1.rrand(0.5).yield;
6.do{
	delta = rrand(1, 1.2);// wider range
	durLine = rrand(0.5, 1.5);//short envelope
	durLine1 = rrand(3, 12);
	mix = rrand(0.1, 0.4);//super dry rev
	room = rrand(0.2, 0.6);
	damp = rrand(0.4, 0.7);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.04);//dry
	rate = rrand(0.95, 1.3);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.03); //grain duration bigger
	hiDurGr1 = rrand(0.023, 0.028); //grain duration bigger
	hiDurGr2 = rrand(0.028, 0.032); //grain duration bigger
	deltaDel = rrand(0.03, 0.06);// narrow range
	densAccum = (10..15)*0.01;//rate change in grain density
	dens = rrand(7, 16);
	hiDens = rrand(5,12);
	transpHiAbs = rrand(1.5, 7.0);
	transpLoAbs = rrand(0.9, 1.1);
		Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf16, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf16pos.at([0]), \posHi, ~buf16pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

		Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~y, \sndbuf,~buf13, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, ~buf13pos.at([0]), \posHi, ~buf13pos.at([1]), \dens, dens, \transpLo, transpHiAbs, \transpHi, transpLoAbs]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~z, \sndbuf,~buf14, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \dens, dens, \transpLo, transpLoAbs, \transpHi, transpHiAbs]);
		deltaDel.yield;//buffer didn't change ~buf12
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~y, \sndbuf,~buf12, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf12pos.at([0]), \posHi, ~buf12pos.at([1]), \dens, dens]);
	delta.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf17, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo,  ~buf17pos.at([0]), \posHi,  ~buf17pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf15, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf15pos.at([0]), \posHi, ~buf15pos.at([1]), \dens, dens]);
	deltaDel.yield;

	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf,  ~buf18, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf18pos.at([0]), \posHi, ~buf18pos.at([1]), \grPos, grPos, \hiDens, hiDens]);
	deltaDel.yield;//wait time between reps

	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf14, \durLine, durLine1, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, ~buf14pos.at([0]), \posHi, ~buf14pos.at([1]), \dens, dens]);//dark in partials buffer
	deltaDel.yield;

		};
});
)




~routGrainVCBufVer2.play;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/RoutinePligues/Section1/routGrainVCBufVer2_transition_take6.aif");
s.record;
s.stopRecording;
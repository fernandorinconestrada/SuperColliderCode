//// plotting;
Env([0,1,0], [0.5, 0.5], [-5, 5]).plot;

~buf1.plot(\buf1);
~buf2.plot(\buf2);
~buf3.plot(\buf3);

~buf4.plot(\bus4);
~buf5.plot(\bus5);
~buf6.plot(\bus6);

~buf7.plot(\bus7);//0.5, 0.7
~buf8.plot(\bus8);//0.25, 0.5
~buf9.plot(\bus9);



(
var winenv1, winenv2, winenv3;
/*~buf1 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_1.wav");
~buf2 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef3ChanMonoMix_6db_2.wav" );
~buf3 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef3ChanMonoMix_6db_3.wav" );*/

/*~buf1 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDef3ChanMonoMix_6db_1.wav" );
~buf2 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_1.wav");
~buf3 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_1.wav");*/

//buffer combination gesture 1
~buf1 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly55hz_Take1 [chan 3]_2_12db.wav");
~buf2 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly55hz_Take1 [chan 3]_3_12db.wav");
~buf3 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_2.wav");

//buffer combination gesture 2
~buf4 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_1.wav");
~buf5 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_2.wav");
~buf6 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/violoncelloSynthDefInstOnly_Take1 [chan 3]18db_3.wav");

//buffer cpmbination ramp gesture1
~buf7 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_3.wav" );
~buf8 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_2.wav");
~buf9 = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/Bounced Files/vcSynthDefChan1_2MonoMix_6db_1.wav");

winenv1 = Env([0,1,0], [0.05, 0.94], [5, -5]);
winenv2 = Env([0,1,0], [0.89, 0.1], [6, -5]);
winenv3 = Env([0,1,0], [0.49, 0.49], [-6, 6]);
~x = Buffer.sendCollection(s, winenv1.discretize, 1);
~y = Buffer.sendCollection(s, winenv2.discretize, 1);
~z = Buffer.sendCollection(s, winenv3.discretize, 1);

(
SynthDef(\bufGrainVCInstVer3, {|densAccum = 0.1, changeGr = 0.4, grpos = 8, sndbuf, mix = 0.4, room = 0.6, damp = 0.5, bus1 = 0, bus2 = 1, ampDel = 0.75, delT = 0.06, envbufnum = -1, grPos = 8, durLine = 3, rate = 1, loDurGr = 0.02, hiDurGr = 0.04, loDens = 0.2, hiDens = 8, loChangeGrDur = 1, hiChangeGrDur = 2, tail = 1.3, posLo = 0, posHi = 1|
var in, trig, dur, posGr, rev, delay, env, envRev;
env = EnvGen.kr(Env([0,1,0.6,0], [durLine*0.14, durLine*0.45, durLine*0.4], [5, 0, -5]), 1, doneAction: 2);
//env = EnvGen.kr(Env([0,1,0.9,0], [durLine*0.6, durLine*0.1, durLine*0.29], [-5, -1, -4]), 1, doneAction: 2);
envRev = EnvGen.kr(Env([0,1,0], [durLine*tail, durLine*tail], [-5, -1, -4]), 1, doneAction: 2);
trig = Dust.kr(SinOsc.kr(densAccum).range(loDens, hiDens));//density of grains
dur = SinOsc.kr(Dust.kr(changeGr).range(loChangeGrDur,hiChangeGrDur)).range(loDurGr, hiDurGr);//grain size
posGr = LFNoise0.kr(grPos).range(posLo, posHi);//position in buffer
in = GrainBuf.ar(1, trig, dur, sndbuf, rate, posGr, 2, 0, envbufnum)*env;
//in = GrainBuf.ar(1, Impulse.ar(dens), dur, sndbuf, XLine.kr(2, 1, durLine, doneAction:2), posGr, 2, 0, envbufnum)*env;
rev = FreeVerb.ar(in, mix, room, damp)*env;//variables for reverb
delay = DelayC.ar(rev, 0.1, delT, ampDel);//location of delay
OffsetOut.ar(bus1, LeakDC.ar(rev));
OffsetOut.ar(bus2, LeakDC.ar(FreeVerb.ar(delay)*envRev));
}).add;
)

(
SynthDef(\bufGrainVCInstVer3RampRhy, {|densAccum = 0.1, changeGr = 0.4, grpos = 8, sndbuf, mix = 0.4, room = 0.6, damp = 0.5, bus1 = 0, bus2 = 1, ampDel = 0.75, delT = 0.06, envbufnum = -1, grPos = 8, durLine = 3, rate = 1, loDurGr = 0.02, hiDurGr = 0.04, loDens = 0.2, hiDens = 8, loChangeGrDur = 1, hiChangeGrDur = 2, tail = 1.3, posLo = 0, posHi = 1, transpLo = 1, transpHi = 1, dens = 5|
var in, trig, dur, posGr, rev, delay, env, envRev;
env = EnvGen.kr(Env([0,1,0.6,0], [durLine*0.14, durLine*0.45, durLine*0.4], [5, 0, -5]), 1, doneAction: 2);
//env = EnvGen.kr(Env([0,1,0.9,0], [durLine*0.6, durLine*0.1, durLine*0.29], [-5, -1, -4]), 1, doneAction: 2);
envRev = EnvGen.kr(Env([0,1,0], [durLine*tail, durLine*tail], [-5, -1, -4]), 1, doneAction: 2);
//trig = Dust.kr(SinOsc.kr(densAccum).range(loDens, hiDens));//density of grains
dur = SinOsc.kr(Dust.kr(changeGr).range(loChangeGrDur,hiChangeGrDur)).range(loDurGr, hiDurGr);//grain size
posGr = LFNoise0.kr(grPos).range(posLo, posHi);//position in buffer
//in = GrainBuf.ar(1, trig, dur, sndbuf, rate, posGr, 2, 0, envbufnum)*env;
in = GrainBuf.ar(1, Impulse.ar(dens), dur, sndbuf, XLine.kr(transpLo, transpHi, durLine, doneAction:2), posGr, 2, 0, envbufnum)*env;
rev = FreeVerb.ar(in, mix, room, damp)*env;//variables for reverb
delay = DelayC.ar(rev, 0.1, delT, ampDel);//location of delay
OffsetOut.ar(bus1, LeakDC.ar(rev));
OffsetOut.ar(bus2, LeakDC.ar(FreeVerb.ar(delay)*envRev));
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
)


(
SynthDef(\bufGrainVCInstVer2, {|densAccum = 0.1, changeGr = 0.4, grpos = 8, sndbuf, mix = 0.4, room = 0.6, damp = 0.5, bus1 = 0, bus2 = 1, ampDel = 0.75, delT = 0.06, envbufnum = -1, grPos = 8, durLine = 3, rate = 1, loDurGr = 0.02, hiDurGr = 0.04, loDens = 0.2, hiDens = 8, loChangeGrDur = 1, hiChangeGrDur = 2|
var in, trig, dur, posGr, rev, delay, env;
env = EnvGen.kr(Env([0,1,0.6,0], [durLine*0.14, durLine*0.45, durLine*0.4], [5, 0, -5]), 1, doneAction: 2);
trig = Dust.kr(SinOsc.kr(densAccum).range(loDens, hiDens));//density of grains
dur = SinOsc.kr(Dust.kr(changeGr).range(loChangeGrDur,hiChangeGrDur)).range(loDurGr, hiDurGr);//grain size
posGr = LFNoise0.kr(grPos).range(0,1);//position in buffer
in = GrainBuf.ar(1, trig, dur, sndbuf, rate, posGr, 2, 0, envbufnum)*env;
rev = FreeVerb.ar(in, mix, room, damp)*env;//variables for reverb
delay = DelayC.ar(rev, 0.1, delT, ampDel);//location of delay
OffsetOut.ar(bus1, LeakDC.ar(rev));
OffsetOut.ar(bus2, LeakDC.ar(delay));
}).add;
)



a = Synth(\bufGrainVCInstVer3, [\envbufnum, ~y, \sndbuf, ~buf3, \durLine, 2, \hiDurGr, 0.04, \delT, 0.05, \dens, 24]);

a = Synth(\bufGrainVCInstVer3, [\envbufnum, ~y, \sndbuf, ~buf3, \durLine, 60]);
a.set(\dens, 24);
a.set(\sndbuf, ~buf2);

(

(
~fund = (0..20)*0.1+54;
~freq= (1..20)*~fund;
//~freq = ((1..20)*2)*~fund;
//~bus = (0..22);
//~bus1 = (0..22).scramble;
/*~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+12;*/
~amps = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5]-30);
);

~routGrainVCBufVer2 = Routine({
	var durLine, delta, densAccum, grPos, changeGr, mix, room, damp, ampDel, delT, rate, bus1, bus2, deltaDel, loDens, hiDens, loChangeDur, hiChangeDur, hiDurGr, dens, busArr, busIn, index, rateRand;
	//densAccum = rrand(0.1, 0.2);
	densAccum = (10..20)*0.01;
	grPos = (6..12);
	changeGr = (40..50)*0.01;
	//bus1 = (0..26);
	bus1 = (0..7);
	bus2 = (0..7);
	//bus2 = (0..26);

// gesture 1 - dark timbre rhythmic reps, noise, percussive, short delay, same buffer
2.do{
	3.do{
	delta = rrand(1.8, 2.0);//narrow wait times between synth reps
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
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;
	/*Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;*/
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	2.yield;//wait time between events not reps
	};
	3.yield;
1.do{// buffer change, on more synth
	2.do{
	delta = rrand(1.5,2);// wider range
	durLine = rrand(3, 5);//high range +1
	mix = rrand(0.3, 0.4);//little more wet
	room = rrand(0.2, 0.8);
	damp = rrand(0.4, 0.5);//mid damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.02);
	rate = rrand(0.95, 1.2);//wider range frequency shift
	hiDurGr = rrand(0.021, 0.023); //grain duration bigger
	deltaDel = rrand(0.025, 0.035);// synth delay + 0.01
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);//large content of partials
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);//large content of partials
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.25, \posHi, 0.75, \grPos, grPos]);// no wait
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf3, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]); //dark color buffer
	delta.yield;
		};
	2.yield;
	};// 25 secs aprox
	3.yield;
	//gesture 2
1.do{// buffer change, on more synth
	2.do{
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
	grPos = rrand(8,12);//rate change position of grain
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf4, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);//dark in partials buffer
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf6, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.55, \posHi, 0.8, \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~y, \sndbuf, ~buf5, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, 0.55, \posHi, 0.8, \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf6, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.6, \posHi, 0.9, \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf4, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	delta.yield;
		};
	3.yield;
		/////gesture 1 ramp
4.do{
	delta = rrand(1.5,2);// wider range
	durLine = rrand(0.5, 3);//short envelope
	mix = rrand(0.1, 0.3);//super dry rev
	room = rrand(0.2, 0.5);
	damp = rrand(0.6, 0.8);
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.02, 0.03);//dry
	rate = rrand(0.95, 1.2);//wider range frequency shift
	hiDurGr = rrand(0.017, 0.023); //grain duration bigger
	deltaDel = rrand(0.03, 0.04);// narrow range
	dens = rrand(7, 11);
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf8, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.1, \posHi, 0.4, \dens, dens]);//dark in partials buffer
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf8, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.4, \posHi, 0.7, \dens, dens]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf8, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr,  \posLo, 0.7, \posHi, 0.9, \dens, dens, \transpLo, 2, \transpHi, 0.9]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf8, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.4, \posHi, 0.7, \dens, dens, 2, \transpHi, 0.9]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3RampRhy, [\envbufnum, ~x, \sndbuf, ~buf8, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.1, \posHi, 0.4, \dens, dens]);
	delta.yield;
		};
	1.5.rrand(0.5).yield;
	};// ca. 40 secs
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
3.do{
	// gesture 1 repeated
	1.do{
	delta = rrand(1.8, 2.0);//narrow wait times between synth reps
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
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;
	/*Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;*/
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	0.5.rrand(1).yield;
	2.do{//buffer combination used in ramp
	delta = rrand(1.8, 2.0);//narrow wait times between synth reps
	durLine = rrand(4, 7); // narrow durLine
	mix = rrand(0.3, 0.4);//low mix
	room = rrand(0.2, 0.4);// larger room
	damp = rrand(0.4, 0.8);// large range damp
	ampDel = rrand(0.6, 0.8);
	delT = rrand(0.01, 0.02);
	rate = rrand(0.95, 1.1);//opening frequency variation
	hiDurGr = rrand(0.011, 0.021); //grain duration
	deltaDel = rrand(0.02, 0.023);//very narrow
	densAccum = (10..15)*0.01;//rate change in grain density
	grPos = rrand(8,12);//rate change position of grain
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf7, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf8, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf9, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	0.5.rrand(1).yield;
	2.do{
	delta = rrand(1.8, 2.0);//narrow wait times between synth reps
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
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;
	/*Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf1, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;*/
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf2, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	0.5.rrand(1).yield;
	3.do{//repetition of buffer combination used in ramp +1 rep
	delta = rrand(1.8, 2.0);//narrow wait times between synth reps
	durLine = rrand(5, 9); // longer durLine
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
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf7, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf8, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	deltaDel.yield;
	Synth(\bufGrainVCInstVer3, [\envbufnum, ~x, \sndbuf, ~buf9, \durLine, durLine, \densAccum, densAccum.choose, \grPos, grPos, \changeGr, changeGr.choose, \mix, mix, \room, room, \damp, damp, \ampDel, ampDel, \delT, delT, \rate, rate, \bus1, bus1.choose, \bus2, bus2.choose, \hiDurGr, hiDurGr, \posLo, 0.5, \posHi, 1, \grPos, grPos]);
	delta.yield;//wait time between reps
		};
	1.0.rrand(1.5).yield;
	}
});
)



~routGrainVCBufVer2.play;
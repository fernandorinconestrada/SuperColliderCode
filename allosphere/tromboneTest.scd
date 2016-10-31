//Trombone in Bflat

//fund = E3 = 330Hz
(
~fundE3 = 330;
~partsE3 = ~fundE3 * (1..10);
~ampsE3n = [24, 30, 27.3, 21, 17, 13.7, 15, 9.5, 6, 4].normalizeSum;
~ampsE3 = ([24, 30, 27.3, 21, 17, 13.7, 15, 9.5, 6, 4] - 30).dbamp;
)
~ampsE3 = [24, 30, 27.3, 21, 17, 13.7, 15, 9.5, 6, 4].plot("TrbnBfl_E3");

//fund = E2 = 165Hz
(
~fundE2 = 165;
~partsE2 = ~fundE2 * (1..19);
~ampsE2 = ([20.5, 19.5, 30, 28, 20.5, 22.5, 21, 18.5, 19.8, 12.5, 9, 10.3, 7.5, 9, 6, 8.5, 7, 5.5, 4] - 30).dbamp;
)
~ampsE2 = [20.5, 19.5, 30, 28, 20.5, 22.5, 21, 18.5, 19.8, 12.5, 9, 10.3, 7.5, 9, 6, 8.5, 7, 5.5, 4].plot("TrbnBfl_E2");

//fund = E1 = 82Hz
(
~fundE1 = 82;
~partsE1 = ~fundE1 * (1..35);
~ampsE1 = ([15, 11, 27.5, 22, 28, 27.5, 30, 29, 28, 27, 26, 23, 27, 23, 24, 18, 17.2, 18.5, 16.2, 18, 22, 20, 17, 18, 17, 18.5, 17, 15, 9, 8, 9, 7, 5, 4, 3]-30).dbamp;
)
~ampsE1 = [15, 11, 27.5, 22, 28, 27.5, 30, 29, 28, 27, 26, 23, 27, 23, 24, 18, 17.2, 18.5, 16.2, 18, 22, 20, 17, 18, 17, 18.5, 17, 15, 9, 8, 9, 7, 5, 4, 3].plot("TrbnBfl_E1");

{ Formant.ar(165, 2310, MouseX.kr(50, 1320).poll, 0.1)}.play;
330*7;
{
	var gliss, scale;
	gliss = MouseX.kr(0.5, 1.5);
	scale = MouseY.kr(0,1).poll;
	Mix.new([Formant.ar((~fundE3*gliss).poll, ~fundE3*2, 660, 0.13*scale), Formant.ar(~fundE3*gliss, ~fundE3*3, 660, 0.03*scale), Formant.ar(~fundE3*gliss, ~fundE3*7, 770, 0.02*scale)])
}.play;

// good brass timbre
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE3, 0.0002, ~ampsE3*30)), Formant.ar(~fundE3, ~fundE3*2, 660, 0.13*scale), Formant.ar(~fundE3, ~fundE3*3, 660, 0.03*scale), Formant.ar(~fundE3, ~fundE3*7, 770, 0.02*scale)]))
}.play;

//low level ca. 0.5 scaled in formants gives more a wooden than brassy sound
{
	var scale, bw;
	scale = MouseX.kr(0,1);
	bw = MouseY.kr(0.5, 2);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE2, 0.0003, ~ampsE2*30)), Formant.ar(~fundE2, ~fundE2*4, 660*bw, 0.15*scale), Formant.ar(~fundE2, ~fundE2*6, 660*bw, 0.05*scale), Formant.ar(~fundE2, ~fundE2*14, 770*bw, 0.04*scale)]))
}.play;

//bass clarinet flavor, bandwith of Resonz gives more airy flavor
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE1, 0.0003, ~ampsE1*30)), Formant.ar(~fundE1, ~fundE1*8, 660, 0.2*scale), Formant.ar(~fundE1, ~fundE1*12, 660, 0.08*scale), Formant.ar(~fundE1, ~fundE1*28, 770, 0.07*scale)]))
}.play

//bandpass
// good brass flavor
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsE3*LFNoise0.kr(12).range(0.998, 1.002), 0.0001, ~ampsE3*30)), Formant.ar(~fundE3, ~fundE3*2, 660, 0.13*scale), Formant.ar(~fundE3, ~fundE3*3, 660, 0.03*scale), Formant.ar(~fundE3, ~fundE3*7, 770, 0.02*scale)]))
}.play;

// delayed and rev, mix clean and rev is effective
{
	var scale, in, del, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsE3*LFNoise0.kr(12).range(0.998, 1.002), 0.0002, (~ampsE3*30)*SinOsc.kr(SinOsc.kr(0.3).range(2,4)).range(0.9, 0.99))), Formant.ar(~fundE3, ~fundE3*2, 660, 0.13*scale), Formant.ar(~fundE3, ~fundE3*3, 660, 0.03*scale), Formant.ar(~fundE3, ~fundE3*7, 770, 0.02*scale)]);
	del = DelayC.ar(in, 0.1, 0.06, 0.72);
	rev = FreeVerb.ar(del, 0.4, 0.4, 0.5);
	Out.ar(0, LeakDC.ar(rev));
	Out.ar(1, LeakDC.ar(in));
}.play;

//not convincing, wooden hybrid, weird
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsE2, 0.0002, ~ampsE2*30)), Formant.ar(~fundE2, ~fundE2*4, 660, 0.15*scale), Formant.ar(~fundE2, ~fundE2*6, 660, 0.08*scale), Formant.ar(~fundE2, ~fundE2*14, 770, 0.07*scale)]))
}.play;

//little bit better
{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsE2*LFNoise0.kr(12).range(0.999, 1.001), 0.0002, ~ampsE2*30)), Formant.ar(~fundE2, ~fundE2*4, 660, 0.15*scale), Formant.ar(~fundE2, ~fundE2*6, 660, 0.08*scale), Formant.ar(~fundE2, ~fundE2*14, 770, 0.07*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.8);
	Out.ar(0, LeakDC.ar(rev))
}.play;

//totally bass clarinet, clean with no formants
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE1*LFNoise0.kr(8).range(0.999, 1.001), 0.0003, ~ampsE1*30)), Formant.ar(~fundE1, ~fundE1*8, 660, 0.1*scale), Formant.ar(~fundE1, ~fundE1*12, 660, 0.04*scale), Formant.ar(~fundE1, ~fundE1*28, 770, 0.03*scale)]))
}.play

{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE1*LFNoise0.kr(8).range(0.999, 1.001), 0.0002, ~ampsE1*30)), Formant.ar(~fundE1, ~fundE1*8, 660, 0.1*scale), Formant.ar(~fundE1, ~fundE1*12, 660, 0.04*scale), Formant.ar(~fundE1, ~fundE1*28, 770, 0.03*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, LeakDC.ar(rev))
}.play;

// mix rev, clean
{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE1*LFNoise0.kr(8).range(0.999, 1.001), 0.0002, ~ampsE1*30)), Formant.ar(~fundE1, ~fundE1*8, 660, 0.1*scale), Formant.ar(~fundE1, ~fundE1*12, 660, 0.04*scale), Formant.ar(~fundE1, ~fundE1*28, 770, 0.03*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, LeakDC.ar(rev));
	Out.ar(1, LeakDC.ar(in));
}.play;
//big reverb
{
	var scale, in, delay, parallel;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE1*LFNoise0.kr(8).range(0.999, 1.001), 0.0002, ~ampsE1*30)), Formant.ar(~fundE1, ~fundE1*8, 660, 0.1*scale), Formant.ar(~fundE1, ~fundE1*12, 660, 0.04*scale), Formant.ar(~fundE1, ~fundE1*28, 770, 0.03*scale)]);
	delay = DelayN.ar(in, 0.06);
	parallel = Mix.ar(Array.fill(7, {CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05).abs, 5)}));
	4.do({parallel = AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], 1)});
	//rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, LeakDC.ar(parallel)*0.2);
	Out.ar(0, LeakDC.ar(in));
}.play;
//big reverb multichann
{
	var scale, in, delay, parallel1, parallel2, parallel3, parallel4, parallel5, parallel6, parallel7;
	scale = MouseX.kr(0,0.4);
	in = Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsE1*LFNoise0.kr(8).range(0.999, 1.001), 0.0002, ~ampsE1*20)), Formant.ar(~fundE1, ~fundE1*8, 660, 0.1*scale), Formant.ar(~fundE1, ~fundE1*12, 660, 0.04*scale), Formant.ar(~fundE1, ~fundE1*28, 770, 0.03*scale)]);
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
	OffsetOut.ar(0, LeakDC.ar(parallel1)*0.5);
	OffsetOut.ar(1, LeakDC.ar(in*0.5));
	OffsetOut.ar(2, LeakDC.ar(parallel2)*0.5);
	OffsetOut.ar(3, LeakDC.ar(in*0.5));
	OffsetOut.ar(4, LeakDC.ar(parallel3)*0.5);
	OffsetOut.ar(5, LeakDC.ar(in*0.5));
	OffsetOut.ar(6, LeakDC.ar(parallel4)*0.5);
	OffsetOut.ar(7, LeakDC.ar(in*0.5));
	OffsetOut.ar(8, LeakDC.ar(parallel5)*0.5);
	OffsetOut.ar(9, LeakDC.ar(in*0.5));
	OffsetOut.ar(10, LeakDC.ar(parallel6)*0.5);
	OffsetOut.ar(11, LeakDC.ar(in*0.5));
	OffsetOut.ar(12, LeakDC.ar(parallel7)*0.5);
	OffsetOut.ar(13, LeakDC.ar(in*0.5));
}.play;

//grain
{
	var scale, in, delay, rev, trigRate, trig, grain;
	trigRate = MouseY.kr(8, 40);
	trig = LFNoise0.kr(trigRate);
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF2*LFNoise0.kr(16).range(0.998, 1.002), 0.0001, ~ampsF2*20)), Formant.ar(~fundF2, ~fundF2*4, 400, 0.4*scale), Formant.ar(~fundF2, ~fundF2*7, 400, 0.3*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	grain = GrainIn.ar(2, trig, trig.range(0.01, 0.04), rev, trig.range(-1.0, 1.0));
	Out.ar(0, LeakDC.ar(grain))
}.play;

//grain F2
{
	var scale, in, delay, rev, trigRate, trig, grain, delGrain;
	trigRate = MouseY.kr(8, 40);
	trig = LFNoise0.kr(trigRate);
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF2*LFNoise0.kr(16).range(0.998, 1.002), 0.0001, ~ampsF2*20)), Formant.ar(~fundF2, ~fundF2*4, 400, 0.4*scale), Formant.ar(~fundF2, ~fundF2*7, 400, 0.3*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	grain = GrainIn.ar(2, trig, trig.range(0.01, 0.04), rev, trig.range(-1.0, 1.0));
	delGrain = Pan2.ar(DelayC.ar(grain, 0.1, 0.06, 0.75), trig.range(1.0, -1.0));
	OffsetOut.ar(0, LeakDC.ar(grain));
	OffsetOut.ar(0, LeakDC.ar(delGrain));
}.play;

//grain F4
{
	var scale, in, delay, rev, trigRate, trig, grain, delGrain;
	trigRate = MouseY.kr(8, 40);
	trig = LFNoise0.kr(trigRate);
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF4*LFNoise0.kr(16).range(0.998, 1.002), 0.0001, ~ampsF4*20)), Formant.ar(~fundF4, ~fundF4*4, 400, 0.4*scale), Formant.ar(~fundF4, ~fundF4*7, 400, 0.3*scale)]);
	delay = DelayC.ar(in, 0.2, 0.02, 0.75);
	rev = FreeVerb.ar(delay, 0.8, 0.3, 0.5);
	grain = GrainIn.ar(2, trig, trig.range(0.03, 0.06), rev, trig.range(-1.0, 1.0));
	delGrain = Pan2.ar(DelayC.ar(grain, 0.1, 0.09, 0.75), trig.range(1.0, -1.0));
	OffsetOut.ar(0, LeakDC.ar(grain));
	OffsetOut.ar(0, LeakDC.ar(delGrain));
}.play;
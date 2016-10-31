//Trumpet in Bflat

//fund = F4 = 698Hz
(
~fundF4 = 698;
~partsF4 = ~fundF4 * (1..14);
~ampsF4n = [25, 30, 25, 21, 17, 16.5, 13, 16, 12.5, 12.5, 12, 9.5, 7.5, 5].normalizeSum;
~ampsF4 = ([25, 30, 25, 21, 17, 16.5, 13, 16, 12.5, 12.5, 12, 9.5, 7.5, 5] - 30).dbamp;
)
~ampsF4 = [25, 30, 25, 21, 17, 16.5, 13, 16, 12.5, 12.5, 12, 9.5, 7.5, 5].plot("TrptBfl_F4");

//fund = F3 = 349Hz
(
~fundF3 = 349;
~partsF3 = ~fundF3 * (1..26);
~ampsF3 = ([17.5, 25, 30, 25.3, 19, 17.5, 16, 15, 16, 15, 14, 15, 13, 11, 9, 12.5, 12.5, 10, 7, 10, 8, 9.5, 7, 4, 2, 1] - 30).dbamp;
)
~ampsF3 = [17.5, 25, 30, 25.3, 19, 17.5, 16, 15, 16, 15, 14, 15, 13, 11, 9, 12.5, 12.5, 10, 7, 10, 8, 9.5, 7, 4, 2, 1].plot("TrptBfl_F3");

//fund = F2 = 175Hz
(
~fundF2 = 175;
~partsF2 = ~fundF2 * (1..28);
~ampsF2 = ([17.5, 24.5, 27.5, 30, 26, 19.5, 20.2, 18.2, 16.3, 15, 16.3, 15, 16.6, 15, 16, 17, 12, 14.3, 8.5, 10.5, 6, 4, 3.5, 2.8, 3.7, 3, 2, 1]-30).dbamp;
)
~ampsF2 = [17.5, 24.5, 27.5, 30, 26, 19.5, 20.2, 18.2, 16.3, 15, 16.3, 15, 16.6, 15, 16, 17, 12, 14.3, 8.5, 10.5, 6, 4, 3.5, 2.8, 3.7, 3, 2, 1].plot("TrptBfl_F2");

{ Formant.ar(698, 2800, MouseX.kr(50, 1200).poll, 0.1)}.play;

{
	var gliss, scale;
	gliss = MouseX.kr(0.5, 1.5);
	scale = MouseY.kr(0,1);
	Mix.new([Formant.ar((~fundF4*gliss).poll, ~fundF4*2, 400, 0.1*scale), Formant.ar(~fundF4*gliss, ~fundF4*4, 400, 0.05*scale), Formant.ar(~fundF4*gliss, ~fundF4*4, 400, 0.01*scale)])
}.play;

// strange upper partial behaviour
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsF4, 0.0001, ~ampsF4*20)), Formant.ar(~fundF4, ~fundF4*2, 400, 0.1*scale), Formant.ar(~fundF4, ~fundF4*4, 400, 0.05*scale)]))
}.play;

{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsF3, 0.0001, ~ampsF3*20)), Formant.ar(~fundF3, ~fundF3*4, 400, 0.1*scale), Formant.ar(~fundF3, ~fundF3*7, 400, 0.05*scale)]))
}.play;

{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsF2, 0.0001, ~ampsF2*20)), Formant.ar(~fundF2, ~fundF2*8, 400, 0.1*scale), Formant.ar(~fundF2, ~fundF2*14, 400, 0.1*scale)]))
}.play

//bandpass
//convincing trumpet timbre
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF4, 0.0001, ~ampsF4*20)), Formant.ar(~fundF4, ~fundF4*2, 400, 0.1*scale), Formant.ar(~fundF4, ~fundF4*4, 400, 0.05*scale)]))
}.play;

{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF4, 0.0001, ~ampsF4*20)), Formant.ar(~fundF4, ~fundF4*2, 400, 0.1*scale), Formant.ar(~fundF4, ~fundF4*4, 400, 0.05*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, rev)
}.play;

// low levels in formants sound more as muted trumpet, formants to max hard coded v.alue don't work, they work better by half'
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF3, 0.0001, ~ampsF3*20)), Formant.ar(~fundF3, ~fundF3*4, 400, 0.1*scale), Formant.ar(~fundF3, ~fundF3*7, 400, 0.05*scale)]))
}.play;

{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF3*LFNoise0.kr(16).range(0.998, 1.002), 0.0001, ~ampsF3*20)), Formant.ar(~fundF3, ~fundF3*4, 400, 0.1*scale), Formant.ar(~fundF3, ~fundF3*8, 400, 0.05*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, LeakDC.ar(rev))
}.play;

{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsF2, 0.0001, ~ampsF2*20)), Formant.ar(~fundF2, ~fundF2*8, 400, 0.07*scale), Formant.ar(~fundF2, ~fundF2*14, 400, 0.03*scale)]))
}.play

{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsF2*LFNoise0.kr(16).range(0.998, 1.002), 0.0001, ~ampsF2*20)), Formant.ar(~fundF2, ~fundF2*4, 400, 0.4*scale), Formant.ar(~fundF2, ~fundF2*7, 400, 0.3*scale)]);
	delay = DelayC.ar(in, 0.2, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, LeakDC.ar(rev))
}.play;


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
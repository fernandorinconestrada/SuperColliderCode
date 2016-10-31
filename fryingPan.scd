{
	var randDur, in;
	randDur = LFNoise0.kr(2).range(1, 10).round.poll;
	in = Decay2.ar(Impulse.ar(1/randDur), 0.001, randDur, BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(2, 4)), LFNoise0.kr(20).range(440, 455), LFNoise0.kr(20).range(0.01, 0.03), EnvGen.kr(Env.perc(0.001, XLine.kr(LFNoise0.kr(20).range(0.001, 0.03), LFNoise0.kr(20).range(0.001, 0.03))), Impulse.kr(LFNoise0.kr(20).range(1, 8)))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(1, Pan2.ar(DelayC.ar(in, 0.2, 0.04), LFNoise0.kr(20).range(1.0, -1.0), LFNoise0.kr(20).range(0.5, 0.8)));
}.play;

{
	var randDur, in;
	randDur = LFNoise0.kr(2).range(1, 10).round.poll;
	in = Decay2.ar(Impulse.ar(1/randDur), 0.001, randDur, BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(2, 4)), LFNoise0.kr(20).range(660, 675), LFNoise0.kr(20).range(0.01, 0.03), EnvGen.kr(Env.perc(0.001, XLine.kr(LFNoise0.kr(20).range(0.001, 0.03), LFNoise0.kr(20).range(0.001, 0.03))), Impulse.kr(LFNoise0.kr(20).range(1, 8)))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(1, Pan2.ar(DelayC.ar(in, 0.2, 0.04), LFNoise0.kr(20).range(1.0, -1.0), LFNoise0.kr(20).range(0.5, 0.8)));
}.play;

{
	var randDur, in;
	randDur = LFNoise0.kr(2).range(1, 10).round.poll;
	in = Decay2.ar(Impulse.ar(1/randDur), 0.001, randDur, BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(2, 4)), LFNoise0.kr(20).range(1320, 1335), LFNoise0.kr(20).range(0.01, 0.03), EnvGen.kr(Env.perc(0.001, XLine.kr(LFNoise0.kr(20).range(0.001, 0.03), LFNoise0.kr(20).range(0.001, 0.03))), Impulse.kr(LFNoise0.kr(20).range(1, 8)))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(1, Pan2.ar(DelayC.ar(in, 0.2, 0.04), LFNoise0.kr(20).range(1.0, -1.0), LFNoise0.kr(20).range(0.5, 0.8)));
}.play;

{
	var randDur, in;
	randDur = LFNoise0.kr(2).range(1, 10).round.poll;
	in = Decay2.ar(Impulse.ar(3/randDur), 0.001, randDur, BBandPass.ar(WhiteNoise.ar(LFNoise0.kr(20).range(2, 4)), LFNoise0.kr(20).range(1440, 1455), LFNoise0.kr(20).range(0.01, 0.03), EnvGen.kr(Env.perc(0.001, XLine.kr(LFNoise0.kr(20).range(0.001, 0.03), LFNoise0.kr(20).range(0.001, 0.03))), Impulse.kr(LFNoise0.kr(20).range(1, 8)))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(1, Pan2.ar(DelayC.ar(in, 0.2, 0.04), LFNoise0.kr(20).range(1.0, -1.0), LFNoise0.kr(20).range(0.5, 0.8)));
}.play;


{
	var randDur, in;
	randDur = LFNoise0.kr(2).range(1, 10).round.poll;
	in = Decay2.ar(Impulse.ar(3/randDur), 0.001, randDur, SinOscFB.ar(LFNoise0.kr(20).range(1440, 1455), LFNoise0.kr(20).range(0.3, 0.7), EnvGen.kr(Env.perc(0.001, XLine.kr(LFNoise0.kr(20).range(0.001, 0.02), LFNoise0.kr(20).range(0.001, 0.02), randDur))), Impulse.kr(LFNoise0.kr(20).range(1, 8))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(1, Pan2.ar(DelayC.ar(in, 0.2, 0.04), LFNoise0.kr(20).range(1.0, -1.0), LFNoise0.kr(20).range(0.5, 0.8)));
}.play;

{Mix(SinOscFB.ar([LFNoise0.kr(20).range(110, 120), LFNoise0.kr(20).range(880, 890), LFNoise0.kr(20).range(3520, 3530)], LFNoise0.kr(20).range(0.3, 0.7), EnvGen.kr(Env.perc(0.01, XLine.kr(LFNoise0.kr(20).range(0.0005, 0.02), LFNoise0.kr(20).range(0.0005, 0.02), 5).poll, LFNoise0.kr(LFNoise0.kr(20).range(0.2, 0.3))),Impulse.kr(8))))}.play;

{
var in;
	in = Mix(SinOscFB.ar([LFNoise0.kr(20).range(110, 120), LFNoise0.kr(20).range(880, 890), LFNoise0.kr(20).range(3520, 3530)], LFNoise0.kr(20).range(0.3, 0.7), EnvGen.kr(Env.perc(0.01, SinOsc.kr(1/5).range(0.001, 0.02).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(8))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.09, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)));
}.play;
(
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*16, (55*16)+10), LFNoise0.kr(17).range(55*17, (55*17)+10), LFNoise0.kr(19).range(55*19, (55*19)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/5).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.4, 0.5)),Impulse.kr(11))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.04, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(17).range(2.0,4.0)), [LFNoise0.kr(19).range(55*23, (55*23)+10), LFNoise0.kr(23).range(55*29, (55*29)+10), LFNoise0.kr(17).range(55*31, (55*31)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/4).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.4, 0.45)),Impulse.kr(13))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.06, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*37, (55*37)+10), LFNoise0.kr(17).range(55*41, (55*41)+10), LFNoise0.kr(11).range(55*43, (55*43)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/3).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.4, 0.45)),Impulse.kr(7))));
	OffsetOut.ar(0, Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.05, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)));
}.play;
)

(
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*16, (55*16)+10), LFNoise0.kr(17).range(55*17, (55*17)+10), LFNoise0.kr(19).range(55*19, (55*19)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/5).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.2, 0.3)),Impulse.kr(11))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.04, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0))));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(17).range(2.0,4.0)), [LFNoise0.kr(19).range(55*23, (55*23)+10), LFNoise0.kr(23).range(55*29, (55*29)+10), LFNoise0.kr(17).range(55*31, (55*31)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/4).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.2, 0.3)),Impulse.kr(13))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.06, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0))));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*37, (55*37)+10), LFNoise0.kr(17).range(55*41, (55*41)+10), LFNoise0.kr(11).range(55*43, (55*43)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/3).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.2, 0.3)),Impulse.kr(7))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.05, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0))));
}.play;
)

(
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*16, (55*16)+10), LFNoise0.kr(17).range(55*17, (55*17)+10), LFNoise0.kr(19).range(55*19, (55*19)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/5).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(11))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)), 3, 1));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.04, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)), 3, 1));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(17).range(2.0,4.0)), [LFNoise0.kr(19).range(55*23, (55*23)+10), LFNoise0.kr(23).range(55*29, (55*29)+10), LFNoise0.kr(17).range(55*31, (55*31)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/4).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(13))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)), 5, 2));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.06, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)), 5, 2));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*37, (55*37)+10), LFNoise0.kr(17).range(55*41, (55*41)+10), LFNoise0.kr(11).range(55*43, (55*43)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/3).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(7))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)), 7, 5));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.05, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)), 7, 5));
}.play;
)

(
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*16, (55*16)+10), LFNoise0.kr(17).range(55*17, (55*17)+10), LFNoise0.kr(19).range(55*19, (55*19)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/5).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(5.3))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.04, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0))));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(17).range(2.0,4.0)), [LFNoise0.kr(19).range(55*23, (55*23)+10), LFNoise0.kr(23).range(55*29, (55*29)+10), LFNoise0.kr(17).range(55*31, (55*31)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/4).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(7.9))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(1.0, -1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.06, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(-1.0, 1.0))));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*37, (55*37)+10), LFNoise0.kr(17).range(55*41, (55*41)+10), LFNoise0.kr(11).range(55*43, (55*43)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/3).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(7.1))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.05, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0))));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*16, (55*16)+10), LFNoise0.kr(17).range(55*17, (55*17)+10), LFNoise0.kr(19).range(55*19, (55*19)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/5).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(4.7))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(1.0, -1.0)), 3, 1));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.04, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(-1.0, 1.0)), 3, 1));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(17).range(2.0,4.0)), [LFNoise0.kr(19).range(55*23, (55*23)+10), LFNoise0.kr(23).range(55*29, (55*29)+10), LFNoise0.kr(17).range(55*31, (55*31)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/4).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(6.7))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(-1.0, 1.0)), 5, 2));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.06, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(1.0, -1.0)), 5, 2));
}.play;
{
	var in;
	in = Mix(BBandPass.ar(WhiteNoise.ar(LFNoise0.ar(19).range(2.0,4.0)), [LFNoise0.kr(23).range(55*37, (55*37)+10), LFNoise0.kr(17).range(55*41, (55*41)+10), LFNoise0.kr(11).range(55*43, (55*43)+10)], LFNoise0.kr(20).range(0.008, 0.01), EnvGen.kr(Env.perc(0.001, SinOsc.kr(1/3).range(0.01, 0.03).poll, LFNoise0.kr(20).range(0.1, 0.15)),Impulse.kr(7.3))));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(in, LFNoise0.kr(20).range(1.0, -1.0)), 7, 5));
	OffsetOut.ar(0, GVerb.ar(Pan2.ar(DelayC.ar(in, 0.2, 0.05, LFNoise0.kr(20).range(0.5, 0.8)), LFNoise0.kr(20).range(-1.0, 1.0)), 7, 5));
}.play;
)
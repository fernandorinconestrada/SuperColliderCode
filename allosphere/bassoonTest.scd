//Bassoon in C

//fund = G3 = 392Hz
(
~fundG3 = 392;
~partsG3 = ~fundG3 * (1..12);
~ampsG3n = [30, 23, 19.5, 21, 18, 17.5, 20, 17, 18.3, 9.5, 6, 2].normalizeSum;
~ampsG3 = ([30, 23, 19.5, 21, 18, 17.5, 20, 17, 18.3, 9.5, 6, 2] - 30).dbamp;
)
~ampsG3 = [30, 23, 19.5, 21, 18, 17.5, 20, 17, 18.3, 9.5, 6, 2].plot("Bassoon_G3");

//fund = G2 = 196Hz
(
~fundG2 = 196;
~partsG2 = ~fundG2 * (1..19);
~ampsG2 = ([21, 30, 28, 25, 24, 19.5, 18, 14.5, 10, 17.5, 19.3, 15.8, 13, 8.5, 5, 10, 7.5, 3, 2] - 30).dbamp;
)
~ampsG2 = [21, 30, 28, 25, 24, 19.5, 18, 14.5, 10, 17.5, 19.3, 15.8, 13, 8.5, 5, 10, 7.5, 3, 2].plot("Bassoon_G2");

//fund = G1 = 98Hz
(
~fundG1 = 98;
~partsG1 = ~fundG1 * (1..33);
~ampsG1 = ([18, 19.5, 20, 25, 27, 28, 30, 23, 25, 21, 20, 21.5, 18, 7.5, 4.5, 4.5, 8, 19, 18.5, 7.5, 12, 5.5, 3, 5.5, 9, 8, 4, 3, 2.5, 5, 3.5, 2, 1]-30).dbamp;
)
~ampsG1 = [18, 19.5, 20, 25, 27, 28, 30, 23, 25, 21, 20, 21.5, 18, 7.5, 4.5, 4.5, 8, 19, 18.5, 7.5, 12, 5.5, 3, 5.5, 9, 8, 4, 3, 2.5, 5, 3.5, 2, 1].plot("Bassoon_G1");

//formant test
// F1= 500Hz, "o" coloring, F2 = 1000Hz, "a" coloring, 2000Hz, "e" coloring, 3500 Hz, "i" coloring

{ Formant.ar(98, 3500, MouseX.kr(50, 800).poll, 0.1)}.play;

{ Out.ar(0, Mix.new([Formant.ar(98, 500, 120, 0.1), Formant.ar(98, 1000, 270, 0.06), Formant.ar(98, 2000, 430, 0.03), Formant.ar(98, 3500, 100, 0.01)])) }.play;

{
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsG3, 0.0001, ~ampsG3*20)), Formant.ar(~fundG3.postln, 500, 120, 0.1), Formant.ar(~fundG3, 1000, 270, 0.06), Formant.ar(~fundG3, 2000, 430, 0.03), Formant.ar(~fundG3, 3500, 100, 0.01)]))
}.play;

{
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsG2, 0.0001, ~ampsG2*20)), Formant.ar(~fundG2.postln, 500, 120, 0.1), Formant.ar(~fundG2, 1000, 270, 0.06), Formant.ar(~fundG2, 2000, 430, 0.03), Formant.ar(~fundG2, 3500, 100, 0.01)]))
}.play;

{
	var scale;
	scale = MouseX.kr(0.2, 1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsG1, 0.0001, ~ampsG1*20)), Formant.ar(~fundG1.postln, 500, 120, 0.1*scale), Formant.ar(~fundG1, 1000, 270, 0.06*scale), Formant.ar(~fundG1, 2000, 430, 0.03*scale), Formant.ar(~fundG1, 3500, 100, 0.01*scale)]))
}.play;

//Bandpass

{
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsG3*SinOsc.kr(0.2).range(0.999, 1.001), 0.0001, ~ampsG3*20)), Formant.ar(~fundG3.postln, 500, 120, 0.1), Formant.ar(~fundG3, 1000, 270, 0.06), Formant.ar(~fundG3, 2000, 430, 0.03), Formant.ar(~fundG3, 3500, 100, 0.01)]))
}.play;

{
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsG2*SinOsc.kr(0.2).range(0.999, 1.001), 0.0001, ~ampsG2*20)), Formant.ar(~fundG2.postln, 500, 120, 0.1), Formant.ar(~fundG2, 1000, 270, 0.06), Formant.ar(~fundG2, 2000, 430, 0.03), Formant.ar(~fundG2, 3500, 100, 0.01)]))
}.play;

//most convincing, too synthetic electric-mechanic
{
	var scale;
	scale = MouseX.kr(0.2, 1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsG1, 0.0001, ~ampsG1*20)), Formant.ar(~fundG1.postln, 500, 120, 0.1*scale), Formant.ar(~fundG1, 1000, 270, 0.06*scale), Formant.ar(~fundG1, 2000, 430, 0.03*scale), Formant.ar(~fundG1, 3500, 100, 0.01*scale)]))
}.play;

{
	var scale, in, delay, rev;
	scale = MouseX.kr(0.2, 1);
	in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsG1, 0.0001, ~ampsG1*20)), Formant.ar(~fundG1.postln, 500, 120, 0.1*scale), Formant.ar(~fundG1, 1000, 270, 0.06*scale), Formant.ar(~fundG1, 2000, 430, 0.03*scale), Formant.ar(~fundG1, 3500, 100, 0.01*scale)]);
	delay = DelayC.ar(in, 0.1, 0.06, 0.75);
	rev = FreeVerb.ar(delay, 0.6, 0.3, 0.4);
	Out.ar([0,1], LeakDC.ar(rev));
}.play;
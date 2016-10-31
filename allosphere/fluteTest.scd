//flute in C

//fund = G5 = 1568Hz
(
~fundG5 = 1568;
~partsG5 = ~fundG5 * (1..3);
~ampsG5 = [30, 17, 5].normalizeSum;
)
~ampsG5 = [30, 17, 5].plot("FluteG5");

//fund = G4 = 784Hz
(
~fundG4 = 784;
~partsG4 = ~fundG4 * (1..6);
~ampsG4 = [30, 24, 18.5, 19.5, 12, 3].normalizeSum;
)
~ampsG4 = [30, 24, 18.5, 19.5, 12, 3].plot("FluteG4");

//fund = G3 = 392Hz

(
~fundG3 = 392;
~partsG3 = ~fundG3 * (1..12);
~ampsG3 = [30, 27, 22, 20.5, 19.7, 18.8, 17, 15, 13, 10.5, 7, 3].normalizeSum;
)
~ampsG3 = [30, 27, 22, 20.5, 19.7, 18.8, 17, 15, 13, 10.5, 7, 3].plot("FluteG3");

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsG5, 0.0001, ~ampsG5.ampdb*0.7)))
}.play;

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsG4, 0.0001, ~ampsG4.ampdb*0.6)))
}.play;

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsG3, 0.0001, ~ampsG5.ampdb*0.5)))
}.play;

//better
{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsG5, 0.0001, ~ampsG5.ampdb*0.7)))
}.play;

//better, bowed string flautato flavor
{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsG4, 0.0001, ~ampsG4.ampdb*0.6)))
}.play;

// better, blend wind and string
{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsG3, 0.0001, ~ampsG5.ampdb*0.5)))
}.play;

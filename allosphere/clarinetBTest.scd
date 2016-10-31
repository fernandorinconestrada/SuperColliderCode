//Clarinet in B

//fund = B4 = 998Hz
(
~fundB4 = 998;
~partsB4 = ~fundB4 * (1..10);
//~ampsB4 = [30, 18.5, 21, 18.5, 19.6, 18.5, 19, 17.5, 18.6, 11].sqrt.normalize;
~ampsB4n = [30, 18.5, 21, 18.5, 19.6, 18.5, 19, 17.5, 18.6, 11].normalizeSum;
~ampsB4 = ([30, 18.5, 21, 18.5, 19.6, 18.5, 19, 17.5, 18.6, 11] - 30).dbamp;
)
~ampsB4 = [30, 18.5, 21, 18.5, 19.6, 18.5, 19, 17.5, 18.6, 11].plot("ClarB_B4");
~ampsB4.value;

//fund = B3 = 494Hz
(
~fundB3 = 494;
~partsB3 = ~fundB3 * (1..14);
//~ampsB3 = [30, 19, 26.5, 19, 20.5, 18, 19, 15, 16.3, 13, 12.2, 11.3, 9, 5].normalizeSum;
~ampsB3 = ([30, 19, 26.5, 19, 20.5, 18, 19, 15, 16.3, 13, 12.2, 11.3, 9, 5] - 30).dbamp;
)
~ampsB3 = [30, 19, 26.5, 19, 20.5, 18, 19, 15, 16.3, 13, 12.2, 11.3, 9, 5].plot("ClarB_B3");

//fund = B2 = 247Hz

(
~fundB2 = 55;
~partsB2 = ~fundB2 * (1..19);
~ampsB2 = [30, 23, 25, 19.5, 24, 19.3, 18.7, 21, 18, 20, 17, 19.5, 10, 14, 15, 14, 5, 6.5, 5].normalizeSum;
//~ampsB2 = ([30, 23, 25, 19.5, 24, 19.3, 18.7, 21, 18, 20, 17, 19.5, 10, 14, 15, 14, 5, 6.5, 5]-30).dbamp;
)
~ampsB2.plot;
~ampsB2 = [30, 23, 25, 19.5, 24, 19.3, 18.7, 21, 18, 20, 17, 19.5, 10, 14, 15, 14, 5, 6.5, 5].plot("ClarB_B2");

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsB4, 0.00017, ~ampsB4*10)))
}.play;

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsB4, 0.00017, ~ampsB4n.ampdb)))
}.play;

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsB3, 0.00014, ~ampsB3*10)))
}.play;

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsB2, 0.0001, ~ampsB2*10)))
}.play;

//better more clarinet sound like
{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB4, 0.0001, ~ampsB4*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB4*LFNoise0.kr(16).range(0.999, 1.002), 0.0001, ~ampsB4*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB4*LFNoise0.kr(20).range(0.999, 1.002), 0.0001, (~ampsB4* LFNoise0.kr(12).range(0.9, 1.0)) *20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB4*SinOsc.kr(12).range(0.999, 1.001), 0.0001, (~ampsB4 * LFNoise0.kr(12).range(0.9, 1.0))*20)))
}.play;

//much better, semi convincing clarinet
{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB3, 0.0001, ~ampsB3*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB3*LFNoise0.kr(16).range(0.999, 1.001), 0.0001, ~ampsB3*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB3*LFNoise0.kr(20).range(0.999, 1.002), 0.0001, (~ampsB3* LFNoise0.kr(12).range(0.9, 1.0)) *20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB3*SinOsc.kr(12).range(0.999, 1.001), 0.0001, (~ampsB3 * LFNoise0.kr(12).range(0.9, 1.0))*20)))
}.play;

// better, blend wind and string
{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB2, 0.0001, ~ampsB2*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB2*LFNoise0.kr(16).range(0.999, 1.001), 0.0001, ~ampsB2*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB2*LFNoise0.kr(16).range(0.999, 1.001), 0.0001, (~ampsB2*LFNoise0.kr(12).range(0.9, 1.0))*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB2*SinOsc.kr(4).range(0.999, 1.001), 0.0001, (~ampsB2*LFNoise0.kr(12).range(0.9, 1.0))*20)))
}.play;

{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsB2*SinOsc.kr(4).range(0.999, 1.001), 0.0001, (~ampsB2.ampdb*LFNoise0.kr(12).range(0.2, 0.23)))))
}.play;

{
	Out.ar(0, LPF.ar(Mix.new(BBandPass.ar(PinkNoise.ar(1), XLine.kr(~partsB2*LFNoise0.kr(12).range(0.999, 1.001), ~partsB2*LFNoise0.kr(12).range(0.999, 1.001)*12, 30), 0.0001, ~ampsB2*20)), 19000))
}.play;
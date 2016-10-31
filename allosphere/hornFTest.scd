// Horn in F
//fund = C4 = 523
(
~fundC4 = 523;
~partsC4 = ~fundC4 * (1..8);
~ampsC4n = [30, 25, 20, 15.3, 10.5, 3, 2, 1].normalizeSum;
~ampsC4 = ([30, 25, 20, 15.3, 10.5, 3, 2, 1] - 30).dbamp;
)
~ampsC4 = [30, 25, 20, 15.3, 10.5, 3, 2, 1].plot("HornF_C4");

//fund = C3 = 262Hz
(
~fundC3 = 262;
~partsC3 = ~fundC3 * (1..17);
~ampsC3 = ([30, 27.5, 26.3, 25, 17.8, 19.3, 17.3, 13, 14.3, 12.8, 8.7, 4, 5.2, 3.5, 2.2, 3, 2] - 30).dbamp;
)
~ampsC3 = [30, 27.5, 26.3, 25, 17.8, 19.3, 17.3, 13, 14.3, 12.8, 8.7, 4, 5.2, 3.5, 2.2, 3, 2].plot("HornF_C3");

//fund = C2 = 131Hz
(
~fundC2 = 131;
~partsC2 = ~fundC2 * (1..20);
~ampsC2 = ([21.5, 26, 30, 23.5, 20, 20, 15, 18, 14, 10, 10.3, 8.5, 8.8, 5, 3, 2, 2, 3, 1.4, 0.5] -30).dbamp;
)
~ampsC2 = [21.5, 26, 30, 23.5, 20, 20, 15, 18, 14, 10, 10.3, 8.5, 8.8, 5, 3, 2, 2, 3, 1.4, 0.5].plot("HornF_C2");

{Formant.ar(131, 2700, MouseX.kr(50, 300).poll ,0.1)}.play

{Mix.new([Formant.ar(131, 250, 150 ,0.1), Formant.ar(131, 1000, 195 ,0.07), Formant.ar(131, 1800, 395 ,0.035), Formant.ar(131, 2700, 135 ,0.015)])}.play;

// convincing timbre
{
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsC4, 0.0001, ~ampsC4*20)), Formant.ar(~fundC4.postln, 250, 150, 0.1), Formant.ar(~fundC4, 1000, 195, 0.07), Formant.ar(~fundC4, 1800, 395, 0.035), Formant.ar(~fundC4, 2700, 135, 0.015)]))
}.play;

// not working
{
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsC3, 0.0001, ~ampsC3*20)), Formant.ar(~fundC3.postln, 250, 150, 0.1), Formant.ar(~fundC3, 1000, 195, 0.07), Formant.ar(~fundC3, 1800, 395, 0.035), Formant.ar(~fundC3, 2700, 135, 0.015)]))
}.play;

//synthetic, improves with low formant mix, has wooden sax sound on low formant
{
	var scale;
	scale = MouseX.kr(0, 1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsC2, 0.0001, ~ampsC2*30)), Formant.ar(~fundC2.postln, 250, 150, 0.1*scale), Formant.ar(~fundC2, 1000, 195, 0.07*scale), Formant.ar(~fundC2, 1800, 395, 0.035*scale), Formant.ar(~fundC2, 2700, 135, 0.015*scale)]))
}.play;

//bandpass
//good timbre when low fix of formants
{
	var scale;
	scale = MouseX.kr(0, 1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsC4, 0.0001, ~ampsC4*20)), Formant.ar(~fundC4.postln, 250, 150, 0.1*scale), Formant.ar(~fundC4, 1000, 195, 0.07*scale), Formant.ar(~fundC4, 1800, 395, 0.035*scale), Formant.ar(~fundC4, 2700, 135, 0.015*scale)]))
}.play;
//strange intersting timbre not recognizable to brass
{
	var scale;
	scale = MouseX.kr(0, 1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsC3, 0.0001, ~ampsC3*20)), Formant.ar(~fundC3.postln, 250, 150, 0.1*scale), Formant.ar(~fundC3, 1000, 195, 0.07*scale), Formant.ar(~fundC3, 1800, 395, 0.035*scale), Formant.ar(~fundC3, 2700, 135, 0.015*scale)]))
}.play;
//
{
	var scale;
	scale = MouseX.kr(0, 1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsC2, 0.0001, ~ampsC2*20)), Formant.ar(~fundC2.postln, 250, 150, 0.1*scale), Formant.ar(~fundC2, 1000, 195, 0.07*scale), Formant.ar(~fundC2, 1800, 395, 0.035*scale), Formant.ar(~fundC2, 2700, 135, 0.015*scale)]))
}.play;
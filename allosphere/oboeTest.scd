//oboe in C

//fund = C5 = 1047Hz
(
~fundC5 = 1047;
~partsC5 = ~fundC5 * (1..10);
~ampsC5 = [30, 13, 18, 12, 5, 2.5, 4, 3, 2, 1].normalizeSum;
)
~ampsC5 = [30, 13, 18, 12, 5, 2.5, 4, 3, 2, 1].plot("OboeC5");

//fund = C4 = 523Hz
(
~fundC4 = 523;
~partsC4 = ~fundC4 * (1..15);
~ampsC4 = [25, 30, 18, 16, 15, 15, 17, 17, 13, 14.5, 12, 8.5, 5, 2, 1].normalizeSum;
)
~ampsC4 = [25, 30, 18, 16, 15, 15, 17, 17, 13, 14.5, 12, 8.5, 5, 2, 1].plot("OboeC4");

//fund = C3 = 262Hz

(
~fundC3 = 262;
~partsC3 = ~fundC3 * (1..20);
~ampsC3 =[28, 22, 21, 30, 17, 19, 21, 23, 11, 11.5, 11, 13, 10, 10.5, 9.5, 7, 5, 5, 2, 1].normalizeSum;
)
~ampsC3 = [28, 22, 21, 30, 17, 19, 21, 23, 11, 11.5, 11, 13, 10, 10.5, 9.5, 7, 5, 5, 2, 1].plot("OboeC3");

// Formants
// 500-1500Hz - "a" color at 1100
// 550 - 600Hz - "o color
// 2500 - 4000hz - "i" color, narrower bandwidth

//testing
{ Mix.new([Formant.ar(262, 1100, 1000, 0.1), Formant.ar(262, 575, 50, 0.1), Formant.ar(262, 3250, 500, 0.05)]) }.play;

{Formant.ar(262, 3250, MouseX.kr(250, 750), 0.03)}.play

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsC5, 0.0001, ~ampsC5.ampdb), Formant.ar(~fundC5.postln, 1100, 1000, 0.1), Formant.ar(~fundC5, 575, 50, 0.1), Formant.ar(~fundC5, 3250, 500, 0.05)))
}.play;

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsC4, 0.0001, ~ampsC4.ampdb), Formant.ar(~fundC4.postln, 1100, 1000, 0.1), Formant.ar(~fundC4, 575, 50, 0.1), Formant.ar(~fundC4, 3250, 500, 0.05)))
}.play;

{
	Out.ar(0, Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsC3, 0.0001, ~ampsC5.ampdb), Formant.ar(~fundC3, 1100, 1000, 0.1), Formant.ar(~fundC3, 575, 50, 0.1), Formant.ar(~fundC3, 3250, 500, 0.05)))
}.play;

//better
{
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsC5, 0.0001, ~ampsC5.ampdb), Formant.ar(~fundC5, 1100, 1000, 0.1), Formant.ar(~fundC5, 575, 50, 0.1), Formant.ar(~fundC5, 3250, 500, 0.05)))
}.play;

//better
{
	var scale;
	scale = MouseX.kr(1, 10);
	Out.ar(0, Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsC4, 0.0005, ~ampsC4.ampdb*0.1), Formant.ar(~fundC4, 1100, 1000, scale*0.1), Formant.ar(~fundC4, 575, 50, scale*0.1), Formant.ar(~fundC4, 3250, 500*scale, (scale*0.05).poll)))
}.play;

// better, oboe like too synthetic, mix low in bandpass hi on formants
{
	var scale;
	scale = MouseX.kr(0.2, 1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsC3*LFNoise0.kr(10).range(0.999, 1.001), 0.0002, ~ampsC5.ampdb*scale)), Formant.ar(~fundC3, 1100, 1000, LFNoise0.kr(16).range(0.08, 0.1)), Formant.ar(~fundC3, 575, 50, LFNoise0.kr(12).range(0.05, 0.08)), Formant.ar(~fundC3, 3250, 500, LFNoise0.kr(14).range(0.02, 0.03))]))
}.play;

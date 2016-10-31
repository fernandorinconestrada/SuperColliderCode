(
{
var input,inputAmp,threshhold,gate;
var basefreq;

input = SoundIn.ar(0);
inputAmp = Amplitude.kr(input);
threshhold = 0.02;	// noise gating threshold
gate = Lag.kr(inputAmp > threshhold, 0.01);

PinkNoise.ar(0.2) * gate
}.play;
)

(
{
var input,inputAmp,threshhold,gate;
var basefreq;

input = SoundIn.ar(0);
inputAmp = Amplitude.kr(input);
threshhold = 0.05;	// noise gating threshold
gate = Lag.kr(inputAmp > threshhold, 0.01);

SinOsc.ar(LFNoise0.kr(30).range(440, 880), 0, gate);
}.play;
)
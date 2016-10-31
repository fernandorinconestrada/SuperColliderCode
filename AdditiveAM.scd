(
SynthDef(\additiveAM, { |freq, pha, freqAmp, phaAmp, amp, pos level|
	var in, ampIn;
	ampIn = SinOsc.kr(freqAmp, phaAmp, amp);
	in = FSinOsc.ar(freq, pha, ampIn);
	OffsetOut.ar(0, Pan2.ar(in, pos, level))
}).load(s);
)
(
a = Synth(\additiveAM, [\freq, 50,      \pha, 0, \freqAmp, 1.91, \pha, 1,    \pos, 0,    \level, 1,       \amp, 1]);
b = Synth(\additiveAM, [\freq, (50*6),  \pha, 0, \freqAmp, 1.73, \pha, -1,   \pos, 0.3,  \level, (1/1.1), \amp, (1/3)]);
c = Synth(\additiveAM, [\freq, (50*10), \pha, 0, \freqAmp, 1.31, \pha, -0.5, \pos, -0.3, \level, (1/1.3), \amp, (1/5)]);
d = Synth(\additiveAM, [\freq, (50*14), \pha, 0, \freqAmp, 1.11, \pha, 0,    \pos, 0.6,  \level, (1/1.9), \amp, (1/7)]);
e = Synth(\additiveAM, [\freq, (50*22), \pha, 0, \freqAmp, 0.73, \pha, 0.5,  \pos, -0.6, \level, (1/1.7), \amp, (1/11)]);
f = Synth(\additiveAM, [\freq, (50*26), \pha, 0, \freqAmp, 0.51, \pha, 1,    \pos, 0.9,  \level, (1/2.3), \amp, (1/13)]);
g = Synth(\additiveAM, [\freq, (50*34), \pha, 0, \freqAmp, 0.31, \pha, 0,    \pos, -0.9, \level, (1/2.9), \amp, (1/17)]);
n = Synth(\additiveAM, [\freq, (50*38), \pha, 0, \freqAmp, 0.23, \pha, -1,    \pos, 0,   \level, (1/3.1), \amp, (1/19)]);
)

(
a = Synth(\additiveAM, [\freq, 50,      \pha, 0, \freqAmp, 1.91, \pha, 1,    \pos, 0,    \level, 1,       \amp, 1]);
b = Synth(\additiveAM, [\freq, (50*2),  \pha, 0, \freqAmp, 1.73, \pha, -1,   \pos, 0.3,  \level, (1/1.1), \amp, (1/3)]);
c = Synth(\additiveAM, [\freq, (50*6), \pha, 0, \freqAmp, 1.31, \pha, -0.5, \pos, -0.3, \level, (1/1.3), \amp, (1/5)]);
d = Synth(\additiveAM, [\freq, (50*44), \pha, 0, \freqAmp, 1.11, \pha, 0,    \pos, 0.6,  \level, (1/1.9), \amp, (1/7)]);
e = Synth(\additiveAM, [\freq, (50*52), \pha, 0, \freqAmp, 0.73, \pha, 0.5,  \pos, -0.6, \level, (1/1.7), \amp, (1/11)]);
f = Synth(\additiveAM, [\freq, (50*104), \pha, 0, \freqAmp, 0.51, \pha, 1,    \pos, 0.9,  \level, (1/2.3), \amp, (1/13)]);
g = Synth(\additiveAM, [\freq, (50*132), \pha, 0, \freqAmp, 0.31, \pha, 0,    \pos, -0.9, \level, (1/2.9), \amp, (1/17)]);
n = Synth(\additiveAM, [\freq, (50*152), \pha, 0, \freqAmp, 0.23, \pha, -1,    \pos, 0,   \level, (1/3.1), \amp, (1/19)]);
)
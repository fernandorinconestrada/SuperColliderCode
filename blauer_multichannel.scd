(
SynthDef(\sine1, { |freq = 110, out, ph = 0.5pi, mult = 0.02 | Out.ar(out, SinOsc.ar(freq, ph, mult)) }).add;
)
(
SynthDef(\sine2, { |freq = 110, out, ph = pi, mult = 0.02 |  Out.ar(out, SinOsc.ar(freq, ph, mult)) }).add;
)

(
Prout({
	Synth(\sine1, [\out, 0]);
	Synth(\sine2, [\out, 30]);
	Synth(\sine1, [\freq, 220, \mult, 0.01, \out, 1]);
	Synth(\sine2, [\freq, 220, \mult, 0.01, \out, 29]);
	Synth(\sine1, [\freq, 112, \ph, pi, \out, 5]);
	Synth(\sine2, [\freq, 112, \ph, 0.5pi, \out, 25]);
	Synth(\sine1, [\freq, 224, \ph, pi, \out, 6, \mult, 0.01]);
	Synth(\sine2, [\freq, 224, \ph, 0.5pi, \out, 24, \mult, 0.01]);
	0.01.wait;
	Synth(\sine1, [\freq, 180, \out, 2]);
	Synth(\sine2, [\freq, 180,\out, 28]);
	Synth(\sine1, [\freq, 360, \mult, 0.01, \out, 3]);
	Synth(\sine2, [\freq, 360, \mult, 0.01, \out, 27]);
	Synth(\sine1, [\freq, 182, \ph, pi, \out, 7]);
	Synth(\sine2, [\freq, 182, \ph, 0.5pi, \out, 24]);
	Synth(\sine1, [\freq, 364, \ph, pi, \out, 8, \mult, 0.01]);
	Synth(\sine2, [\freq, 364, \ph, 0.5pi, \out, 26, \mult, 0.01]);


}.fork;
)
)
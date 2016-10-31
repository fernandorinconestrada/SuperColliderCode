(
SynthDef(\critBand, { |freq, pha=0, amp=0.3|
	var env, gliss;
	gliss = EnvGen.kr(Env([1, 1.05, 1.25, 1.5, 2, 1], [3,3,3,3,12]), 1);
	env = EnvGen.kr(Env([0.01,1,1,0.001], [0.29,23.94,0.29]));
	Out.ar(0, FSinOsc.ar([freq, gliss*freq], pha, amp) * env)
}).load(s);
)

a = Synth(\critBand, [\freq, 400]);
b = Synth(\critBand, [\freq, 200, \reach, 300, \start, 200, \time, 12]);
c = Synth(\critBand, [\freq, 300, \reach, 400, \start, 300, \time, 12]);
d = Synth(\critBand, [\freq, 510, \reach, 630, \start, 510, \time, 12]);
e = Synth(\critBand, [\freq, 770, \reach, 630, \start, 770, \time, 12]);
f = Synth(\critBand, [\freq, 770, \reach, 920, \start, 770, \time, 12]);
g = Synth(\critBand, [\freq, 1080, \reach, 920, \start, 1080, \time, 12]);
h = Synth(\critBand, [\freq, 1270, \reach, 1080, \start, 1270, \time, 12]);
(
SynthDef(\oneshot, { |dens = 20, dur = 0.2, level = 0.5, gate = 1, freq = 440, pha = 0, amp = 0.2|
	var env, envGlob;
	env = EnvGen.kr(Env.perc, LFNoise0.kr(dens));
	envGlob = EnvGen.kr(Env.sine(dur, level), gate);
	Out.ar(0, FSinOsc.ar(freq, pha, amp));
}).send(s);
)
(
var grEnv1, grEnv2, grEnv3, grEnv4;
grEnv1 = Env([0, 0.75, 1, 0.5, 0], [0.25, 0.25, 0.25, 0.25], [-8, 8]);
grEnv2 = Env([0, 1, 0.5, 0.75, 0], [0.25, 0.25, 0.25, 0.25], [-5, 5]);
grEnv3 = Env([0, 0.5, 0.75, 1, 0], [0.25, 0.25, 0.25, 0.25], [5, -5]);
grEnv4 = Env([0, 0.5, 1, 0.75, 0], [0.25, 0.25, 0.25, 0.25], [8, -8]);
~env1 = Buffer.sendCollection(s, grEnv1.discretize, 1);
~env2 = Buffer.sendCollection(s, grEnv2.discretize, 1);
~env3 = Buffer.sendCollection(s, grEnv3.discretize, 1);
~env4 = Buffer.sendCollection(s, grEnv4.discretize, 1);
grEnv1.plot(400, Rect(900, 600, 350, 200), 0, 1, "Env1");
grEnv2.plot(400, Rect(900, 300, 350, 200), 0, 1, "Env2");
grEnv3.plot(400, Rect(450, 600, 350, 200), 0, 1, "Env3");
grEnv4.plot(400, Rect(450, 300, 350, 200), 0, 1, "Env4");

(
SynthDef(\grainSinOscFBMulti, { | freqGliss = 0.0201, freqLo = 440, freqHi = 660, freqFB = 0.79, fbSineLo = 0.2, fbSineHi = 0.6, freqAmp = 0.23, ampLo = 0.02, ampHi = 0.06, dens = 50, durRate = 50, durLo = 0.03, durHi = 0.1, panRate = 50, envbuf = -1, thresh = 0.5, sloBel = 0.75, sloAb = 0.25, maxDel = 0.2, delT = 0.13, decT = 0.31, maxDelFb = 0.2, delTFb = 0.17, decTFb = 0.37, freqMix = 0.02, mixLo = 0.1, mixHi = 0.2, freqRoom = 50, roomLo = 0.2, roomHi = 0.3, freqDamp = 0.02, dampLo = 0.3, dampHi = 0.6, out = 0 |
	var sine, grain, delay, fb, rev;
	sine = SinOscFB.ar(SinOsc.kr(freqGliss).range(freqLo, freqHi), SinOsc.kr(freqFB).range(fbSineLo, fbSineHi), SinOsc.ar(freqAmp).range(ampLo, ampHi));
	grain = GrainIn.ar(2, LFNoise0.kr(dens), LFNoise0.kr(durRate).range(durLo,durHi), sine, LFNoise0.kr(panRate).range(-1.0, 1.0), envbuf);
	delay = AllpassC.ar(Compander.ar(grain, grain, thresh, sloBel, sloAb), maxDel, delT, decT);
	fb = AllpassC.ar(delay, maxDelFb, delTFb, decTFb);
	rev = FreeVerb.ar(fb, SinOsc.kr(freqMix).range(mixLo, mixHi), LFNoise0.kr(freqRoom).range(roomLo, roomHi), SinOsc.kr(freqDamp).range(dampLo, dampHi));
	OffsetOut.ar(out, Limiter.ar(rev));
}).add;
)
)

(
y = Synth(\grainSinOscFBMulti, [\out, 0, \envbuf, ~env4]);
z = Synth(\grainSinOscFBMulti, [\out, 2, \freqGliss, 0.0203, \freqLo, 880, \freqHi, 660, \freqAmp, 0.29, \envbuf, ~env4])
)

y.set(\sloBel, 0.75, \sloAb, 0.25, \ampLo, 0.1, \ampHi, 0.2);
y.set(\thresh, 0.4);

y.set(\envbuf, ~env2);
z.set(\envbuf, ~env2);

x.free;
y.free;

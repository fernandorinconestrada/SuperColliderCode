(
b = Buffer.alloc(s, 512);
(
SynthDef(\ampFollowTest, {
	var chain, onsets, env, sig, freq;
	chain = FFT(b, SoundIn.ar(0));
	freq = Amplitude.kr(SoundIn.ar(0), 0.01, 0.01, 1200, 400);
	onsets = Onsets.kr(chain, MouseX.kr(0, 1) > 0.5);
	env = EnvGen.kr(Env.perc, onsets.poll);
	sig = SinOscFB.ar(freq, LFNoise0.kr(30).range(0.2, 0.8), LFNoise0.kr(20).range(0.1, 0.6)) * env;
	OffsetOut.ar(0, AllpassC.ar(sig, 0.2, SinOsc.kr(0.1).range(0.03, 0.2), SinOsc.kr(0.3).range(0.3, 1)));
}).add;
);
)

a = Synth(\ampFollowTest);


(
SynthDef(\testEnvFollow, { | freqEnv = 441, width 0.2|
	var source, env, in;
	//source = SoundIn.ar(0);
	//source = SinOsc.ar(freqEnv);
	source = PulseDPW.ar(freqEnv, width);
	env = EnvFollow.ar(source);
	in = LeakDC.ar(LPF.ar(SoundIn.ar(0, env), 19000));
	OffsetOut.ar(0,  in);
	OffsetOut.ar(1, AllpassC.ar(in, 0.2, 0.06));
}).add;
)

a = Synth(\testEnvFollow);
a.set(\freqEnv, 20);

(
b = Buffer.alloc(s, 512);
)
(
x = {
	var sig, chain, onsets, in;
	sig = SoundIn.ar(0);
	chain = FFT(b, sig);
	onsets = Onsets.kr(chain, MouseX.kr(0, 1), \rcomplex);
	in = SinOscFB.ar(LFNoise0.kr(20).range(220, 880), LFNoise0.kr(10).range(0.3, 0.9),EnvGen.kr(Env.perc, onsets));
	OffsetOut.ar(0, in);
	OffsetOut.ar(1, AllpassC.ar(in, 0.2, 0.06));
}.play;
)
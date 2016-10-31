(
SynthDef(\testWacom, { |dens = 30, delT = 0.2, decT = 0.3|
	var env, grain, out;
	env = EnvGen.kr(Env.adsr, MouseButton.kr(0, 1));
	grain = GrainFM.ar(2, Dust.kr(dens), MouseX.kr(0.01, 0.3), MouseY.kr(220, 440), LFNoise0.kr(20).range(100, 200), MouseY.kr(1, 7), LFNoise0.kr(30).range(-1.0, 1.0), mul: 0.3);
	out = LPF.ar(AllpassC.ar(grain, 0.2, SinOsc.kr(delT).range(0.02, 0.2), SinOsc.kr(decT).range(0.2, 0.6), 0.5), 13000, 0.5);
	OffsetOut.ar(0, out * env);
}).add;
)

a = Synth(\testWacom);
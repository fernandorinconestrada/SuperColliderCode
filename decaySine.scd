{ Decay.ar(Impulse.ar(1,0.5), 0.5, WhiteNoise.ar) }.plot(1);
{ Decay2.ar(Impulse.ar(2), 0.01, 0.1, SinOscFB.ar(100, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(3), 0.01, 0.1, SinOscFB.ar(110, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(5), 0.01, 0.1, SinOscFB.ar(120, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(7), 0.01, 0.1, SinOscFB.ar(130, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(11), 0.01, 0.1, SinOscFB.ar(140, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(13), 0.01, 0.1, SinOscFB.ar(150, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));Decay2.ar(Impulse.ar(5), 0.01, 0.1, SinOscFB.ar(100, SinOsc.kr(0.5).range(0.0, 0.6), 0.2));
	Decay2.ar(Impulse.ar(17), 0.01, 0.1, SinOscFB.ar(160, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(19), 0.01, 0.1, SinOscFB.ar(170, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(23), 0.01, 0.1, SinOscFB.ar(180, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(29), 0.01, 0.1, SinOscFB.ar(190, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));
	Decay2.ar(Impulse.ar(29), 0.01, 0.1, SinOscFB.ar(200, SinOsc.kr(0.5).range(0.0, 0.6), 0.08));

}.play;

{Impulse.ar(10)}.plot(1);

Decay2.ar(Impulse.ar(0.5), 0.01, 1, GrainBuf.ar(1, Impulse.kr(2), LFNoise2.kr(4).range(0.02, 0.08), sndbuf, LFNoise2.kr(4).range(0.95, 1.05), LFNoise0.kr(5).range(0, 1.0), 2, 0, envbufnum))) ;
}
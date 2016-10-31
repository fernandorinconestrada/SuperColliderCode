(
(
s.boot;
b = Buffer.alloc(s, s.sampleRate * 1.0, 1);
c = Buffer.alloc(s, s.sampleRate * 1.0, 1);
);
(
SynthDef(\bufWr, {
	var inL, inR;
	inL = BBandPass.ar(WhiteNoise.ar(1), MouseX.kr(1200, 2400), MouseX.kr(0.01, 0.1));
	inR = BBandPass.ar(WhiteNoise.ar(1), MouseY.kr(1200, 2400), MouseY.kr(0.01, 0.1));
	BufWr.ar(inL, b, Phasor.ar(0, BufRateScale.kr(b), 0, BufFrames.kr(b)));
	BufWr.ar(inR, c, Phasor.ar(0, BufRateScale.kr(c), 0, BufFrames.kr(c)));
}).add;
);
(
SynthDef(\speechStereoConv, { |bufL = 0, bufR = 1, t_trig = 0|
	var input, rate1, rate2, kernelL, kernelR;
	rate1 = MouseX.kr(0.1, 2, lag:0.2);
	rate2 = MouseY.kr(0.1, 2, lag:0.2);
	input=SoundIn.ar(0);
	kernelL= PlayBuf.ar(1, bufL, BufRateScale.kr(bufL) * rate1, 1, 0, 1);
	kernelR= PlayBuf.ar(1, bufR, BufRateScale.kr(bufR) * rate2, 1, 0, 1);
	Out.ar(0, StereoConvolution2L.ar(input,kernelL, kernelR, t_trig, 2048));
}).add;
);
)

a= Synth(\bufWr);
b = Synth(\speechStereoConv, [\kernelL, b, \kernelR, c]);
b.set(\t_trig, 1);
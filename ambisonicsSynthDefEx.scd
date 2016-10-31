(
/* omnidirection soundfield, push to a plane wave: */
SynthDef(\foaMonoEnc, {arg outBus, rho = 1, theta = 0, phi = 0, rateAngle = 10, loAngle = 0.03, hiAngle = 0.13;
	var angle, src, foa, encoderMatrix;
	src = PinkNoise.ar(-6.dbamp);
	angle = SinOsc.kr(LFNoise0.kr(rateAngle).range(loAngle, hiAngle)).range(pi/2, -pi/2);

	// Encode into our foa signal
	// Note: as the encoder is a matrix encoder, it can be
	//			included in the SynthDef
	encoderMatrix = FoaEncoderMatrix.newOmni;
	foa = FoaEncode.ar(src, encoderMatrix); // encode as omni
	foa = FoaTransform.ar(foa, 'push', angle, theta, phi);   // image / pan
	Out.ar(outBus, foa);
}).add
)

a = Synth(\foaMonoEnc);
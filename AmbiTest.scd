(
//~theta = MouseX.kr(pi, -pi, lag: 0.1);
//~phi = MouseY.kr(pi/2, -pi/2, lag:0.1);
//encodes input, with predetermined configuration of mic placements
~encoder = FoaEncoderMatrix.newOmni;
// theta = azimuth ang/radians; pi to -pi, left=180º; right=0º; phi = elevation ang/rad; pi/2 to -pi/2; front=90º;back=270º
~encoder = FoaEncoderMatrix.newDirection(-pi/2, -pi/4);
//decodes input to output with predetermined configuration of speaker
~decoder = FoaDecoderMatrix.newStereo;
);
(
(
SynthDef(\testAmbi, { |freqAng = 0.2,  loAng = 1.570797, hiAng = -1.0570797, freqAz = 0.7,  loAz = 3.141693, hiAz = -3.141693, attT = 0.01, relT = 1, freq = 0.4, ampNoiz = 0.3, freqBand = 1200, bw = 0.5, ampBand = 0.8,delT = 0.1|
	var angle, azim, sig, env, out, delay;
	angle = SinOsc.kr(freqAng).range(loAng, hiAng);
	azim = SinOsc.kr(freqAz).range(loAz, hiAz);
	env = EnvGen.ar(Env.perc(attT, relT), Impulse.kr(freq));
	sig = BBandPass.ar(PinkNoise.ar(ampNoiz), freqBand, bw, ampBand)*env;
	sig = FoaEncode.ar(sig, ~encoder);
	sig = FoaTransform.ar(sig, 'focus', angle, azim);
	//sig = FoaTransform.ar(sig, 'focus');
	out = FoaDecode.ar(sig, ~decoder);
	delay = LPF.ar(AllpassC.ar(out, 0.2, delT), 12000);
	OffsetOut.ar(0, delay);
}).add;
);
)
(
(
SynthDef(\testAmbiSine, { |freqAng = 0.3,  loAng = 1.570797, hiAng = -1.0570797, freqAz = 0.3,  loAz = 3.141693, hiAz = -3.141693, attT = 0.01, relT = 1, freq = 1, ampNoiz = 0.3, freqBand = 1200, bw = 0.5, ampBand = 0.8,delT = 0.3, freqSine = 220, fb = 0.3, ampSine = 0.3, loDel = 0.01, hiDel = 0.2|
	var angle, azim, sig, env, out, delay;
	angle = SinOsc.kr(freqAng).range(loAng, hiAng);
	azim = SinOsc.kr(freqAz).range(loAz, hiAz);
	env = EnvGen.ar(Env.perc(attT, relT), Impulse.kr(freq));
	//sig = BBandPass.ar(PinkNoise.ar(ampNoiz), freqBand, bw, ampBand)*env;
	sig = SinOscFB.ar(freqSine, fb, ampSine) * env;
	sig = FoaEncode.ar(sig, ~encoder);
	sig = FoaTransform.ar(sig, 'focus', angle, azim);
	//sig = FoaTransform.ar(sig, 'focus');
	out = FoaDecode.ar(sig, ~decoder);
	delay = LPF.ar(AllpassC.ar(out, 0.2, SinOsc.kr(delT).range(loDel, hiDel)), 12000);
	OffsetOut.ar(0, delay);
}).add;
);
)
(
(
SynthDef(\testAmbiLiveIn, { |freqAng = 0.2,  loAng = 1.570797, hiAng = -1.0570797, freqAz = 0.7,  loAz = 3.141693, hiAz = -3.141693, attT = 0.01, relT = 1, freq = 0.4, ampNoiz = 0.3, freqBand = 1200, bw = 0.5, ampBand = 0.8,delT = 0.1, loDel = 0.01, hiDel = 0.2|
	var angle, azim, sig, env, out, delay;
	angle = SinOsc.kr(freqAng).range(loAng, hiAng);
	azim = SinOsc.kr(freqAz).range(loAz, hiAz);
	//env = EnvGen.ar(Env.perc(attT, relT), Impulse.kr(freq));
	//sig = BBandPass.ar(PinkNoise.ar(ampNoiz), freqBand, bw, ampBand)*env;
	sig = HPF.ar(SoundIn.ar(0), 60);
	sig = FoaEncode.ar(sig, ~encoder);
	sig = FoaTransform.ar(sig, 'focus', angle, azim);
	//sig = FoaTransform.ar(sig, 'focus');
	out = FoaDecode.ar(sig, ~decoder);
	delay = LPF.ar(AllpassC.ar(out, 0.2, SinOsc.kr(delT).range(loDel, hiDel)), 12000);
	OffsetOut.ar(0, delay);
}).add;
);
)
a = Synth(\testAmbiSine);
a.set(\delT, 0.05);
a.set(\relT, 0.1);
a.set(\freqAng, 0.1);
a.set(\freqAz, 0.2);
a.set(\freq, 1);
a.set(\ampNoiz, 1.5);
a.set(\ampBand, 1.2);
a.set(\loDel, 0.03, \hiDel, 0.07);
a.set(\bw, 0.1);
a.scope;

//inspection of proper settings
~encoder.kind;
~encoder.numChannels;
~encoder.dirChannels;

~decoder.kind;
~decoder.numChannels;
~decoder.dirChannels;

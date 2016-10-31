o  = Server.local.options;
o.numOutputBusChannels = 2;


~sndbuf01 = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editSequia/Bounced Files/SequiaChunkUniAndes.wav" , channels: 0);
~sndbuf02 = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editSequia/Bounced Files/SequiaChunkUniAndes.wav" , channels: 1);
~sndbuf03 = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editSequia/Bounced Files/MonoSequiaChunkUniAndes.wav" , channels: 0);


~sndbuf01 = Buffer.readChannel(s,"/Users/fernandorincon/Music/SuperCollider Recordings/uniAndes/routBandPassBufferTake1.aif", channels: 0);
~sndbuf02 = Buffer.readChannel(s,"/Users/fernandorincon/Music/SuperCollider Recordings/uniAndes/routBandPassBufferTake1.aif", channels: 1);
~sndbuf03 = Buffer.read(s,"/Users/fernandorincon/Music/SuperCollider Recordings/uniAndes/MonoRoutBandPassBufferTake1.wav");

~sndbuf01 = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editPeceras/editPeceras/Bounced Files/PecerasChunkUniandes.wav", channels: 0);
~sndbuf02 = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editPeceras/editPeceras/Bounced Files/PecerasChunkUniandes.wav", channels: 1);
~sndbuf03 = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editPeceras/editPeceras/Bounced Files/MonoPecerasChunkUniandes.wav");

~decoder = FoaDecoderKernel.newListen(1013);
~decoder = FoaDecoderKernel.newListen(1023);
~decoder = FoaDecoderKernel.newCIPIC;
~decoder = FoaDecoderMatrix.newPanto(16);
(
(
SynthDef(\ambiSequiaPush, { |rateAngle = 10, loAngle = 0.03, hiAngle = 0.13, rateTh = 0.11, loTh = -1.57, hiTh = 1.57, ratePhi = 0.13, loPhi = 0, hiPhi = 1.57, bufnum|
	var angle, theta, phi, sig, encoder, decoder;
	angle = SinOsc.kr(LFNoise0.kr(rateAngle).range(loAngle, hiAngle)).range(0, pi/2);
	theta = SinOsc.kr(rateTh).range(loTh, hiTh);
	phi = SinOsc.kr(ratePhi).range(loPhi, hiPhi);
	encoder = FoaEncoderMatrix.newOmni;
	//decoder = FoaDecoderKernel.newCIPIC;
	sig = PlayBuf.ar(bufnum.numChannels, bufnum, doneAction:2);
	sig = FoaEncode.ar(sig, encoder);
	sig = FoaTransform.ar(sig, 'push', angle, theta, phi);
	sig = FoaDecode.ar(sig, ~decoder);
	OffsetOut.ar(0, sig)
}).add;
);
(
SynthDef(\ambiSequiaFocus, { |rateAngle = 10, loAngle = 0.03, hiAngle = 0.13, rateTh = 0.11, loTh = -1.57, hiTh = 1.57, ratePhi = 0.13, loPhi = 0, hiPhi = 1.57, bufnum|
	var angle, theta, phi, sig, encoder, decoder;
	angle = SinOsc.kr(LFNoise0.kr(rateAngle).range(loAngle, hiAngle)).range(0, pi/2);
	theta = SinOsc.kr(rateTh).range(loTh, hiTh);
	phi = SinOsc.kr(ratePhi).range(loPhi, hiPhi);
	encoder = FoaEncoderMatrix.newOmni;
	//decoder = FoaDecoderKernel.newCIPIC;
	sig = PlayBuf.ar(bufnum.numChannels, bufnum, doneAction:2);
	sig = FoaEncode.ar(sig, encoder);
	sig = FoaTransform.ar(sig, 'focus', angle, theta, phi);
	sig = FoaDecode.ar(sig, ~decoder);
	OffsetOut.ar(0, sig)
}).add;
);
(
SynthDef(\ambiSequiaPress, { |rateAngle = 10, loAngle = 0.03, hiAngle = 0.13, rateTh = 0.11, loTh = -1.57, hiTh = 1.57, ratePhi = 0.13, loPhi = 0, hiPhi = 1.57, bufnum|
	var angle, theta, phi, sig, encoder, decoder;
	angle = SinOsc.kr(LFNoise0.kr(rateAngle).range(loAngle, hiAngle)).range(0, pi/2);
	theta = SinOsc.kr(rateTh).range(loTh, hiTh);
	phi = SinOsc.kr(ratePhi).range(loPhi, hiPhi);
	encoder = FoaEncoderMatrix.newOmni;
	//decoder = FoaDecoderKernel.newCIPIC;
	sig = PlayBuf.ar(bufnum.numChannels, bufnum, doneAction:2);
	sig = FoaEncode.ar(sig, encoder);
	sig = FoaTransform.ar(sig, 'press', angle, theta, phi);
	sig = FoaDecode.ar(sig, ~decoder);
	OffsetOut.ar(0, sig)
}).add;
);
)
(
SynthDef(\ambiSequiaVer2, { |rateAngle = 1, loAngle = 0.03, hiAngle = 0.13, rateTh = 0.11, loTh = -1.57, hiTh = 1.57, ratePhi = 0.13, loPhi = 0, hiPhi = 1.57, bufnum, kind|
	var angle, theta, phi, sig, encoder, decoder;
	angle = SinOsc.kr(LFNoise0.kr(rateAngle).range(loAngle, hiAngle)).range(pi/2, -pi/2);
	theta = SinOsc.kr(rateTh).range(loTh, hiTh);
	phi = SinOsc.kr(ratePhi).range(loPhi, hiPhi);
	encoder = FoaEncoderMatrix.newOmni;
	sig = PlayBuf.ar(bufnum, bufnum, doneAction:2);
	sig = FoaEncode.ar(sig, encoder);
	//sig = FoaTransform.ar(sig, ~kind, angle, theta, phi);
	sig = FoaDecode.ar(sig, ~decoder);
	OffsetOut.ar(0, sig)
}).add;
)
(
b = Synth(\ambiSequiaPush, [\bufnum, ~sndbuf01, \rateAngle, 5]);
c = Synth(\ambiSequiaFocus, [\bufnum, ~sndbuf02, \rateAngle, 2])
)
(
b.set(\rateAngle, 7);
c.set(\rateAngle, 5)
)
~decoder.dirChannels;

[ 0.19634954084936, 0.58904862254809, 0.98174770424681, 1.3744467859455, 1.7671458676443, 2.159844949343, 2.5525440310417, 2.9452431127404, -2.9452431127404, -2.5525440310417, -2.159844949343, -1.7671458676443, -1.3744467859455, -0.98174770424681, -0.58904862254809, -0.19634954084936 ] *180/pi

(360/16)*(0..15)-180

(
~routAmbiSequia = Routine({
	var delta;
	1.do{
		"go".postln;
		b = Synth(\ambiSequiaPush, [\bufnum, ~sndbuf01, \rateAngle, 1/5, \rateTh, 1/5]);
		c = Synth(\ambiSequiaFocus, [\bufnum, ~sndbuf02, \rateAngle, 1/2, \rateTh, 1/10]);
		d = Synth(\ambiSequiaPress, [\bufnum, ~sndbuf03, \rateAngle, 1/3, \rateTh, 1/20]);
		30.yield;
		"30".postln;
		b.set(\rateAngle, 1/6);
		b.set(\rateTh, 1/9);
		c.set(\rateAngle, 1/3);
		c.set(\rateTh, 1/6);
		36.yield;
		"18".postln;
		b.set(\rateAngle, 1/7);
		b.set(\rateTh, 1/14);
		c.set(\rateAngle, 1/4);
		c.set(\rateTh, 1/4);
		56.yield;
		"28".postln;
		b.set(\rateAngle, 1/8);
		b.set(\rateTh, 1/10);
		c.set(\rateAngle, 1/5);
		c.set(\rateTh, 1/8);
		80.yield;
		"40".postln;
		b.set(\rateAngle, 1/9);
		b.set(\rateTh, 1/3);
		c.set(\rateAngle, 1/6);
		c.set(\rateTh, 1/6);
		36.yield;
		"18".postln;
		b.set(\rateAngle, 1/10);
		b.set(\rateTh, 1/5);
		c.set(\rateAngle, 1/7);
		c.set(\rateTh, 1/10);
		70.yield;
		"70".postln;
		b.set(\rateAngle, 1/11);
		b.set(\rateTh, 1/22);
		c.set(\rateAngle, 1/8);
		c.set(\rateTh, 1/11);
	}
})
)
~sndbuf01.free;
~sndbuf02.free;
~sndbuf03.free;

~routAmbiSequia.play;
s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/sequiaAmbi/routAmbiPecerasTake1_binaural.aif");
s.record;
s.stopRecording;
1/15
(2/15)*(0..15) - 1
(pi/2).raddeg
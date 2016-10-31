~sndbuf = Buffer.read(s, "/Users/fernandorincon/Music/Recordings FRE/GrabacionesVarias/Electronica/5 Sequia.aiff");

~encoder = FoaEncoderMatrix.newOmni

~decoder = FoaDecoderMatrix.newStereo(131/2 * pi/180, 0.5) // Cardioids at 131 deg
~decoder = FoaDecoderKernel.newUHJ                         // UHJ (kernel)
~decoder = FoaDecoderKernel.newSpherical                   // synthetic binaural (kernel)
~decoder = FoaDecoderKernel.newCIPIC                       // KEMAR binaural (kernel)

~decoder.kind

~transformer1 = 'direct'
~transformer2 = 'focus'
~transformer3 = 'zoom'
~transformer2 = 'push'
~transformer1 = 'press'

(
{
	var sig, angle, theta, phi;

//angle = SinOsc.kr(0.1).range(pi/2, -pi/2);
angle = SinOsc.kr(LFNoise0.kr(1).range(0.05, 0.11)).range(pi/2, -pi/2);

//theta = MouseX.kr(pi, -pi);
theta = SinOsc.kr(0.11).range(pi, -pi);

//phi = MouseY.kr(pi, -pi);
phi = SinOsc.kr(0.13).range(-pi, pi);

sig = PlayBuf.ar(~sndbuf.numChannels, ~sndbuf, doneAction:2);

sig = FoaEncode.ar(sig, ~encoder);

sig = FoaTransform.ar(sig, ~transformer1, angle, theta, phi);

FoaDecode.ar(sig, ~decoder);
}.scope;
)

(
{
	var sig, angle, theta, phi;

//angle = SinOsc.kr(0.1).range(pi/2, -pi/2);
angle = SinOsc.kr(LFNoise0.kr(1).range(0.05, 0.11)).range(pi/2, -pi/2);

//theta = MouseX.kr(pi, -pi);
theta = SinOsc.kr(0.11).range(pi, -pi);

//phi = MouseY.kr(pi, -pi);
phi = SinOsc.kr(0.13).range(-pi, pi);

sig = PlayBuf.ar(~sndbuf.numChannels, ~sndbuf, doneAction:2);

sig = FoaEncode.ar(sig, ~encoder);

sig = FoaTransform.ar(sig, ~transformer2, angle, theta, phi);

FoaDecode.ar(sig, ~decoder);
}.scope;
)

(
{
	var sig, angle, theta, phi;

//angle = SinOsc.kr(0.1).range(pi/2, -pi/2);
angle = SinOsc.kr(LFNoise0.kr(1).range(0.05, 0.11)).range(pi/2, -pi/2);

//theta = MouseX.kr(pi, -pi);
theta = SinOsc.kr(0.11).range(pi, -pi);

//phi = MouseY.kr(pi, -pi);
phi = SinOsc.kr(0.13).range(-pi, pi);

sig = PlayBuf.ar(~sndbuf.numChannels, ~sndbuf, doneAction:2);

sig = FoaEncode.ar(sig, ~encoder);

sig = FoaTransform.ar(sig, ~transformer3, angle, theta, phi);

FoaDecode.ar(sig, ~decoder);
}.scope;
)
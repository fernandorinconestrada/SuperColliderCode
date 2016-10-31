Server.local.makeGui;
Server.internal.makeGui;

o = Server.local.options;
o.numOutputBusChannels = 31;

p = ProxySpace.push(s);

b = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");
(
SynthDef(\foaEncode1, { |dur = 0.05 , sndbuf = 0, rate = 1, pos = 0 |
			    var src, theta, phi, foa, decoderMatrix, out;
    //src = PinkNoise.ar(-6.dbamp);
	src = BufGrain.ar(LFNoise2.ar(100), LFNoise2.kr(100).range(0.01, 0.1), sndbuf, rate, LFNoise2.kr(10).range(0,1), interp:2, mul:0.2);
    theta = MouseX.kr(-pi, pi);
    phi = 0;
    // Encode into our foa signal
    foa = FoaPanB.ar(src, theta, phi);
    // Cardioids at 131 deg
    decoderMatrix = FoaDecoderMatrix.newStereo(131/2 * pi/180, 0.5);
    out = FoaDecode.ar(foa, decoderMatrix);
	Out.ar([3, 7, 11], out);
}).add;
)
~out = Pbind(\instrument, \foaEncode1, \sndbuf, b);
~out.playN([0, 10, 20], [0.1, 0.2, 0.1], [22, 22, 22]);
p.clear;
(
SynthDef(\foaEncode2, { |dur = 0.05 , sndbuf = 0, rate = 1, pos = 0, density = 10, freq = 220 |
    var src, angle, azim, encoderMatrix, foa, decoderMatrix, out, amp, rings;
    //src = PinkNoise.ar(-6.dbamp);
	//src = BufGrain.ar(LFNoise2.ar(100), LFNoise2.kr(100).range(0.01, 0.1), sndbuf, rate, LFNoise2.kr(10).range(0,1), interp:2, mul:0.2);
	//src = FMGrain.ar(Dust.ar(density), dur, LFNoise2.kr(300).range(220, 880), Dust.kr(10).range(220, 330), LFNoise2.kr(10).range(1, 10), LFNoise2.kr(20).range(0.01, 0.2));
	amp = LFNoise2.kr(10).range(0.05, 0.2);
	rings = LFNoise2.kr(10).range(0.5, 3);
	src = DynKlank.ar(`[[freq, freq * 3, freq * 5, freq * 7, freq * 11], [amp, amp, amp, amp, amp], [rings, rings, rings, rings, rings]], Dust.ar(density, LFNoise2.kr(10).range(0.02, 0.2)));
    // for the 'push' transform later
    // angle ---> top           = push to plane wave
    //            bottom        = omni-directional
    angle = MouseY.kr(pi/2, 0);
    // azimuth -> hard left     = back
    //            centre        = centre
    //            hard right    = back
    azim = MouseX.kr(pi, -pi);
    // a matrix for an omni image
    encoderMatrix = FoaEncoderMatrix.newOmni;
    // Encode into our foa signal
    foa = FoaEncode.ar(src, encoderMatrix);
    // transform for angle and azim
    foa = FoaTransform.ar(foa, 'pushX', angle);
//    foa = FoaPushX.ar(foa, angle);
    // Cardioids at 131 deg
    decoderMatrix = FoaDecoderMatrix.newStereo(131/2 * pi/180, 0.5);
    out = FoaDecode.ar(foa, decoderMatrix);
     Out.ar(0, out);
}).add;
)

a = Synth(\foaEncode2,  [\sndbuf, b]);
a = Synth(\foaEncode2, [\density, 10, \freq, 880]);
a.free;
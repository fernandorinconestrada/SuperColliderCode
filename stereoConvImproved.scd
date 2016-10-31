(
(
s.boot;
b = Buffer.alloc(s, s.sampleRate * 1.0, 1);
c = Buffer.alloc(s, s.sampleRate * 1.0, 1);
~d = Buffer.read(s, "/Users/fernandorincon/Documents/UCSB/DO NOT REMOVE!/Impulse responses/large spaces/cathedral2.aif");
~e = Buffer.read(s,"/Users/fernandorincon/Documents/UCSB/DO NOT REMOVE!/Impulse responses/Church Schellingwoude/Church Schellingwoude/Church Schellingwoude.wav")
);
(
SynthDef(\DbufWr, {
	var inL, inR;
	inL = BBandPass.ar(WhiteNoise.ar(1), MouseX.kr(1600, 6400), MouseX.kr(0.001, 0.01));
	inR = BBandPass.ar(WhiteNoise.ar(1), MouseY.kr(200, 1600), MouseY.kr(0.001, 0.01));
	BufWr.ar(inL, b, Phasor.ar(0, BufRateScale.kr(b), 0, BufFrames.kr(b)));
	BufWr.ar(inR, c, Phasor.ar(0, BufRateScale.kr(c), 0, BufFrames.kr(c)));
	//Demand.kr(MouseButton.kr, 0, Dbufwr(inL, b, Phasor.ar(0, BufRateScale.kr(b), 0, BufFrames.kr(b))));
	//Demand.kr(MouseButton.kr, 0, Dbufwr(inR, c, Phasor.ar(0, BufRateScale.kr(c), 0, BufFrames.kr(c))));
}).add;
);
(
SynthDef(\speechStereoConv2, { |bufL = 0, bufR = 1, imp =1, t_trig = 0|
	var input, rate1, rate2, kernelL, kernelR;
	rate1 = MouseX.kr(0.1, 2, lag:0.2);
	rate2 = MouseY.kr(0.1, 2, lag:0.2);
	input=SoundIn.ar(0);
	//input = Decay2.ar(Impulse.ar(MouseX.kr(1, 20), 0.5), 0.01, 1, WhiteNoise.ar(0.1));
	//trig =  Impulse.kr(1);
	kernelL= PlayBuf.ar(1, bufL, BufRateScale.kr(bufL) * rate1, 1, 0, 1);
	kernelR= PlayBuf.ar(1, bufR, BufRateScale.kr(bufR) * rate2, 1, 0, 1);
	//kernelL = BBandPass.ar(WhiteNoise.ar(1), MouseX.kr(2400, 4800), MouseY.kr(0.1, 0.01));
	//kernelR = BBandPass.ar(WhiteNoise.ar(1), MouseY.kr(4800, 2400), MouseX.kr(0.1, 0.01));
	//kernelL = WhiteNoise.ar(0.3);
	//kernelR = WhiteNoise.ar(0.3);
	Out.ar(0, Convolution.ar(input, kernelL, 16384, 0.5));
	Out.ar(1, Convolution.ar(input, kernelR, 16384, 0.5));
}).send(s);
);
)

a= Synth(\DbufWr);
g = Synth(\speechStereoConv2, [\kernelL, b, \kernelR, c]);
g.set(\bufL, ~d, \bufR, ~e);
g.set(\t_trig, 1);
g.set(\bufL, b, \bufR, c);
g.set(\t_trig, 1);
g.free;
b.free;
c.free;
~d.free;
~e.free;
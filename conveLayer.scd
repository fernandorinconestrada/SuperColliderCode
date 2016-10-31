(
//must have power of two framesize- FFT size will be sorted by Convolution to be double this
//maximum is currently a=8192 for FFT of size 16384
a= 2048;
s = Server.local;
e = Buffer.read(s, "/Users/fernandorincon/Documents/Pre Comp/KimSchoen/filia_kleven.wav", 0, 44100*60);
)

(
SynthDef(\speechConvLayer, { |bufnum = 0, out = 0|
	var input, inputAmp, gate, threshold, kernel, mix;
	input=SoundIn.ar(0);
	inputAmp = Amplitude.kr(input);
	threshold = 0.02;
	gate = Lag.kr(inputAmp > threshold, 0.01);
	kernel= PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * 1, 1, 0, 1);
	mix = Mix([kernel * 0.1, Convolution.ar(input * gate,kernel, a, 0.03)]);
	Out.ar(0,Pan2.ar(mix, 0));
}).send(s);
)

x = Synth(\speechConvLayer, [\out, 0, \bufnumIn, e]);

s.prepareForRecord("/Users/fernandorincon/Documents/Pre Comp/KimSchoen/SCPatchRender/ConvolveLayerA.aiff");
s.record;
s.stop;
(
//must have power of two framesize- FFT size will be sorted by Convolution to be double this
//maximum is currently a=8192 for FFT of size 16384
a=2048;
s = Server.local;
//kernel buffer
//~ker = Buffer.read(s,"/Users/fernandorincon/Documents/Live/KimSchoen/Samples/Processed/Consolidate/KernelConv.aif", 44100, 8192);
e = Buffer.read(s, "/Users/fernandorincon/Documents/Pre Comp/KimSchoen/filia_kleven.wav", 0, 44100*60);
)


(
SynthDef(\speechConv, { |bufnum = 0, out = 0, bufnumIn = 0|
	var input, kernel, rate, freq, form;
	freq = MouseX.kr(220, 230, lag:0.2);
	form = MouseY.kr(440, 1760, lag:0.2);
	rate = LFNoise2.kr(Line.kr(4, 20, 36)).range(0.9, 1.2);
	input=SoundIn.ar(0);
	//input = PlayBuf.ar(1, bufnumIn, BufRateScale.kr(bufnumIn) * rate, 1, 0, 1);
	kernel= PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 1, 0, 1);
	//kernel = Formant.ar(freq, form, freq + freq );
	//kernel= Mix.ar(LFSaw.ar([300,500,800,1000]*MouseX.kr(1.0,2.0),0,1.0));
	Out.ar(0,Pan2.ar(Convolution.ar(input,kernel, 2*a, 0.03)));
}).send(s);
)
w = Synth(\speechConv, [\out, 0, \bufnumIn, e]);

s.prepareForRecord("/Users/fernandorincon/Documents/Pre Comp/KimSchoen/SCPatchRender/Convolve.aiff");
s.record;
s.stop;
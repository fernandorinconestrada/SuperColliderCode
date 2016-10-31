~b = Buffer.alloc(s,1024,1); //for sampling rates 88200 and 96000

(
s = Server.local;
b = Buffer.read(s,"/Users/fernandorincon/Documents/Pre Comp/KimSchoenen/filia_kleven.wav");
c = Buffer.read(s,"/Users/fernandorincon/Documents/Pre Comp/KimSchoenen/chatbot.wav");
~b = Buffer.alloc(s, 1024, 1);
)

(
SynthDef(\vocodeKim, { |dens|
	var in, fft, output, freq, max;
	//in= PlayBuf.ar(1,b,BufRateScale.kr(b),1,0,1);
	max = Dwhite(0, 50, inf);
	freq = Dust.kr(dens).range(0.9, 1.1);
	in = SoundIn.ar(0);
	fft = FFT(~b, in, wintype:1);
	output=TPV.ar(fft, 1024, 512, 50, Demand.kr(Impulse.kr(10), 0,  max), freq, LFNoise0.kr(20).range(0.1,100), MouseY.kr(-20,40).dbamp);
Out.ar(0,Pan2.ar(output) * 1.2);
}).send(s)
)
y = Synth(\vocodeKim, [\dens, 4]);
y.set(\dens, 8);
s.prepareForRecord("/Users/fernandorincon/Documents/Pre Comp/KimSchoen/SCPatchRender/FiliaVocoder.aiff");
s.record;
s.stop;
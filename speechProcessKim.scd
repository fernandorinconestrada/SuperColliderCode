(
s = Server.local;
b = Buffer.read(s,"/Users/fernandorincon/Documents/Pre Comp/KimSchoen/filia_kleven.wav");
c = Buffer.read(s,"/Users/fernandorincon/Documents/Pre Comp/KimSchoen/chatbot.wav");
d = Buffer.read(s, "/Users/fernandorincon/Documents/Live/KimSchoen/Samples/Processed/Consolidate/ChatbotMacVoice.aif");
e = Buffer.read(s, "/Users/fernandorincon/Documents/Live/KimSchoen/Samples/Processed/Consolidate/ChatbotGoogleTransExp-1.aif");
)

(
SynthDef(\zigzag, {| out = 0, bufnum = 0 |
    var rate, in, chain;
	//freq = MouseX.kr(5, 20, lag: 0.2);
	rate = LFNoise2.kr(Line.kr(0.1, 20, 36)).range(0.9, 1.1);
	//ratio = LFNoise0.kr(10).range(0.9, 1.1);
	in = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 1, 0, 1);
	/*amp = Amplitude.kr(in, 0.05, 0.05);
	# freq, hasFreq = Tartini.kr(in);
	in = Mix.new(VarSaw.ar(freq * [0.5,1,2], 0, LFNoise1.kr(0.3,0.1,0.1), amp));*/
	chain = FFT(LocalBuf(2048), in);
	chain = PV_BinScramble(chain, MouseX.kr(0, 0.1) , 0.1, Impulse.kr(0.5));
    Out.ar(out, 0.3 * IFFT(chain).dup)
    }).send(s);
)

s.prepareForRecord("/Users/fernandorincon/Documents/Pre Comp/KimSchoenen/SCPatchRender/ChatbotBinScramble.aiff");
s.record;
s.stop;
a = Synth(\zigzag, [\bufnum, e]);
a.set(\bufnum, c);
b.free;


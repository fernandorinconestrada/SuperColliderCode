(
s = Server.local;
b = Buffer.read(s,"/Users/fernandorincon/Documents/Pre Comp/KimSchoen/filia_kleven.wav");
c = Buffer.read(s,"/Users/fernandorincon/Documents/Pre Comp/KimSchoen/chatbot.wav");
d = Buffer.read(s, "/Users/fernandorincon/Documents/Live/KimSchoen/Samples/Processed/Consolidate/ChatbotMacVoice.aif");
)

(
SynthDef(\zigzagClean, {| out = 0, bufnum = 0 |
    var rate, in;
	rate = LFDNoise0.kr(20).range(1.05, 1.2);
	in = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate.poll, 1, 0, 1);
    Out.ar(out, in.dup)
    }).send(s);
)

s.prepareForRecord("/Users/fernandorincon/Documents/Pre Comp/KimSchoenen/SCPatchRender/ChatbotRandomRate.aiff");
s.record;
s.stop;

x = Synth(\zigzagClean, [\out, 0, \bufnum, d]);
x.set(\bufnum, b);
x.set(\bufnum, c);
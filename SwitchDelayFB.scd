(
(
s = Server.local.boot;
b = Buffer.alloc(s, s.sampleRate*8, 1);
c = Buffer.read(s,"/Users/fernandorincon/Music/Precomp/Samples/Metal/Tapa_media_5.aif");
);
(
SynthDef(\writeBuf, { | bufnum = 0, dryLev = 1, wetLev = 1, delT = 1, delF = 0.7, maxDel = 20, amp = 1.0 |
	var in, rateWr, rateRead, buf, read, out;
	in = Limiter.ar(SoundIn.ar(0, 0.9), 0.9);
	rateWr = MouseX.kr(0.1, 2, 0, 0.2);
	rateRead = MouseY.kr(0.1, 2, 0, 0.2);
	buf = BufWr.ar(in, bufnum, Phasor.ar(0, BufRateScale.kr(bufnum) * rateWr, 0, BufFrames.kr(bufnum)), 1);
	read =  BufRd.ar(1, bufnum, Phasor.ar(0, BufRateScale.kr(bufnum) * rateRead, 0, BufFrames.kr(bufnum)), 1, 2);
	out = SwitchDelay.ar(read, dryLev, wetLev, delT, delF, maxDel, amp);
	OffsetOut.ar([0,1], out);
}).add;
);
a = Synth(\writeBuf, [\bufnum, b]);
)
a.set(\bufnum, c);

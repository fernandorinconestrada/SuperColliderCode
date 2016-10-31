(
~buf = Buffer.alloc(s, 1024, 1);
)
(
SynthDef(\chngR8, { |bufnum = 0, rateIn = 1, dens = 10|
	var out, input, in, rate, rateVal;
	//rate = SinOsc.kr(0.5).range(0.9, 1.1);
	//rate = LFNoise2.kr(0.5).range(0.9, 1.1);
	rateVal = Dwhite(0.87, 1.13, inf);
	rate = Poll.kr(Impulse.kr(10), Demand.kr(Impulse.kr(dens), 0, rateVal));
	input = SoundIn.ar(0);
	in = BufWr.ar(input, bufnum, Phasor.ar(0, BufRateScale.kr(~buf) * rateIn, 0, BufFrames.kr(~buf)));
	out = BufRd.ar(1, bufnum, Phasor.ar(0, BufRateScale.kr(~buf) * rate, 0, BufFrames.kr(~buf)));
	OffsetOut.ar([0,1], out);
}).send(s);
)

a = Synth(\chngR8);

s.prepareForRecord("/Users/fernandorincon/Documents/Pre Comp/KimSchoen/SCPatchRender/ChatbotLiveInRate1.aiff");
s.record;
s.stop;


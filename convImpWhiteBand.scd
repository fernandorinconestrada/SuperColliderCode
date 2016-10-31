(
{
	var kernel;
	kernel = BBandPass.ar(WhiteNoise.ar(1), 440 * LFNoise0.kr(20).range(0.5, 2), LFNoise0.kr(30).range(0.1, 0.5));
Convolution.ar(Impulse.ar(10), kernel, 512, 0.5)
}.play;
)

(
SynthDef(\convBandPImpWhite, { | left = 0, right = 1, ampWhite = 1, freq = 440, rateFreqDev = 20, loDev = 0.5, hiDev = 2, rateBW = 30, loBW = 0.01, hiBW = 0.5, ampFilt = 0.8, rateImp = 12, ampConv = 0.8, delT = 0.000605, ampDel = 0.8 |
	var kernel, in;
	kernel = BBandPass.ar(WhiteNoise.ar(ampWhite), freq * LFNoise0.ar(rateFreqDev).range(loDev, hiDev), LFNoise0.kr(rateBW).range(loBW, hiBW), ampFilt);
	in = Convolution.ar(Impulse.ar(rateImp), kernel, 512, ampConv);
	OffsetOut.ar(left, in);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel));
}).add;
)

a = Synth(\convBandPImpWhite);
a.set(\rateImp, 20);
a.set(\hiBW, 0.3);
a.set(\hiDev, 4);
a.set(\delT, 0.01);
a.set(\delT, 0.1);
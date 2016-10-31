{ JPverb.ar(Decay2.ar(Impulse.ar(0.1, 0, 1), 0.01, 20, WhiteNoise.ar(0.1)), 20, 0.8, 3) }.play;

{ JPverb.ar(Decay2.ar(Impulse.ar(0.1, 0, 1), 0.01, 20, BBandPass.ar(WhiteNoise.ar(1.5), 2400, 0.01)), 20, 0.8, 3) }.play;

{ JPverb.ar(Decay2.ar(Impulse.ar(0.1, 0, 1), 0.01, 20, BBandPass.ar(WhiteNoise.ar(1.5), 3605, 0.001)), 20, 0.3, 30) }.play;

{ LeakDC.ar(JPverb.ar(Decay2.ar(Impulse.ar(0.3, 0, 1), 0.001, 20, BBandPass.ar(WhiteNoise.ar(1), 200.rand+5000, (SinOsc.kr(10, -1)+SinOsc.kr(11, -1)+SinOsc.kr(12, -1)+SinOsc.kr(13, -1)).abs.range(0.001, 0.01))), 20, 0.3, 30)) }.play;

1/0.05;

{(SinOsc.ar(10, -1)+SinOsc.ar(11, -1)+SinOsc.ar(12, -1)+SinOsc.ar(13, -1))}.plot(1);

{ LeakDC.ar(JPverb.ar(Decay2.ar(Impulse.ar(0.3, 0, 1), 0.001, 20, BBandPass.ar(WhiteNoise.ar(1), 200.rand+5000, SinOsc.kr(10, -1).abs.range(0.001, 0.01))), 20, 0.3, 30)) }.play;

(
SynthDef(\jpverbTest, { |multWh = 1.2, freqBand = 3600, sum1, sum2, sum3, sum4, sum5, attDecT = 0.01, decT = 20, damp = 0.3, size = 3, loPos, hiPos|
	var bw, in, out;
	bw = SinOsc.ar(sum1)+SinOsc.ar(sum2)+SinOsc.ar(sum3)+SinOsc.ar(sum4)+SinOsc.ar(sum5);
	in = Decay2.ar(Impulse.ar(1/decT), attDecT, decT, BBandPass.ar(WhiteNoise.ar(multWh), freqBand, bw.abs.range(0.0001, 0.05)));
	out = LeakDC.ar(JPverb.ar(in, decT*0.7, damp, size));
	OffsetOut.ar(0, Pan2.ar(out, bw.range(loPos, hiPos).poll(label: \pan)));
}).add;
)

(
SynthDef(\jpverbTestRout, { |multWh = 1.2, freqBand = 3600, sum1, sum2, sum3, sum4, sum5, attDecT = 0.01, decT = 20, damp = 0.3, size = 3, loPos, hiPos|
	var bw, in, out;
	bw = SinOsc.ar(sum1)+SinOsc.ar(sum2)+SinOsc.ar(sum3)+SinOsc.ar(sum4)+SinOsc.ar(sum5);
	in = Decay2.ar(Impulse.ar(0), attDecT, decT, BBandPass.ar(WhiteNoise.ar(multWh), freqBand, bw.abs.range(0.0001, 0.05)));
	out = LeakDC.ar(JPverb.ar(in, decT*0.7, damp, size));
	OffsetOut.ar(0, Pan2.ar(out, bw.range(loPos, hiPos).poll(label: \pan)));
}).add;
)

a = Synth(\jpverbTest, [\sum1, 11, \sum2, 13, \sum3, 17, \sum4, 19, \sum5, 23, \size, 6, \loPos, -0.3, \hiPos, 0.3])

b = Synth(\jpverbTest, [\sum1, 23, \sum2, 19, \sum3, 17, \sum4, 13, \sum5, 11, \freqBand, 4800, \decT, 10, \damp, 0.4, \loPos, -0.6, \hiPos, 0.6]);

c = Synth(\jpverbTest, [\sum1, 19, \sum2, 23, \sum3, 17, \sum4, 11, \sum5, 13, \freqBand, 2400, \decT, 16, \damp, 0.8, \size, 8, \loPos, -0.8, \hiPos, 0.8]);

(
~aRout = Routine({
	var freqBand, decT, pos;
	freqBand = 1200*[2,3,4,5];
	decT = (10..20);
	pos = (0..10)* 0.1;
	10.do{
		Synth(\jpverbTestRout, [\sum1, 23, \sum2, 19, \sum3, 17, \sum4, 13, \sum5, 11, \freqBand, freqBand.choose, \decT, decT.choose, \damp, 0.4, \loPos, pos.choose*(-1) , \hiPos, pos.choose]);
	}
})
)

~aRout.play;
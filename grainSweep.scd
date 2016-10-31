(
SynthDef(\grainSweep, { |freqImp1 = 0.17, freqImp2 = 0.19, freqImp3 = 0.23, freqImp4 = 0.29, freqImp5 = 0.31, freqImp6 = 0.37, freqImp7 = 0.41, freqImp8 = 0.43, freqImp9 = 0.47, freqImp10 = 0.43, freqImp11 = 0.41, freqImp12 = 0.37, freqSweep1 = 0.13, freqSweep2 = 0.17, freqSweep3 = 0.19, freqSweep4 = 0.23, freqSweep5 = 0.29, freqSweep6 = 0.31, freqSweep7 = 0.31, freqSweep8 = 0.29, freqSweep9 = 0.23, freqSweep10 = 0.19, freqSweep11 = 0.17, freqSweep12 = 0.13, bw1 = 0.31, bw2 = 0.37, bw3 = 0.41, bw4 = 0.43, bw5 = 0.47, bw6 = 0.51,  bw7 = 0.51, bw8 = 0.47, bw9 = 0.43, bw10 = 0.41, bw11 = 0.37, bw12 = 0.31, ampBw1 = 1.1, ampBw2 = 1.3, ampBw3 = 0.7, ampBw4 = 2.3, ampBw5 = 1.7, ampBw6 = 3.1, ampBw7 = 2.3, ampBw8 = 1.7, ampBw9 = 3.1, ampBw10 = 0.7, ampBw11 = 2.3, ampBw12 = 1.3, maxDelAll = 0.2, maxDelAll1 = 0.3, maxDelAll2 = 0.3, maxDelAll3 = 0.5, maxDelAll4 = 0.3,  maxDelAll5 = 0.5, maxDelAll6 = 0.3, maxDelAll7 = 0.5, delTAll 0.1, delTAll1 = 0.3, delTAll2 = 0.23, delTAll3 0.13,  delTAll4 = 0.23, delTAll5 0.19, delTAll6 = 0.19, delTAll7 0.29, decTAll = 0.05, decTAll1 = 0.01, decTAll2 = 0.07, decTAll3 = 0.03, decTAll4 = 0.11, decTAll5 = 0.03, decTAll6 = 0.07, decTAll7 = 0.19, thresh = 0.5, thresh1 = 0.5, thresh2 = 0.5, thresh3 = 0.5, mixSig = 0.023, mixSig1 = 0.031, mixSig2 = 0.19, room = 0.031, room1 = 0.023, room2 = 0.037, damp = 0.037, damp1 = 0.031, damp2 = 0.023, panRate = 10, panRate1 = 20, panRate2 = 17|
var band1, band2, band3, band4, band5, band6, band7, band8, band9, band10, band11, band12, mix, mix1, mix2, mix3, delay, delay1, delay2, delay3, fb, fb1, fb2, fb3,out, out1, out2, out3, rev, rev1, rev2, pan, pan1, pan2, final;
	band1  = BBandPass.ar(Impulse.ar(freqImp1),  SinOsc.kr(freqSweep1).range(100, 120),    SinOsc.kr(bw1).range(0.031, 0.11),   LFNoise0.kr(ampBw1).range(0.2, 0.73));
	band2  = BBandPass.ar(Impulse.ar(freqImp2),  SinOsc.kr(freqSweep2).range(360, 300),    SinOsc.kr(bw2).range(0.019, 0.13),   LFNoise0.kr(ampBw2).range(0.2, 0.83));
	band3  = BBandPass.ar(Impulse.ar(freqImp3),  SinOsc.kr(freqSweep3).range(500, 600),    SinOsc.kr(bw3).range(0.023, 0.13),   LFNoise0.kr(ampBw3).range(0.2, 0.67));
	band4  = BBandPass.ar(Impulse.ar(freqImp4),  SinOsc.kr(freqSweep4).range(840, 700),    SinOsc.kr(bw4).range(0.023, 0.11),   LFNoise0.kr(ampBw4).range(0.2, 0.71));
	band5  = BBandPass.ar(Impulse.ar(freqImp5),  SinOsc.kr(freqSweep5).range(1100, 1320),  SinOsc.kr(bw5).range(0.023, 0.07),   LFNoise0.kr(ampBw5).range(0.2, 0.87));
	band6  = BBandPass.ar(Impulse.ar(freqImp6),  SinOsc.kr(freqSweep6).range(1560, 1300),  SinOsc.kr(bw6).range(0.029, 0.07),   LFNoise0.kr(ampBw6).range(0.2, 0.67));
	band7  = BBandPass.ar(Impulse.ar(freqImp7),  SinOsc.kr(freqSweep7).range(1700, 2040),  SinOsc.kr(bw7).range(0.11, 0.019),   LFNoise0.kr(ampBw7).range(0.2, 0.73));
	band8  = BBandPass.ar(Impulse.ar(freqImp8),  SinOsc.kr(freqSweep8).range(2280, 1900),  SinOsc.kr(bw8).range(0.019, 0.13),   LFNoise0.kr(ampBw8).range(0.2, 0.83));
	band9  = BBandPass.ar(Impulse.ar(freqImp9),  SinOsc.kr(freqSweep9).range(2300, 2760),  SinOsc.kr(bw9).range(0.023, 0.17),   LFNoise0.kr(ampBw9).range(0.2, 0.67));
	band10 = BBandPass.ar(Impulse.ar(freqImp10), SinOsc.kr(freqSweep10).range(3500, 2900), SinOsc.kr(bw10).range(0.02, 0.11),   LFNoise0.kr(ampBw10).range(0.2, 0.71));
	band11 = BBandPass.ar(Impulse.ar(freqImp11), SinOsc.kr(freqSweep11).range(3100, 3480), SinOsc.kr(bw11).range(0.023, 0.07),  LFNoise0.kr(ampBw11).range(0.2, 0.87));
	band12 = BBandPass.ar(Impulse.ar(freqImp12), SinOsc.kr(freqSweep12).range(4440, 3700), SinOsc.kr(bw12).range(0.029, 0.13),  LFNoise0.kr(ampBw12).range(0.2, 0.71));
	mix  = Mix.new([band1, band8,  band11]);
	mix1 = Mix.new([band2, band7,  band9]);
	mix2 = Mix.new([band3, band6,  band10]);
	mix3 = Mix.new([band4, band5, band12]);
	delay =  AllpassC.ar(mix,   maxDelAll,  SinOsc.kr(delTAll).range(0.11, 0.19), SinOsc.kr(decTAll).range(0.3, 0.7));
	fb =     AllpassC.ar(delay, maxDelAll1, SinOsc.kr(delTAll1).range(0.13,0.23), SinOsc.kr(decTAll1).range(0.5, 1.3));
	out =    CompanderD.ar(fb,  thresh, 0.5, 0.5);
	delay1 = AllpassC.ar(mix1,   maxDelAll2, SinOsc.kr(delTAll2).range(0.13, 0.29), SinOsc.kr(decTAll2).range(0.5, 0.7));
	fb1 =    AllpassC.ar(delay1, maxDelAll3, SinOsc.kr(delTAll3).range(0.11,0.41),  SinOsc.kr(decTAll3).range(0.7, 1.1));
	out1 =   CompanderD.ar(fb1,  thresh1, 0.6, 0.6);
	delay2 = AllpassC.ar(mix2,   maxDelAll4, SinOsc.kr(delTAll4).range(0.11, 0.23), SinOsc.kr(decTAll4).range(0.3, 1.1));
	fb2 =    AllpassC.ar(delay2, maxDelAll5, SinOsc.kr(delTAll5).range(0.13,0.19),  SinOsc.kr(decTAll5).range(0.7, 1.3));
	out2 =   CompanderD.ar(fb2,  thresh2, 0.4, 0.4);
	delay3 = AllpassC.ar(mix3,   maxDelAll6, SinOsc.kr(delTAll6).range(0.13, 0.31), SinOsc.kr(decTAll6).range(0.3, 0.7));
	fb3 =    AllpassC.ar(delay3, maxDelAll7, SinOsc.kr(delTAll7).range(0.19,0.43),  SinOsc.kr(decTAll7).range(0.5, 1.1));
	out3 =   CompanderD.ar(fb3, thresh3, 0.6, 0.6);
	rev =  FreeVerb.ar(out, SinOsc.kr(mixSig).range(0.05, 0.19),  SinOsc.kr(room).range(0.11, 0.19),  SinOsc.kr(damp).range(0.2, 0.6));
	pan =  Pan2.ar(rev, LFNoise0.kr(panRate).range(-1.0, 1.0));
	rev1 = FreeVerb.ar(out, SinOsc.kr(mixSig1).range(0.05, 0.23), SinOsc.kr(room1).range(0.13, 0.23), SinOsc.kr(damp1).range(0.2, 0.6));
	pan1 = Pan2.ar(rev, LFNoise0.kr(panRate1).range(-1.0, 1.0));
	rev2 = FreeVerb.ar(out, SinOsc.kr(mixSig2).range(0.05, 0.17), SinOsc.kr(room2).range(0.07, 0.17), SinOsc.kr(damp2).range(0.2, 0.6));
	pan2 = Pan2.ar(rev, LFNoise0.kr(panRate2).range(-1.0, 1.0));
	final = Mix.new([pan, pan1, pan2]);
	OffsetOut.ar(0, final);
}).add;
)

a = Synth(\grainSweep);

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/grainSweep.aif");
s.record;
s.stopRecording;
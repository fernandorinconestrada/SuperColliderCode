
(
SynthDef(\grainFeedback, { | freqBw7 = 200, bw7 = 0.01, ampBw7 = 1.0, freqBw8 = 700, bw8 = 0.01, ampBw8 = 1.0, freqBw9 = 1200, bw9 = 0.01, ampBw9 = 1.0, freqBw10 = 2000, bw10 = 0.01, ampBw10 = 1.0, freqBw11 = 3800, bw11 = 0.01, ampBw11 = 1.0, freqBw12 = 7400, bw12 = 0.01, ampBw12 = 1.0, dens = 2, dur = 0.1, pan = 0, envbuf = -1, ampGrain = 0.8, delAllGr = 0.01, decAllGr = 0.5 , amp_inGrain = 0.9, delCombGr = 0.2, decCombGr = 0.5, amp_feedGr = 0.9, delMixFBGr = 0.1, decMixFBGr = 0.5, ampMixFBGr = 0.9, freq|
	var liveInputB, band7, band8, band9, band10, band11, band12, mixBandB, inGrain, feedGrain, feedbackGr, mixAllB;
	liveInputB = SoundIn.ar(0);
	//liveInputB = WhiteNoise.ar(freq);
	band7 = BBandPass.ar(liveInputB, freqBw7, bw7, ampBw7);
	band8 = BBandPass.ar(liveInputB, freqBw8, bw8, ampBw8);
	band9 = BBandPass.ar(liveInputB, freqBw9, bw9, ampBw9);
	band10 = BBandPass.ar(liveInputB, freqBw10, bw10, ampBw10);
	band11 = BBandPass.ar(liveInputB, freqBw11, bw11, ampBw11);
	band12 = BBandPass.ar(liveInputB, freqBw12, bw12, ampBw12);
	mixBandB = Mix.new([band7, band8, band9, band10, band11, band12]);
	inGrain = Limiter.ar(LPF.ar(GrainIn.ar(1, Dust.kr(dens), dur, mixBandB, pan, envbuf, 512, ampGrain), 19000), 0.9);
	feedGrain = Limiter.ar(AllpassC.ar(inGrain, 2.0, LFNoise0.kr(MouseX.kr(0.2, 20)).range(0.01, 1.99).poll, LFNoise0.kr(MouseY.kr(0.2, 12)).range(0.5, 3.0), amp_inGrain), 0.9);
	feedbackGr = Limiter.ar(CombC.ar(feedGrain, 4.0, LFNoise0.kr(MouseX.kr(0.5, 20)).range(0.02, 3.99), LFNoise0.kr(MouseY.kr(0.2, 12)).range(1.0, 6.0), amp_feedGr), 0.9);
	mixAllB =  AllpassC.ar(feedbackGr, 4, delMixFBGr, decMixFBGr, ampMixFBGr);
	OffsetOut.ar([0,1], mixAllB);
}).send(s);
)

a = Synth(\grainFeedback);

a.set(\dens, 300);

s.prepareForRecord;
s.record;
s.stopRecording;
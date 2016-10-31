(
SynthDef(\grainDelFeedback, { | freqBw1 = 200, bw1 = 1.0, ampBw1 = 1.0, freqBw2 = 700, bw2 = 1.0, ampBw2 = 1.0, freqBw3 = 1200, bw3 = 1.0, ampBw3 = 1.0, freqBw4 = 2000, bw4 = 1.0, ampBw4 = 1.0, freqBw5 = 3800, bw5 = 1.0, ampBw5 = 1.0, freqBw6 = 7400, bw6 = 1.0, ampBw6 = 1.0, dens = 40, dur = 0.02, pan = 0, envbuf = -1, ampGrain = 1.0, del_inDelay = 2.0, dec_inDelay = 3.0, amp_inDelay = 1.0, del_feedDel = 1.0, dec_feedDel = 0.5, amp_feedDel = 1.0, del_inGrain = 0.4, dec_inGrain = 1.0 , amp_inGrain = 1.0, del_feedGr = 0.5, dec_feedGr = 1.5, amp_feedGr = 1.0, attack = 0.01, release = 0.01, numHarm = 30, mulAmp = 0.1, delMixFBDel = 1, decMixFBDel = 2, ampMixFBDel = 0.5, delMixFBGr = 1, decMixFBGr = 2, ampMixFBGr = 0.5|
	var liveInput, liveInput1, band1, band2, band3, band4, band5, band6, mixBand, mixBand1, inDelay, inGrain, feedDel, feedbackDel, feedGrain, feedbackGr, gen, mixAll;
	liveInput = SoundIn.ar(0);
	band1 = BBandPass.ar(liveInput, freqBw1, bw1, ampBw1);
	band2 = BBandPass.ar(liveInput, freqBw2, bw2, ampBw2);
	band3 = BBandPass.ar(liveInput, freqBw3, bw3, ampBw3);
	band4 = BBandPass.ar(liveInput, freqBw4, bw4, ampBw4);
	band5 = BBandPass.ar(liveInput, freqBw5, bw5, ampBw5);
	band6 = BBandPass.ar(liveInput, freqBw6, bw6, ampBw6);
	mixBand = Mix.new([band1, band2, band3, band4, band5, band6]);
	inDelay = Limiter.ar(LPF.ar(mixBand, 19000, 1.0), 0.9);
	inGrain = Limiter.ar(LPF.ar(GrainIn.ar(1, Dust.kr(dens), dur, mixBand, pan, envbuf, 512, ampGrain), 19000), 0.9);
	feedDel = AllpassC.ar(inDelay, 5, del_inDelay, dec_inDelay, amp_inDelay);
	feedbackDel = CombC.ar(feedDel, 3.0, del_feedDel, dec_feedDel, amp_feedDel);
	feedGrain = AllpassC.ar(inGrain, 5, del_inGrain, dec_inGrain, amp_inGrain);
	feedbackGr = CombC.ar(feedGrain, 3.0, del_feedGr, dec_feedGr, amp_feedGr);
	mixAll = Mix.new([AllpassC.ar(feedbackDel, 4, delMixFBDel, decMixFBDel, ampMixFBDel), AllpassC.ar(feedbackGr, 4, delMixFBGr, decMixFBGr, ampMixFBGr)]);
	OffsetOut.ar(0, mixAll);
}).add;
)

a = Synth(\grainDelFeedback);

(
OSCdef(\ampFilt1,    {|msg, time, addr, recvPort| a.set(\ampMixFBDel,    msg[1].postln)}, "/ampFilt1", nil, 57121);
OSCdef(\ampFilt2,    {|msg, time, addr, recvPort| a.set(\ampMixFBGr,     msg[1].postln)}, "/ampFilt2", nil, 57121);
)


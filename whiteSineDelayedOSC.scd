(
SynthDef(\white, { | freqEnv1 = 17, freqEnv2 = 19, freqEnv3 = 13, freqEnv4 = 23, amp1 = 0.05, loAmpSig1 = 0.8, hiAmpSig1 = 1.5, amp2 = 0.07, loAmpSig2 = 0.7, hiAmpSig2 = 1.7, amp3 = 0.011, loAmpSig3 = 0.5, hiAmpSig3 = 1.7, amp4 = 0.07, loAmpSig4 = 0.7, hiAmpSig4 = 1.3, freqBand1 = 110, freqBand2 = 330, bw1 = 0.0001,  bw2 = 0.0001, maxDel1 = 0.3, delT1 = 0.06, decT1 = 0.3, maxDelfb1 = 0.3, delTfb1 = 0.1, decTfb1 = 0.5, freqBand3 = 550, freqBand4 = 770, bw3 = 0.0001,  bw4 = 0.0001, maxDel2 = 0.3, delT2 = 0.06, decT2 = 0.3, maxDelfb2 = 0.3, delTfb2 = 0.1, decTfb2 = 0.5, freqBand5 = 1100, freqBand6 = 1300, bw5 = 0.0001,  bw6 = 0.0001, maxDel3 = 0.3, delT3 = 0.08, decT3 = 0.3, maxDelfb3 = 0.3, delTfb3 = 0.2, decTfb3 = 0.5, freqBand7 = 1700, freqBand8 = 1900, bw7 = 0.0001,  bw8 = 0.0001, maxDel4 = 0.3, delT4 = 0.07, decT4 = 0.3, maxDelfb4 = 0.3, delTfb4 = 0.2, decTfb4 = 0.5, mixRev1 = 0.2, room1 = 0.2, damp1 = 0.2, mixRev2 = 0.23, room2 = 0.19, damp2 = 0.23, mixRev3 = 0.19, room3 = 0.2, damp3 = 0.2, mixRev4 = 0.13, room4 = 0.2, damp4 = 0.23|
	var env1, env2, env3, env4, sig1, sig2, sig3, sig4, band1, band2, band3, band4, band5, band6, band7, band8, mix1, filt1, fb1, mix2, filt2, fb2, mix3, filt3, fb3, mix4, filt4, fb4, rev1, rev2, rev3, rev4;
	env1 = EnvGen.ar(Env([0,1,0], [0.15, 0.85], [2, -6]), Dust.kr(freqEnv1));
	sig1 = (WhiteNoise.ar(SinOsc.ar(amp1).range(loAmpSig1, hiAmpSig1)) * env1);
	env2 = EnvGen.ar(Env([0,1,0], [0.15, 0.85], [2, -6]), Dust.kr(freqEnv2));
	sig2 = (WhiteNoise.ar(SinOsc.ar(amp2).range(loAmpSig2, hiAmpSig2)) * env2);
	env3 = EnvGen.ar(Env([0,1,0], [0.15, 0.85], [2, -6]), Dust.kr(freqEnv3));
	sig3 = (WhiteNoise.ar(SinOsc.ar(amp3).range(loAmpSig3, hiAmpSig3)) * env3);
	env4 = EnvGen.ar(Env([0,1,0], [0.15, 0.85], [2, -6]), Dust.kr(freqEnv4));
	sig4 = (WhiteNoise.ar(SinOsc.ar(amp4).range(loAmpSig4, hiAmpSig4)) * env4);
	//first
	band1 = BBandPass.ar(sig1, freqBand1, bw1);
	band2 = BBandPass.ar(sig1, freqBand2, bw2);
	mix1 =  Mix.new([band1, band2]);
	filt1 = AllpassC.ar(mix1, maxDel1, SinOsc.kr(delT1).range(0.02, 0.2), decT1);
	fb1 =   AllpassC.ar(filt1, maxDelfb1, SinOsc.kr(delTfb1).range(0.05, 0.27), decTfb1);
	//second
	band3 = BBandPass.ar(sig2, freqBand3, bw3);
	band4 = BBandPass.ar(sig2, freqBand4, bw4);
	mix2 =  Mix.new([band3, band4]);
	filt2 = AllpassC.ar(mix2, maxDel2, SinOsc.kr(delT2).range(0.03, 0.23), decT2);
	fb2 =   AllpassC.ar(filt2, maxDelfb2, SinOsc.kr(delTfb2).range(0.01, 0.29), decTfb2);
	//third
	band5 = BBandPass.ar(sig3, freqBand5, bw5);
	band6 = BBandPass.ar(sig3, freqBand6, bw6);
	mix3 =  Mix.new([band5, band6]);
	filt3 = AllpassC.ar(mix3, maxDel3, SinOsc.kr(delT3).range(0.01, 0.23), decT3);
	fb3 =   AllpassC.ar(filt3, maxDelfb3, SinOsc.kr(delTfb3).range(0.03, 0.19), decTfb3);
	//fourth
	band7 = BBandPass.ar(sig4, freqBand7, bw7);
	band8 = BBandPass.ar(sig4, freqBand8, bw8);
	mix4 =  Mix.new([band7, band8]);
	filt4 = AllpassC.ar(mix4, maxDel4, SinOsc.kr(delT4).range(0.07, 0.29), decT4);
	fb4 =   AllpassC.ar(filt4, maxDelfb4, SinOsc.kr(delTfb4).range(0.01, 0.13), decTfb4);
	//mix
	rev1 = FreeVerb.ar(fb1, SinOsc.kr(mixRev1).range(0.05, 0.2), SinOsc.kr(room1).range(0.1, 0.5), SinOsc.kr(damp1).range(0.5, 1));
	rev2 = FreeVerb.ar(fb2, SinOsc.kr(mixRev2).range(0.07, 0.23), SinOsc.kr(room2).range(0.1, 0.5), SinOsc.kr(damp2).range(0.5, 1));
	rev3 = FreeVerb.ar(fb3, SinOsc.kr(mixRev3).range(0.05, 0.27), SinOsc.kr(room3).range(0.1, 0.5), SinOsc.kr(damp3).range(0.5, 1));
	rev4 = FreeVerb.ar(fb4, SinOsc.kr(mixRev4).range(0.05, 0.19), SinOsc.kr(room4).range(0.1, 0.5), SinOsc.kr(damp4).range(0.5, 1));
	OffsetOut.ar(0, [rev1, rev2, rev3, rev4]);
}).add;
)

a = Synth(\white);
b = Synth(\white);
c = Synth(\white);
a.set(\freqEnv1, 19, \freqEnv2, 23, \freqEnv3, 17, \freqEnv4, 29);
a.set(\amp1, 15, \amp2, 13, \amp3, 15, \amp4, 7);
a.set(\freqBand1, 110.3, \freqBand2, 109.7, \freqBand3, 111,\freqBand4, 109.2,\freqBand5, 110.9, \freqBand6, 109.8, \freqBand7, 110.2, \freqBand8, 110);
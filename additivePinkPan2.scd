(
SynthDef(\testPink, { | ratePan = 0.08, left = -1.0, right = 1.0, rateAmpSrc = 20, loAmpSrc = 0.4, hiAmpSrc = 1.0, rateAmpDel = 20, loAmpDel = 0.4, hiAmpDel = 1.0, dens = 5, attDec = 0.01, decDec = 0.4, ampPink = 1.5, freq = 220, arrFreq = #[0,0,0,0,0,0,0,0,0,0,0,0], bw = 0.001, arrBw = #[0,0,0,0,0,0,0,0,0,0,0,0], amp = 1.0, arrAmp = #[0,0,0,0,0,0,0,0,0,0,0,0], delT = 0.06, rev = -1.0 |
	var panSrc, levSrc, levDel, in;
	panSrc = SinOsc.kr(ratePan).range(left, right);
	//levSrc = LFNoise0.kr(rateAmpSrc).range(loAmpSrc, hiAmpSrc);
	//levDel = LFNoise0.kr(rateAmpDel).range(loAmpDel, hiAmpDel);
	levSrc = SinOsc.kr(rateAmpSrc).range(loAmpSrc, hiAmpSrc);
	levDel = SinOsc.kr(rateAmpDel).range(loAmpDel, hiAmpDel);
	in = Pan2.ar(Decay2.ar(Impulse.ar(dens), attDec, decDec, Mix.new(BBandPass.ar(PinkNoise.ar(ampPink), freq * arrFreq, bw * arrBw, amp * arrAmp))), panSrc, levSrc);
	OffsetOut.ar(0, HPF.ar(in, 30));
	OffsetOut.ar(0, HPF.ar(Pan2.ar(DelayC.ar(in, 0.2, delT), panSrc * rev, levDel), 30));
}).add;
)
(
~arrFreq = Array.series(12, 1, 3);
~arrBw = Array.rand(12, 1, 4);
~arrAmp = Array.rand(12, 0.8, 2);
)
a = Synth(\testPink, [\arrFreq, ~arrFreq, \arrBw, ~arrBw, \arrAmp, ~arrAmp]);
a.set(\arrBw, ~arrBw);
a.set(\arrAmp, ~arrAmp);
a.set(\arrFreq, ~arrFreq);
a.set(\freq, 440);
a.set(\decDec, 0.06);
a.set(\dens, 18);
a.set(\delT, 0.08);
a.set(\delT, 0.008);
a.set(\rev, -0.1); //narrow and localized
a.set(\rev, -1.0); //wide
55*56
//for SinOsc ampControl
a.set(\loAmpSrc, 0.2, \hiAmpSrc, 1.0, \loAmpDel, 0.2, \loAmpDel, 1.0);
a.set(\rateAmpSrc, 14, \rateAmpDel, 16);
(

~spline = BezierSpline([ 0, 0 ], [ [ 0.15, 0.3 ], [ 0.5, 0], [ 0.75, 0 ] ], [ 0.75, 1 ], [ [ 0.85, 0.125 ], [ 0.95, 0.725 ] ], [1,0], false);
~spline.gui(nil,1200@300);

SynthDef(\splineOsc, { | freqSpl = 0.2, loFreq = 220, hiFreq = 440, freqFB = 0.2, loFB = 0.2, hiFB = 0.8, freqAmp = 0.2, loAmp = 0.05, hiAmp = 0.13, dens = 50, dur = 20, panRate = 20, envbuf = -1, thresh = 0.5, sloB = 0.75, sloA = 0.25, maxDel = 0.3, delT = 0.03, decT = 0.3, maxDelfb = 0.3, delTfb = 0.03, decTfb = 0.5, freqMix = 0.2, freqRoom = 0.2, freqDamp = 0.2, out = 0, limit = 0.95  |
	var sine, grain, delay, feed, rev;
	sine = SinOscFB.ar(SplineGen(~spline, loop: true).kr(freqSpl).range(loFreq, hiFreq), SinOsc.kr(freqFB).range(loFB, hiFB), SinOsc.kr(freqAmp).range(loAmp, hiAmp));
	grain = GrainIn.ar(2, LFNoise0.kr(dens), LFNoise0.kr(dur).range(0.03, 0.08), sine, LFNoise0.kr(panRate).range(-1.0, 1.0), envbuf);
	delay = AllpassC.ar(Compander.ar(grain, grain, thresh, sloB, sloA), maxDel, delT, decT);
	feed = AllpassC.ar(delay, maxDelfb, delTfb, decTfb);
	rev = FreeVerb.ar(feed, SinOsc.kr(freqMix).range(0.1, 0.3), SinOsc.kr(freqRoom).range(0.2, 2.0), SinOsc.kr(freqDamp).range(0.3, 0.6));
	OffsetOut.ar(out, Limiter.ar(rev, limit));
}).add;
);
(
a = Synth(\splineOsc);
b = Synth(\splineOsc, [\freqSpl, 0.203, \loFreq, 220.02]);
);
a.set(\hiFreq, 1760);
a.set(\panRate, 100);
b.set(\hiFreq, 880);
a.set(\freqSpl, 10);
a.set(\sloB, 0.75, \sloA, 0.25);
b.set(\sloB, 0.75, \sloA, 0.25);
a.set(\hiAmp, 0.17)
b.set(\hiAmp, 0.17);
a.free;
b.free;


	
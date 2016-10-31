o = Server.local.options;
o.memSize = 40*8192;
o.memSize;


~freqs = [445, 618, 890, 1050, 1496, 1681, 1953, 2138, 2385, 2583, 3016, 3182, 3442, 3627];
~amps = ((1..14)*1).normalizeSum.reverse;
~freqAmp = Array.rand(14, 4, 16)*0.05;
~delT = (1..8)*0.01;

(
SynthDef(\testMultiVer1,{ |loVib = 0.4, hiVib = 0.8, loAmp = 3, hiAmp = 4, multWhite = 4, freq, bw = 0.001, amp = 1.2, maxDel = 0.1, delT = 0.03, ampDel = 0.75, delFeed = 0.04, ampFeed = 0.75, delMix = 0.05, ampMix = 0.75|
	var freqVib, sig, del, feedDel, mix, mixDel;
	freqVib = SinOsc.kr(SinOsc.kr(0.1).range(loVib, hiVib)).range(loAmp, hiAmp);
	sig = BBandPass.ar(WhiteNoise.ar(multWhite), freq, bw, amp);
	del = DelayL.ar(sig, maxDel, delT, ampDel);
	feedDel = DelayL.ar(del, maxDel, delFeed, ampFeed);
	mix = Mix.new([sig, del, feedDel]);
	mixDel = DelayL.ar(mix, maxDel, delMix, ampMix);
	OffsetOut.ar(0, [mix, mixDel]*freqVib);
}).add;
)

(
SynthDef(\testMultiVer1Rout,{ |lev1, lev2, att, dec, rel, loVib = 0.4, hiVib = 0.8, loAmp = 2, hiAmp = 3, multWhite = 4, freq, bw = 0.001, amp = 1.2, maxDel = 0.1, delT = 0.03, ampDel = 0.75, delFeed = 0.04, ampFeed = 0.75, delMix = 0.05, ampMix = 0.75|
	var env, freqVib, sig, del, feedDel, mix, mixDel;
	env = EnvGen.kr(Env([0,lev1,lev2,0], [att,dec,rel]), 1, doneAction: 2);
	freqVib = SinOsc.kr(SinOsc.kr(0.1).range(loVib, hiVib)).range(loAmp, hiAmp);
	sig = BBandPass.ar(WhiteNoise.ar(multWhite), freq, bw, amp);
	del = DelayL.ar(sig, maxDel, delT, ampDel);
	feedDel = DelayL.ar(del, maxDel, delFeed, ampFeed);
	mix = Mix.new([sig, del, feedDel]);
	mixDel = DelayL.ar(mix, maxDel, delMix, ampMix);
	OffsetOut.ar(0, ([mix, mixDel]*freqVib)*env);
}).add;
)

(
SynthDef(\testMultiVer2,{ |freqAmp, multWhite = 4, freq, bw = 0.001, amp = 1.2, loAmp = 0.009, hiAmp, phase = 0, maxDel = 0.1, delT = 0.03, ampDel = 0.75, delFeed = 0.04, ampFeed = 0.75, delMix = 0.05, ampMix = 0.75|
	var sig, del, feedDel, mix, mixDel;
	amp = SinOsc.kr(freqAmp, phase);
	sig = BBandPass.ar(WhiteNoise.ar(multWhite), freq, bw, amp.range(loAmp, hiAmp));
	del = DelayL.ar(sig, maxDel, delT, ampDel);
	feedDel = DelayL.ar(del, maxDel, delFeed, ampFeed);
	mix = Mix.new([sig, del, feedDel]);
	mixDel = DelayL.ar(mix, maxDel, delMix, ampMix);
	OffsetOut.ar(0, [mix, mixDel]*4);
}).add;
)

(
a = Synth(\testMultiVer1, [\freq, ~freqs.at(0), \amp, ~amps.at(0)]);
b = Synth(\testMultiVer1, [\freq, ~freqs.at(1), \amp, ~amps.at(1)]);
c = Synth(\testMultiVer1, [\freq, ~freqs.at(2), \amp, ~amps.at(2)]);
d = Synth(\testMultiVer1, [\freq, ~freqs.at(3), \amp, ~amps.at(3)]);
e = Synth(\testMultiVer1, [\freq, ~freqs.at(4), \amp, ~amps.at(4)]);
f = Synth(\testMultiVer1, [\freq, ~freqs.at(5), \amp, ~amps.at(5)]);
g = Synth(\testMultiVer1, [\freq, ~freqs.at(6), \amp, ~amps.at(6)]);
h = Synth(\testMultiVer1, [\freq, ~freqs.at(7), \amp, ~amps.at(7)]);
i = Synth(\testMultiVer1, [\freq, ~freqs.at(8), \amp, ~amps.at(8)]);
j = Synth(\testMultiVer1, [\freq, ~freqs.at(9), \amp, ~amps.at(9)]);
k = Synth(\testMultiVer1, [\freq, ~freqs.at(10), \amp, ~amps.at(10)]);
l = Synth(\testMultiVer1, [\freq, ~freqs.at(11), \amp, ~amps.at(11)]);
m = Synth(\testMultiVer1, [\freq, ~freqs.at(12), \amp, ~amps.at(12)]);
n = Synth(\testMultiVer1, [\freq, ~freqs.at(13), \amp, ~amps.at(13)]);
)

(
a = Synth(\testMulti, [\freq, ~freqs.at(0), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(0)]);
b = Synth(\testMulti, [\freq, ~freqs.at(1), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(1)]);
c = Synth(\testMulti, [\freq, ~freqs.at(2), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(2)]);
d = Synth(\testMulti, [\freq, ~freqs.at(3), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(3)]);
e = Synth(\testMulti, [\freq, ~freqs.at(4), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(4)]);
f = Synth(\testMulti, [\freq, ~freqs.at(5), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(5)]);
g = Synth(\testMulti, [\freq, ~freqs.at(6), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(6)]);
h = Synth(\testMulti, [\freq, ~freqs.at(7), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(7)]);
i = Synth(\testMulti, [\freq, ~freqs.at(8), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(8)]);
j = Synth(\testMulti, [\freq, ~freqs.at(9), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(9)]);
k = Synth(\testMulti, [\freq, ~freqs.at(10), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(10)]);
l = Synth(\testMulti, [\freq, ~freqs.at(11), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(11)]);
m = Synth(\testMulti, [\freq, ~freqs.at(12), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(12)]);
n = Synth(\testMulti, [\freq, ~freqs.at(13), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(13)]);
)

(
a = Synth(\testMulti, [\freq, ~freqs.at(0), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(0), \delT, ~delT.choose]);
b = Synth(\testMulti, [\freq, ~freqs.at(1), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(1), \delT, ~delT.choose]);
c = Synth(\testMulti, [\freq, ~freqs.at(2), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(2), \delT, ~delT.choose]);
d = Synth(\testMulti, [\freq, ~freqs.at(3), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(3), \delT, ~delT.choose]);
e = Synth(\testMulti, [\freq, ~freqs.at(4), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(4), \delT, ~delT.choose]);
f = Synth(\testMulti, [\freq, ~freqs.at(5), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(5), \delT, ~delT.choose]);
g = Synth(\testMulti, [\freq, ~freqs.at(6), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(6), \delT, ~delT.choose]);
h = Synth(\testMulti, [\freq, ~freqs.at(7), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(7), \delT, ~delT.choose]);
i = Synth(\testMulti, [\freq, ~freqs.at(8), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(8), \delT, ~delT.choose]);
j = Synth(\testMulti, [\freq, ~freqs.at(9), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(9), \delT, ~delT.choose]);
k = Synth(\testMulti, [\freq, ~freqs.at(10), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(10), \delT, ~delT.choose]);
l = Synth(\testMulti, [\freq, ~freqs.at(11), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(11), \delT, ~delT.choose]);
m = Synth(\testMulti, [\freq, ~freqs.at(12), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(12), \delT, ~delT.choose]);
n = Synth(\testMulti, [\freq, ~freqs.at(13), \freqAmp, ~freqAmp.choose, \hiAmp, ~amps.at(13), \delT, ~delT.choose]);
)

(
~rout = Routine({
	var delta, delta2, lev1, lev2, att, dec, rel;
	delta = (1..10)*0.005;
	delta2 = (6..11);
	lev1 = (1..10)*0.1;
	lev2 = (1..10)*0.05;
	att = (1..10)*0.01;
	dec = (1..10);
	rel = (1..10)*0.2;
	3.do{
		1.do{
			var degree;
			degree = (1..3).choose;
		a = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(0)*degree, \amp, ~amps.at(0), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		b = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(1)*degree, \amp, ~amps.at(1), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		c = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(2)*degree, \amp, ~amps.at(2), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		d = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(3)*degree, \amp, ~amps.at(3), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		e = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(4)*degree, \amp, ~amps.at(4), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		f = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(5)*degree, \amp, ~amps.at(5), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		g = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(6)*degree, \amp, ~amps.at(6), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		h = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(7)*degree, \amp, ~amps.at(7), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		i = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(8)*degree, \amp, ~amps.at(8), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		j = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(9)*degree, \amp, ~amps.at(9), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		k = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(10)*degree, \amp, ~amps.at(10), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		l = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(11)*degree, \amp, ~amps.at(11), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		m = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(12)*degree, \amp, ~amps.at(12), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		delta.choose.yield;
		n = Synth(\testMultiVer1Rout, [\freq, ~freqs.at(13)*degree, \amp, ~amps.at(13), \lev1, lev1.choose, \lev2, lev2.choose, \att, att.choose, \dec, dec.choose, \rel, rel.choose]);
		};
	delta2.choose.yield;
	};
})
)

~rout.play;

(
r = Routine({
	var delta;
	delta = (1..5);
	3.do{
		1.do{
			postln("1");
			delta.choose.yield;
			postln("2");
			delta.choose.yield;
			postln("3");
		};
		delta.choose.yield;
	}

})
)

r.play;
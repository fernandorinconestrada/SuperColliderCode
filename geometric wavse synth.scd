s = Server.local;
s.scope;
(
c = Array.series(100, 400, 800).postln; //double the fundamental
d = c.indexOfGreaterThan(22000).postln;
c = Array.series(d, 400, 800).postln;
a = Array.series(d, 1, 2).postln;
b = a.collect{|i, a| 1/a}.shift(-1, 0);
b.normalizeSum;
x = { Out.ar(0, LPF.ar(Normalizer.ar(SinOsc.ar([c], 0, [b]), 0.01, 0.01),20000));
}.play;
)

(
SynthDef(\triangle, { |lev = 0.01, dur = 0.01, freq_cut = 20000, freq = 100|
	var harm_series, index, harms, amps, amp_div, amp_val;
	harm_series = Array.series(200, freq, freq*2).postln;
	index = harm_series.indexOfGreaterThan(22000).postln;
	harms = Array.series(index, freq, freq*2);
	amp_div = Array.series(index, 1, 2).postln;
	amp_val = (amp_div.collect{|i, a| 1 /a }).shift(-1,0).postln;
	amp_val = amp_val.normalizeSum.postln;
	Out.ar(0, LPF.ar(Normalizer.ar(SinOsc.ar([harms], 0, [amp_val].postln), lev, dur), freq_cut))
}).send(s);
)

a = Synth(\triangle);

a = 200;
Array.series(4, a, a*2);
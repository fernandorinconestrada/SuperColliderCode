(
SynthDef(\ring5klow, { |bus = #[0,1,2,3], amp = 0.4, density = 1, ring = #[0,0,0,0,0,0,0,0], amps = #[0,0,0,0,0,0,0,0], decs = #[0,0,0,0,0,0,0,0], ringlow = #[0,0,0,0,0,0,0,0], ampslow = #[0,0,0,0,0,0,0,0], decslow = #[0,0,0,0,0,0,0,0], maxDel = 0.2, delTime = 0.2, decTime = 1, ampFilt = 0.8, freq_dec = 0.01, freq_declow = 0.2|
	var out, in, filter, dec, mod, declow;
	in = Dust.ar(density);
	dec = SinOsc.kr(freq_dec).range(0.23, 0.79);
	mod = SinOsc.kr(0.06).range(0, 0.6);
	declow = SinOsc.kr(freq_declow).range(0.17, 0.67);
	out = DynKlank.ar(`[ring, amps, decs], in, decayscale: dec) + DynKlank.ar(`[ringlow, ampslow*mod, decslow], in, decayscale: declow);
	filter = AllpassC.ar(out, maxDel, delTime, decTime, ampFilt);
	OffsetOut.ar(bus, LPF.ar(filter, 20000, amp))
}).load(s);
)
(
~ring6 = { |fund ... harms| fund * harms }.value( 82.41 ,61,67,71,73,79,83,89,97 );
~amps6 = { |sum ... parts| sum / parts }.value(1, 5,2,3,5,7,11,13,17).normalizeSum;
~decs6 = { |sum ... parts| sum / parts }.value(2, 17,19,23,29,31,37,41,43).reverse.range(0.5, 1.5);


~ring5 = { |fund ... harms| fund * harms }.value( 110 ,47,53,59,61,67,71,73,79 );
~amps5 = { |sum ... parts| sum / parts }.value(1, 5,2,3,5,7,11,13,17).normalizeSum;
~decs5 = { |sum ... parts| sum / parts }.value(2, 17,19,23,29,31,37,41,43).reverse.range(0.5, 1.5);

~rlow = { |fund ... harms| fund * harms }.value(82.41, 1,2,3,5,7,9,23,31);
~alow = { |sum ... parts| sum / parts }.value(1, 2,3,5,7,11,13,17,19).reverse.normalizeSum;
~dlow = { |sum ... parts| sum / parts }.value(2, 17,19,23,29,31,37,41,43).reverse.range(0.5, 1.5);

~rlow5 = { |fund ... harms| fund * harms }.value(110, 1,2,3,5,7,9,23,31);
~alow5 = { |sum ... parts| sum / parts }.value(1, 2,3,5,7,11,13,17,19).reverse.normalizeSum;
~dlow5 = { |sum ... parts| sum / parts }.value(2, 17,19,23,29,31,37,41,43).reverse.range(0.5, 1.5);
)

a = Synth(\ring5klow, [\ring, ~ring6, \amps, ~amps6, \decs, ~decs6, \ringlow, ~rlow, \ampslow, ~alow, \decslow, ~dlow, \bus, [30, 28, 26, 24], \amp, 0.1]);
a.set(\amp, 0.2);
a.trace(10);
a.set(\density, 4);
a.free;

b = Synth(\ring5klow, [\ring, ~ring5, \amps, ~amps5, \decs, ~decs5,\freq_dec, 0.02, \ringlow, ~rlow5, \ampslow, ~alow5, \decslow5, ~dlow5, \bus, [0, 2, 4, 6], \amp, 0.1]);
b.set(\amp, 0.2);
b.set(\density, 4);
b.free;

s.s
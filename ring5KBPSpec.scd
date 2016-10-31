(
SynthDef(\ring5k, { |bus = 0, amp = 0.4, density = 1, ring = #[0,0,0,0,0,0,0,0], amps = #[0,0,0,0,0,0,0,0], decs = #[0,0,0,0,0,0,0,0], maxDel = 0.2, delTime = 0.2, decTime = 1, ampFilt = 0.8, freq_dec = 0.01|
	var out, in, filter, dec;
	in = Dust.ar(density);
	dec = SinOsc.kr(freq_dec).range(0.23, 0.91);
	out = DynKlank.ar(`[ring, amps, decs], in, decayscale: dec);
	filter = AllpassC.ar(out, maxDel, delTime, decTime, ampFilt);
	OffsetOut.ar(bus, LPF.ar(filter, 20000, amp))
}).load(s);
)
(
~ring6 = { |fund ... harms| fund * (3**(harms/13)) }.value( 55, 52,54, 56, 58, 60, 62,64,66);
~amps6 = { |sum ... parts| sum / parts }.value(1, 5,2,3,5,7,11,13,17).normalizeSum;
~decs6 = { |sum ... parts| sum / parts }.value(2, 17,19,23,29,31,37,41,43).reverse.range(0.5, 1.5);


~ring5 = { |fund ... harms| fund * (3**(harms/13)) }.value( 55, 49,52,55,58,61,63,65,67, );
~amps5 = { |sum ... parts| sum / parts }.value(1, 5,2,3,5,7,11,13,17).normalizeSum;
~decs5 = { |sum ... parts| sum / parts }.value(2, 17,19,23,29,31,37,41,43).reverse.range(0.5, 1.5);
)

a = Synth(\ring5k, [\ring, ~ring6, \amps, ~amps6, \decs, ~decs6, \bus, 1]);
a.set(\amp, 0.2);
a.set(\density, 4);
a.free;

b = Synth(\ring5k, [\ring, ~ring5, \amps, ~amps6, \decs, ~decs6, \bus, 0, \freq_dec, 0.02]);
b.set(\amp, 0.3);
b.set(\density, 4);
b.free;

s.scope;
s.prepareForRecord("/Users/fernandorincon/Documents/UCSB/Quals/TakeHomeComp/chordRasgado/potlid/renderPotlid2.aiff");
s.record;
s.stop;
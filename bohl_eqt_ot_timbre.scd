s = Server.local.makeGui;

(
var vc_iv, vc_iii, vc_ii, vc_i, vc_iv_bohl, vc_iii_bohl, vc_ii_bohl, vc_i_bohl, vc_iv_eqt, vc_iii_eqt, vc_ii_eqt, vc_i_eqt, vc_iv_ot, vc_iii_ot, vc_ii_ot, vc_i_ot, sect_ot_bohl_1, sect_ot_bohl_2, sect_ot_bohl_3, sect_ot_bohl_4, sect_ot_bohl_5, sect_ot_bohl_6, sect_ot_bohl_7, sect_ot_bohl_8, sect_ot_bohl_9, sect_ot_bohl_10, sect_eqt_bohl_1, sect_eqt_bohl_2, sect_eqt_bohl_3, sect_eqt_bohl_4, sect_eqt_bohl_5, sect_eqt_bohl_6, sect_eqt_bohl_7, sect_eqt_bohl_8, sect_eqt_bohl_9, sect_eqt_bohl_10, sect_ot_eqt_1, sect_ot_eqt_2, sect_ot_eqt_3, sect_ot_eqt_4, sect_ot_eqt_5, sect_ot_eqt_6, sect_ot_eqt_7, sect_ot_eqt_8, sect_ot_eqt_9, sect_ot_eqt_10 ;
vc_iv  = 65.41;
vc_iii = 98.0;
vc_ii  = 146.83;
vc_i   = 220.0;
vc_iv_bohl  = Array.fill(29, { |deg| vc_iv  * (3**(deg/13)) }).postln;
vc_iii_bohl = Array.fill(29, { |deg| vc_iii * (3**(deg/13)) }).postln;
vc_ii_bohl  = Array.fill(29, { |deg| vc_ii  * (3**(deg/13)) }).postln;
vc_i_bohl   = Array.fill(29, { |deg| vc_i   * (3**(deg/13)) }).postln;
vc_iv_eqt   = Array.fill(29, { |deg| vc_iv  * (2**(deg/12)) }).postln;
vc_iii_eqt  = Array.fill(29, { |deg| vc_iii * (2**(deg/12)) }).postln;
vc_ii_eqt   = Array.fill(29, { |deg| vc_ii  * (2**(deg/12)) }).postln;
vc_i_eqt    = Array.fill(29, { |deg| vc_i   * (2**(deg/12)) }).postln;
vc_iv_ot    = Array.series(29, vc_iv, vc_iv ).postln;
vc_iii_ot   = Array.series(29, vc_iii, vc_iii).postln;
vc_ii_ot    = Array.series(29, vc_ii, vc_ii ).postln;
vc_i_ot     = Array.series(29, vc_i, vc_i ).postln;
sect_ot_bohl_10 = sect(vc_iv_ot, vc_iv_bohl).postln;//match fifths
sect_ot_bohl_9 = sect(vc_iv_ot, vc_iii_bohl).postln;
sect_ot_bohl_8 = sect(vc_iv_ot, vc_ii_bohl).postln;
sect_ot_bohl_7 = sect(vc_iv_ot, vc_i_bohl).postln;
sect_ot_bohl_6 = sect(vc_iii_ot, vc_iii_bohl).postln;//match fifths
sect_ot_bohl_5 = sect(vc_iii_ot, vc_ii_bohl).postln;
sect_ot_bohl_4 = sect(vc_iii_ot, vc_i_bohl).postln;
sect_ot_bohl_3 = sect(vc_ii_ot, vc_ii_bohl).postln;//match fifths
sect_ot_bohl_2 = sect(vc_ii_ot, vc_i_bohl).postln;
sect_ot_bohl_1 = sect(vc_i_ot, vc_i_bohl).postln;//match fifths
sect_ot_eqt_10 = sect(vc_iv_ot, vc_iv_eqt).postln;//match octaves
sect_ot_eqt_9 = sect(vc_iv_ot, vc_iii_eqt).postln;
sect_ot_eqt_8 = sect(vc_iv_ot, vc_ii_eqt).postln;
sect_ot_eqt_7 = sect(vc_iv_ot, vc_i_eqt).postln;
sect_ot_eqt_6 = sect(vc_iii_ot, vc_iii_eqt).postln;//match octaves
sect_ot_eqt_5 = sect(vc_iii_ot, vc_ii_eqt).postln;
sect_ot_eqt_4 = sect(vc_iii_ot, vc_i_eqt).postln;
sect_ot_eqt_3 = sect(vc_ii_ot, vc_ii_eqt).postln;//match octaves
sect_ot_eqt_2 = sect(vc_ii_ot, vc_i_eqt).postln;
sect_ot_eqt_1 = sect(vc_i_ot, vc_i_eqt).postln;//match octaves
sect_eqt_bohl_10 = sect(vc_iv_eqt, vc_iv_bohl).postln;
sect_eqt_bohl_9 = sect(vc_iv_eqt, vc_iii_bohl).postln;
sect_eqt_bohl_8 = sect(vc_iv_eqt, vc_ii_bohl).postln;
sect_eqt_bohl_7 = sect(vc_iv_eqt, vc_i_bohl).postln;
sect_eqt_bohl_6 = sect(vc_iii_eqt, vc_iii_bohl).postln;
sect_eqt_bohl_5 = sect(vc_iii_eqt, vc_ii_bohl).postln;
sect_eqt_bohl_4 = sect(vc_iii_eqt, vc_i_bohl).postln;
sect_eqt_bohl_3 = sect(vc_ii_eqt, vc_ii_bohl).postln;
sect_eqt_bohl_2 = sect(vc_ii_eqt, vc_i_bohl).postln;
sect_eqt_bohl_1 = sect(vc_i_eqt, vc_i_bohl).postln;
)

a = Array.series(29, 0.01, 0.0035);
a.reverse;
b = Array.fill(29, { |deg| 98 * (3**(deg/13)) });
c = Array.series(29, 98, 98);
g = Array.fill(29, { |deg| 98 * (2**(deg/12)) });

d = { Out.ar(0, Impulsar.ar([b],[a])) }.play;
d.free;
e = { Out.ar(0, Impulsar.ar([c],[a])) }.play;
e.free;
h = { Out.ar(0, Impulsar.ar([g],[a])) }.play;
h.free;


(
SynthDef(\grainspec, { |dur = 0.04, rel = 0.5|
	var env;
	env = EnvGen.kr(Env.perc(dur, rel));
	Out.ar(0, SinOsc.ar([g], 0, [a]) * env);
}).load(s);
)
x = Synth(\grainspec);

(
SynthDef(\grinbohl, {
	Out.ar(0, GrainIn.ar(2, Impulse.kr(0.4), 0.1, SinOsc.ar([b], 0, [a])))
}).load(s);
)

(
SynthDef(\grainfreq, { |freq = 1, den = 0.5|
	Out.ar(0, DynKlank.ar(`[c, a, nil], Impulse.ar(den), freq));
}).load(s);
)
z = Synth(\grainfreq, [\freq, 2]);
z.free;
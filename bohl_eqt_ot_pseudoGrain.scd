(
SynthDef(\bohl_eqt_ot_klank, { |reps = 0.2, mult = 0.2|
    var freqs, rings, amp, signal;
    freqs = Control.names([\freqs]).kr([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);
	amp = Control.names([\amp]).kr([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);
	rings = Control.names([\rings]).kr([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]);
    signal = DynKlank.ar(`[freqs, amp, rings ], Impulse.ar(reps, 0, mult));
	Out.ar(0, LPF.ar(signal, 20000));
}).load(s);
)

(
SynthDef(\bohl_eqt_ot_sin, { |freq 0.5, width = 0.2, mult = 0.2|
    var freqs, amp, signal;
	freqs = Control.names([\freqs]).kr([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	amp = Control.names([\amp]).kr([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	signal = SinOsc.ar( [freqs],0, [amp]);
	//env = EnvGen.kr(Env.perc, 1);
	Out.ar(0, LPF.ar(signal, 20000) * Pulse.ar(freq, width, mult));
}).load(s);
)

(
SynthDef(\bohl_eqt_ot_sinenv, { |freq_env 0.5, mult = 0.2|
    var freqs, amp, signal, env;
	freqs = Control.names([\freqs]).kr([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	amp = Control.names([\amp]).kr([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	signal = SinOsc.ar( [freqs],0, [amp]);
	env = EnvGen.kr(Env.perc, SinOsc.kr(freq_env, 0, mult));
	Out.ar(0, LPF.ar(signal, 20000) * env);
}).load(s);
)
a = Synth(\bohl_eqt_ot_sinenv);
b = Synth(\bohl_eqt_ot_sinenv)
b.set(\freq_env, 3);

(
SynthDef(\bohl_eqt_ot_singrain, {
    var freqs, amp, dur, signal;
	freqs = Control.names([\freqs]).kr([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	amp = Control.names([\amp]).kr([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	dur = Control.names([\dur]).kr([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
	signal = PSinGrain.ar( [freqs], [dur], [amp]);
	//env = EnvGen.kr(Env.perc, 1);
	Out.ar(0, LPF.ar(signal, 20000));
}).load(s);
)
a = Synth(\bohl_eqt_ot_sin);
b = Synth(\bohl_eqt_ot_sin);
a.free;
b.free;
a.setn(\freqs, Array.fill(29, { |deg| 98 * (3**(deg/13)) }).postln );
b.setn(\freqs, Array.fill(29, { |deg| 98 * (3**(deg/13)) }).postln );
a.setn(\freqs, Array.fill(29, { |deg| 98 * (2**(deg/12)) }) );
a.setn(\freqs, Array.series(29, 98, 98) );
a.setn(\amp,  Array.series(29, 0.01, 0.05).reverse);
b.setn(\amp,  Array.series(29, 0.01, 0.05).reverse);
a.setn(\rings,  Array.series(29, 0.01, 0.05));
a.set(\mult, 0.03, \width, 0.8, \freq, 8);

b.setn(\freqs, Array.fill(29, { |deg| 220 * (2**(deg/12)) }) );
b.setn(\freqs, Array.series(29, 98, 98) );
b.setn(\amp,  Array.series(29, 0.01, 0.05).reverse);

b.set(\mult, 0.003, \width, 0.1, \freq, 7);

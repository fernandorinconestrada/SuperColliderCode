(

SynthDef(\test_chain, { arg freq, out, grain_freq, dur, max_del, del_time, decay, density;
	Out.ar(out,
		CombC.ar(SinGrain.ar(Impulse.ar(freq, 0, 1.5), dur, grain_freq), max_del, del_time, decay, Dust.ar(density)));
}).add;

SynthDef(\delay, {arg out, freqscale, freqoffset, decayscale, freq_fil_1, freq_fil_2, freq_fil_3, freq_fil_4;
	var in_del;
	in_del = In.ar(out, 1);
	Out.ar(out,
		DynKlank.ar(`[[freq_fil_1, freq_fil_2, freq_fil_3, freq_fil_4], nil, [1, 1, 1, 1]], in_del, freqscale, freqoffset, decayscale));
}).add;

)

a = Synth(\test_chain, [\out, 1, \freq, 3, \grain_freq, 220, \dur, 0.05, \max_del, 0.5, \del_time, 0.5, \decay, 2, \density, 500]);
a.free;
b = Synth.after(a, \delay, [\out, 1, \freq_fil_1, 300, \freq_fil_2, 400, \freq_fil_3, 700, \freq_fil_4, 1100, \freqscale, 1, \freqoffset, 0, \decayscale, 1]);
b.run(false);
b.run(true);
b.free;
c = Synth(\test_chain, [\out, 1, \freq, 0.07, \grain_freq, 222, \dur, 0.1, \max_del, 0.5, \del_time, 0.7, \decay, 3, \density, 400]);
c.free;
d = Synth.after(c, \delay, [\out, 1, \freq_fil_1, 400, \freq_fil_2, 700, \freq_fil_3, 1300, \freq_fil_4, 1700,\freqscale, 1, \freqoffset, 0, \decayscale, 1]);
d.run(false);
d.run(true);

e = Synth(\test_chain, [\out, 3, \freq, 0.1, \grain_freq, 230, \dur, 0.07, \max_del, 0.5, \del_time, 0.5, \decay, 2.3, \density, 1300]);
e.free;
f = Synth.after(e, \delay, [\out, 3, \freq_fil_1, 700, \freq_fil_2, 1300, \freq_fil_3, 1900, \freq_fil_4, 2300,\freqscale, 1, \freqoffset, 0, \decayscale, 1]);
//b = Synth(\delay, [\out, 0, \freqscale, 1, \freqoffset, 0, \decayscale, 1]);
f.run(false);
f.run(true);

{CombC.ar(SinGrain.ar(Impulse.ar(0.5), 0.3, 3000), 0.3, 0.3, 2, Dust.ar(50))}.play;
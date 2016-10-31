(
SynthDef(\ifstateKlang, { |freq = 3, dur = 0.1, freq_pitch0 = #[1,1,1,1,1,1], freq_pitch1= #[1,1,1,1,1,1], amps0= #[0.1,0.1,0.1,0.1,0.1,0.1], rings0= #[1,1,1,1,1,1], amps1= #[0.1,0.1,0.1,0.1,0.1,0.1], rings1= #[1,1,1,1,1,1], beat0 = 0.2, beat1 = 0.5, bus = #[0, 1], max_del = 0.2, del_time = 0.1, dec_time = 0.5, cutoff = 20000, lowcut = 20, densImp = 4, ampDens = 0.1|
	var inst1, inst2, mult, in, in_del, lowpass, density;
	density = Dust.ar(densImp, ampDens);
	inst1 = DynKlank.ar(`[freq_pitch0, amps0, rings0], density)*FSinOsc.ar(beat0);
	inst2 = DynKlank.ar(`[freq_pitch1, amps1, rings1], density)*FSinOsc.ar(beat1);
	mult = Control.names(\mult).kr(0.1);
	in = Trig1.ar(Dust.ar(freq, 0.2), dur).lag(0.1).if(inst1, inst2);
	in_del = AllpassC.ar(in, max_del, del_time, dec_time);
	lowpass = LPF.ar(in_del, cutoff);
	Out.ar(bus, HPF.ar(lowpass, lowcut) * mult)
}).load(s);
)
(
~freq_pitch0 = Array.fill(6, { |deg| 411.975*(3**(deg/13)) });
~freq_pitch1 = Array.fill(6, { |deg| 494.473*(3**(deg/13)) });
~amps0 = Array.fill(6, {|amps| amps*0.04 + 0.1}).reverse;
~rings0 = Array.fill(6, { |ring| ring*0.2 + 0.1}).reverse;
~amps1 = Array.fill(6, {|amps| amps*0.04 + 0.1}).reverse;
~rings1 = Array.fill(6, { |ring| ring*0.2 + 0.1}).reverse;
)
~a = Synth(\ifstateKlang, [\freq_pitch0, ~freq_pitch0, \amps0, ~amps0, \rings0, ~rings0, \freq_pitch1, ~freq_pitch1, \amps1, ~amps1, \rings1, ~rings1]);
~a.set(\mult, 1.2);
~a.set(\ampDens, 0.01);
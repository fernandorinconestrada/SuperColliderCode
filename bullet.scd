(
SynthDef(\bullet, { |density = 2, amp = 0.2, freq = 411.975, freq1 = 494.473, bus = 0, beat0 = 0.2, beat1 = 0.3, freq_dust = 2, max_del = 0.2, del_time = 0.2, dec_time = 2, cutoff = 20000, lowcut = 20, dur = 0.3, att_time = 0.05, rel_time = 2|
	var env, gate, harms, out, out1, amps, partial, in, in_del, lowpass, inst1, inst2;
	gate = Dust.ar(density, amp);
	env = EnvGen.ar(Env.perc(att_time, rel_time, curve: \sine), gate);
	partial = Control.names(\partial).kr(0.5);
	harms = Array.fill(6, { |deg| 1 * (3**(deg/13))});
	amps = Array.fill(6, { |amp| partial**amp }).normalizeSum;
	out = Mix.fill(6, FSinOsc.ar([freq * harms], 0, [amps]));
	out1 = Mix.fill(6, FSinOsc.ar([freq1 * harms], 0, [amps]));
	inst1 = out * FSinOsc.ar(beat0);
	inst2 = out1 * FSinOsc.ar(beat1);
	in = Trig1.ar(Dust.ar(freq_dust), dur).lag(0.2).if(inst1, inst2);
	in_del = AllpassC.ar(in, max_del, del_time, dec_time);
	lowpass = LPF.ar(in_del, cutoff);
	Out.ar([0,1], HPF.ar(lowpass, lowcut) * env)
}).load(s);
)
(
SynthDef(\pedals, { |freq = 411.975, bus = #[0,1]|
	var partial, harms, amps, mult, out;
	partial = Control.names(\partial).kr(0.02);
	mult = Control.names(\mult).kr(0.2);
	harms = Array.fill(6, { |deg| 1 * (3**(deg/13))});
	amps = Array.fill(6, { |amp| partial**amp }).normalizeSum;
	out = Mix.fill(6, FSinOsc.ar([freq * harms], 0, [amps]));
	Out.ar(bus, out * mult)
}).load(s);
)

a = Synth(\bullet, [\density, 1, \amp, 0.4, \partial, 0.6, \beat0, 0.3, \beat1, 1.1, \dur, 0.3, \freq_dust, 5, \max_del, 0.3, \del_time, 0.3, \dec_time, 3]);
a.set(\att_time, 0.01);
a.set(\density, 0.3, \amp, 0.3);
a.set(\partial, 0.4);
a.set(\beat0, 0.3, \beat1, 1.7);
a.set(\dur, 0.1);
a.set(\freq_dust, 20);
a.set(\max_del, 0.5, \del_time, 0.5);
a.set(\dec_time, 20);
b = Synth(\bullet, [\freq1, 494.473, \freq, 576.928]);
b.set(\density, 0.5, \partial, 0.4, \dur, 0.1);
b.set(\freq_dust, 1);
c = Synth(\bullet, [\freq1, 659.28, \freq, 576.928]);
c.set(\density, 1, \partial, 0.2, \dur, 0.2);
d = Synth(\pedals);
d.free;


//x = FreqScope.new;


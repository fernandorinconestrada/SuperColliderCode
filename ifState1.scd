(
SynthDef(\ifstate1, { |freq = 3, dur = 0.1, freq_pitch0 = 440, freq_pitch1= 441, beat0 = 0.2, beat1 = 0.5, bus = #[0, 1], max_del = 0.2, del_time = 0.1, dec_time = 0.5, cutoff = 20000, lowcut = 20|
	var inst1, inst2, mult, in, in_del, lowpass;
	inst1 = FSinOsc.ar(freq_pitch0) * FSinOsc.ar(beat0);
	inst2 = FSinOsc.ar(freq_pitch1) * FSinOsc.ar(beat1);
	mult = Control.names(\mult).kr(0.1);
	in = Trig1.ar(Dust.ar(freq), dur).lag(0.1).if(inst1, inst2);
	in_del = AllpassC.ar(in, max_del, del_time, dec_time);
	lowpass = LPF.ar(in_del, cutoff);
	Out.ar(bus, HPF.ar(lowpass, lowcut) * mult)
}).load(s);
)
(
SynthDef(\pedalHarms, { |pedFreq, pha = 0, amp = 0.01, bus #[0,1]|
	Out.ar(bus, FSinOsc.ar(pedFreq, pha, amp))
}).load(s);
)

x = FreqScope.new;

a = Synth(\ifstate1, [\freq_pitch0, 494.473, \freq_pitch1, 576.928, \bus, [0,1], \mult, 0.03, \dur, 0.2]);//septimal minor third string 6
a.set(\dur, 0.1);
a.set(\beat0, 0.2, \beat1, 0.3);
a.set(\mult, 0.02);
a.set(\dec_time, 2);
a.free;

b = Synth(\ifstate1, [\freq_pitch0, 411.975, \freq_pitch1, 494.473, \bus, [0,1], \mult, 0.03, \dur, 0.2]);//just minor third
b.set(\dur, 0.2);
b.set(\beat0, 1.1, \beat1, 0.5);
b.set(\mult, 0.02);
b.set(\dec_time, 1);
b.free;

c = Synth(\pedalHarms, [\pedFreq, 494.73, \amp, 0.007]);
c.free;

d = Synth(\pedalHarms, [\pedFreq, 411.975, \amp, 0.007]);
d.free;

e = Synth(\pedalHarms, [\pedFreq, 576.928, \amp, 0.004]);
e.free;

f = Synth(\ifstate1, [\freq_pitch0, 770.077, \freq_pitch1, 660.017, \bus, [0,1], \mult, 0.03, \dur, 0.2]);//septimal minor third string 5
a.set(\dur, 0.1);
a.set(\beat0, 0.2, \beat1, 0.3);
a.set(\mult, 0.02);
a.set(\dec_time, 2);
a.free;

g = Synth(\ifstate1, [\freq_pitch0, 549.9, \freq_pitch1, 660.017, \bus, [0,1], \mult, 0.03, \dur, 0.2]);//just minor third
b.set(\dur, 0.2);
b.set(\beat0, 1.1, \beat1, 0.5);
b.set(\mult, 0.02);
b.set(\dec_time, 1);
b.free;

h = Synth(\pedalHarms, [\pedFreq, 549.9, \amp, 0.005]);
h.free;

i = Synth(\pedalHarms, [\pedFreq, 660.017, \amp, 0.007]);
i.free;

j = Synth(\pedalHarms, [\pedFreq, 770.077, \amp, 0.004]);
j.free;

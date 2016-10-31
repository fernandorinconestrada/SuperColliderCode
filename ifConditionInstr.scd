{ Trig1.ar(Dust.ar(3), 0.2).lag(0.1).if(FSinOsc.ar(440) * FSinOsc.ar(0.4), FSinOsc.ar(441) * FSinOsc.ar(0.5)) * 0.2 }.play;
{ Trig1.ar(Dust.ar(3), 0.2).lag(0.1).if(FSinOsc.ar(440.5) * FSinOsc.ar(0.4), FSinOsc.ar(439.5) * FSinOsc.ar(0.5)) * 0.2 }.play;

s = Server.local.makeGui;
s.scope;
(
SynthDef(\ifstate, { |freq = 3, dur = 0.1, freq_pitch0 = 440, freq_pitch1= 441, beat0 = 0.2, beat1 = 0.5, bus = #[0, 1], max_del = 0.2, del_time = 0.1, dec_time = 0.5, cutoff = 20000, lowcut = 20|
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

a = Synth(\ifstate, [\freq_pitch0, 55, \freq_pitch1, 55.1, \bus, [0,1], \mult, 0.03, \dur, 0.2]);//0
a.set(\dur, 0.1);
a.set(\beat0, 0.2, \beat1, 0.3);
a.set(\mult, 0.2);
a.set(\dec_time, 1);
a.free;

b = Synth(\ifstate, [\freq_pitch0, 8817.87, \freq_pitch1, 8982.69, \bus, [0,1], \mult, 0.03, \dur, 0.2]);//1
b.set(\dur, 0.08);
b.set(\freq, 1.3);
b.set(\beat0, 1.1, \beat1, 0.5);
b.set(\mult, 0.003);
b.set(\dec_time, 0.5);
b.free;

c = Synth(\ifstate, [\freq_pitch0, 8323.41, \freq_pitch1, 8488.23, \bus, [0,1], \mult, 0.05, \dur, 0.5]);//2
c.set(\dur, 0.05);
c.set(\freq, 1);
c.set(\beat0, 0.7, \beat1, 0.5);
c.set(\mult, 0.002);
c.set(\dec_time, 0.5);
c.free;

d = Synth(\ifstate, [\freq_pitch0, 660, \freq_pitch1, 1980, \bus, [0,1], \mult, 0.03, \dur, 0.2]);//3
d.set(\dur, 0.2);
d.set(\beat0, 0.5, \beat1, 0.2);
d.set(\mult, 0.004);
d.set(\dec_time, 0.3);
d.free;

e = Synth(\ifstate, [\freq_pitch0, 392.46, \freq_pitch1, 1177.4, \bus, [0,1], \mult, 0.05, \dur, 0.5]);//4
e.set(\dur, 0.2);
e.set(\beat0, 0.7, \beat1, 1.1);
e.set(\mult, 0.07);
e.free;

f = Synth(\ifstate, [\freq_pitch0, 588, \freq_pitch1, 1764, \bus, [0,1], \mult, 0.05, \dur, 0.3]);//5
f.set(\dur, 0.4);
f.set(\beat0, 2.1, \beat1, 0.5);
f.set(\mult, 0.02);
f.free;

g = Synth(\ifstate, [\freq_pitch0, 881.1, \freq_pitch1, 2643.3, \bus, [0,1], \mult, 0.03, \dur, 0.7]);//6
g.set(\dur, 0.3);
g.set(\beat0, 0.7, \beat1, 0.2);
g.set(\mult, 0.007);
g.set(\dec_time, 1);
g.free;

h = Synth(\ifstate, [\freq_pitch0, 59.85, \freq_pitch1, 59, \bus, [0,1], \mult, 0.03, \dur, 0.7]);//7
h.set(\dur, 0.5);
h.set(\beat0, 0.3, \beat1, 1.1);
h.set(\mult, 0.2);
h.free;

i = Synth(\ifstate, [\freq_pitch0, 65.1277, \freq_pitch1, 64.6, \bus, [0,1], \mult, 0.05, \dur, 0.7]);//8
i.set(\dur, 0.3);
i.set(\beat0, 0.3, \beat1, 0.7);
i.set(\mult, 0.2);
i.set(\dec_time, 5);
i.free;

j = Synth(\ifstate, [\freq_pitch0, 70.87, \freq_pitch1, 70, \bus, [0,1], \mult, 0.03, \dur, 0.7]);//9
j.set(\dur, 0.1);
j.set(\beat0, 0.3, \beat1, 0.2);
j.set(\mult, 0.2);
j.free

k = Synth(\ifstate, [\freq_pitch0, 146.8, \freq_pitch1, 146, \bus, [0,1], \mult, 0.05, \dur, 0.1]);//10
k.set(\dur, 0.5);
k.set(\beat0, 1.3, \beat1, 1.1);
k.set(\mult, 0.03);
k.free;

l = Synth(\ifstate, [\freq_pitch0, 165, \freq_pitch1, 165.7, \bus, [0,1], \mult, 0.03, \dur, 0.3]);//1
l.set(\dur, 0.08);
l.set(\beat0, 0.7, \beat1, 1.1);
l.set(\mult, 0.1);
l.free;

m = Synth(\ifstate, [\freq_pitch0, 130, \freq_pitch1, 130.82, \bus, [0,1], \mult, 0.03, \dur, 0.3]);//12
m.set(\dur, 0.07);
m.set(\beat0, 0.3, \beat1, 1.1);
m.set(\mult, 0.05);
m.set(\dec_time, 1);
m.free;

n = Synth(\ifstate, [\freq_pitch0, 196, \freq_pitch1, 195.5, \bus, [0,1], \mult, 0.03, \dur, 1.1]);//13
n.set(\dur, 0.5);
n.set(\beat0, 0.3, \beat1, 1.1);
n.set(\mult, 0.04);
n.free

o = Synth(\ifstate, [\freq_pitch0, 324.7, \freq_pitch1, 324.41, \bus, [0,1], \mult, 0.05, \dur, 0.1]);//14
o.set(\dur, 0.1);
o.set(\beat0, 1.3, \beat1, 1.1);
o.set(\mult, 0.07);
o.set(\dec_time, 1.2);
o.free;

p = Synth(\ifstate, [\freq_pitch0, 495, \freq_pitch1, 495.8, \bus, [0,1], \mult, 0.03, \dur, 0.3]);//15
p.set(\dur, 0.3);
p.set(\beat0, 0.3, \beat1, 1.1);
p.set(\mult, 0.07);
p.free

s = Server.local;
s.prepareForRecord("/Users/fernandorincon/Documents/UCSB/Quals/TakeHomeComp/IfState/PedMixDeg21_26.aiff");
s.record;
s.stopRecording;
s.scope;
x = FreqScope.new;
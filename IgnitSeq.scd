(
SynthDef(\guitIgnition, { |pluck, freq, pha = 0, amp = 0.5, max = 0.5, del = 0.5, dec = 1.5, ampFilt = 0.8|
	var out, env;
	env = EnvGen.kr(Env.perc(0.03, 1.2, curve: -8), Impulse.kr(pluck), doneAction:2);
	out = FSinOsc.ar(freq, pha, amp) * env;
	OffsetOut.ar(0, AllpassC.ar(out, max, del, dec, ampFilt))
}).load(s)
)

(
a = Pbind(\instrument, \guitIgnition, \freq, Prand([(82.41*7).postln, (146.83*4).postln, (196*3).postln], inf), \dur, Pfunc({0.07.rand +0.3}).poll, \amp, Pfunc({0.2.rand + 0.5}).poll).play;
)

(
b = Pbind(\instrument, \guitIgnition, \freq, Prand([(82.41*7).postln, (146.83*4).postln, (196*3).postln], inf), \dur, Pfunc({0.07.rand +0.3}).poll, \amp, Pfunc({0.2.rand + 0.5}).poll).play;
)


(
b = Pbind(\instrument, \guitIgnition, \freq, Prand([(82.41*7).postln, (146.83*4).postln, (196*3).postln], inf), \dur, Pfunc({0.07.rand +0.3}).poll, \amp, Pfunc({0.2.rand + 0.5}).poll).play;
)
a.stop;
b.stop;
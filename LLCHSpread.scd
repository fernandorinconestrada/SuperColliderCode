(
SynthDef(\LLCHSpread, { |busL = 0, busR = 2, gate = 0.5, freq = 330, fb = 0.4, amp = 0.2, maxDel = 0.2, delT = 0.0, decT = 0.5, ampDel = 0.8|
	var env, signal, delay;
	env = EnvGen.kr(Env.perc, Impulse.kr(gate));
	signal = SinOscFB.ar(freq, fb, amp) * env;
	delay = AllpassC.ar(signal, maxDel, SinOsc.kr(delT).range(0.0001, 0.08).poll, decT, ampDel);
	OffsetOut.ar(busL, signal);
	OffsetOut.ar(busR, delay);
}).add;
)

(
SynthDef(\LLCHSpreadFixed, { |busL = 0, busR = 2, gate = 0.5, freq = 330, fb = 0.4, amp = 0.2, maxDel = 0.2, delT = 0.0, decT = 0.5, ampDel = 0.75|
	var env, signal, delay;
	env = EnvGen.kr(Env.perc, Impulse.kr(gate));
	signal = SinOscFB.ar(freq, fb, amp) * env;
	delay = AllpassC.ar(signal, maxDel, delT, decT, ampDel);
	OffsetOut.ar(busL, signal);
	OffsetOut.ar(busR, delay);
}).add;
)

(
SynthDef(\LLCHSpreadFixed, { |busL = 0, busR = 2, gate = 0.5, freq = 330, fb = 0.4, amp = 0.2, maxDel = 0.2, delT = 0.0, decT = 0.5, ampDel = 0.75|
	var env, signal, delay;
	env = EnvGen.kr(Env.perc, Impulse.kr(gate));
	signal = SinOscFB.ar(freq, fb, amp) * env;
	delay = AllpassC.ar(signal, maxDel, delT, decT, ampDel);
	OffsetOut.ar(busL, signal);
	OffsetOut.ar(busR, delay);
}).add;
)

a = Synth(\LLCHSpread, [\delT, 0.02, \busL, 2, \busR, 4]);
a.set(\gate, 10);
d.free;
a.set(\amp, 0.1);
b = Synth(\LLCHSpread, [\delT, 0.02, \busL, 1, \busR, 5, \gate, 11, \freq, 331, \amp, 0.1]);
c = Synth(\LLCHSpread, [\delT, 0.02, \busL, 3, \busR, 7, \gate, 13, \freq, 55, \amp, 0.05]);
d = Synth(\LLCHSpread, [\delT, 0.023, \busL, 4, \busR, 6, \gate, 19, \freq, 1760, \amp, 0.01]);


b.set(\freq, 660, \amp, 0.05, \gate, 17);
b = Synth(\LLCHSpreadFixed);
c = Synth(\LLCHSpreadFixed, [\busL, 3, \busR, 7]);
c.set(\freq, 440);
c.set(\delT, 0.03);
c.set(\gate, 0.4);
a.set(\busR, 7);
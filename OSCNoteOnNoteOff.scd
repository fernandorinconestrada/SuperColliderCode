{
	var mic = SoundIn.ar(8, 1),
	amplitude = Amplitude.kr(mic),
	gate = SendTrig.kr( (gate-gate) > 0, 0, 1.0);
	SinOsc.ar(440, 0, 0.3) * EnvGen.ar(Env.perc, gate);
}.play;

(
SynthDef(\testOSC, { | amp = 0.7, gate = 0|
	var env, output;
	env = EnvGen.ar(Env.asr, gate.poll);
	output = SinOsc.ar(440, 0, amp) * env;
	Out.ar(0, output);
}).add;
)

a = Synth(\testOSC);
a.set(\gate, 0.1);
a.set(\gate, 0);
(
OSCdef(\in, {|msg, time, addr, recvPort| e = time; d = msg[1]; a.set(\gate, ~reset.value);}, "/ampFilt1", nil, 57121);
~reset = { ~values = if ((d = d++ , {d = 1}, {d = 0}) };
)
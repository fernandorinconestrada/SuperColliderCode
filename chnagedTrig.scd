(
{ |in|
	if(Trig.kr(in), SinOscFB.ar(200, 0.2, 0.1))
}.play
);
(
SynthDef(\testTrig, { |gate, freq|
	var env, key;
	//key = KeyState.kr(0, 0, 1, 0.02);
	env = EnvGen.ar(Env.adsr(0.1, 0.3, 0.7, 1), ToggleFF.kr(Changed.kr(gate)), LFNoise2.kr(3, 0.2, 0.1));
	OffsetOut.ar(0, SinOscFB.ar(LFNoise2.kr(4, 1.05, freq), LFNoise2.kr(4, 0.6, 0.4), env));
}).add;
)

a = Synth(\testTrig);
(
OSCdef(\freq,    {|msg, time, addr, recvPort| a.set(\freq,  ((msg[1] * 150) + 150).postln)}, "/gate_freq/multixy1/1", nil, 57121);
OSCdef(\gate,    {|msg, time, addr, recvPort| a.set(\gate,  (msg[1] * 0.01).postln)}, "/gate_freq/multixy1/1", nil, 57121);
)

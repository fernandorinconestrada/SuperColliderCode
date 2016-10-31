
(
SynthDef(\blip_trig, {arg freq = 220, t_trig = 1, harm = 20, mul = 0.3, input, trig;
	var filter, amp, ring;
	filter = MouseX.kr(80, 600);
	amp = TRand.kr(0.01, 0.6, trig);
	ring = TRand.kr(0, 1, Impulse.kr(10));
	Out.ar(0,
		DynKlank.ar(`[[filter, filter*7, filter*13, filter*19],[amp, amp, amp, amp],[ring, ring, ring, ring]], Impulse.ar(input)));
}).send(s);
)
x = Synth(\blip_trig);
y = Synth(\blip_trig);
(
OSCdef(\trigger_1, {|msg, time, addr, recvPort| x.set(\input, msg[1]/msg[1])},"/circle", nil, 57130);
OSCdef(\trigger_2, {|msg, time, addr, recvPort| x.set(\trig, msg[1]/msg[1])},"/circle", nil, 57130);
OSCdef(\trigger_3, {|msg, time, addr, recvPort| y.set(\input, msg[1]/msg[1])},"/circle_1", nil, 57130);
OSCdef(\trigger_4, {|msg, time, addr, recvPort| y.set(\trig, msg[1]/msg[1])},"/circle_1", nil, 57130);
)

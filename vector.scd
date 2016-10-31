(
OSCdef(\test1, {|msg, time, addr, recvPort| b.set(\freq, ([msg[1]*300, msg[2]*400, msg[3]*1200]).postln)}, "/gyrosc/gyrosc/gyro/gyro", nil, 8009);
)
(
SynthDef(\vector, { |freq = #[1,1,1]|
	Out.ar(0, FSinOsc.ar(freq, 0, [0.1, 0.1, 0.1]))
}).send(s);
)
b = Synth(\vector);


(
OSCdef(\test1, {|msg, time, addr, recvPort| ([msg[1], msg[2], msg[3]]).postln}, "/gyrosc/gyrosc/gyro/gyro", nil, 8009);
)
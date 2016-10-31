(
SynthDef(\testEnv, { |freq1 = 440, amp1, freq2 = 440, amp2|
	Out.ar(0, (FSinOsc.ar(freq1, 0, amp1.lag(0.1))*FSinOsc.ar(freq2, 0, amp2.lag(0.1))));
}).load(s);
)

f = Synth(\testEnv);
(
OSCdef(\freq, {|msg, time, addr, recvPort| f.set(\freq1, (((msg[1] + 1.56) * 0.32) * 200 + 50).postln)}, "/1/joint/l_hand", nil, 8008);
OSCdef(\freq2, {|msg, time, addr, recvPort| f.set(\freq2, (((msg[2] + 3.1) * 0.1587) * 1000+ 50).postln)}, "/gyrosc/gyro", nil, 8008);
//OSCdef(\freq1, {|msg, time, addr, recvPort| f.set(\freq1, (((msg[3] + 3.15) * 0.1587) * 200 + 50).postln)}, "/gyrosc/gyro", nil, 8008);
OSCdef(\amp1, {|msg, time, addr, recvPort| f.set(\amp1, (msg[1].abs * 0.3).postln)}, "/gyrosc/accel", nil, 8008);
OSCdef(\amp2, {|msg, time, addr, recvPort| f.set(\amp2, (msg[1].abs * 0.3).postln)}, "/gyrosc/accel", nil, 8008);
)
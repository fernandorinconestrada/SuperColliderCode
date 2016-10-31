(
SynthDef(\timOSC_A, { |freq = 600, numharm = 50, amp = 0.01, density 10, ampG = 0.01, maxDel = 0.2, delT = 0.01, decT = 0.3, ampFilt = 0.2|
	var in, gate, env;
	gate = Impulse.kr(density, 0, ampG);
	env = EnvGen.kr(Env.perc, gate);
	in = Blip.ar(freq, numharm.lag(0.1), amp) * env;
	Out.ar(0, AllpassC.ar(in, maxDel, delT, decT, ampFilt));
}).send(s);
)

a = Synth(\timOSC_A);
(
OSCdef(\freq, {|msg, time, addr, recvPort| a.set(\freq, (msg[2].abs.range(0,1000)+50).postln)}, "/gyrosc/gyro", nil, 8008);
OSCdef(\numharm, {|msg, time, addr, recvPort| a.set(\numharm, msg[3].abs.range(0,100).postln)}, "/gyrosc/gyro", nil, 8008);
OSCdef(\amp, {|msg, time, addr, recvPort| a.set(\amp, msg[1].abs.range(0,0.5).postln)}, "/gyrosc/gyro", nil, 8008);
OSCdef(\density, {|msg, time, addr, recvPort| a.set(\density, msg[1].abs.range(1,20).postln)}, "/gyrosc/accel", nil, 8008);
OSCdef(\ampG, {|msg, time, addr, recvPort| a.set(\numharm, msg[2].abs.range(0,0.5).postln)}, "/gyrosc/accel", nil, 8008);
OSCdef(\ampFilt, {|msg, time, addr, recvPort| a.set(\ampFilt, msg[3].abs.range(0,0.7).postln)}, "/gyrosc/accel", nil, 8008);
OSCdef(\delT, {|msg, time, addr, recvPort| a.set(\delT, msg[1].abs.range(0,0.5).postln)}, "/gyrosc/rrate", nil, 8008);
OSCdef(\decT, {|msg, time, addr, recvPort| a.set(\decT, msg[2].abs.range(0, 1.8).postln)}, "/gyrosc/rrate", nil, 8008);
)
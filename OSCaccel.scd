(
SynthDef(\accel, { |freq=200, dens = 0.1, numharm = 5, ampFreq = 2|
	var in, amp, rx, ry, rz, filter, env;
	rx = NamedControl.kr(\rx);
	ry = NamedControl.kr(\ry);
	rz = NamedControl.kr(\rz);
	env = SinOsc.kr(ampFreq);
	amp = (rx +ry + rz);
	in = Blip.ar(freq, numharm, amp.range(0, 0.5).poll) * EnvGen.kr(Env.perc, Dust.kr(amp.range(0,3)));
	filter = LPF.ar(in, 21000);
	OffsetOut.ar([0,1], AllpassC.ar(filter, 0.2, amp.range(0,0.2), amp.range(0, 1)) * env)
}).load(s);
)


a = Synth(\accel);

(
w = OSCdef(\trig, {|msg, time, addr, recvPort| a.set(\freq, msg[1].abs.range(60, 120).postln, \dens, msg[2].abs.range(0.1, 20).postln, \numharm, msg[3].abs.range(0, 1000).postln)}, "/1/joint/l_hand", nil, 8008);
x = OSCdef(\amp, {|msg, time, addr, recvPort| a.set(\rx, msg[1].postln, \ry, msg[2].postln,\rz, msg[3].postln)}, "/1/joint/r_hand", nil, 8008);
)
a.set(a\ampFreq, 0.2);
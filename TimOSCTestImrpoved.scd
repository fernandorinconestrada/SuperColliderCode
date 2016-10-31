(
SynthDef(\timOSC_B, { |freq = 600, numharm = 50, amp = 0.1, density 10, ampG = 0.1, maxDel = 0.2, delT = 0.01, decT = 0.3, ampFilt = 0.2, freqEnv = 2|
	var in, gate, env, envGlob, totalAmp;
	totalAmp = MouseX.kr(0.01, 0.4, lag: 0.2);
	gate = Impulse.kr(density, 0, ampG);
	env = EnvGen.kr(Env.perc, gate);
	in = Blip.ar(freq, numharm.lag(0.2), amp.lag(0.2)) * ( env * SinOsc.ar(freqEnv, 0, 0.3));
	Out.ar(1, AllpassC.ar(in, maxDel, delT, decT, ampFilt)* totalAmp);
}).load(s);
)
a.free;
a = Synth(\timOSC_B);
(
OSCdef(\freq, {|msg, time, addr, recvPort| a.set(\freq, (msg[2].abs.range(0,1700)+25).postln)}, "/1/joint/l_hand", nil, 8008);
OSCdef(\numharm, {|msg, time, addr, recvPort| a.set(\numharm, msg[3].abs.range(0,20).postln)}, "/1/joint/l_hand", nil, 8008);
OSCdef(\amp, {|msg, time, addr, recvPort| a.set(\amp, msg[1].abs.range(0,0.5).postln)}, "/1/joint/l_hand", nil, 8008);
OSCdef(\density, {|msg, time, addr, recvPort| a.set(\density, msg[1].abs.range(0,9).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\ampG, {|msg, time, addr, recvPort| a.set(\ampG, msg[2].abs.range(0,0.5).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\ampFilt, {|msg, time, addr, recvPort| a.set(\ampFilt, msg[3].abs.range(0,0.5).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\delT, {|msg, time, addr, recvPort| a.set(\delT, msg[1].abs.range(0,0.3).postln)}, "/1/joint/head", nil, 8008);
OSCdef(\decT, {|msg, time, addr, recvPort| a.set(\decT, msg[2].abs.range(0, 0.6).postln)}, "/1/joint/head", nil, 8008);
OSCdef(\freqEnv, {|msg, time, addr, recvPort| a.set(\freqEnv, msg[3].abs.range(0, 3).postln)}, "/1/joint/head", nil, 8008);
)
s = Server.local.makeGui;
a.free;
/*
head - ranges?
torso -
neck -
hip - left and right

shoulder - left and right
elbows - left and right
knees - left and right

hands - left and right
foot - left and right

/joint/xxxxx
/joint/l_xxxx
/joint/r_xxxx

*/
~x = 0.0;
~y = 0.0;
~z = 0.0;
(
SynthDef(\timOSC, { |freq = 600, numharm, amp, ampIn = 0.8, freqAm = 0.2, ampAM = 0.8, ampGate, freqGate|
	var in, gate, env, maxDel, delT, decT, allAmp;
	delT = MouseY.kr(0.001, 0.2);
	maxDel = MouseY.kr(0.001, 0.2);
	decT = MouseX.kr(0.011, 2);
	gate = Impulse.kr(freqGate, 0, ampGate);
	allAmp = MouseX.kr(0,1);
	env = EnvGen.kr(Env.perc, gate);
	in = Blip.ar(freq, numharm.lag(0.1), amp);
	Out.ar(0, (((AllpassC.ar(in, maxDel, delT, decT, ampIn) * SinOsc.ar(freqAm, mul: ampAM))) * env) * allAmp)
}).send(s);
)

OSCdef(\message1, {|msg, time, addr, recvPort| msg[1].postln}, "gyrosc/gyro",nil, 8008)
b = Synth(\timOSC);
b.free;
(
OSCdef(\freq, {|msg, time, addr, recvPort| b.set(\freq, ((msg[2]*900)+50).postln)}, "gyrosc/gyro", nil, 8008);
OSCdef(\decT, {|msg, time, addr, recvPort| b.set(\decT, ((msg[1].range(0,1)*1.2)+0.2).postln)}, "1/joint/r_foot", nil, 8008);
~m2 = OSCdef(\freqAm, {|msg, time, addr, recvPort| b.set(\freqAm, ((msg[2].range(0,1)*(-5))+13).postln)}, "1/joint/r_hand", nil, 8008);
OSCdef(\numharm, {|msg, time, addr, recvPort| a = (msg[2].range(0,1)*50); c = (50**(a/50)); b.set(\numharm, c.postln)}, "1/joint/l_hand", nil, 8008);
OSCdef(\amp, {|msg, time, addr, recvPort| b.set(\amp, (msg[1]*0.8).postln)}, "1/joint/l_hand", nil, 8008);
~m3 = OSCdef(\freqGate, {|msg, time, addr, recvPort| b.set(\freqGate,(~z = msg[3]* 10).postln)}, "1/joint/r_hand", nil, 8008);
~m1 = OSCdef(\ampGate, {|msg, time, addr, recvPort| b.set(\ampGate, (~x = msg[1]*0.8).postln)}, "1/joint/r_hand", nil, 8008);
)
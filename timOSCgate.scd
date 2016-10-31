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

(
SynthDef(\timOSC, { |freq = 600, numharm, amp, maxDel = 0.2, delT = 0.2, decT = 1, ampIn = 0.8, freqAm = 0.2, ampAM = 0.8, gate = 1|
	var in, env;
	env = EnvGen.kr(Env.perc, gate);
	in = Blip.ar(freq, numharm, amp);
	Out.ar(0, (AllpassC.ar(in, maxDel, delT, decT, ampIn) * SinOsc.ar(freqAm, mul: ampAM) * env))
}).send(s);
)
a = Synth(\timOSC);
a.free;
(
OSCdef(\freq, {|msg, time, addr, recvPort| a.set(\freq, (msg[2]*3980+20).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\decT, {|msg, time, addr, recvPort| a.set(\decT, (msg[1].range(0,1)*1.2+0.2).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\freqAm, {|msg, time, addr, recvPort| a.set(\freqAm, ((msg[1].range(0,1)*(-14))+16).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\numharm, {|msg, time, addr, recvPort| b = (msg[1].range(0,1)*50); c = (50**(b/50)); a.set(\numharm, c.postln)}, "/1/joint/l_hand", nil, 8008);
OSCdef(\amp, {|msg, time, addr, recvPort| a.set(\amp, (msg[2]*0.1).postln)}, "/1/joint/l_hand", nil, 8008);
OSCdef(\gate, {|msg, time, addr, recvPort| d = (msg[2]*1.2 + msg[1]*1.2); a.set(\gate, d.postln)}, "/joint/r_/1", nil, 8008);
)
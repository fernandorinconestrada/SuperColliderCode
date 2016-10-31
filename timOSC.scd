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
SynthDef(\timOSC, { |freq = 600, numharm, amp, maxDel = 0.2, delT = 0.2, decT = 1, ampIn = 0.8, freqAm = 0.2, ampAM = 0.8|
	var in;
	//env = EnvGen.kr(Env.perc, gate);
	in = Blip.ar(freq, numharm.lag(0.1), amp);
	Out.ar(0, (AllpassC.ar(in, maxDel, delT, decT, ampIn) * SinOsc.ar(freqAm, mul: ampAM)))
}).send(s);
)
b = Synth(\timOSC);
b.free;
(
OSCdef(\freq, {|msg, time, addr, recvPort| b.set(\freq, ((msg[2]*1800)+50).postln)}, "2/joint/r_hand", nil, 8008);
OSCdef(\decT, {|msg, time, addr, recvPort| b.set(\decT, ((msg[1].range(0,1)*1.2)+0.2).postln)}, "2/joint/r_hand", nil, 8008);
OSCdef(\freqAm, {|msg, time, addr, recvPort| b.set(\freqAm, ((msg[1].range(0,1)*(-11))+13).postln)}, "2/joint/r_hand", nil, 8008);
OSCdef(\numharm, {|msg, time, addr, recvPort| a = (msg[1].range(0,1)*50); c = (50**(a/50)); b.set(\numharm, c.postln)}, "2/joint/l_hand", nil, 8008);
OSCdef(\amp, {|msg, time, addr, recvPort| b.set(\amp, (msg[2]*0.2).postln)}, "2/joint/l_hand", nil, 8008);
)
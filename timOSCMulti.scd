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
s = Server.local.makeGui;

(
SynthDef(\timOSCMult, { |right, left, numharmL, numharmR, ampRight, ampLeft, maxDel = 0.2, delT = 0.2, decT = 1, ampIn = 0.8, freqAmR = 0.2, freqAmL = 0.2, ampAM = 0.5, freqEnvR = 1, freqEnvL = 1|
	var in, env;
	//env = EnvGen.kr(Env.perc, Impulse.kr([freqEnvR, freqEnvL]));
	in = Blip.ar([right, left], [numharmL,numharmR], [ampRight, ampLeft]);
	Out.ar(0, (AllpassC.ar(in, maxDel, delT, decT, ampIn) ) * SinOsc.ar([freqAmR, freqAmL],mul: ampAM))
}).send(s);
)
a = Synth(\timOSCMult);
a.free;
(
OSCdef(\freqRight, {|msg, time, addr, recvPort| a.set(\right, ((msg[2].postln*1750)+50).postln)}, "1/joint/r_hand", nil, 8008);
OSCdef(\freqLeft, {|msg, time, addr, recvPort| a.set(\left, ((msg[2].postln*(-1750))+1800))}, "1/joint/l_hand", nil, 8008);
OSCdef(\ampRight, {|msg, time, addr, recvPort| a.set(\ampRight, ((msg[1]).range(0, 0.8)).postln)}, "1/joint/r_hand", nil, 8008);
OSCdef(\ampLeft, {|msg, time, addr, recvPort| a.set(\ampLeft, ((msg[1]).range(0.7, 0)).postln)}, "1/joint/l_hand", nil, 8008);
OSCdef(\numharmR, {|msg, time, addr, recvPort| a.set(\numharmR, ((msg[3].abs * 0.1428) * 35).postln)}, "1/joint/r_hand", nil, 8008);
OSCdef(\numharmL, {|msg, time, addr, recvPort| a.set(\numharmL, ((msg[3].abs * 0.1428).range(1,0) * 30).postln)}, "1/joint/l_hand", nil, 8008);
OSCdef(\freqAmR, {|msg, time, addr, recvPort| a.set(\freqAmR, (((msg[1]).range(0,1)*(-4))+6).postln)}, "1/joint/r_hand", nil, 8008);
//OSCdef(\freqAmR).clear;
OSCdef(\freqAmL, {|msg, time, addr, recvPort| a.set(\freqAmL, (((msg[1]).range(1,0)*(-4))+8).postln)}, "1/joint/l_hand", nil, 8008);
//OSCdef(\freqAmL).clear;
OSCdef(\freqEnvR, {|msg, time, addr, recvPort| a.set(\freqEnvR, (msg[2] * 5)).postln}, "1/joint/r_foot", nil, 8008);
OSCdef(\freqEnvL, {|msg, time, addr, recvPort| a.set(\freqEnvL, (msg[2].abs.range(1,0) * 7)).postln}, "1/joint/l_foot", nil, 8008);
)

/* frecuencia en y l_hand/r_hand ( mirror)
 amplitud en x
harmonicos en z
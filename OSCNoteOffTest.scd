(
(
SynthDef(\Instr_1, { | freq, numharm, amp = 0.8, freq1, numharm1, amp1 = 0.8, gate1 = 0.0, delTime = 0.1, decTime = 0.2, ampAll = 0.05, delTimeFB = 0.5, decTimeFB = 1.0, ampAllFB = 0.8 |
	var env1, blip, inBlip, blipFB;
	blip =  Blip.ar(freq, numharm, amp) * Blip.ar(freq1, numharm1, amp1);
	env1 = EnvGen.kr(Env.perc, gate1) * blip;
	inBlip = AllpassC.ar(env1, 0.2, delTime, decTime, ampAll);
	blipFB = AllpassC.ar(inBlip, 2, delTimeFB, decTimeFB, ampAllFB);
	Out.ar([0,1], blipFB);
}).add;
);
(
SynthDef(\Instr_2, { | freq2, numharm2, amp2 = 0.001, freq3, numharm3, amp3 = 0.001, gate2 = 0.0, delTime1 = 0.1, decTime1 = 0.2, ampAll1 = 0.05, delTimeFB1 = 0.5, decTimeFB1 = 1.0, ampAllFB1 = 0.05 |
	var env2, blip1, inBlip1, blipFB1;
	blip1 =  Blip.ar(freq2, numharm2, amp2) * Blip.ar(freq3, numharm3, amp3);
	env2 =  EnvGen.kr(Env.adsr, gate2, Latch.kr(gate2, gate2)) * blip1;
	inBlip1 = AllpassC.ar(env2, 0.2, delTime1, decTime1, ampAll1);
	blipFB1 = AllpassC.ar(inBlip1, 2, delTimeFB1, decTimeFB1, ampAllFB1);
	Out.ar([0,1], blipFB1);
}).add;
);
(
a = Synth(\Instr_1);
b = Synth(\Instr_2);
);
(
OSCdef(\gate1,    {|msg, time, addr, recvPort| a.set(\gate1, msg[1].postln)},                "/gate1",            nil, 57122);
OSCdef(\gate2,    {|msg, time, addr, recvPort| b.set(\gate2, msg[1].postln)},                "/gate2",            nil, 57122);
//adsr
OSCdef(\freq,    {|msg, time, addr, recvPort| a.set(\freq, (msg[1] * 700 + 50).postln)},   "/freq/numharm",    nil, 57122);
OSCdef(\numharm, {|msg, time, addr, recvPort| a.set(\numharm, (msg[2] * 16 + 8).postln)},  "/freq/numharm",    nil, 57122);
OSCdef(\amp,     {|msg, time, addr, recvPort| a.set(\amp, msg[1].postln)},                  "/amp/amp1",       nil, 57122);
OSCdef(\freq1,    {|msg, time, addr, recvPort| a.set(\freq1, (msg[1] * 400 + 100).postln)}, "/freq1/numharm1",nil, 57122);
OSCdef(\numharm1, {|msg, time, addr, recvPort| a.set(\numharm1, (msg[1] * 8 + 2).postln)},  "/freq1/numharm1",nil, 57122);
OSCdef(\amp1,     {|msg, time, addr, recvPort| a.set(\amp1, msg[2].postln)},                 "/amp/amp1",      nil, 57122);
//perc
OSCdef(\freq,    {|msg, time, addr, recvPort| b.set(\freq2, (msg[1] * 700 + 50).postln)},   "/freq/numharm",    nil, 57122);
OSCdef(\numharm, {|msg, time, addr, recvPort| b.set(\numharm2, (msg[2] * 16 + 8).postln)},  "/freq/numharm",    nil, 57122);
OSCdef(\amp,     {|msg, time, addr, recvPort| b.set(\amp2, msg[1].postln)},                  "/amp/amp1",       nil, 57122);
OSCdef(\freq1,    {|msg, time, addr, recvPort| b.set(\freq3, (msg[1] * 400 + 100).postln)}, "/freq1/numharm1",nil, 57122);
OSCdef(\numharm1, {|msg, time, addr, recvPort| b.set(\numharm3, (msg[1] * 8 + 2).postln)},  "/freq1/numharm1",nil, 57122);
OSCdef(\amp1,     {|msg, time, addr, recvPort| b.set(\amp3, msg[2].postln)},                 "/amp/amp1",      nil, 57122);
//adsr
OSCdef(\del,    {|msg, time, addr, recvPort| a.set(\delTime, (msg[1] * 0.19 + 0.01).postln)},   "/freq/numharm",    nil, 57122);
OSCdef(\dec,    {|msg, time, addr, recvPort| a.set(\decTime, (msg[2] * 0.3 +  0.1).postln)},    "/freq/numharm",    nil, 57122);
OSCdef(\ampAll, {|msg, time, addr, recvPort| a.set(\ampAll,   msg[1].postln)},                  "/amp/amp1",        nil, 57122);
OSCdef(\delFB,  {|msg, time, addr, recvPort| a.set(\delTimeFB, (msg[1] * 1.9 + 0.1).postln)},   "/freq1/numharm1",  nil, 57122);
OSCdef(\decFB,  {|msg, time, addr, recvPort| a.set(\decTimeFB, (msg[1] * 2.5 + 0.5).postln)},  "/freq1/numharm1",nil, 57122);
OSCdef(\ampFB,  {|msg, time, addr, recvPort| a.set(\ampAllFB, msg[2].postln)},                 "/amp/amp1",      nil, 57122);
//perc
OSCdef(\del,    {|msg, time, addr, recvPort| b.set(\delTime1, (msg[1] * 0.19 + 0.01).postln)},   "/freq/numharm",    nil, 57122);
OSCdef(\dec,    {|msg, time, addr, recvPort| b.set(\decTime1, (msg[2] * 0.3 +  0.1).postln)},    "/freq/numharm",    nil, 57122);
OSCdef(\ampAll, {|msg, time, addr, recvPort| b.set(\ampAll1,   msg[1].postln)},                  "/amp/amp1",        nil, 57122);
OSCdef(\delFB,  {|msg, time, addr, recvPort| b.set(\delTimeFB1, (msg[1] * 1.9 + 0.1).postln)},   "/freq1/numharm1",  nil, 57122);
OSCdef(\decFB,  {|msg, time, addr, recvPort| b.set(\decTimeFB1, (msg[1] * 2.5 + 0.5).postln)},  "/freq1/numharm1",nil, 57122);
OSCdef(\ampFB,  {|msg, time, addr, recvPort| b.set(\ampAllFB1, msg[2].postln)},                 "/amp/amp1",      nil, 57122);
);
)

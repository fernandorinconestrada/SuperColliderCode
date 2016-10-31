(
SynthDef(\testTwoIns, { | ampFilt1 = 0.001, ampFilt2 = 0.001 |
	var in, out1, out2, filter1, filter2;
	in = SoundIn.ar(0);
	out1 = Blip.ar(AmplitudeMod.kr(in, 0.01, 0.01, 400, 400), 100, SinOsc.kr(20).range(0.1, 0.9));
	out2 = Blip.ar(AmplitudeMod.kr(in, 0.03, 0.03, 1200, 1800), 50, SinOsc.kr(30).range(0.1, 0.9));
	filter1 = AllpassC.ar(out1, 0.5, 0.5, 2, ampFilt1);
	filter2 = AllpassC.ar(out2, 0.5, 0.4, 4, ampFilt2);
	Out.ar(0, [filter1, filter2]);
}).add;
)

a = Synth(\testTwoIns);

(
OSCdef(\ampFilt1,    {|msg, time, addr, recvPort| a.set(\ampFilt1,    msg[1].postln)}, "/ampFilt1", nil, 57121);
OSCdef(\ampFilt2,    {|msg, time, addr, recvPort| a.set(\ampFilt2,    msg[1].postln)}, "/ampFilt2", nil, 57121);
)
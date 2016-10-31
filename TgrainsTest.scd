(
b = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");

(
SynthDef(\TgrainsTest, { | rateTrig = 20, bufnum = 0 |
	var trig;
	trig = Impulse.kr(rateTrig);
	OffsetOut.ar(0, HPF.ar(TGrains.ar(2, trig, bufnum, LFNoise0.kr(5, 1.05, 0.95), 0.5, LFNoise0.kr(5, 0.15, 0.05), LFNoise0.kr(4).range(-1.0, 1.0), LFNoise0.kr(5, 0.5, 0.1), 4), 40));
}).add;
)

)

a = Synth(\TgrainsTest, [\bufnum, b])

(
c = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");

(
SynthDef(\TgrainsTestMouse, { | rateTrig = 20, bufnum = 0 |
	var trig, posCen;
	trig = Impulse.kr(rateTrig);
	posCen = MouseX.kr(0, 1, lag: 0.05);
	OffsetOut.ar(0, HPF.ar(TGrains.ar(2, trig, bufnum, LFNoise0.kr(5, 1.05, 0.95), posCen, LFNoise0.kr(5, 0.15, 0.05), LFNoise0.kr(4).range(-1.0, 1.0), LFNoise0.kr(5, 0.5, 0.1), 4), 40));
}).add;
)

)

d = Synth(\TgrainsTestMouse, [\bufnum, c])

(
g = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/Pot_lid.wav");

(
SynthDef(\TgrainsTestDelay, { | rateTrig = 20, bufnum = 0 |
	var trig, in;
	trig = Impulse.kr(rateTrig);
	in = HPF.ar(TGrains.ar(2, trig, bufnum, LFNoise0.kr(5, 1.05, 0.95), LFNoise0.kr(6, 0.7, 0.3), LFNoise0.kr(5, 0.15, 0.05), LFNoise0.kr(4).range(-1.0, 1.0), LFNoise0.kr(5, 0.5, 0.1), 4), 40);
	OffsetOut.ar(0, LPF.ar(in, 19000));
	OffsetOut.ar(0, Pan2.ar(LPF.ar(AllpassC.ar(in, 0.2, LFNoise0.kr(6, 0.04, 0.04), LFNoise0.kr(4, 0.3, 0.1), 19000)), LFNoise0.kr(5).range(-1.0, 1.0)));
}).add;
)

)

h = Synth(\TgrainsTestPeak, [\bufnum, g])
f.set(\rateTrig, 40)
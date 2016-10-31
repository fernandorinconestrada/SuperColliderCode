p = ProxySpace.push;
o = Server.local.options;
o.numOutputBusChannels = 31;

//b = Buffer.read(s,"/Users/fernandorincon/Desktop/Pot_lid.wav");
~out = { GrainBuf.ar(1, Impulse.kr(0.31, mul: 0.07), Dwhite(0.01, 0.03), Buffer.read(s,"/Users/fernandorincon/Desktop/Pot_lid.wav"), Dwhite(0.1, 1).range(0.9, 1.2), LFNoise2.kr(0.1).range(0, 1), interp: 2) * EnvGen.kr(Env([0,1,0], [1,1], \sin, 1)) };
//~out.play;

~out1 = { GrainBuf.ar(1, Impulse.kr(0.41, mul: 0.11), Dwhite(0.01, 0.029), Buffer.read(s,"/Users/fernandorincon/Desktop/Pot_lid.wav"), Dwhite(1, 0.1).range(1.3, 0.7), LFNoise2.kr(0.1).range(0, 0.5), interp: 2) * EnvGen.kr(Env.perc(0.001, LFNoise2.kr(0.7).range(0.1, 0.4))) };

~out2 = { GrainBuf.ar(1, Impulse.kr(0.53, mul: 0.05), Dwhite(0.01, 0.017), Buffer.read(s,"/Users/fernandorincon/Desktop/Pot_lid.wav"), Dwhite(0.5, 0.1).range(1.7, 0.3), LFNoise2.kr(0.1).range(0.5, 1.0), interp: 2) * EnvGen.kr(Env.perc) };

~out3 = { GrainBuf.ar(1, Impulse.kr(0.37, mul: 0.07), Dwhite(0.11, 0.023), Buffer.read(s,"/Users/fernandorincon/Desktop/Pot_lid.wav"), Dwhite(0.1, 1).range(1.9, 0.2), LFNoise2.kr(0.1).range(0, 0.5), interp: 2) * EnvGen.kr(Env([0,1,0], [1,1], \sin, 1)) };

~out4 = { GrainBuf.ar(1, Impulse.kr(0.59, mul: 0.05), Dwhite(0.01, 0.023), Buffer.read(s,"/Users/fernandorincon/Desktop/Pot_lid.wav"), Dwhite(0.5, 0.1).range(0.5, 1.3), LFNoise2.kr(0.1).range(0.5, 1.0), interp: 2) * EnvGen.kr(Env.perc(LFNoise2.kr(3).range(0.001, 0.007), Dwhite(0.2), 1)) };


~out.playN([0, 9,10,19,20,29]);
~out1.playN([1,8,11,18,21,28]);
~out2.playN([2,7,12,17,22,27]);
~out3.playN([3,6,13,16,23,26]);
~out4.playN([4,5,14,15,24,25,30]);

p.clear;
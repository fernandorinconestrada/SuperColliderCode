s= Server.local.makeGui;
o = Server.local.options;
o.numInputBusChannels.postln;
o.numInputBusChannels = 0;


(SynthDef(\spray, { |index = 1, freq = 0.1, freq1 = 0.11|
	var dens, dens1, carfrq, modfrq, amp, amp1, out1, out;
	dens = SinOsc.kr(freq).range(0, 30);
	dens1 = SinOsc.kr(freq1).range(0, 30);
	modfrq = MouseY.kr(20, 100);
	carfrq = MouseX.kr(50, 5000, 0, 0.2);
	amp = LFNoise0.kr(20).range(0.05, 0.2);
	amp1 = LFNoise0.kr(20).range(0.05, 0.2);
	out = GrainFM.ar(2, Dust.kr(dens), LFNoise0.kr(50).range(0.05, 0.2), carfrq, modfrq, index, mul: amp);
	out1 = GrainFM.ar(2, Dust.kr(dens1), LFNoise0.kr(50).range(0.05, 0.2), carfrq, modfrq, index, mul: amp1);
	Out.ar(0, LPF.ar([out,out1], 20000));
}).load(s);
)

(SynthDef(\spray_tri, { |index = 1, freq = 0.1, freq1 = 0.11|
	var dens, dens1, carfrq, modfrq, amp, amp1, out1, out;
	dens = LFTri.kr(freq).range(0, 30);
	dens1 = LFTri.kr(freq1).range(0, 30);
	modfrq = MouseY.kr(20, 100);
	carfrq = MouseX.kr(50, 5000, 0, 0.2);
	amp = LFNoise0.kr(20).range(0.05, 0.2);
	amp1 = LFNoise0.kr(20).range(0.05, 0.2);
	out = GrainFM.ar(2, Dust.kr(dens), LFNoise0.kr(50).range(0.05, 0.2), carfrq, modfrq, index, mul: amp);
	out1 = GrainFM.ar(2, Dust.kr(dens1), LFNoise0.kr(50).range(0.05, 0.2), carfrq, modfrq, index, mul: amp1);
	Out.ar(0, LPF.ar([out,out1], 20000));
}).load(s);
)


(
var env;
env = Env([0, 0.8, 0],[0.3, 0.7], \sin);
env.plot;
z = Buffer.sendCollection(s, env.discretize, 1);

SynthDef(\spray_saw, { |freq = 0.1, freq1 = 0.11, envbuf = -1, carfrq = #[0,0,0,0] , modfrq =#[0,0,0,0]|
	var dens, dens1, amp, amp1, out1, out, index, index1;
	dens = LFSaw.kr(freq, 0, 0.8).range(0, 30);
	dens1 = LFSaw.kr(freq1, 0, 0.8).range(0, 30);
	//modfrq = MouseY.kr(0, 100);
	//carfrq = MouseX.kr(50, 5000, 0, 0.2);
	amp = LFNoise0.kr(10).range(0.05, 0.15);
	amp1 = LFNoise0.kr(10).range(0.05, 0.15);
	index = Line.kr(0, 10, 30);
	index1 = Line.kr(0, 12, 30);
	out = GrainFM.ar(1, Dust.kr(dens), LFNoise0.kr(50).range(0.03, 0.13), carfrq, modfrq, index, 0.6, envbuf, mul: amp);
	out1 = GrainFM.ar(1, Dust.kr(dens1), LFNoise0.kr(50).range(0.05, 0.17), carfrq, modfrq, index1, -0.6, envbuf, mul: amp1);
	Out.ar(0, LPF.ar([out,out1], 20000) * 0.5);
}).load(s);
)

a = Synth(\spray_saw);
a.set(\envbuf, z);
a.set(\envbuf, -1);
a.set(\carfrq, [130, 131, 1039, 2080], \modfrq, [50, 49, 100, 101], \freq, 20, \freq1, 50);
a.set(\modfrq, [50, 49, 100, 101]);
a.free;
a.set(\freq, 20);
a.set(\freq1, 50);


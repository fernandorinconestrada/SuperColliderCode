Server.local.makeGui;
Server.internal.makeGui;


o = Server.local.options;
o.numOutputBusChannels = 31;

p = ProxySpace.push;

a = Buffer.read(s, "/Users/fernandorincon/Desktop/Pot_lid.wav");

(
~grain.set(\sndbuf, a.bufnum);
~trig = { |density = 10| Dust.ar(density) };
~graindur = 0.1;
~rate = 1;
~filepos = { |freq = 20| LFNoise2.ar(freq) };
~grain = { |sndbuf = 0|
	GrainBuf.ar(1, ~density.kr, ~graindur.kr, sndbuf, ~rate.kr, ~filepos.kr)
};
~grain.play;
)

~graindur = 0.3;

~filepos = { |freq = 200| LFNoise2.ar(freq) };
~trig = { |density = 20| Impulse.ar(density) };
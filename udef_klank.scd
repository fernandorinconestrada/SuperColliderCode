Server.local.makeGui;
Server.internal.makeGui;

o = Server.local.options;
o.numOutputBusChannels = 31;

(
Udef(\klank, { | freq = 100, ampli = 0.8, density = 5 |
	UOut.ar(0, DynKlank.ar(`[[freq * 3, freq * 5, freq * 7, freq * 11, freq * 13], nil, [ampli, ampli/2, ampli/5, ampli/3, ampli/7]], Dust.ar(density) ) )
} ).loadSynthDef(s);

Udef(\kl_lfn, { | freq = 500, ampli = 0.8, density = 11|
	UOut.ar(1, DynKlank.ar(`[[freq * 2, freq * 5, freq * 11, freq * 13, freq * 17], nil, [ampli, ampli/2, ampli/5, ampli/3, ampli/7]], Dust.ar(LFNoise2.ar(density).range(0,32) ) ) )
} ).loadSynthDef(s);
)

x = UChain(\klank, \klank, \kl_lfn, \kl_lfn, \output);

s.notify;
x.gain_(-24);
x.dur_(60);
x.fadeIn_(2);
x.fadeOut_(2);
x.prepareAndStart(s);
x.gui;


1.1910.rand;
Server.local.makeGui;
Server.internal.makeGui;

o = Server.local.options;
o.numOutputBusChannels = 31;



ULib.startup;

(
a = Udef(\test, { |freq = 440, freq1 = 441, freq2 = 439, ampli = 0.05, ampli1 = 0.03, ampli2 = 0.02|
	var sine1, sine2;
	sine1 = SinOsc.ar(freq1, 0, ampli1);
	sine2 = SinOsc.ar(freq2, 0, ampli2);
	UMixOut.ar(0, sine1 + sine2 + SinOsc.ar(freq, 0, ampli))
});
a.loadSynthDef(s);
)

b = UChain(\test, \test, \output);

b.gui;
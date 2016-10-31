Server.local.makeGui;
Server.internal.makeGui;

o = Server.local.options;
o.numOutputBusChannels = 31;

(
SynthDef(\test, { arg freq = 440, amp = 0.001;
	Out.ar(0,
		SinOsc.ar(freq, 0, amp))
}).add;
)

///// working ////
p = ProxySpace.push;

~x = { SinOsc.ar(440, 0, 0.001) };
~x.play;

~y = { SinOsc.ar(441, 0, 0.001) };
~y.play;

~z = { SinOsc.ar(438, 0, 0.0015) };
~z.play;

~a = { PulseDPW.ar(444, 0.2, 0.0008) };
~a.play;


(
~x.playN(
			[0, 5, 10, 15, 20, 25]);
)

(
~y.playN(
			[0, 6, 12, 19, 26]);
)

(
~a.playN(
			[1, 3, 7, 11, 13, 17, 19, 23, 29]);
)



(
~z.playN(
			[0, 4, 8, 16, 30]);
)
(
~a.playN(
	[29]);
)
Server.local.makeGui;
s = Server.local;
b = Spectrogram.new;

a = {SinOsc.ar(440, 1, 0.5)};
b = {SinOsc.ar(440, -1, 0.5)};
a.play;
b.play;

c = a+b;
c.play;

a = {SinOsc.ar(440, 0, 0.5) * SinOsc.ar(440, pi*0.01, 0.5)}.play;


(
SynthDef(\alias, { |pha1 = 0, pha2 = 0, amp1 = 0.2, amp2 = 0.2, index = 10|
	var in;
	in = SinOsc.ar(440, pha1, amp1) + SinOsc.ar(440, pha2, amp2);
	Out.ar(0, LPF.ar(in, 440*index))
}).add;
)
a.free;

a = Synth(\alias, [pha2:pi]);
a.set(\index, 1);
a.set(\pha2, pi*0.001);

FreqScope.new(400, 200, 0);
s.scope;
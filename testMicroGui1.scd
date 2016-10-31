(
SynthDef(\burst, { |att = 0.01, sust = 0.05, dec = 0.3, gate = 1, ampNoise = 1, freqQ = 330, bw = 0.6, ampFilt = 0.8, left = 0, right = 1, delT = 0.000605, ampDel = 0.8 |
	var env, in;
	env = EnvGen.kr(Env([0, 1, 0.3, 0], [att, sust, dec], [8, -8, -8]), Impulse.kr(gate));
	in = BBandPass.ar(WhiteNoise.ar(ampNoise), freqQ, bw, ampFilt) * env;
	OffsetOut.ar(left, in);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel))
}).send(s);
)

a = Synth(\burst);
a.set(\bw, 0.1);
a.set(\bw, 0.2);
a.set(\bw, 0.3);
a.set(\bw, 0.4);
a.set(\bw, 0.5);
a.set(\bw, 0.6);
a.set(\bw, 0.7);
a.set(\bw, 0.8);
a.set(\bw, 0.9);


(
w = Window("Burst", Rect(1000,1600, 320, 420)).front;
b = StaticText(w, Rect(220, 10, 40, 20)).background_(Color.rand);
b.string = "attack";
c = Slider(w, Rect(10, 10, 200, 20)).value_(0).step_(0.005).focus.action_({
	a.set(\att, (c.value * 0.1).postln);
});
d = StaticText(w, Rect(220, 40, 60, 20)).background_(Color.rand);
d.string = "sustain";
e = Slider(w, Rect(10, 40, 200, 20)).value_(0).step_(0.005).focus.action_({
	a.set(\sust, (e.value * 0.1).postln);
});
f = StaticText(w, Rect(220, 70, 40, 20)).background_(Color.rand);
f.string = "decay";
g = Slider(w, Rect(10, 70, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\dec, (g.value).postln);
});
~h = StaticText(w, Rect(220, 100, 85, 20)).background_(Color.rand);
~h.string = "EnvelopeFreq";
~i = Slider(w, Rect(10, 100, 200, 20)).value_(0).step_(0.1).focus.action_({
	a.set(\gate, (~i.value * 20.0).postln);
});
h = StaticText(w, Rect(220, 130, 70, 20)).background_(Color.rand);
h.string = "NoiseAmp";
i = Slider(w, Rect(10, 130, 200, 20)).value_(0).step_(0.1).focus.action_({
	a.set(\ampNoise, (i.value * 2).postln);
});
j = StaticText(w, Rect(220, 160, 80, 20)).background_(Color.rand);
j.string = "filterFreq";
k = Slider(w, Rect(10, 160, 200, 20)).value_(0).step_(0.1).focus.action_({
	a.set(\freqQ, (k.value * 2000+200).postln);
});
l = StaticText(w, Rect(220, 190, 70, 20)).background_(Color.rand);
l.string = "BandWidth";
m = Slider(w, Rect(10, 190, 200, 20)).value_(0).step_(0.05).focus.action_({
	a.set(\bw, (m.value).postln);
});
n = StaticText(w, Rect(220, 220, 70, 20)).background_(Color.rand);
n.string = "AmpFilter";
o = Slider(w, Rect(10, 220, 200, 20)).value_(0).step_(0.05).focus.action_({
	a.set(\ampFilt, (o.value).postln);
});
p = StaticText(w, Rect(220, 250, 70, 20)).background_(Color.rand);
p.string = "DelayTime";
q = Slider(w, Rect(10, 250, 200, 20)).value_(0).step_(0.00005).focus.action_({
	a.set(\delT, (q.value * 0.000999).postln);
});
r = StaticText(w, Rect(220, 280, 70, 20)).background_(Color.rand);
r.string = "AmpDelay";
t = Slider(w, Rect(10, 280, 200, 20)).value_(0).step_(0.05).focus.action_({
	a.set(\ampDel, (t.value).postln);
});
t = Slider2D(w, Rect(10, 310 ,100, 100))
            .y_(0)
            .x_(0)
            .background_(Color.rand)
            .knobColor_(Color.rand)
            .action_({|sl|
	                a.set(\delT,(sl.x * 0.000999).postln,\ampDel,sl.y.postln);
            });
)
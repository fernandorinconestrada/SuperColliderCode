(
SynthDef(\testSampleDelay, { |rateDelay = 0.02, trig = 0.5, freq = 49, maxDel = 1.5, delay = 1, cutoff|
	var out;
	delay = (SinOsc.kr(rateDelay, -1.6).range(1, 22050).round(1)/44100);
	out = Decay2.ar(Impulse.ar(trig), 0.01, 1, SinOscFB.ar(freq + [0, 0.5], 0.5, 0.3));
	OffsetOut.ar(0, out);
	OffsetOut.ar(0, LPF.ar(DelayN.ar(out, maxDel, delay, 1), cutoff));
}).add;
)

a = Synth(\testSampleDelay);

a.set(\rateDelay, 40);
a.set(\trig, 32);
a.set(\delay, 1/44100);
a.set(\delay, 2/44100);
a.set(\delay, 4/44100);
a.set(\delay, 8/44100);
a.set(\delay, 32/44100);
a.set(\delay, 64/44100);
a.set(\delay, 512/44100);
a.set(\delay, 22050/44100);
a.set(\delay, 44100/44100);

(
w = Window("test GUI", Rect(1000,1600, 300, 320)).front;
b = StaticText(w, Rect(220, 10, 40, 20)).background_(Color.rand);
b.string = "freq";
c = Slider(w, Rect(10, 10, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\freq, (49 + ((49*4) * c.value)).postln);
});
d = StaticText(w, Rect(220, 40, 60, 20)).background_(Color.rand);
d.string = "rateDelay";
e = Slider(w, Rect(10, 40, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\rateDelay, (0.02 + (4* e.value)).postln);
});
f = StaticText(w, Rect(220, 70, 50, 20)).background_(Color.rand);
f.string = "trig";
g = Slider(w, Rect(10, 70, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\trig, (0.5 + (39.5 * g.value)).postln);
});
h = StaticText(w, Rect(220, 100, 60, 20)).background_(Color.rand);
h.string = "cutoff";
i = Slider(w, Rect(10, 100, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\cutoff, (1000 + (10000 * i.value)).postln);
});
/*k = StaticText(w, Rect(220, 130, 60, 20)).background_(Color.rand);
k.string = "release";
k = Slider(w, Rect(10, 130, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\att, (k.value * 0.3).postln);
});
l = StaticText(w, Rect(220, 160, 60, 20)).background_(Color.rand);
l.string = "rateTrig";
m = Slider(w, Rect(10, 160, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\rateTrig, (m.value * 10).postln);
});
n = StaticText(w, Rect(220, 190, 40, 20)).background_(Color.rand);
n.string = "cutoff";
o = Slider(w, Rect(10, 190, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\cutoff, (5000 + (6000 * o.value)).postln);
});
p = StaticText(w, Rect(220, 220, 60, 20)).background_(Color.rand);
p.string = "decT";
q = Slider(w, Rect(10, 220, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\decT, (q.value * 1).postln);
});
r = StaticText(w, Rect(220, 250, 60, 20)).background_(Color.rand);
r.string = "levDel";
t = Slider(w, Rect(10, 250, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\levDel, (t.value * 0.5).postln);
});
u = StaticText(w, Rect(220, 280, 60, 20)).background_(Color.rand);
u.string = "level";
v = Slider(w, Rect(10, 280, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\level, v.value.postln);
});*/
);

s.prepareForRecord;
s.record;
s.stopRecording;

(
(
SynthDef(\testGuiVer2, { |rateTrig = 1, fund, partsL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], partsR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], fbL = 0.1, fbpartsL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], fbR = 0.1, fbpartsR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], rateModL = 0.1, mulRateL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], rateModR = 0.1, mulRateR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], ampL = 1, mulAmpL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], ampR = 1, mulAmpR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], att = 0.01, sus = 0.2, rel = 0.1, level = 0.5, delTL = 0.06, decTL = 0.5, levDelL = 0.5, delTR = 0.06, decTR = 0.5, levDelR = 0.5|
	var outL, outR, trigEnv, delayL, delayR;
	trigEnv = Impulse.kr(rateTrig);
	outL = Mix.new(SinOscFB.ar(fund * partsL, fbL * fbpartsL, SinOsc.kr(rateModL * mulRateL, 0, ampL * mulAmpL))) * EnvGen.kr(Env.linen(att, sus, rel, level, \lin), trigEnv);
	outR = Mix.new(SinOscFB.ar(fund * partsR, fbR * fbpartsR, SinOsc.kr(rateModR * mulRateR, 0, ampR * mulAmpR))) * EnvGen.kr(Env.linen(att, sus, rel, level, \lin), trigEnv);
	delayL = AllpassC.ar(outL, 0.2, delTL, decTL, levDelL);
	delayR = AllpassC.ar(outR, 0.2, delTR, decTR, levDelR);
	OffsetOut.ar(0, outL);
	OffsetOut.ar(1, outR);
	OffsetOut.ar(1, delayL);
	OffsetOut.ar(0, delayR);
}).add;
);
(
~partsL = Array.series(12, 1, 4);
~partsR = Array.series(12, 3, 4);
~mulRateL = Array.series(12, 1, 6);
~mulRateR = Array.series(12, 4, 6);
//~mulAmp = Array.fill(12, { |i| 1/((i+1)*3)});
~mulAmpL = Array.series(12, 3, 6).collect({ |item, i| (1/item)});
~mulAmpR = Array.series(12, 6, 6).collect({ |item, i| (1/item)});
~fbpartsL = Array.fill(12, { |i| i.rrand(3, 8) * 1});
~fbpartsR = Array.fill(12, { |i| i.rrand(3, 8) * 1});
);

a = Synth(\testGuiVer2, [\fund, 220, \partsL, ~partsL, \partsR, ~partsR, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR]);
//a.set(\rateTrig, 4);
//a = Synth(\testGui);
(
w = Window("test GUI", Rect(1000,1600, 300, 520)).front;
b = StaticText(w, Rect(220, 10, 40, 20)).background_(Color.rand);
b.string = "fund";
c = Slider(w, Rect(10, 10, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\fund, (55 + (385 * c.value)).postln);
});
d = StaticText(w, Rect(220, 40, 60, 20)).background_(Color.rand);
d.string = "rateModL";
e = Slider(w, Rect(10, 40, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\rateModL, (0.2 * e.value).postln);
});
f = StaticText(w, Rect(220, 70, 60, 20)).background_(Color.rand);
f.string = "rateModR";
g = Slider(w, Rect(10, 70, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\rateModR, (g.value * 0.2).postln);
});
h = StaticText(w, Rect(220, 100, 60, 20)).background_(Color.rand);
h.string = "attack";
i = Slider(w, Rect(10, 100, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\att, (i.value * 0.1).postln);
});
k = StaticText(w, Rect(220, 130, 60, 20)).background_(Color.rand);
k.string = "sustain";
k = Slider(w, Rect(10, 130, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\sustain, (k.value * 0.3).postln);
});
l = StaticText(w, Rect(220, 160, 60, 20)).background_(Color.rand);
l.string = "release";
m = Slider(w, Rect(10, 160, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\release, (m.value * 0.3).postln);
});
n = StaticText(w, Rect(220, 190, 60, 20)).background_(Color.rand);
n.string = "rateTrig";
o = Slider(w, Rect(10, 190, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\rateTrig, (o.value * 10).postln);
});
p = StaticText(w, Rect(220, 220, 40, 20)).background_(Color.rand);
p.string = "delTL";
q = Slider(w, Rect(10, 220, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\delTL, (q.value * 0.2).postln);
});
r = StaticText(w, Rect(220, 250, 40, 20)).background_(Color.rand);
r.string = "decTL";
t = Slider(w, Rect(10, 250, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\decTL, t.value.postln);
});
u = StaticText(w, Rect(220, 280, 50, 20)).background_(Color.rand);
u.string = "levDelL";
v = Slider(w, Rect(10, 280, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\levDelL, (v.value * 0.5).postln);
});
x = StaticText(w, Rect(220, 310, 40, 20)).background_(Color.rand);
x.string = "delTR";
y = Slider(w, Rect(10, 310, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\delTR, (y.value * 0.2).postln);
});
z = StaticText(w, Rect(220, 340, 40, 20)).background_(Color.rand);
z.string = "decTR";
~a = Slider(w, Rect(10, 340, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\decTR, ~a.value.postln);
});
~b = StaticText(w, Rect(220, 370, 50, 20)).background_(Color.rand);
~b.string = "levDelR";
~c = Slider(w, Rect(10, 370, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\levDelR, (~c.value * 0.5).postln);
});
~d = StaticText(w, Rect(220, 400, 50, 20)).background_(Color.rand);
~d.string = "fbL";
~e = Slider(w, Rect(10, 400, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\fbL, (~e.value * 0.1).postln);
});
~d = StaticText(w, Rect(220, 430, 50, 20)).background_(Color.rand);
~d.string = "fbR";
~e = Slider(w, Rect(10, 430, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\fbR, (~e.value * 0.1).postln);
});
~f = StaticText(w, Rect(220, 460, 50, 20)).background_(Color.rand);
~f.string = "ampL";
~g = Slider(w, Rect(10, 460, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\ampL, ~g.value.postln);
});
~h = StaticText(w, Rect(220, 490, 50, 20)).background_(Color.rand);
~h.string = "ampR";
~i = Slider(w, Rect(10, 490, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\ampR, ~i.value.postln);
});
);
)
(
~parts = Array.fill(12, { |i| i * 2 + 1});
~mulRate = Array.fill(12, { |i| i * 3 + 1});
~mulAmp = Array.fill(12, { |i| 1/((i+1)*3)});
~fbparts = Array.fill(12, { |i| i.rrand(3, 8) * 1});
);

a.set(\parts, ~parts)
a.set(\fbparts, ~fbparts)
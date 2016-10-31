(
(
SynthDef(\testGui, { |rateTrig = 1, fund, partsL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], partsR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], fb, fbpartsL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], fbpartsR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], rateMod, mulRateL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], mulRateR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], amp, mulAmpL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], mulAmpR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], att = 0.01, sus = 0.2, rel = 0.1, level = 0.5, delT = 0.06, decT = 0.5, levDel = 0.5|
	var outL, outR, trigEnv, delayL, delayR;
	trigEnv = Impulse.kr(rateTrig);
	outL = Mix.new(SinOscFB.ar(fund * partsL, fb * fbpartsL, SinOsc.kr(rateMod * mulRateL, 0, amp * mulAmpL))) * EnvGen.kr(Env.linen(att, sus, rel, level, \lin), trigEnv);
	outR = Mix.new(SinOscFB.ar(fund * partsR, fb * fbpartsR, SinOsc.kr(rateMod * mulRateR, 0, amp * mulAmpR))) * EnvGen.kr(Env.linen(att, sus, rel, level, \lin), trigEnv);
	delayL = AllpassC.ar(outL, 0.2, delT, decT, levDel);
	delayR = AllpassC.ar(outR, 0.2, delT, decT, levDel);
	OffsetOut.ar(0, outL);
	OffsetOut.ar(1, outL);
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

a = Synth(\testGui, [\fund, 220, \partsL, ~partsL, \partsR, ~partsR, \fb, 0.1, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \rateMod, 0.1, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \amp, 1, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR]);
//a.set(\rateTrig, 4);
//a = Synth(\testGui);
(
w = Window("test GUI", Rect(1000,1600, 300, 320)).front;
b = StaticText(w, Rect(220, 10, 40, 20)).background_(Color.rand);
b.string = "fund";
c = Slider(w, Rect(10, 10, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\fund, (55 + (385 * c.value)).postln);
});
d = StaticText(w, Rect(220, 40, 60, 20)).background_(Color.rand);
d.string = "rateMod";
e = Slider(w, Rect(10, 40, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\rateMod, 0.2 * e.value.postln);
});
f = StaticText(w, Rect(220, 70, 50, 20)).background_(Color.rand);
f.string = "attack";
g = Slider(w, Rect(10, 70, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\att, (g.value * 0.1).postln);
});
h = StaticText(w, Rect(220, 100, 60, 20)).background_(Color.rand);
h.string = "sustain";
i = Slider(w, Rect(10, 100, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\att, (i.value * 0.3).postln);
});
k = StaticText(w, Rect(220, 130, 60, 20)).background_(Color.rand);
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
n.string = "delT";
o = Slider(w, Rect(10, 190, 200, 20)).value_(0.5).step_(0.01).focus.action_({
	a.set(\delT, (o.value * 0.2).postln);
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
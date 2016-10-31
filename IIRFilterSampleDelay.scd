(
z = {
    var sig, freq;
    freq = MouseX.kr(20,12000,\exponential);
    sig = IIRFilter.ar( LFSaw.ar([freq * 0.99, freq * 1.01], 0, 0.1) ! 2, SinOsc.kr(SinOsc.kr(0.5),1.5pi,1550,1800), MouseY.kr(0.01,1,\linear));
     (CombN.ar(sig, 0.4, [0.4,0.35],2) * 0.4) + (sig * 0.5);
}.play)
z.release

(
SynthDef(\testDelay, { | rateDel = 0.2, trigImp = 0.5, attT = 0.01, decT = 0.5, freq = 49, addFreq1 = 0, addFreq2 = 0.3, fb = 0.2, ampMul = 0.25, ampDel = 0.75, ampFilt = 1 |
	var delay, out;
	delay = (SinOsc.kr(rateDel, 0, 22049, 1).abs.round(1)/44100);
	out = Decay2.ar(Impulse.ar(trigImp), attT, decT, SinOscFB.ar(freq + [addFreq1, addFreq2], SinOsc.kr(fb, 0, 0.6, 0.2), ampMul));
	OffsetOut.ar(0, IIRFilter.ar(out, MouseX.kr(49, 10000), MouseY.kr(0.01, 1), ampFilt);
	OffsetOut.ar(0, DelayC.ar(out, 1, delay, ampDel)));
}).add;
)

a = Synth(\testDelay);
a.set(\trigImp, 32);
a.set(\rateDel, 0.02);
a.set(\decT, 1);
a.set(\addFreq2, 4);
{(SinOsc.kr(0.02, 0, 22049, 1).abs.round(1)/44100).poll}.play;

(
w = Window("test GUI", Rect(1000,1600, 300, 320)).front;
b = StaticText(w, Rect(220, 10, 40, 20)).background_(Color.rand);
b.string = "rateDel";
c = Slider(w, Rect(10, 10, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\rateDel, (0.002 + (0.198 * c.value)).postln);
});
d = StaticText(w, Rect(220, 40, 60, 20)).background_(Color.rand);
d.string = "trigImp";
e = Slider(w, Rect(10, 40, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\trigImp, (0.5 + (128* e.value)).postln);
});
f = StaticText(w, Rect(220, 70, 50, 20)).background_(Color.rand);
f.string = "attT";
g = Slider(w, Rect(10, 70, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\attT, (0.01 + (0.09 * g.value)).postln);
});
h = StaticText(w, Rect(220, 100, 60, 20)).background_(Color.rand);
h.string = "decT";
i = Slider(w, Rect(10, 100, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\decT, (0.1 + (0.9 * i.value)).postln);
});
k = StaticText(w, Rect(220, 130, 60, 20)).background_(Color.rand);
k.string = "freq";
k = Slider(w, Rect(10, 130, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\freq, (49 + (k.value * 49*4)).postln);
});
l = StaticText(w, Rect(220, 160, 60, 20)).background_(Color.rand);
l.string = "addFreq1";
m = Slider(w, Rect(10, 160, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\addFreq1, m.value.postln);
});
n = StaticText(w, Rect(220, 190, 40, 20)).background_(Color.rand);
n.string = "addFreq2";
o = Slider(w, Rect(10, 190, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\addFreq2, (2 * o.value).postln);
});
p = StaticText(w, Rect(220, 220, 60, 20)).background_(Color.rand);
p.string = "fbRate";
q = Slider(w, Rect(10, 220, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\fb, q.value.postln);
});
r = StaticText(w, Rect(220, 250, 60, 20)).background_(Color.rand);
r.string = "ampMul";
t = Slider(w, Rect(10, 250, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\ampMul, t.value.postln);
});
u = StaticText(w, Rect(220, 280, 60, 20)).background_(Color.rand);
u.string = "amoDel";
v = Slider(w, Rect(10, 280, 200, 20)).value_(0).step_(0.01).focus.action_({
	a.set(\ampDel, v.value.postln);
});
);
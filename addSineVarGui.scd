(
SynthDef(\addSineComp, { |rateTrig = 0.5, dur = 1, level = 0.1, loDur = 0.05, hiDur = 0.2, loLev = 0.1, hiLev = 0.3, fund = 220, parts = #[0,0,0,0,0,0,0,0,0,0,0,0], fb = #[0,0,0,0,0,0,0,0,0,0,0,0]|
	var trig, env, out;
	trig = Impulse.kr(rateTrig);
	env = EnvGen.kr(Env.linen(dur*0.01, dur*0.16, dur*0.69, level * 0.8, -4), trig, doneAction:2);
	out = Mix.new(SinOscFB.ar(fund * parts, fb, env));
	out = LeakDC.ar(LPF.ar(out, 19000));
	OffsetOut.ar(0, out);
	OffsetOut.ar(0, AllpassC.ar(out, 0.2, 0.06));
}).add;


// {
// 	var trig;
// 	trig = Impulse.kr(0.5);
// Mix.new(SinOscFB.ar(MouseX.kr(220, 440)*~parts, ~fb, EnvGen.kr(Env.sine(TRand.kr(0.05, 0.2, trig).poll, TRand.kr(0.1, 0.3, trig)), trig))) }.play;


~parts = Array.fill(12, { |i| (i*2) + 1 });
~fb = Array.rand(12, 0.2, 0.7);
//~dur = Array.rand(12, 0.1, 0.05);
~dur = Array.fill(12, { |i| i * 0.05 + 0.05}).reverse;
~level = Array.rand(12, 0.2, 0.1);



p = Pbind(
	\instrument, \addSineComp,
	\parts, ~parts,
	\fund, PL(\fund),
	\dur, PL(\dur),
	\rateTrig, PL(\rateTrig),
	\fb, ~fb,
	\level, ~level
);



~specPairs = [\fund, [55, 200, \lin, 1, 55],
	\dur, [0.1, 1, \lin, 0.1, 0.1],
	\rateTrig, [10, 1, \lin, 1, 10]
];

v = VarGui(~specPairs, stream: p).gui;
)

1/0.05

(
var w;
w = Window(\testGui, Rect(1000,1600, 300, 300));
a = Slider(w, Rect(10, 10, 200, 20)).value_(0.5).step_(0.05).focus.action_({
	p.set(\fund, 55 + (1000 * a.value));
});
w.front;
)

{ EnvGen.kr(Env.linen(0.01, 0.16, 0.69, 0.4, -4), 1, doneAction:2)}.plot(1);
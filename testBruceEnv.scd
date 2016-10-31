(
// use shift-click to keep a node selected
w = Window("envelope", Rect(150 , Window.screenBounds.height - 250, 250, 100)).front;
w.view.decorator = FlowLayout(w.view.bounds);

b = EnvelopeView(w, Rect(0, 0, 230, 80))
    .drawLines_(true)

    .selectionColor_(Color.red)
    .drawRects_(true)
    .resize_(5)
    .step_(0.05)
    .action_({arg b; [b.index, b.value].postln})
    .thumbSize_(5)
    .value_([[0.0, 0.1, 0.5, 1.0],[0.1,1.0,0.8,0.0]]);
w.front;
)

b.setEnv(Env([0, 1, 0.3, 0], [0.01, 0.03, 0.2], [8, -8, -8]));
b.asEnv;

(
var winenv;
// a custom envelope
winenv = Env([0, 1, 0.3, 0], [0.01, 0.03, 0.2], [8, -8, -8]);
z = Buffer.sendCollection(s, winenv.discretize, 1);


SynthDef(\testEnvUpdate, { | rateAmp = 40, rateTrig = 1, rateDur = 20, loDur = 0.03, hiDur = 0.06, freq = 440, rateDev = 30, loDev = 0.5, hiDev = 2.0, ratePan = 40, envbufnum = -1, delT = 0.05, ratePanDel = 40, rateLevPan = 20 |
	var in, ampGrain;
	ampGrain = LFNoise0.kr(rateAmp).range(0.25, 0.65);
	in = GrainSin.ar(2, Impulse.kr(rateTrig), LFNoise0.kr(rateDur).range(loDur, hiDur), freq * LFNoise0.kr(rateDev).range(loDev, hiDev), LFNoise0.kr(ratePan).range(-1.0, 1.0), envbufnum, mul: ampGrain);
	OffsetOut.ar(0, in);
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, delT), LFNoise0.kr(ratePanDel).range(-1.0, 1.0), LFNoise0.kr(rateLevPan).range(0.25, 0.85) * ampGrain))
}).add;
)

a = Synth(\testEnvUpdate);
a.set(\envbufnum, z);
a.set(\envbufnum, -1);
a.set(\rateTrig, 20);
a.set(\rateTrig, 40);
a.set(\freq, 165);
a.set(\freq, 220);
a.set(\freq, 440);
a.set(\freq, 330);
a.set(\delT, 0.01);
a.set(\delT, 0.02);
a.set(\delT, 0.03);
a.set(\delT, 0.04);
a.set(\delT, 0.05);
a.set(\delT, 0.06);
a.set(\delT, 0.07);
a.set(\delT, 0.08);
a.set(\delT, 0.09);
a.set(\loDur, 0.035, \hiDur, 0.06);
a.set(\loDur, 0.025, \hiDur, 0.045);
a.set(\loDur, 0.015, \hiDur, 0.03);

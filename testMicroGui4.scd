(
SynthDef(\burstGrain, { |att = 0.01, sust = 0.05, dec = 0.3, gate = 1, density = 1, dur = 0.2, carfreq = 220, modfreq = 440, index = 1, left = 0, right = 1, delT = 0.000605, ampDel = 0.8 |
	var trig, env, in;
	trig = Impulse.kr(density);
	env = EnvGen.kr(Env([0, 1, 0.3, 0], [att, sust, dec], [8, -8, -8]), trig, doneAction: 2);
	in = GrainFM.ar(1, trig, dur, carfreq, modfreq, index, envbufnum: - 1);
	OffsetOut.ar(left, in * env);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel))
}).send(s);
);
(
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var attack, sustain, decay, impFreq, density, dur, carfreq, modfreq, index, delT, ampDel;

x = Window("BurstGrainEZ", Rect(1000, 0, 440, 300)).front;
x.front; // make window visible and front window.
x.view.decorator = FlowLayout(x.view.bounds);
x.view.decorator.gap=5@5;

startButton = Button(x, 75 @ 20);
startButton.states = [
    ["Start", Color.black, Color.green(0.7)],
    ["Stop", Color.white, Color.red(0.7)]
];
startButton.action = {|view| (view.value == 1).if  {
            // start sound
            node = Synth( "burstGrain", [
                "attack", attack.value,
                "sustain", sustain.value,
                "decay", decay.value,
                "density", density.value,
				"dur", dur.value,
				"carfreq", carfreq.value,
				"modfreq", modfreq.value,
				"index", index.value,
				"delT", delT.value,
				"ampDel", ampDel.value.dbamp
			]);
        } {
            // set gate to zero to cause envelope to release
            node.release; node.free;
        };
};
x.view.decorator.nextLine;
	attack = EZSlider(x, 430@20, "attack", ControlSpec(0.01, 0.1, \lin, 0.005, 0.01, "secs"),
		{ |ez| node.set(\att, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	sustain = EZSlider(x, 430@20, "sustain", ControlSpec(0.03, 0.2, \lin, 0.005, 0.01, "secs"),
		{ |ez| node.set(\sust, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	decay = EZSlider(x, 430@20, "decay", ControlSpec(0.1, 0.5, \lin, 0.05, 0.2, "secs"),
		{ |ez| node.set(\dec, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	density = EZSlider(x, 430@20, "density", ControlSpec(1, 100, \lin, 1.0, 20, "Imp/sec"),
		{ |ez| node.set(\density, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	dur = EZSlider(x, 430@20, "dur", ControlSpec(0.03, 0.2, \lin, 0.01, 0.05, "secs"),
		{ |ez| node.set(\dur, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	carfreq = EZSlider(x, 430@20, "carfreq", ControlSpec(200, 2000, \lin, 0.5, 400, "Hz"),
		{ |ez| node.set(\carfreq, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	modfreq = EZSlider(x, 430@20, "modfreq", ControlSpec(200, 1000, \lin, 0.5, 200, "Hz")
		{ |ez| node.set(\modfreq, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	index = EZSlider(x, 430@20, "index", ControlSpec(1, 20, \lin, 0.5, 1, "indFM"),
		{ |ez| node.set(\index, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	delT = EZSlider(x, 430@20, "delT", ControlSpec(0, 0.000999, \lin, 0.000005, 0.000605, "micro"),
		{ |ez| node.set(\delT, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampDel = EZSlider(x, 430@20, "ampDel", \db,
		{ |ez| node.set(\ampDel, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);

CmdPeriod.add({ startButton.value_(0)}).postln;

// stop the sound when window closes and remove cmdPeriodFunc.
x.onClose = {
    node.free; node = nil;
    CmdPeriod.remove(cmdPeriodFunc);
};
});
)
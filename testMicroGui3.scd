(
SynthDef(\burstSinGrain, { |density = 1, dur = 0.2, freq = 220, left = 0, right = 1, delT = 0.000605, ampDel = 0.8, ampGr = 0.8 |
	var trig, env, in;
	trig = Dust.kr(density);
	in = GrainSin.ar(1, trig, dur, freq * LFNoise0.kr(30).range(0.5, 4), envbufnum: - 1, mul: ampGr);
	OffsetOut.ar(left, in);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel))
}).send(s);
);
(
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var density, dur, freq, delT, ampDel, ampGr;

x = Window("BurstSinGrainEZ", Rect(1000, 0, 440, 300)).front;
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
            node = Synth( "burstSinGrain", [
                "density", density.value,
				"dur", dur.value,
				"freq", freq.value,
				"delT", delT.value,
				"ampDel", ampDel.value.dbamp,
			    "ampGr", ampGr.value.dbamp
			]);
        } {
            // set gate to zero to cause envelope to release
            node.release; node.free;
        };
};
x.view.decorator.nextLine;
	density = EZSlider(x, 430@20, "density", ControlSpec(1, 100, \lin, 1.0, 20, "Imp/sec"),
		{ |ez| node.set(\density, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	dur = EZSlider(x, 430@20, "dur", ControlSpec(0.03, 0.2, \lin, 0.01, 0.05, "secs"),
		{ |ez| node.set(\dur, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	freq = EZSlider(x, 430@20, "freq", ControlSpec(200, 2000, \lin, 0.5, 400, "Hz"),
		{ |ez| node.set(\freq, freq.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	delT = EZSlider(x, 430@20, "delT", ControlSpec(0, 0.000999, \lin, 0.000005, 0.000605, "micro"),
		{ |ez| node.set(\delT, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampDel = EZSlider(x, 430@20, "ampDel", \db,
		{ |ez| node.set(\ampDel, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampGr = EZSlider(x, 430@20, "ampGrain", \db,
		{ |ez| node.set(\ampGr, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);

cmdPeriodFunc = { startButton.value = 0};
CmdPeriod.add(cmdPeriodFunc.defer(0.04));

// stop the sound when window closes and remove cmdPeriodFunc.
x.onClose = {
    node.free; node = nil;
    CmdPeriod.removeAll(cmdPeriodFunc);
};
});
)
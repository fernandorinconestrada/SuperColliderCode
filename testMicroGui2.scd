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
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var attack, sustain, decay, impFreq, ampNoise, freqQ, bandWidth, ampFilt, delTime, ampDel;

x = Window("BurstEZ", Rect(1000, 0, 440, 300)).front;
x.front; // make window visible and front window.
x.view.decorator = FlowLayout(x.view.bounds);
x.view.decorator.gap=5@5;

startButton = Button(x, 75 @ 20);
startButton.states = [
    ["Start", Color.black, Color.green(0.7)],
    ["Stop", Color.white, Color.red(0.7)]
];
startButton.action = {|view| (view.value == 1)
		.if{
            // start sound
            node = Synth( "burst", [
                "attack", attack.value,
                "sustain", sustain.value,
                "decay", decay.value,
                "impulse", impFreq.value,
                "ampNoise", ampNoise.value.dbamp,
				"freqQ", freqQ.value,
				"bandWidth", bandWidth.value,
				"ampFilt", ampFilt.value.dbamp,
				"delTime", delTime.value,
				"ampDel", ampDel.value.dbamp]);
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
	impFreq = EZSlider(x, 430@20, "impFreq", ControlSpec(0.4, 20, \lin, 0.05, 0.2, "Hz"),
		{ |ez| node.set(\gate, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampNoise = EZSlider(x, 430@20, "ampNoise",\db,
		{ |ez| node.set(\ampNoise, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	freqQ = EZSlider(x, 430@20, "freqQ", ControlSpec(200, 2000, \lin, 0.1, 330, "Hz"),
		{ |ez| node.set(\freqQ, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	bandWidth = EZSlider(x, 430@20, "bandWidth", ControlSpec(0.01, 1, \lin, 0.01, 0.5, "Octave"),
		{ |ez| node.set(\bw, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampFilt = EZSlider(x, 430@20, "ampFilt",\db,
		{ |ez| node.set(\ampFilt, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	delTime = EZSlider(x, 430@20, "delTime", ControlSpec(0, 0.000999, \lin, 0.00005, 0.000605, "secs"),
		{ |ez| node.set(\delT, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampDel = EZSlider(x, 430@20, "ampDel",\db,
		{ |ez| node.set(\ampDel, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);

CmdPeriod.add({ startButton.value = 0 });

// stop the sound when window closes and remove cmdPeriodFunc.
x.onClose = {
    node.free; node = nil;
    CmdPeriod.remove(cmdPeriodFunc);
};
});
)
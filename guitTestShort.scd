(
s.waitForBoot({

var w, startButton, sliders;
var stopFunc, node;
var params, specs;

SynthDef(\testB, { |attT = 0.01, relT = 0.5, freq = 440, pha = 0, amp = 0.5, maxD = 0.2, delT = 0.1, decT = 0.5, ampF = 0.5, pos = 0, dens = 15, stop = 0|
	var env, in, gate;
		gate = Impulse.kr(dens);
		env = EnvGen.kr(Env.perc(attT, relT, 0.5, \sine), gate, doneAction: stop);
	in = AllpassC.ar(FSinOsc.ar(freq, pha, amp), maxD, delT, decT, ampF) * env;
	OffsetOut.ar(0, Pan2.ar(in, pos, 0.5))
}).add;

	params = [ "attT", "relT", "freq", "amp", "delT", "decT", "ampF", "pos", "dens"];
	specs = [
		ControlSpec(0.01, 0.05, \lin, 0.001, 0.04, \ms),
		ControlSpec(0.2, 1.2, \lin, 0.01, 0.5, \ms),
		ControlSpec(55, 880, \lin, 0.1, 220, \hz),
		ControlSpec(0.01, 0.8, \exp, 0.01, 0.4, \vol),
		ControlSpec(0.01, 0.2, \lin, 0.001, 0.1, \ms),
		ControlSpec(0.01, 0.5, \lin, 0.01, 0.2, \ms),
		ControlSpec(0.01, 0.8, \lin, 0.01, 0.4, \mix),
		ControlSpec(-1.0, 1.0, \lin, 0.1, 0.0, \bal),
		ControlSpec(0.01, 16, \lin, 0.01, 3.0, \imp),
		//ControlSpec(0.01, 0.8, \lin, 0.01, 0.01, \amp),
	];


w = Window("test", Rect(800, 800, 415, 265));
w.front;
w.view.decorator = FlowLayout(w.view.bounds);
w.view.decorator.gap=4@4;

startButton = Button(w, 50 @ 20);
startButton.states = [
    ["Start", Color.black, Color.green(0.7)],
    ["Stop", Color.white, Color.red(0.7)]
];
startButton.action = {|view|
		var args;
        if (view.value == 1) {
            // start sound
            params.do { |param, i|
				args = args.add(param);
				args = args.add(sliders[i].value)
			};
			node = Synth(\testB, args.postcs);
        } {
            // set gate to zero to cause envelope to release
			node.release; node.set(\dens, 0); node = nil;
        };
};

w.view.decorator.nextLine;
sliders = params.collect { |param, i|
		EZSlider(w, 400 @ 20, param, specs[i],
    {|ez| node.set( param, ez.value )}, unitWidth: 32)
        .setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	};

	stopFunc = { startButton.value = 0; };
	CmdPeriod.add(stopFunc);

	w.onClose = {
		 node.free; node = nil;
		    CmdPeriod.remove(stopFunc);
};
});
)
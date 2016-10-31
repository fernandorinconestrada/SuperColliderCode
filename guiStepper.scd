(
s.waitForBoot({

var w, startButton, sliders;
var stopFunc, node;
var params, specs;

SynthDef(\step, { |dens, res, min, max, step, resval, maxdel = 0.4, del = 0.1, dec = 0.5, ampfilt = 0.6, pos = 0, freq = 200, amp, gate = 1|
	var trig, in, counter, env;
		env = EnvGen.kr(Env.cutoff, gate, doneAction: 2);
	trig = Impulse.kr(dens.lag(0.2));
	counter = Stepper.kr(trig, res, min.lag(0.2), max.lag(0.2), step.lag(0.2), resval);
	in = SinOsc.ar(counter * freq.lag(0.2), 0, amp) * env;
		Out.ar(0, Pan2.ar(AllpassC.ar(in, maxdel, del.lag(0.2), dec, ampfilt), pos))
}).add;

	params = [ \dens, \res, \min, \max, \step, \resval, \del, \dec, \ampfilt, \pos, \freq, \amp];
	specs = [
		ControlSpec(0, 20, \lin, 1, 1, \imp),
		ControlSpec(0, 20, \lin, 1, 0, \step),
		ControlSpec(0, 20, \lin, 1, 0, \step),
		ControlSpec(0, 20, \lin, 1, 20, \step),
		ControlSpec(0, 20, \lin, 1, 0, \size),
		ControlSpec(0, 20, \lin, 1, 0, \val),
		ControlSpec(0.001, 0.05, \lin, 0.001, 0.02, \ms),
		ControlSpec(0.01, 0.4, \lin, 0.01, 0.2, \ms),
		ControlSpec(0.01, 0.8, \lin, 0.01, 0.4, \amp),
		ControlSpec(-1.0, 1.0, \lin, 0.01, 0.0, \bal),
		ControlSpec(20, 500, \lin, 0.01, 200, \hz),
		ControlSpec(0.01, 1.0, \exp, 0.01, 0.0, \vol),
	];

w = Window("Stepper", Rect(800, 800, 418, 315));
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
			node = Synth(\step, args.postcs);
        } {
            // set gate to zero to cause envelope to release
			node.release; node = nil;
        };
};

	w.view.decorator.nextLine;
sliders = params.collect { |param, i|
		EZSlider(w, 400 @ 20, param, specs[i],
    {|ez| node.set( param, ez.value )}, unitWidth: 35)
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
(
s = Server.local.boot;
(
SynthDef(\envBlipDecBruce, { | left = 0, right = 1, rateTrig = 1, devTrig = 10, levAtt = 1, levDec = 0.3, att = 0.01, sust = 0.04, dec = 0.12, curveAtt = 8, curveSust = -8, curveDec = -8, trigDec = 0.5, attDec2 = 0.001, decDec2 = 0.3, freq = 440, rateDev = 30, loDev = 0.9, hiDev = 1.1, numHarm = 20, rateHarm = 40, loHarm = 0.8, hiHarm = 1.2, ampGrain = 1, delT = 0.0006, ampDel = 0.8 |
	var trig, env, in;
	trig = Impulse.kr(rateTrig * LFNoise0.kr(devTrig).range(0.5, 2).poll(label: \impulse));
	//trig = Impulse.kr(SinOsc.kr(rateTrig).range(0.5, 100));
	env = EnvGen.kr(Env([0, levAtt, levDec, 0], [att, sust, dec], [curveAtt, curveSust, curveDec]), trig);
	in = Decay2.ar(Impulse.ar(trigDec), attDec2, decDec2, LPF.ar(Blip.ar(freq * LFNoise0.kr(rateDev).range(loDev, hiDev), (numHarm * LFNoise0.kr(rateHarm).range(loHarm, hiHarm)).round(1).poll(label: \harms), env), 19000, ampGrain));
	OffsetOut.ar(left, HPF.ar(in, 30));
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT.poll(1, \delayTime), ampDel))
}).add;
);
(
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var levAtt, levDec, att, sust, dec, curveAtt, curveSust, curveDec, rateTrig, trigDec, attDec2, decDec2, freq, rateDev, loDev, hiDev, numHarm, rateHarm, loHarm, hiHarm, ampGrain, delT, ampDel;

x = Window("Blip Decay", Rect(270, 800, 570, 610)).front;
x.front;
x.view.decorator = FlowLayout(x.view.bounds);
x.view.decorator.gap=5@5;

startButton = Button(x, 75 @ 20);
startButton.states = [
    ["Start", Color.black, Color.green(0.7)],
    ["Stop", Color.white, Color.red(0.7)]
];
startButton.action = {|view| (view.value == 1).if  {
            // start sound
            node = Synth( "envBlipDecBruce", [
			    "levAtt", levAtt.value,
                "levDec", levDec.value,
                "att", att.value,
                "dec", dec.value,
                "sust", sust.value,
				"curveAtt", curveAtt.value,
				"curveSust", curveSust.value,
				"curveDec", curveDec.value,
				"rateTrig", rateTrig.value,
				"trigDec", trigDec.value,
			    "attDec2", attDec2.value,
			    "decDec2", decDec2.value,
			    "freq", freq.value,
			    "rateDev", rateDev.value,
			    "loDev", loDev.value,
			    "hiDev", hiDev.value,
			    "numHarm", loDev.value,
			    "rateHarm", rateHarm.value,
			    "loHarm", loHarm.value,
			    "hiHarm", hiHarm.value,
			    "ampGrain", ampGrain.value.dbamp,
			    "delT", delT.value,
			    "ampDel", ampDel.value.dbamp
			]);
        } {
            // set gate to zero to cause envelope to release
            node.release; node.free;
        };
};
    x.view.decorator.nextLine;
	levAtt = EZSlider(x, 560@20, "levelAtt", ControlSpec(0.0, 1.0, \lin, 0.01, 1, "normAmp"),
		{ |ez| node.set(\levAtt, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	levDec = EZSlider(x, 560@20, "levDec", ControlSpec(0.0, 1.0, \lin, 0.01, 0.3, "normAmp"),
		{ |ez| node.set(\levDec, ez.value.dbamp)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	att = EZSlider(x, 560@20, "attGrain", ControlSpec(0.01, 0.029, \lin, 0.001, 0.01, "milli"),
		{ |ez| node.set(\att, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	sust = EZSlider(x, 560@20, "sustGrain", ControlSpec(0.03, 0.2, \lin, 0.001, 0.04, "milli"),
		{ |ez| node.set(\sust, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	dec = EZSlider(x, 560@20, "decGrain", ControlSpec(0.1, 1, \lin, 0.01, 0.12, "milli"),
		{ |ez| node.set(\dec, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	curveAtt = EZSlider(x, 560@20, "curveAtt", ControlSpec(-8, 8, \lin, 1, 8, "cave/vex"),
		{ |ez| node.set(\curvAtt, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	curveSust = EZSlider(x, 560@20, "curveSust", ControlSpec(-8, 8, \lin, 1, -8, "cave/vex"),
		{ |ez| node.set(\curveSust, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	curveDec  = EZSlider(x, 560@20, "curveDec", ControlSpec(-8, 8, \lin, 1, -8, "cave/vex")
		{ |ez| node.set(\curveDec, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	/*x.view.decorator.nextLine;
	rateTrig = EZSlider(x, 560@20, "innerImp", ControlSpec(0.005, 0.1, \lin, 0.001, 1, "imp/sec"),
		{ |ez| node.set(\rateTrig, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);*/
	x.view.decorator.nextLine;
	rateTrig = EZSlider(x, 560@20, "innerImp", ControlSpec(0.005, 50, \lin, 0.001, 1, "imp/sec"),
		{ |ez| node.set(\rateTrig, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	trigDec = EZSlider(x, 560@20, "envTrig", ControlSpec(0.5, 40, \lin, 0.01, 0.5, "imp/sec"),
		{ |ez| node.set(\trigDec, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	attDec2 = EZSlider(x, 560@20, "attEnv", ControlSpec(0.001, 0.1, \lin, 0.001, 0.001, "milli"),
		{ |ez| node.set(\attDec2, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	decDec2 = EZSlider(x, 560@20, "DecEnv", ControlSpec(0.02, 0.8, \lin, 0.01, 0.5, "milli"),
		{ |ez| node.set(\decDec2, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	freq = EZSlider(x, 560@20, "freq", ControlSpec(55, 880, \lin, 0.1, 440, "Hz."),
		{ |ez| node.set(\freq, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	rateDev = EZSlider(x, 560@20, "rateDev", ControlSpec(1, 50, \lin, 0.1, 20, "val/sec"),
		{ |ez| node.set(\rateDev, ez.value)}, -6, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	loDev = EZSlider(x, 560@20, "loDeviate", ControlSpec(0.1, 1, \lin, 0.01, 0.9, "octave"),
		{ |ez| node.set(\loDev, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	hiDev = EZSlider(x, 560@20, "hiDeviate", ControlSpec(1.0, 4, \lin, 0.01, 1.1, "octave"),
		{ |ez| node.set(\hiDev, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	numHarm = EZSlider(x, 560@20, "harmonics", ControlSpec(1, 200, \lin, 1, 20, "number"),
		{ |ez| node.set(\numHarm, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateHarm = EZSlider(x, 560@20, "changeHarms", ControlSpec(1, 50, \lin, 0.1, 40, "val/sec"),
		{ |ez| node.set(\rateHarm, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	loHarm = EZSlider(x, 560@20, "loNumHarm", ControlSpec(0.5, 1, \lin, 0.01, 0.8, "factor"),
		{ |ez| node.set(\loHarm, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	hiHarm = EZSlider(x, 560@20, "hiNumHarm", ControlSpec(1, 2, \lin, 0.01, 1.2, "factor"),
		{ |ez| node.set(\loHarm, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampGrain = EZSlider(x, 560@20, "ampGrain", \db,
		{ |ez| node.set(\ampGrain, ez.value.dbamp )}, -6, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	delT = EZSlider(x, 560@20, "delT", ControlSpec(0.000001, 0.001, \lin, 0.00001, 0.0006, "micro"),
		{ |ez| node.set(\delT, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(6);
	x.view.decorator.nextLine;
	ampDel = EZSlider(x, 560@20, "ampDelay", \db,
		{ |ez| node.set(\ampDel, ez.value.dbamp )}, -6, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
CmdPeriod.add({ startButton.value_(0)}).postln;
x.onClose = {
    node.free; node = nil;
    CmdPeriod.remove(cmdPeriodFunc);
};
});
);
(
f = FreqScope.new.window.bounds_(Rect(932, 255, 430, 230));
y = ServerMeter.new(s, 2, 2).window.bounds_(Rect(1135, 570 , 140, 240));
z = Stethoscope.new(s, 2).window.bounds_(Rect(855, 570 , 240, 240));
);
)


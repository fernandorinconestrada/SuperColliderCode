(
s= Server.local.boot;
(
SynthDef(\convBandPDustWhite, { | left = 0, right = 1, ampWhite = 2, freq = 440, rateFreqDev = 20, loDev = 0.5, hiDev = 2, rateBW = 30, loBW = 0.01, hiBW = 0.02, ampFilt = 1, trigDec = 0.5, attDec = 0.01, decDec = 0.5, impRate = 16, ampConv = 1, delT = 0.0006, ampDel = 0.8 |
	var trig, kernel, in;
	trig = Impulse.ar(trigDec);
	kernel = BBandPass.ar(WhiteNoise.ar(ampWhite), freq * LFNoise0.ar(rateFreqDev).range(loDev, hiDev), LFNoise0.kr(rateBW).range(loBW, hiBW), ampFilt);
	in = LPF.ar(Decay2.ar(trig, attDec, decDec, Convolution.ar(Impulse.ar(impRate), kernel, 512, ampConv)), 19000);
	OffsetOut.ar(left, HPF.ar(in, 30));
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT.poll(1, label: \delay), ampDel));
}).add;
);
(
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var impRate, ampWhite, freq, rateFreqDev, loDev, hiDev, rateBW, loBW, hiBW, ampFilt, trigDec, attDec, decDec, ampConv, delT, ampDel;

x = Window("Convolution Filtered White/Dust_a", Rect(270, 800, 570, 440)).front;
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
            node = Synth( "convBandPDustWhite", [
			    "impRate", impRate.value;
                "ampWhite", ampWhite.value,
                "freq", freq.value,
                "rateFreqDev", rateFreqDev.value,
                "loDev", loDev.value,
				"hiDev", hiDev.value,
				"rateBW", rateBW.value,
				"loBW", loBW.value,
				"hiBW", hiBW.value,
				"ampFilt", ampFilt.value.dbamp,
			    "trigDec", trigDec.value,
			    "attDec", attDec.value,
			    "decDec", decDec.value,
			    "ampConv", ampConv.value.dbamp,
			    "delT", delT.value,
			    "ampDel", ampDel.value.dbamp
			]);
        } {
            node.release; node.free;
        };
};
    x.view.decorator.nextLine;
	impRate = EZSlider(x, 560@20, "impulseRate", ControlSpec(0.5, 150, \lin, 0.01, 16, "imp/sec"),
		{ |ez| node.set(\impRate, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampWhite = EZSlider(x, 560@20, "ampWhite", ControlSpec(0.5, 4, \lin, 0.01, 2, "amp/norm"),
		{ |ez| node.set(\ampWhite, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	freq = EZSlider(x, 560@20, "freq", ControlSpec(100, 1000, \lin, 0.01, 440, "Hz"),
		{ |ez| node.set(\freq, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateFreqDev = EZSlider(x, 560@20, "rateDeviate", ControlSpec(0.3, 40, \lin, 0.1, 20, "val/sec"),
		{ |ez| node.set(\rateFreqDev, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	loDev = EZSlider(x, 560@20, "loTransp", ControlSpec(0.4, 1.0, \lin, 0.01, 0.5, "octave"),
		{ |ez| node.set(\loDev, ez.value)},  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	hiDev = EZSlider(x, 560@20, "hiTransp", ControlSpec(1.0, 6.0, \lin, 0.01, 2, "octave"),
		{ |ez| node.set(\hiDev, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateBW = EZSlider(x, 560@20, "rateBandWidth", ControlSpec(0.5, 30, \lin, 0.01, 30, "val/sec"),
		{ |ez| node.set(\rateBW, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	loBW = EZSlider(x, 560@20, "loBWrange", ControlSpec(0.001, 0.1, \lin, 0.001, 0.01, "octave")
		{ |ez| node.set(\loBW, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	hiBW = EZSlider(x, 560@20, "hiBWrange", ControlSpec(0.001, 1, \lin, 0.001, 0.05, "octave"),
		{ |ez| node.set(\hiBW, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	ampFilt = EZSlider(x, 560@20, "ampFilter", \db,
		{ |ez| node.set(\ampFilt, ez.value.dbamp)}, -6, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	trigDec = EZSlider(x, 560@20, "envTrig", ControlSpec(0.5, 100, \lin, 0.1, 0.5, "imp/sec"),
		{ |ez| node.set(\trigDec, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	attDec = EZSlider(x, 560@20, "attack", ControlSpec(0.001, 0.02, \lin, 0.001, 0.01, "milli"),
		{ |ez| node.set(\attDec, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
    x.view.decorator.nextLine;
	decDec = EZSlider(x, 560@20, "decay", ControlSpec(0.03, 0.5, \lin, 0.01, 0.5, "milli"),
		{ |ez| node.set(\decDec, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	ampConv = EZSlider(x, 560@20, "ampCon", \db,
		{ |ez| node.set(\ampConv, ez.value.dbamp)}, -6,  labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	delT = EZSlider(x, 560@20, "Delay", ControlSpec(0, 0.0001, \lin, 0.000001, 0.0006, "milli"),
		{ |ez| node.set(\delT, ez.value)}, labelWidth: 90, numberWidth:70, unitWidth: 70)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(6);
	x.view.decorator.nextLine;
	ampDel = EZSlider(x, 560@20, "ampDel", \db,
		{ |ez| node.set(\ampDel, ez.value.dbamp)}, -6, labelWidth: 90, numberWidth:70, unitWidth: 70)
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

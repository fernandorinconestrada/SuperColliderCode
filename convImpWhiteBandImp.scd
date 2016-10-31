(
SynthDef(\convBandPDustWhite, { | left = 0, right = 1, impRate = 20, ampWhite = 1, freq = 440, rateFreqDev = 20, loDev = 0.5, hiDev = 2, rateBW = 30, loBW = 0.01, hiBW = 0.5, ampFilt = 0.8, att = 0.01, dec = 0.05, ampConv = 0.8, delT = 0.000605, ampDel = 0.8 |
	var trig, kernel, in;
	trig = Impulse.ar(impRate);
	kernel = BBandPass.ar(WhiteNoise.ar(ampWhite), freq * LFNoise0.ar(rateFreqDev).range(loDev, hiDev), LFNoise0.kr(rateBW).range(loBW, hiBW), ampFilt);
	in = Decay2.ar(trig, att, dec, Convolution.ar(trig, kernel, 512, ampConv));
	OffsetOut.ar(left, in);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel));
}).add;
)

a = Synth(\convBandPDustWhite);

a.set(\impRate, 48);
a.set(\hiBW, 0.02);
a.set(\hiDev, 6);
a.set(\delT, 0.01);
a.set(\delT, 0.001);
a.set(\freq, 100);
a.set(\dec, 0.04);


b = Synth(\convBandPDustWhite);

b.set(\rateImp, 30);
b.set(\hiBW, 0.02);
b.set(\hiDev, 6);
a.set(\delT, 0.01);
a.set(\delT, 0.1);
b.set(\freq, 102);
b.set(\dec, 0.03);

(
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var impRate, ampWhite, freq, rateFreqDev, loDev, hiDev, rateBW, loBW, hiBW, ampFilt, att, dec, ampConv, delT, ampDel;

x = Window("Convolution Filtered White/Dust_a", Rect(1000, 0, 500, 410)).front;
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
                "ampWhite", ampWhite.value.dbamp,
                "freq", freq.value,
                "rateFreqDev", rateFreqDev.value,
                "loDev", loDev.value,
				"hiDev", hiDev.value,
				"rateBW", rateBW.value,
				"loBW", loBW.value,
				"hiBW", hiBW.value,
				"ampFilt", ampFilt.value.dbamp,
			    "att", att.value,
			    "dec", dec.value,
			    "ampConv", ampConv.value.dbamp,
			    "delT", delT.value,
			    "ampDel", ampDel.value.dbamp
			]);
        } {
            // set gate to zero to cause envelope to release
            node.release; node.free;
        };
};
    x.view.decorator.nextLine;
	impRate = EZSlider(x, 490@20, "impulseRate", ControlSpec(0.5, 150, \lin, 0.1, 20, "imp/sec"),
		{ |ez| node.set(\impRate, ez.value)}, numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampWhite = EZSlider(x, 490@20, "ampWhite", \db,
		{ |ez| node.set(\ampWhite, ez.value.dbamp)}, -6,  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	freq = EZSlider(x, 490@20, "freq", ControlSpec(100, 1000, \lin, 0.1, 450, "Hz"),
		{ |ez| node.set(\freq, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateFreqDev = EZSlider(x, 490@20, "rateDev", ControlSpec(0.3, 40, \lin, 0.2, 010, "val/sec"),
		{ |ez| node.set(\rateFreqDev, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	loDev = EZSlider(x, 490@20, "loTransp", ControlSpec(0.4, 1.0, \lin, 0.1, 0.5, "octave"),
		{ |ez| node.set(\loDev, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	hiDev = EZSlider(x, 490@20, "hiTransp", ControlSpec(1.0, 6.0, \lin, 0.1, 2, "octave"),
		{ |ez| node.set(\hiDev, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateBW = EZSlider(x, 490@20, "rateBandWidth", ControlSpec(0.5, 40, \lin, 0.1, 20, "val/sec"),
		{ |ez| node.set(\rateBW, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	loBW = EZSlider(x, 490@20, "loQrange", ControlSpec(0.001, 0.1, \lin, 0.001, 0.01, "octave")
		{ |ez| node.set(\loBW, ez.value)}, numberWidth: 60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	hiBW = EZSlider(x, 490@20, "hiQrange", ControlSpec(0.001, 1, \lin, 0.001, 0.5, "octave"),
		{ |ez| node.set(\hiBW, ez.value)}, numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	ampFilt = EZSlider(x, 490@20, "ampFilt", \db,
		{ |ez| node.set(\ampFilt, ez.value.dbamp)}, -6,  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	att = EZSlider(x, 490@20, "attack", ControlSpec(0.001, 0.02, \lin, 0.001, 0.01, "milli"),
		{ |ez| node.set(\att, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	dec = EZSlider(x, 490@20, "decay", ControlSpec(0.03, 0.2, \lin, 0.01, 0.05, "milli"),
		{ |ez| node.set(\dec, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	ampConv = EZSlider(x, 490@20, "ampCon", \db,
		{ |ez| node.set(\ampConv, ez.value.dbamp)}, -6,  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	delT = EZSlider(x, 490@20, "Delay", ControlSpec(0, 0.2, \lin, 0.001, 0.01, "milli"),
		{ |ez| node.set(\delT, ez.value)},  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow)
	.numberView.minDecimals_(3);
	x.view.decorator.nextLine;
	ampDel = EZSlider(x, 490@20, "ampDel", \db,
		{ |ez| node.set(\ampDel, ez.value.dbamp)}, -6,  numberWidth:60, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
CmdPeriod.add({ startButton.value_(0)}).postln;

// stop the sound when window closes and remove cmdPeriodFunc.
x.onClose = {
    node.free; node = nil;
    CmdPeriod.remove(cmdPeriodFunc);
};
});
)

(
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var impRate, ampWhite, freq, rateFreqDev, loDev, hiDev, rateBW, loBW, hiBW, ampFilt, att, dec, ampConv, delT, ampDel;

y = Window("Convolution Filtered White/Dust", Rect(1000, 0, 440, 360)).front;
y.front; // make window visible and front window.
y.view.decorator = FlowLayout(x.view.bounds);
y.view.decorator.gap=5@5;

startButton = Button(y, 75 @ 20);
startButton.states = [
    ["Start", Color.black, Color.green(0.7)],
    ["Stop", Color.white, Color.red(0.7)]
];
startButton.action = {|view| (view.value == 1).if  {
            // start sound
            node = Synth( "convBandPDustWhite", [
			    "impRate", impRate.value;
                "ampWhite", ampWhite.value.dbamp,
                "freq", freq.value,
                "rateFreqDev", rateFreqDev.value,
                "loDev", loDev.value,
				"hiDev", hiDev.value,
				"rateBW", rateBW.value,
				"loBW", loBW.value,
				"hiBW", hiBW.value,
				"ampFilt", ampFilt.value.dbamp,
			    "att", att.value,
			    "dec", dec.value,
			    "ampConv", ampConv.value.dbamp,
			    "delT", delT.value,
			    "ampDel", ampDel.value.dbamp
			]);
        } {
            // set gate to zero to cause envelope to release
            node.release; node.free;
        };
};
    y.view.decorator.nextLine;
	impRate = EZSlider(y, 430@20, "impulseRate", ControlSpec(0.5, 150, \lin, 0.1, 20, "imp/sec"),
		{ |ez| node.set(\impRate, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	ampWhite = EZSlider(y, 430@20, "ampWhite", \db,
		{ |ez| node.set(\ampWhite, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	freq = EZSlider(y, 430@20, "freq", ControlSpec(100, 1000, \lin, 0.1, 450, "Hz"),
		{ |ez| node.set(\freq, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	rateFreqDev = EZSlider(y, 430@20, "rateDev", ControlSpec(0.3, 40, \lin, 0.2, 010, "val/sec"),
		{ |ez| node.set(\rateFreqDev, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	loDev = EZSlider(y, 430@20, "loTransp", ControlSpec(0.4, 1.0, \lin, 0.1, 0.5, "octave"),
		{ |ez| node.set(\loDev, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	hiDev = EZSlider(y, 430@20, "hiTransp", ControlSpec(1.0, 6.0, \lin, 0.1, 2, "octave"),
		{ |ez| node.set(\hiDev, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	rateBW = EZSlider(y, 430@20, "rateBandWidth", ControlSpec(0.5, 40, \lin, 0.1, 20, "val/sec"),
		{ |ez| node.set(\rateBW, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	loBW = EZSlider(y, 430@20, "loQrange", ControlSpec(0.01, 0.1, \lin, 0.01, 0.01, "octave")
		{ |ez| node.set(\loBW, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	hiBW = EZSlider(y, 430@20, "hiQrange", ControlSpec(0.01, 1, \lin, 0.01, 0.5, "octave"),
		{ |ez| node.set(\hiBW, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	ampFilt = EZSlider(y, 430@20, "ampFilt", \db,
		{ |ez| node.set(\ampFilt, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	att = EZSlider(y, 430@20, "attack", ControlSpec(0.001, 0.02, \lin, 0.001, 0.01, "milli"),
		{ |ez| node.set(\att, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    y.view.decorator.nextLine;
	dec = EZSlider(y, 430@20, "decay", ControlSpec(0.03, 0.2, \lin, 0.01, 0.05, "milli"),
		{ |ez| node.set(\dec, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    y.view.decorator.nextLine;
	ampConv = EZSlider(y, 430@20, "ampCon", \db,
		{ |ez| node.set(\ampConv, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    y.view.decorator.nextLine;
	delT = EZSlider(y, 430@20, "Delay", ControlSpec(0, 0.2, \lin, 0.001, 0.01, "milli"),
		{ |ez| node.set(\delT, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	y.view.decorator.nextLine;
	ampDel = EZSlider(y, 430@20, "ampDel", \db,
		{ |ez| node.set(\ampDel, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
CmdPeriod.add({ startButton.value_(0)}).postln;

// stop the sound when window closes and remove cmdPeriodFunc.
y.onClose = {
    node.free; node = nil;
    CmdPeriod.remove(cmdPeriodFunc);
};
});
)

CmdPeriod.removeAll;
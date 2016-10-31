(
SynthDef(\convBandPDustWhite, { | left = 0, right = 1, ampWhite = 1, freq = 440, rateFreqDev = 20, loDev = 0.5, hiDev = 2, rateBW = 30, loBW = 0.01, hiBW = 0.5, ampFilt = 0.8, rateImp = 12, ampConv = 0.8, delT = 0.000605, ampDel = 0.8 |
	var kernel, in;
	kernel = BBandPass.ar(WhiteNoise.ar(ampWhite), freq * LFNoise0.ar(rateFreqDev).range(loDev, hiDev), LFNoise0.kr(rateBW).range(loBW, hiBW), ampFilt);
	in = Convolution.ar(Dust.ar(rateImp), kernel, 512, ampConv);
	OffsetOut.ar(left, in);
	OffsetOut.ar(right, DelayC.ar(in, 0.2, delT, ampDel));
}).add;
)

a = Synth(\convBandPDustWhite);

a.set(\rateImp, 20);
a.set(\hiBW, 0.1);
a.set(\hiDev, 6);
a.set(\delT, 0.01);
a.set(\delT, 0.1);

(
s.waitForBoot({

var node, cmdPeriodFunc;
var startButton;
var ampWhite, freq, rateFreqDev, loDev, hiDev, rateBW, loBW, hiBW, ampFilt, rateImp, ampConv, delT, ampDel;

x = Window("Convolution Filtered White/Dust", Rect(1000, 0, 440, 360)).front;
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
                "ampWhite", ampWhite.value.dbamp,
                "freq", freq.value,
                "rateFreqDev", rateFreqDev.value,
                "loDev", loDev.value,
				"hiDev", hiDev.value,
				"rateBW", rateBW.value,
				"loBW", loBW.value,
				"hiBW", hiBW.value,
				"ampFilt", ampFilt.value.dbamp,
			    "rateImp", rateImp.value,
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
	ampWhite = EZSlider(x, 430@20, "ampWhite", \db,
		{ |ez| node.set(\ampWhite, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	freq = EZSlider(x, 430@20, "freq", ControlSpec(100, 1000, \lin, 0.1, 450, "Hz"),
		{ |ez| node.set(\freq, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateFreqDev = EZSlider(x, 430@20, "rateDev", ControlSpec(0.3, 40, \lin, 0.2, 010, "val/sec"),
		{ |ez| node.set(\rateFreqDev, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	loDev = EZSlider(x, 430@20, "loTransp", ControlSpec(0.4, 1.0, \lin, 0.1, 0.5, "octave"),
		{ |ez| node.set(\loDev, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	hiDev = EZSlider(x, 430@20, "hiTransp", ControlSpec(1.0, 6.0, \lin, 0.1, 2, "octave"),
		{ |ez| node.set(\hiDev, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateBW = EZSlider(x, 430@20, "rateBandWidth", ControlSpec(0.5, 40, \lin, 0.1, 20, "val/sec"),
		{ |ez| node.set(\rateBW, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	loBW = EZSlider(x, 430@20, "loQrange", ControlSpec(0.01, 0.1, \lin, 0.01, 0.01, "octave")
		{ |ez| node.set(\loBW, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	hiBW = EZSlider(x, 430@20, "hiQrange", ControlSpec(0.1, 2, \lin, 0.01, 0.5, "octave"),
		{ |ez| node.set(\hiBW, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampFilt = EZSlider(x, 430@20, "ampFilt", \db,
		{ |ez| node.set(\ampFilt, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	rateImp = EZSlider(x, 430@20, "DustImp", ControlSpec(0.5, 40, \lin, 0.1, 10, "imp/sec"),
		{ |ez| node.set(\rateImp, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	ampConv = EZSlider(x, 430@20, "ampCon", \db,
		{ |ez| node.set(\ampConv, ez.value.dbamp)}, -6, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
    x.view.decorator.nextLine;
	delT = EZSlider(x, 430@20, "Delay", ControlSpec(0, 0.2, \lin, 0.001, 0.01, "milli"),
		{ |ez| node.set(\delT, ez.value)}, unitWidth: 60)
	.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
	x.view.decorator.nextLine;
	ampDel = EZSlider(x, 430@20, "ampCon", \db,
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
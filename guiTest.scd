(
s.waitForBoot({

var w, startBut, frqKtrl, ampKtrl, densKtrl, panKtrl;
var cmdPeriodFunc, node;

SynthDef(\test, { |attT = 0.01, relT = 0.5, freq = 440, pha = 0, amp = 0.5, maxD = 0.2, delT = 0.1, decT = 0.5, ampF = 0.5, pos = 0, dens = 20|
	var env, in, gate;
		gate = Impulse.kr(dens, 0, 0.8);
		env = EnvGen.kr(Env.perc(attT, relT, 0.5, \sine), gate);
	in = AllpassC.ar(FSinOsc.ar(freq, pha, amp), maxD, delT, decT, ampF);
	OffsetOut.ar(0, Pan2.ar(in, pos, 0.5) * env)
}).add;

w = Window("test", Rect(860, 800, 400, 200));
w.front;
w.view.decorator = FlowLayout(w.view.bounds);
w.view.decorator.gap=2@2;

startBut = Button(w, 50 @ 20);
startBut.states = [
    ["Start", Color.black, Color.green(0.7)],
    ["Stop", Color.white, Color.red(0.7)]
];
startBut.action = {|view|
        if (view.value == 1) {
            // start sound
            node = Synth( \test, [
                "freq", frqKtrl.value,
                "amp",  ampKtrl.value.dbamp,
				"dens", densKtrl.value,
				"pos",  panKtrl.value]);
        } {
            // set gate to zero to cause envelope to release
			           node.release; node.set(\dens, 0); node = nil;
        };
};

w.view.decorator.nextLine;
frqKtrl = EZSlider(w, 400 @ 20, "freq", ControlSpec(440, 660, \lin, 1, 550, \hz),
    {|ez| node.set( "freq", ez.value )}, unitWidth: 32)
        .setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);

w.view.decorator.nextLine;
ampKtrl = EZSlider(w, 400 @ 20, "amp ", \db,
    {|ez| node.set( "amp", ez.value.dbamp )}, -6, unitWidth: 32)
        .setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);

w.view.decorator.nextLine;
densKtrl = EZSlider(w, 400 @ 20, "dens", ControlSpec(0.1, 16, \lin, 0.1, 1, \den),
    {|ez| node.set( "dens", ez.value )}, unitWidth: 32)
        .setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);

w.view.decorator.nextLine;
panKtrl = EZSlider(w, 400 @ 20, "pan ", \bipolar,
    {|ez| node.set( "pos", ez.value )}, unitWidth: 32)
        .setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);

	cmdPeriodFunc = { startBut.value = 0; }.defer(0.5);
	CmdPeriod.add(cmdPeriodFunc);

	w.onClose = {
		 node.free; node = nil;
		    CmdPeriod.remove(cmdPeriodFunc);
};
});
)

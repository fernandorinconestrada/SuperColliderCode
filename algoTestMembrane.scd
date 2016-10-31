(
SynthDef(\algoTestMembrane, { |bus = #[0,1,2,3,4,5,6,7], densTrig =  0.5, ampTrig = 0.3, decay= 1, levNoise = 0.3, amp = 0.9, delDecay = 1, ampDelay = 1|
	var trig, delTrig, tension, loss, excite, in;
	trig = Impulse.ar(densTrig, 0, ampTrig);
	loss = EnvGen.ar(Env([TRand.ar(0.99, 0.999999, trig), TRand.ar(0.99, 0.999999, trig), 0.999], [1.9999, 0]), trig).poll(label: \env);
	delTrig = (1/TRand.ar(4, 16, trig)).poll(label: \delTrig);
	tension = TRand.ar(0.06, 0.2, trig).poll(label: \tension);
	//loss = TRand.ar(0.999999, 0.999, trig).poll(label: \loss);
	excite = Decay2.ar(trig, 0.01, decay, PinkNoise.ar(levNoise));
	in = MembraneCircle.ar(excite, tension, loss, amp);
	OffsetOut.ar(bus.at(0), in);
	OffsetOut.ar(bus.at(1), Decay2.ar(TDelay.ar(trig, delTrig*1), 0.01, decay * 0.9, in*ampDelay*0.9));
	OffsetOut.ar(bus.at(2), Decay2.ar(TDelay.ar(trig, delTrig*2), 0.01, decay * 0.8, in*ampDelay*0.8));
	OffsetOut.ar(bus.at(3), Decay2.ar(TDelay.ar(trig, delTrig*3), 0.01, decay * 0.7, in*ampDelay*0.7));
	OffsetOut.ar(bus.at(4), Decay2.ar(TDelay.ar(trig, delTrig*4), 0.01, decay * 0.6, in*ampDelay*0.6));
	OffsetOut.ar(bus.at(5), Decay2.ar(TDelay.ar(trig, delTrig*5), 0.01, decay * 0.5, in*ampDelay*0.5));
	OffsetOut.ar(bus.at(6), Decay2.ar(TDelay.ar(trig, delTrig*6), 0.01, decay * 0.4, in*ampDelay*0.4));
	OffsetOut.ar(bus.at(7), Decay2.ar(TDelay.ar(trig, delTrig*7), 0.01, decay * 0.3, in*ampDelay*0.3));
}).send(s);
)

a = Synth(\algoTestMembrane);
a.set(\densTrig, 8);
a.set(\amp, 0.3);
a.set(\ampTrig, 0.1);
a.set(\decay, 0.3);
a.set(\bus, ~bus);

~bus = (0..7).scramble;
~bus = (0..7).reverse;
~bus = (0..7);
~bus = (0..7).reverse.scramble;

0.5/0.5;
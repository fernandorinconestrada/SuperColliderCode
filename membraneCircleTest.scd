(
{ OffsetOut.ar(0, MembraneCircle.ar(Decay2.ar(Impulse.ar(1, 0, 0.5), 0.01, 0.5, PinkNoise.ar(0.3), SinOsc.kr(0.02, 0, 0.024, 0.024).poll(label: 'tension'), SinOsc.kr(0.03, 0, 0.024, 0.024).poll(label:'loss')))) }.play;
)

(
SynthDef(\membraneTest, { |rateTrig = 1, tension = 0.05, loss = 0.999, delT = 0.05, decT = 1, ampDel = 0.7, bus = 0|
	var trig, excitation, out, del;
	trig = Impulse.ar(rateTrig, 0, 0.5);
	excitation = Decay2.ar(trig, 0.01, 0.5, PinkNoise.ar(0.3));
	out = MembraneCircle.ar(excitation, tension, loss);
	del = AllpassC.ar(out, 0.2, delT, decT, ampDel);
	OffsetOut.ar(bus, [out, del]);
}).add;
)

(
SynthDef(\membraneDynTest, { |rateTrig = 1, ampImp = 0.7, decay = 0.7, ratePink = 0.5, rateTens = 0.02, loTens = 0.01 , hiTens = 0.1, rateLoss = 0.03, loLoss = 0.0999999, hiLoss = 0.999, delT = 0.07, decT = 1, ampDel = 0.7, bus = 0|
	var trig, excitation, tension, loss, del, out;
	trig = Impulse.ar(rateTrig, 0, ampImp);
	excitation = Decay2.ar(trig, 0.01, decay, PinkNoise.ar(ratePink));
	tension = SinOsc.kr(rateTens).range(loTens, hiTens);
	loss = SinOsc.kr(rateLoss).range(loLoss, hiLoss);
	out = MembraneCircle.ar(excitation, tension, loss);
	del = AllpassC.ar(out, 0.2, delT, decT, ampDel);
	OffsetOut.ar(bus, [out, del]);
}).add;
)

a = Synth(\membraneDynTest);
a.set(\loTens, 0.5, \hiTens, 0.01);
a.set(\rateTens, 0.002, \rateLoss, 0.002);
a.set(\rateTrig, 1);
a.set(\delT, 0.05);

b = Synth(\membraneTest);
b.set(\tension, 0.07, \loss, 0.999999);
b.set(\tension, 0.03, \loss, 0.999999);
b.set(\tension, 0.03, \loss, 0.999);
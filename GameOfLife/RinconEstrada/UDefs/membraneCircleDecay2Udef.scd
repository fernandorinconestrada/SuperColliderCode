(
Udef( \membraneCircleDecay, { |gate = 1, decT = 1, mulGray = 0.05, fund = 440, constBw = 0.01, constAmp = 0.1, tension = 0.1, loss = 0.99999|
    var trig, env;
    trig = Impulse.ar(gate);
	env = EnvGen.ar(Env.perc(0.01, 0.1), Impulse.ar(gate*LFNoise0.ar(2, 7, 1).abs.poll), constAmp);
	UMixOut.ar(0, Decay2.ar(trig, 0.01, decT, MembraneCircle.ar(Mix.new(BBandPass.ar(GrayNoise.ar(mulGray), fund*[1,2,3,4,5,6,7,8,9,10,11,12], constBw*[1,1,1,1,1,1,1,1,1,1,1,1], env*[1,1,1,1,1,1,1,1,1,1,1,1])), tension, loss)), 0, true);
} ).setSpec(\gate, [0.2, 20, \lin, 0.1, 1])
.setSpec(\decT, [0.2, 1, \lin, 0.1, 1])
.setSpec(\mulGray, [0.05, 0.2, \lin, 0.01, 0.05])
.setSpec(\fund, [55, 2000, \lin, 0.1, 110])
.setSpec(\constBw, [0.001, 0.2, \lin, 0.001, 0.01])
.setSpec(\constAmp, [0.01, 0.4, \lin, 0.01, 0.1])
.setSpec(\tension, [0.01, 0.5, \lin, 0.01, 0.1])
.setSpec(\loss, [0.9999, 0.99999, \lin, 0.00001, 0.99999]);
)

a = UChain(\membraneCircleDecay);
a.gui;

(
Udef( \membraneCircleDecay2, { |gate = 1, decT = 1, mulGray = 0.05, fund = 440, constBw = 0.01, constAmp = 0.1, tension = 0.1, loss = 0.99999|
    var trig, env;
    trig = Impulse.ar(gate);
	env = EnvGen.ar(Env.perc(0.01, LFNoise0.kr(4, 0.04, 0.1).abs), Impulse.ar(gate*LFNoise0.ar(2, 7, 1).abs.poll), constAmp);
	UMixOut.ar(0, Decay2.ar(trig, 0.01, decT, MembraneCircle.ar(Mix.new(BBandPass.ar(GrayNoise.ar(mulGray), fund*[1,2,3,4,5,6,7,8,9,10,11,12], constBw*[1,1,1,1,1,1,1,1,1,1,1,1], env*[1,1,1,1,1,1,1,1,1,1,1,1])), tension, loss)), 0, true);
} ).setSpec(\gate, [0.2, 20, \lin, 0.1, 1])
.setSpec(\decT, [0.2, 1, \lin, 0.1, 1])
.setSpec(\mulGray, [0.05, 0.2, \lin, 0.01, 0.05])
.setSpec(\fund, [55, 2000, \lin, 0.1, 110])
.setSpec(\constBw, [0.001, 0.2, \lin, 0.001, 0.01])
.setSpec(\constAmp, [0.01, 0.4, \lin, 0.01, 0.1])
.setSpec(\tension, [0.01, 0.5, \lin, 0.01, 0.1])
.setSpec(\loss, [0.9999, 0.99999, \lin, 0.00001, 0.99999]);
)

b = UChain(\membraneCircleDecay2);
b.gui;

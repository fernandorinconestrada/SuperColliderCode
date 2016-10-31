Udef( \membraneCircle, { |multNois = 0.05, trig = 1, fund = 220, constBw = 0.1, constAmps = 0.1, tension = 0.1, loss = 0.99999|
	var env;
	env = EnvGen.ar(Env.perc, Impulse.kr(trig));
	UMixOut.ar( 0, MembraneCircle.ar(Mix.new(BBandPass.ar(GrayNoise.ar(multNois), fund*[1,2,3,4,5,6,7,8,9], constBw*[1,1,1,1,1,1,1,1,1], constAmps*[1,1,1,1,1,1,1,1,1])), tension, loss)* env, 0, true ) 
} ).setSpec( \fund, FreqSpec( 2, 2000 ) )
	.setSpec( \trig, ControlSpec(0.1, 20, \exponential, 0.1, 1))
	.setSpec( \constBw, ControlSpec(0.01, 0.1, \exponential, 0.01, 0.01))
	.setSpec( \cnstAmps, ControlSpec(0.01, 0.1, \exponential, 0.01, 0.01))
	.setSpec( \tension, ControlSpec(0.05, 0.5, \exponential, 0.01, 0.1))
	.setSpec( \loss, ControlSpec(0.9999, 0.99999, \exponential, 0.00001, 0.99999));

(
x = UChain ( [\membraneCircle] );
x.gui;
)
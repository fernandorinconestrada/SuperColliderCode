o = s.options;
o.numOutputBusChannels = 32;

{
	var trig;
	trig = Impulse.kr(1);
	Out.ar(Stepper.kr(trig, 0, 0, 7, 1, 7), WhiteNoise.ar(0.05)*EnvGen.kr(Env.perc(0.01, 0.02), trig))
}.play;

{Out.ar((0..7), WhiteNoise.ar(0.05))}.play;

/*Varese Routing
Chan1 PanL Bus 1-2
Chan2 PanL Bus 7-8
Chan3 PanR Bus 1-2
Chan4 PanR Bus 5-6
Chan5 PanR Bus 3-4
Chan6 PanR Bus 7-8
Chan7 PanL Bus 3-4
Chan8 PanL Bus 5-6

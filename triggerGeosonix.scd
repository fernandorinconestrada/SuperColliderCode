(
SynthDef(\beaconEnv, { |bus = 1, gate = 1|
	var env;
	env = EnvGen.kr(Env.perc, gate);
	Out.ar(bus, PMOsc.ar(55, 110, 3.07, 0.5) * env)
}).send(s);
)

a = (\beaconEnv);

OSCdef(\gate, { |msg, time, addr, recvPort| a.set(\gate, msg.[1]) }, "//trig1", nil, 57141);
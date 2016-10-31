(
SynthDef(\geosonix, {arg attack = 0.04, release= 0.6, trig = 5, level = 0.5;
	var env, spread, center;
	spread = MouseX.kr(-1, 1, 0, 0.2);
	center = MouseY.kr(0, 1.0, 0, 0.2);
	env = EnvGen.kr(Env.perc(attack, release, 1, -4), Impulse.kr(trig), 1, 0, 1);
	Out.ar(0,
		    Splay.arFill(21, { |i|
			Pulse.ar( (i + 2 * 100).postln, (i + 0.02 * 0.01).postln, 0.8) * env},
			spread.postln, level, center));
}).send(s)
)
x = Synth(\geosonix);
y = Synth(\geosonix);
(
OSCdef(\trigger_1, {|msg, time, addr, recvPort| x.set(\trig, (msg[1] * -1).postln)},"/trigger", nil, 57130);//size in seconds range 0 to 0.3 secs
OSCdef(\trigger_2, {|msg, time, addr, recvPort| y.set(\trig, msg[1].postln)},"/trigger_1", nil, 57130);//size in seconds range 0 to 0.3 secs
)
(
SynthDef(\geosonix_2, { arg trig_a;
	var env, gate;
	gate = Trig1.kr(trig_a, 0.025);
	env = EnvGen.kr(Env.perc(0.01, 1, 1, -4), gate, 1, 0, 1, 2);
	Out.ar(0,
		Blip.ar(trig_a, 4, 0.2, -0.20).dup(10) * env);
}).send(s);
)

x = Synth(\geosonix_2);
y = Synth(\geosonix_2);

(
OSCdef(\trigger_3, {|msg, time, addr, recvPort| x.set(\trig_a, msg[1].postln)},"/circle", nil, 57130);//size in seconds range 0 to 0.3 secs
OSCdef(\trigger_4, {|msg, time, addr, recvPort| y.set(\trig_a, msg[1].postln)},"/circle", nil, 57130);//size in seconds range 0 to 0.3 secs
)

(
SynthDef(\geosonix_3, { arg carrier, modulator;
	Splay.arFill(10,{
		GrainFM.ar(1, Dust.kr(TIRand.kr(0, 20, Impulse.kr(50))), TRand.kr(0.01, 0.025, Impulse.kr(10)), carrier, modulator, TIRand.kr(1, 15, Impulse.kr(25)), -1)}, MouseX.kr(0.1,1), 1, MouseY.kr(-1, 1));
}).send(s);
)

x = Synth(\geosonix_3);
y = Synth(\geosonix_3);
x.plot(minval:50, maxval:1000);

(
OSCdef(\trigger_5, {|msg, time, addr, recvPort| x.set(\carrier, msg[1].postln)},"/circle", nil, 57130);//size in seconds range 0 to 0.3 secs
	OSCdef(\trigger_6, {|msg, time, addr, recvPort| x.set(\modulator, msg[1].postln)},"/circle_1", nil, 57130);//size in seconds range 0 to 0.3 secs
OSCdef(\trigger_6, {|msg, time, addr, recvPort| y.set(\carrier, msg[1].postln)},"/circle", nil, 57130);//size in seconds range 0 to 0.3 secs
	OSCdef(\trigger_7, {|msg, time, addr, recvPort| y.set(\modulator, msg[1].postln)},"/circle_1", nil, 57130);//size in seconds range 0 to 0.3 secs
)
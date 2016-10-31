(
SynthDef(\tone_ping, { |freq = #[0,0,0,0,0,0,0,0], pha = #[0,0,0,0,0,0,0,0], amp = #[1,1,1,1,1,1,1,1], out = 0|
	var  env, decay, dur;
	decay = LFNoise2.kr(10).range(0.05, 0.5);
	dur = LFNoise2.kr(10).range(0.01, 0.03);
	env = EnvGen.kr(Env.perc(dur, decay), doneAction: 2);
	Out.ar(out, SinOsc.ar(freq, pha, amp) *env)
}).add;
)

a = Array.fill( 13, { |deg| 440*(3**(deg/13)) } );
b = Array.fill(8, { |amp| (0.8/32**amp + 0.05) * 0.1 } );
c = Array.fill(8, { |pha| pha + 2pi/8 } );
(
x = Prout({
	Synth(\tone_ping, [freq: [ a.choose ].postln, pha: [c], amp: [b], out: 0]);
	Synth(\tone_ping, [freq: [ a.choose ].postln, pha: [c], amp: [b], out: 0]);
	0.065.wait;
	Synth(\tone_ping, [freq: [ a.choose ].postln, pha: [c], amp: [b], out: 1]);
	Synth(\tone_ping, [freq: [ a.choose ].postln, pha: [c], amp: [b], out: 1]);
	2.wait;
}).repeat(10);
x.play;
)
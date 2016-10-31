a = Array.fill( 13, { |deg| 440*(3**(deg/13)) } );
b = Array.fill(8, { |amp| (0.8/32**amp + 0.05) * 0.3 } );
c = Array.fill(8, { |pha| pha + 2pi/8 } );
a.asCollection;

(
SynthDef(\tone, { |freq = #[0,0,0,0,0,0,0,0], pha = #[0,0,0,0,0,0,0,0], amp = #[1,1,1,1,1,1,1,1]|
	Out.ar(0, SinOsc.ar(freq, pha, amp))
}).add;
)

(
SynthDef(\tone_ping, { |freq = #[0,0,0,0,0,0,0,0], pha = #[0,0,0,0,0,0,0,0], amp = #[1,1,1,1,1,1,1,1]|
	var  env, decay, dur;
	decay = LFNoise2.kr(10).range(0.05, 0.5);
	dur = LFNoise2.kr(10).range(0.01, 0.03);
	env = EnvGen.kr(Env.perc(dur, decay), doneAction: 2);
	Out.ar(0, SinOsc.ar(freq, pha, amp) *env)
}).add;
)

d = Synth(\tone, [freq: [ a.choose ].postln, pha: [c], amp: [b] ]);
d.free;
e = Synth(\tone_ping, [freq: [ a.choose ].postln, pha: [c], amp: [b] ]);
e.free;
f = LFNoise2.kr(0.2).range(0.2, 0.8);
f.asArray;

(
Pbind(
	\instrument, \tone_ping,
	\freq, Prand([a.choose], inf),
	\dur, Pseq([0.2, 0.7, 1.3], inf)
).play;
)



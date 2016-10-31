{SinOsc.ar(440, 0, 0.3)}.play;
{SinOsc.ar((0.midiratio)*440, 0, 0.3)}.play
{SinOsc.ar((4.midiratio)*440, 0, 0.3)}.play
{SinOsc.ar((7.midiratio)*440, 0, 0.3)}.play


{SinOsc.ar(60.midicps, 0, 0.1)}.play;
{SinOsc.ar(60.5.midicps, 0, 0.1)}.play;
{SinOsc.ar(60.11.midicps, 0, 0.1)}.play;
{SinOsc.ar(60.53.midicps, 0, 0.1)}.play;

(
Pbind(
	\midinote, Pseq([0,2.04,3.86,4.98,7.02] + 60, 2), \dur, 0.3
).play
)

(
Pbind(
	\midinote, Pseq([0,2,4,5,7] + 60, 2), \dur, 0.3
).play
)


(
Pbind(
	\note, Pseq([0, 2, 3, 5, 7, 8, 10, 12], 2),
	\dur, 0.3,
	\octave, 5,
).play
)

(
Pbind(
	\degree, Pseq([0, 2, 3, 5, 7, 8, 10, 12, 13], 2),
	\dur, 0.3,
	\octave, 5,
	\scale, (0..11)
).play
)

(
Pbind(
	\note, Pwhite(-6, 9, inf),
	\dur, Pseq([0.3, 0.2, 0.5, 0.2, 0.3], inf),
	\sustain, Pwhite(0.9, 1.3, inf),
	\stepsPerOctave, 7,
	\octave, 4
).play
)

//// key \note range is controlled with \octave, octave remains changed until new value is updated, maybe lookup what is default value for it ///

(
Pbind(
	\note, Pwhite(-6, 19, inf),
	\dur, Pseq([0.3, 0.2, 0.5, 0.2, 0.3], inf),
	\sustain, Pwhite(0.9, 1.3, inf),
	\stepsPerOctave, 13,
	\octave, 4
).play
)

(
e = Pbind(
	\note, Pwhite(-6, 23, inf).postln,
	\dur, Pseq([0.3, 0.2, 0.5, 0.2, 0.3], inf),
	\sustain, Pwhite(0.9, 1.3, inf),
	\stepsPerOctave, 19,
	\octave, 5,
	\scale, [0, 2, 3, 5, 7, 11, 13, 17]
).play
)

(
e.stream = Pbind(
	\note, Pwhite(-6, 23, inf),
	\dur, Pseq([0.3, 0.2, 0.5, 0.2, 0.3], inf),
	\sustain, Pwhite(0.9, 1.3, inf),
	\stepsPerOctave, 19,
	\octave, 5,
	\scale, [1, 4, 6, 8, 9, 10, 12, 14, 15, 16]
).asStream;
)

(
SynthDef(\test_ping17, { |freq, amp|
	var out, env;
	env = EnvGen.kr(Env.perc(0.1, 0.5), doneAction:2);
	out = Pan2.ar(SinOsc.ar(freq, 0, amp)*env, 0);
	Out.ar(0,
		out);
}).add;
)


a = [1.058823529,
1.117647059,
1.176470588,
1.235294118,
1.294117647,
1.352941176,
1.411764706,
1.470588235,
1.529411765,
1.588235294,
1.647058824,
1.705882353,
1.764705882,
1.823529412,
1.882352941,
1.941176471,
	2]*220;

(
e = Pbind(
    \freq, Pseq(a, inf),
    \dur, Pwhite(0.2, 0.5, inf),
    \amp, Pwhite(0.2, 0.5, inf),
    \sustain, Pwhite(0.2, 0.5, inf),
    \instrument, \test_ping17
).play
)

(
e.stream = Pbind(
    \freq, Pseq(d, inf),
    \dur, Pwhite(0.2, 0.5, inf),
    \amp, Pwhite(0.2, 0.5, inf),
    \sustain, Pwhite(0.2, 0.5, inf),
    \instrument, \test_ping17
).asStream
)

(
e.stream = Pbind(
    \freq, Pn(Prand(a, 1), inf),
    \dur, Pwhite(0.2, 0.5, inf),
    \amp, Pwhite(0.2, 0.5, inf),
    \sustain, Pwhite(0.2, 0.5, inf),
    \instrument, \test_ping17
).asStream
)

c = [1,2,3,5,8,13,21]
d = c.linlin(1,34,1,2);

c = [1,2,3,5,7,11,13,14,17,18]
d = c.linlin(1,18,1,2)*220;

(10/8).asFraction;
(
f = { |numerator, denominator|
    (numerator/denominator).asFraction
};
)

f.(12,4)*220;
(
SynthDef(\ratio, { |root = 100, freq = #[1,1]|
    var num, den, frac;
    frac =  {|numerator, denominator|
    (numerator/denominator).asFraction};
    frac = freq;
    Out.ar(0,
        Pan2.ar(SinOsc.ar( freq * root, 0, 0.1), [0.2, -0.2]))
}).add;
)

Synth(\ratio, [\root:220, \freq:[1,1] ]);
Synth(\ratio, [\root:220, \freq:[2,1] ]);
Synth(\ratio, [\root:220, \freq:[3,2] ]);
Synth(\ratio, [\root:220, \freq:[4,3] ]);
Synth(\ratio, [\root:220, \freq:[5,4] ]);
Synth(\ratio, [\root:55, \freq:[16,15] ]);
Synth(\ratio, [\root:110, \freq:[6,5] ]);

f.(6,5)*110;
f.(6,5);

(
~ratios = [1/1, 9/8, 5/4, 4/3, 3/2, 5/3, 15/8, 2/1];
~scale = [0, 1, 2, 3, 4, 5, 6, 7, 8];
e = Pbind(
    \freq, Pseq([Pfunc({
        (~ratios.wrapAt(~scale).[~scale.size.rand])*440
    })
    ], inf),
    \dur, Pwhite(0.2, 0.8, inf),
    \amp, Pwhite(0.05, 0.3, inf),
    \instrument, "test_ping17"
).play;
)

~ratios = [1/1, 9/8, 5/4, 4/3, 3/2, 5/3, 15/8, 2/1];
~scale = [0, 1, 3, 4, 5, 7];
e = Pbind(
    \freq, Pseq([Pfunc({
        (~ratios.wrapAt(~scale).[~scale.size.rand])*440
    })
    ], inf),
    \dur, Pwhite(0.2, 0.8, inf),
    \amp, Pwhite(0.05, 0.3, inf),
    \instrument, "test_ping17"
).play;
)

~ratios.wrapAt(~scale).[~scale.size.rand(5)];

~scale.size.rand;

a = Array.fill(12, {|i| (1/12)*i});
b = Array.fill(14, {|i| (1/14)*i});
a.sect(b);

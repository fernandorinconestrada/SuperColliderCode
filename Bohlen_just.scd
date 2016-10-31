Server.local.makeGui;
Server.internal.makeGui;

p = ProxySpace;
p.push;

(
SynthDef(\pop, { |fund = 220|
	var  env, decay, dur, amp, amp_b;
	decay = LFNoise2.kr(10).range(0.05, 0.5);
	dur = LFNoise2.kr(10).range(0.01, 0.03);
	env = EnvGen.kr(Env.perc(dur, decay), doneAction: 2);
	amp = LFNoise2.kr(10).range(0.3, 0.7);
	amp_b = LFNoise2.kr(10).range(0.05, 0.09);
	Out.ar(0, (SinOsc.ar(fund, 0, amp) * env)* (SinOsc.ar(fund*2, 0, amp_b) * env))
}).load(s);
)

(
SynthDef(\base, { |fund_a, fund_b, seg_a, seg_b|
	var  amp, amp_b, env;
	env = EnvGen.kr(Env([0.001,1, 0],[seg_a, seg_b]), doneAction: 2);
	amp = LFNoise2.kr(10).range(0.4, 0.6);
	amp_b = LFNoise2.kr(10).range(0.13, 0.23);
	Out.ar(0, [SinOsc.ar(fund_a, 0, amp) * env, SinOsc.ar(fund_b, -0.5pi, amp_b) * env]  )
}).load(s);
)




(
Pbind(
	\instrument, \pop,
	\fund, Pseq(a, inf),
	\dur, 0.5
).play;
)


(
var deg, freq, scale;
deg = 0;
{deg < 13}.while ({
	deg = deg + 1;
	deg.postln;
	freq = 220*(3**(deg/13));
	freq.postln;
	scale= Array.fill(14, {freq.value});
	scale.postln;
})
)
a = Array.fill( 14, { |deg| 440*(3**(deg/13)) } );
a.asStream;

b = Array.fill( 13, { |deg| 440*(2**(deg/12)) } );


c = List[1, 9/7, 7/5, 5/3, 9/5, 15/7, 7/3, 9/3].collect( { |item, deg| item * 73.3333333 } );//Bohlen Diatonic Just
d = List[1, 27/25, 25/21, 9/7, 7/5, 5/3, 75/49, 5/3, 9/5, 49/25, 15/7, 7/3, 63/25, 25/9, 9/3].collect( { |item, deg| item * 220 } );//Bohlen Chromatic from just
c.choose;
d.choose;

p.clear;
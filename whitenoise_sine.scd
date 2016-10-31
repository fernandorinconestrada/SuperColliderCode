{ Out.ar(0, (LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), [880, 881, 1759.3, 1760], 0.001, 0.8), 1900) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), [879.8, 880.4, 1759.7, 1760.3], 0.001, 0.8), 1900))) }.play;

{ Out.ar(0, (LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), [586.6666, 587, 1173, 1172.8], 0.001, 1.2), 1200) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), [586.3333, 587.1, 1173.4, 11173.3], 0.001, 1.2), 1200))*2) }.play;

{
	var sin_1, sin_2, sin_3, sin_4, sin_5, mix;
	sin_1 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 49, 0.001, 0.8), 54) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 49.2, 0.001, 0.8), 54);
	sin_2 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 147, 0.001, 1.2), 153) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 147.3, 0.001, 1.2), 153);
	sin_3 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 441, 0.001, 1.6), 445) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 439.7, 0.001, 1.6), 445);
	sin_4 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 1323, 0.001, 1.2), 1328) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 1323.3, 0.001, 1.2), 1328);
	sin_5 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 3969, 0.001, 0.2), 3975) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 3969.1, 0.001, 0.2), 4975);
	mix = Mix.new(sin_1 + sin_3 + sin_2 + sin_4 + sin_5);
	Out.ar([0,1], mix);
}.play;

{
	var sin_1, sin_2, sin_3, sin_4, sin_5, mix;
	sin_1 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 73.2, 0.001, 0.8), 80) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 73, 0.001, 0.8), 80);
	sin_2 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 219.6, 0.001, 1.2), 225) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 220, 0.001, 1.2), 225);
	sin_3 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 658.8, 0.001, 1.4), 664) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 659, 0.001, 0.8), 664);
	sin_4 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 1976.3, 0.001, 0.6), 1981) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 1976, 0.001, 0.6), 1981);
	sin_5 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 5929.2, 0.001, 0.3), 5940) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), 5929.1, 0.001, 0.3), 5940);
	mix = Mix.new(sin_1 + sin_3 + sin_2 + sin_4 + sin_5);
	Out.ar([0,1], mix);
}.play;

s.recChannels = 2;
s.prepareForRecord("/Users/fernandorincon/Documents/Pre Comp/june8/bohlenWhiteSineTake4.aif");
s.record;
s.stop;

(
var env_grain;
b = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/Electronic/Skecthing Project/Samples/Processed/Consolidate/Buffer_Grain-1.aif", 0,-1, 0);
env_grain = Env([0, 1, 0], [0.5, 1], \sin);
z = Buffer.sendCollection(s, env_grain.discretize);

(
SynthDef(\grainSine, {  |dens = 10, dur = 0.1, sndbuf, freq = 50, freq_pan = 10, freq_rate = 0.2, bufnum = -1|
	var pos, pan, rate;
	rate = SinOsc.kr(freq_rate).range(0.99, 1.01);
	pos = LFNoise0.kr(freq).range(0, 1);
	pan = LFNoise0.kr(freq_pan).range(-1.0, 1.0);
	Out.ar(0,
		GrainBuf.ar(2, Dust.kr(dens), dur, sndbuf, rate, pos, 2, pan, bufnum))
}).load(s);
);
)

a = Synth(\grainSine, [\sndbuf, b, \dur, 0.2, \dens, 4, \freq, 3]);
a.set(\bufnum, z);
a.set(\bufnum, -1);
a.set(\dur, 0.3);
a.free;
	
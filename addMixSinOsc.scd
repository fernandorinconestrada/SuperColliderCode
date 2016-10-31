(
SynthDef(\addMixSinOsc, { |rateTrig = 1, levAtt = 1.0, levSust = 0.3, att = 0.01, sust = 0.04, dec = 0.1, curveAtt = 8, curveSust = -8, curveDec = -8, fund, partsL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], partsR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], fbL = 0.1, fbpartsL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], fbR = 0.1, fbpartsR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], rateModL = 0.1, mulRateL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], rateModR = 0.1, mulRateR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], ampL = 1, mulAmpL = #[0,0,0, 0,0,0, 0,0,0, 0,0,0], ampR = 1, mulAmpR = #[0,0,0, 0,0,0, 0,0,0, 0,0,0],  delTL = 0.06, decTL = 0.5, levDelL = 0.5, delTR = 0.06, decTR = 0.5, levDelR = 0.5|
	var trigEnv, env, outL, outR, delayL, delayR;
	trigEnv = Impulse.kr(rateTrig);
	env = EnvGen.kr(Env([0, levAtt, levSust, 0], [att, sust, dec], [curveAtt, curveSust, curveDec]), trigEnv);
	outL = HPF.ar(Mix.new(SinOscFB.ar((fund * partsL)*LFNoise0.kr(20).range(0.8, 1.2), fbL * fbpartsL, SinOsc.kr(rateModL * mulRateL, 0, ampL * mulAmpL))), 30) * env;
	outR = HPF.ar(Mix.new(SinOscFB.ar((fund * partsR)*LFNoise0.kr(20).range(0.8, 1.2), fbR * fbpartsR, SinOsc.kr(rateModR * mulRateR, 0, ampR * mulAmpR))), 30) * env;
	//delayL = AllpassC.ar(LPF.ar(outL, 12000), 0.2, delTL, decTL, levDelL);
	delayL = AllpassC.ar(LPF.ar(outL, 12000), 0.2, delTL, decTL, SinOsc.kr(0.04, 0, 0.7, 0.1));
	//delayR = AllpassC.ar(LPF.ar(outR, 12000), 0.2, delTR, decTR, levDelR);
	delayR = AllpassC.ar(LPF.ar(outR, 12000), 0.2, delTR, decTR, SinOsc.kr(0.041, 0, 0.7, 0.1));
	OffsetOut.ar(0, outL);
	OffsetOut.ar(1, outR);
	OffsetOut.ar(1, delayL);
	OffsetOut.ar(0, delayR);
}).add;
);
(
~partsL = Array.series(12, 1, 4);
~partsR = Array.series(12, 3, 4);
~mulRateL = Array.series(12, 1, 3);
~mulRateR = Array.series(12, 4, 3);
//~mulAmp = Array.fill(12, { |i| 1/((i+1)*3)});
~mulAmpL = Array.series(12, 3, 6).collect({ |item, i| (1/item)});
~mulAmpR = Array.series(12, 6, 6).collect({ |item, i| (1/item)});
~fbpartsL = Array.fill(12, { |i| i.rrand(3, 8) * 1});
~fbpartsR = Array.fill(12, { |i| i.rrand(3, 8) * 1});
);

a = Synth(\addMixSinOsc, [\fund, 625, \partsL, ~partsL, \partsR, ~partsR, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR]);
a.set(\rateTrig, 2);
a.set(\sust, 0.02);
a.set(\fund, 625);
//a = Synth(\testGui);

(
a = Synth(\addMixSinOsc, [\fund, 623, \partsL, ~partsL, \partsR, ~partsR, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR, \rateTrig, 1.9]);
b = Synth(\addMixSinOsc, [\fund, 624, \partsL, ~partsL, \partsR, ~partsR, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR, \rateTrig, 2.3]);
c = Synth(\addMixSinOsc, [\fund, 625, \partsL, ~partsL, \partsR, ~partsR, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR, \rateTrig, 2.9]);
d = Synth(\addMixSinOsc, [\fund, 626, \partsL, ~partsL, \partsR, ~partsR, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR, \rateTrig, 3.1]);
e = Synth(\addMixSinOsc, [\fund, 627, \partsL, ~partsL, \partsR, ~partsR, \fbpartsL, ~fbpartsL, \fbpartsR, ~fbpartsR, \mulRateL, ~mulRateL, \mulRateR, ~mulRateR, \mulAmpL, ~mulAmpL, \mulAmpR, ~mulAmpR, \rateTrig, 3.7]);
)

(
a.set(\sust, 0.0031);
b.set(\sust, 0.0029);
c.set(\sust, 0.0037);
d.set(\sust, 0.0031);
e.set(\sust, 0.0029);
)
(
a.set(\dec, 0.041);
b.set(\dec, 0.047);
c.set(\dec, 0.033);
d.set(\dec, 0.051);
e.set(\dec, 0.037);
)
(
a.set(\fbpartsL, ~fbpartsL);
a.set(\fbpartsR, ~fbpartsR);
)
(
b.set(\fbpartsL, ~fbpartsL);
b.set(\fbpartsR, ~fbpartsR);
)
(
c.set(\fbpartsL, ~fbpartsL);
c.set(\fbpartsR, ~fbpartsR);
)
(
d.set(\fbpartsL, ~fbpartsL);
d.set(\fbpartsR, ~fbpartsR);
)
(
e.set(\fbpartsL, ~fbpartsL.reverse);
e.set(\fbpartsR, ~fbpartsR.reverse);
)

(
a.set(\fund, 55);
b.set(\fund, 55*4);
c.set(\fund, 55 *3);
d.set(\fund, 54.9 *5);
e.set(\fund, 55.1* 7);
)

(
a.set(\fund, 55*16);
b.set(\fund, 55*8);
c.set(\fund, 56 *4);
d.set(\fund, 54.9 *8);
e.set(\fund, 55.1* 4);
)

(
a.set(\mulRateL, ~mulRateL);
a.set(\mulRateR, ~mulRateR);
)
(
b.set(\mulRateL, ~mulRateL.reverse);
b.set(\mulRateR, ~mulRateR.reverse);
)
(
c.set(\mulRateL, ~mulRateL);
c.set(\mulRateR, ~mulRateR);
)
(
d.set(\mulRateL, ~mulRateL.reverse);
d.set(\mulRateR, ~mulRateR.reverse);
)
(
e.set(\mulRateL, ~mulRateL);
e.set(\mulRateR, ~mulRateR);
)

(
a.set(\rateTrig, 0.3);
b.set(\rateTrig, 0.31);
c.set(\rateTrig, 0.33);
d.set(\rateTrig, 0.37);
e.set(\rateTrig, 0.29);
)

(
a.set(\rateTrig, 0.5);
b.set(\rateTrig, 0.501);
c.set(\rateTrig, 0.503);
d.set(\rateTrig, 0.507);
e.set(\rateTrig, 0.499);
)
(
a.set(\delTL, 0.00041);
b.set(\delTL, 0.00047);
c.set(\delTL, 0.00033);
d.set(\delTL, 0.00051);
e.set(\delTL, 0.00037);
)
(
a.set(\delTR, 0.0047);
b.set(\delTR, 0.0043);
c.set(\delTR, 0.0037);
d.set(\delTR, 0.0041);
e.set(\delTR, 0.0037);
)


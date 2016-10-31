(
(
SynthDef(\klankGrainLeft, { |bus = 0, freqs = #[1,1,1,1,1,1], ampFreqs = #[0,0,0,0,0,0], rings = #[1,1,1,1,1,1], freqTrig = 2, rateDev = 10, loDev = 0.3, hiDev = 0.9, rateFreqScale = 10, loFreqScale = 1.001, hiFreqScale = 1.1, rateDecayScale = 10, loDecayScale = 0.1, hiDecayScale = 0.9, maxDel = 0.2, delT = 0.06, decT = 0.5, ampDel 0.75, mix = 0.1, room = 0.3, damp = 0.8|
	var left, right;
	left = DynKlank.ar(`[freqs, ampFreqs, rings], GaussTrig.ar(freqTrig, LFNoise1.kr(rateDev).range(loDev, hiDev)), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale).poll, 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale));
	right = HPF.ar(AllpassC.ar(left, maxDel, delT, decT, ampDel), 40);
	OffsetOut.ar(bus, LPF.ar(FreeVerb.ar([left, right], mix, room, damp), 1900));
}).add;
);

(
SynthDef(\klankGrainRight, { |bus = 0, freqs = #[1,1,1,1,1,1], ampFreqs = #[0,0,0,0,0,0], rings = #[1,1,1,1,1,1], freqTrig = 2, rateDev = 10, loDev = 0.3, hiDev = 0.9, rateFreqScale = 10, loFreqScale = 1.001, hiFreqScale = 1.1, rateDecayScale = 10, loDecayScale = 0.1, hiDecayScale = 0.9, maxDel = 0.2, delT = 0.06, decT = 0.5, ampDel 0.75, mix = 0.1, room = 0.3, damp = 0.8|
	var left, right;
	right = DynKlank.ar(`[freqs, ampFreqs, rings], GaussTrig.ar(freqTrig, LFNoise1.kr(rateDev).range(loDev, hiDev)), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale).poll, 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale));
	left = HPF.ar(AllpassC.ar(right, maxDel, delT, decT, ampDel), 40);
	OffsetOut.ar(bus, LPF.ar(FreeVerb.ar([left, right], mix, room, damp), 1900));
}).add;
);
)

(
a = Synth(\klankGrainLeft, [\freqs, ~freq1, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.6, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
b = Synth(\klankGrainRight, [\freqs, ~freq2, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.6, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
c = Synth(\klankGrainLeft, [\freqs, ~freq3, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] *0.5, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
d = Synth(\klankGrainRight, [\freqs, ~freq4, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] *0.5, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
e = Synth(\klankGrainLeft, [\freqs, ~freq5, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.4, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
f = Synth(\klankGrainRight, [\freqs, ~freq6, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.3, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
)
a.set(\hiFreqScale, 1.05);
a.set(\freqs, [200, 600, 1000, 1400, 1800, 2200])
(
a.set(\rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]*0.12);
b.set(\rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]*0.14);
c.set(\rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]*0.16);
d.set(\rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]*0.18);
e.set(\rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]*0.12);
f.set(\rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]*0.15);
)
(
a.set(\freqTrig, 4);
b.set(\freqTrig, 5);
c.set(\freqTrig, 6);
d.set(\freqTrig, 7);
e.set(\freqTrig, 8);
f.set(\freqTrig, 16);
)

(
a.set(\delT, 0.04);
b.set(\delT, 0.08);
c.set(\delT, 0.12);
d.set(\delT, 0.16);
e.set(\delT, 0.20);
f.set(\delT, 0.18);
)

(
a.set(\mix, 0.08, \room, 0.09);
b.set(\mix, 0.05, \room, 0.05);
c.set(\mix, 0.07, \room, 0.13);
d.set(\mix, 0.03, \room, 0.2);
e.set(\mix, 0.04, \room, 0.12);
f.set(\mix, 0.08, \room, 0.17);
)
(
~fund = 220;
~freq1 = [~fund*1, ~fund * 3, ~fund * 5, ~fund * 7, ~fund * 9, ~fund * 11];
~freq2 = [~fund*3, ~fund * 9, ~fund * 15, ~fund * 21, ~fund * 27, ~fund * 33];
~freq3 = [~fund*5, ~fund * 15, ~fund * 25, ~fund * 35, ~fund * 45, ~fund * 55];
~freq4 = [~fund*7, ~fund * 21, ~fund * 35, ~fund * 49, ~fund * 63, ~fund * 77];
~freq5 = [~fund*9, ~fund * 27, ~fund * 45, ~fund * 63, ~fund * 81, ~fund * 99];
~freq6 = [~fund*11, ~fund * 33, ~fund * 55, ~fund * 77, ~fund * 99, ~fund * 121];
)

(
~fund = 2200;
~freq1 = [~fund*0.1, ~fund *0.3, ~fund *0.5, ~fund *0.7, ~fund *0.9, ~fund *0.11];
~freq2 = [~fund*0.3, ~fund *0.9, ~fund *0.15, ~fund *0.21, ~fund *0.27, ~fund *0.33];
~freq3 = [~fund*0.5, ~fund *0.15, ~fund *0.25, ~fund *0.35, ~fund *0.45, ~fund *0.55];
~freq4 = [~fund*0.7, ~fund *0.21, ~fund *0.35, ~fund *0.49, ~fund *0.63, ~fund *0.77];
~freq5 = [~fund*0.9, ~fund *0.27, ~fund *0.45, ~fund *0.63, ~fund *0.81, ~fund *0.99];
~freq6 = [~fund*0.11, ~fund *0.33, ~fund *0.55, ~fund *0.77, ~fund *0.99, ~fund *1.21];
)

(
a.set(\freqs, ~freq1);
b.set(\freqs, ~freq2);
c.set(\freqs, ~freq3);
d.set(\freqs, ~freq4);
e.set(\freqs, ~freq5);
f.set(\freqs, ~freq6);
)

2200*0.1;
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
SynthDef(\klankGrainLLCHStereo, { | freqTrig = 1, rateDev = 10, loDev = 0.2, hiDev = 0.8, freqTrig2 = 1, attTimeDec = 0.01, decTimeDec = 0.1, freqs = #[1, 1, 1, 1, 1, 1, 1, 1], ampFreqs = #[0, 0, 0, 0, 0, 0, 0, 0], rings = #[1, 1, 1, 1, 1, 1, 1, 1], rateFreqScale = 10, loFreqScale = 1.001, hiFreqScale = 1.1, rateDecayScale = 10, loDecayScale = 0.1, hiDecayScale = 0.9, posOut1 = -1.0, maxDel = 0.3, delT = 0.06, decT= 0.5, ampDel = 0.75, posDel1 = -0.71428571428571,  ampPanDel1 = 0.75, durTrigDel1 = 0.2, posOut2 = -0.71428571428571, posDel2 = -0.42857142857143, ampPanDel2 = 0.75, durTrigDel2 = 0.4,  posOut3 = -0.42857142857143, posDel3 = -0.14285714285714, ampPanDel3 = 0.75, durTrigDel3 = 0.6, posOut4 = -0.14285714285714, posDel4 = 0.14285714285714, ampPanDel4 = 0.75, durTrigDel4 = 0.8, posOut5 = 0.14285714285714, posDel5 = 0.42857142857143, ampPanDel5 = 0.75, durTrigDel5 = 1.0, posOut6 = 0.42857142857143, posDel6 = 0.71428571428571, ampPanDel6 = 0.75, durTrigDel6 = 1.2, posOut7 = 0.71428571428571, posDel7 = 1, ampPanDel7 = 0.75, durTrigDel7 = 1.4, posOut8 = 1.0, posDel8 = -1.0, ampPanDel8 = 0.75, bus1 = 0 |

	var trig, trig2, out1, delay1, out2, delay2, out3, delay3, out4, delay4, out5, delay5, out6, delay6, out7, delay7, out8, delay8, mixStereo;

	trig = GaussTrig.ar(freqTrig, LFNoise1.kr(rateDev).range(loDev, hiDev));
	trig2 = Impulse.ar(freqTrig2);

	out1 = Pan2.ar(LPF.ar(Decay2.ar(trig, attTimeDec, decTimeDec, DynKlank.ar(`[freqs, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut1);
		delay1 = Pan2.ar(HPF.ar(AllpassC.ar(out1, maxDel, delT, decT, ampDel), 40), posDel1, ampPanDel1);

	out2 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrigDel1), attTimeDec, decTimeDec, DynKlank.ar(`[freqs *1.01, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut2);
	delay2 = Pan2.ar(HPF.ar(AllpassC.ar(out2, maxDel, delT, decT, ampDel), 40), posDel2, ampPanDel2);

	out3 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrigDel2), attTimeDec, decTimeDec, DynKlank.ar(`[freqs * 1.02, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut3);
	delay3 = Pan2.ar(HPF.ar(AllpassC.ar(out3, maxDel, delT, decT, ampDel), 40), posDel3, ampPanDel3);

	out4 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrigDel3), attTimeDec, decTimeDec, DynKlank.ar(`[freqs *1.001, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut4);
	delay4 = Pan2.ar(HPF.ar(AllpassC.ar(out4, maxDel, delT, decT, ampDel), 40), posDel4, ampPanDel4);

	out5 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrigDel4), attTimeDec, decTimeDec, DynKlank.ar(`[freqs * 1.1, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut5);
	delay5 = Pan2.ar(HPF.ar(AllpassC.ar(out5, maxDel, delT, decT, ampDel), 40), posDel5, ampPanDel5);

	out6 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrigDel5), attTimeDec, decTimeDec, DynKlank.ar(`[freqs * 1.002, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut6);
	delay6 = Pan2.ar(HPF.ar(AllpassC.ar(out6, maxDel, delT, decT, ampDel), 40), posDel6, ampPanDel6);

	out7 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrigDel6), attTimeDec, decTimeDec, DynKlank.ar(`[freqs *1.01, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut7);
	delay7 = Pan2.ar(HPF.ar(AllpassC.ar(out7, maxDel, delT, decT, ampDel), 40), posDel7, ampPanDel7);

	out8 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrigDel7), attTimeDec, decTimeDec, DynKlank.ar(`[freqs * 1.0003, ampFreqs, rings], trig, LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecayScale).range(loDecayScale, hiDecayScale))), 19000), posOut8);
	delay8 = Pan2.ar(HPF.ar(AllpassC.ar(out8, maxDel, delT, decT, ampDel), 40), posDel8, ampPanDel8);

	mixStereo = Mix.new([ out1, delay1, out2, delay2, out3, delay3, out4, delay4, out5, delay5, out6, delay6, out7, delay7, out8, delay8 ]);
	OffsetOut.ar(bus1, Limiter.ar(mixStereo * 0.1, 0.5));
}).send(s);
)

a.set(\decTimeDec, 0.1);

a.set(\freqTrig2, 16);

(
a = Synth(\klankGrainLLCHStereo, [\freqs, ~freq1, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.6, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
b = Synth(\klankGrainLLCHStereo, [\freqs, ~freq2, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.6, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
c = Synth(\klankGrainLLCHStereo, [\freqs, ~freq3, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] *0.5, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
d = Synth(\klankGrainLLCHStereo, [\freqs, ~freq4, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] *0.5, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
e = Synth(\klankGrainLLCHStereo, [\freqs, ~freq5, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.4, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
f = Synth(\klankGrainLLCHStereo, [\freqs, ~freq6, \ampFreqs, [0.24, 0.18, 0.135, 0.10125, 0.0759375, 0.056953125] * 0.3, \rings, [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]]);
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
a.set(\freqTrig, 8);
b.set(\freqTrig, 10);
c.set(\freqTrig, 12);
d.set(\freqTrig, 14);
e.set(\freqTrig, 16);
f.set(\freqTrig, 32);
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
~fund = 8000;
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

o = ServerOptions.new;
o.memSize = 512;
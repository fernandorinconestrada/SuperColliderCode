(
SynthDef(\dynKlankDec, {
	var trig, freq1, freq2, freq3, amp1, amp2, amp3, ring1, ring2, ring3;
	trig = Impulse.ar(1);
	freq1 = LFNoise2.kr(5, 200, 200);
	freq2 = LFNoise2.kr(5, 400, 400);
	freq3 = LFNoise2.kr(5, 800, 800);
	amp1 = LFNoise1.kr(5, 0.3, 0.2);
	amp2 = LFNoise1.kr(5, 0.3, 0.2);
	amp3 = LFNoise1.kr(5, 0.3, 0.2);
	ring1 = Demand.ar(trig, 0, Dwhite(0.3, 0.8, inf));
	ring2 = Demand.ar(trig, 0, Dwhite(0.5, 1.3, inf));
	ring3 = Demand.ar(trig, 0, Dwhite(0.7, 1.5, inf));
	OffsetOut.ar(0, Decay2.ar(trig, 0.01, 1, DynKlank.ar(`[[freq1, freq2, freq3], [amp1, amp2, amp3], [ring1, ring2, ring3]], trig, Demand.ar(trig, 0, Dwhite(0.9, 1.1, inf)), 0, LFNoise0.kr(5).range(0.2, 0.9).poll)));
}).add;
)

(
SynthDef(\delSpreadDynKlankA, { | rateTrig = 1, rateDecKlang = 8, attTDec = 0.01, decTDec = 0.5, rateFreq = 5, mulFreq = 1.05, freq = 200, rateFB = 6, ampFreq = 8,  posOut = -1.0, levOut = 1, maxDel = 0.64, delT1 = 0.08, decT1 = 0.5, ampDel1 = 0.9, posDel1 = -0.71428571428571, levDel = 1.0, delT2 = 0.16,  decT2 = 0.43, ampDel2 = 0.8, posDel2 = -0.42857142857143, delT3 = 0.24,  decT3 = 0.36, ampDel3 = 0.7, posDel3 = -0.14285714285714, delT4 = 0.32,  decT4 = 0.29, ampDel4 = 0.6, posDel4 = 0.14285714285714, delT5 = 0.4,  decT5 = 0.22, ampDel5 = 0.5, posDel5 = 0.42857142857143, delT6 = 0.48, decT6 = 0.15, ampDel6 = 0.4, posDel6 = 0.71428571428571, delT7 = 0.56, decT7 = 0.8, ampDel7 = 0.3, posDel7 = 1.0, mix = 0.1, room = 0.1, damp = 0.1, bus = #[0,1] |
	var out, trig, freqRing1,  freqRing2, freqRing3, freqRing4, freqRing5,  freqRing6, freqRing7, freqRing8, ring1, ring2, ring3, ring4, ring5, ring6, ring7, ring8, ampRing1, ampRing2, ampRing3, ampRing4, ampRing5, ampRing6, ampRing7, ampRing8, klank, mult, delay1, delay2, delay3, delay4, delay5, delay6, delay7, mixOut;
	trig = Impulse.ar(rateTrig, 0, 1);
	freqRing1 = Demand.ar(trig, 0, Dwhite(600, 630, inf));
	freqRing2 = Demand.ar(trig, 0, Dwhite(1000, 1050, inf));
	freqRing3 = Demand.ar(trig, 0, Dwhite(1400, 1470, inf));
	freqRing4 = Demand.ar(trig, 0, Dwhite(1800, 1890, inf));
	freqRing5 = Demand.ar(trig, 0, Dwhite(2200, 2310, inf));
	freqRing6 = Demand.ar(trig, 0, Dwhite(2600, 2730, inf));
	freqRing7 = Demand.ar(trig, 0, Dwhite(3000, 3150, inf));
	freqRing8 = Demand.ar(trig, 0, Dwhite(3400, 3570, inf));
	ampRing1 = Demand.ar(trig, 0, Dwhite(0.1, 0.3, inf));
	ampRing2 = Demand.ar(trig, 0, Dwhite(0.2, 0.4, inf));
	ampRing3 = Demand.ar(trig, 0, Dwhite(0.3, 0.5, inf));
	ampRing4 = Demand.ar(trig, 0, Dwhite(0.4, 0.6, inf));
	ampRing5 = Demand.ar(trig, 0, Dwhite(0.3, 0.5, inf));
	ampRing6 = Demand.ar(trig, 0, Dwhite(0.2, 0.4, inf));
	ampRing7 = Demand.ar(trig, 0, Dwhite(0.1, 0.3, inf));
	ampRing8 = Demand.ar(trig, 0, Dwhite(0.2, 0.4, inf));
	ring1 = Demand.ar(trig, 0, Dwhite(0.2, 0.6, inf));
	ring2 = Demand.ar(trig, 0, Dwhite(0.3, 0.7, inf));
	ring3 = Demand.ar(trig, 0, Dwhite(0.4, 0.8, inf));
	ring4 = Demand.ar(trig, 0, Dwhite(0.3, 0.7, inf));
	ring5 = Demand.ar(trig, 0, Dwhite(0.2, 0.6, inf));
	ring6 = Demand.ar(trig, 0, Dwhite(0.3, 0.7, inf));
	ring7 = Demand.ar(trig, 0, Dwhite(0.4, 0.8, inf));
	ring8 = Demand.ar(trig, 0, Dwhite(0.3, 0.6, inf));
	mult = Decay2.ar(trig , attTDec, decTDec, SinOscFB.ar(Demand.ar(trig, 0, Dwhite(200, 220, inf)), LFNoise2.ar(rateFB, 0.6, 0.4), LFNoise2.ar(ampFreq, 0.2, 0.1)));
	klank = DynKlank.ar(`[[freqRing1, freqRing2, freqRing3, freqRing4, freqRing5, freqRing6, freqRing7, freqRing8], [ampRing1, ampRing2, ampRing3, ampRing4, ampRing5, ampRing6, ampRing7, ampRing8], [ring1, ring2, ring3, ring4, ring5, ring6, ring7, ring8]], mult, Demand.ar(trig, 0, Dwhite(0.95, 1.05, inf)), 0, LFNoise2.kr(rateDecKlang).range(0.1, 0.9));
	out = Pan2.ar(Limiter.ar(LPF.ar(klank, 19000), 0.8), posOut, levOut) ;
	delay1 = Pan2.ar(AllpassC.ar(out, maxDel, delT1, decT1, ampDel1), posDel1, levDel * 0.9);
	delay2 = Pan2.ar(AllpassC.ar(out, maxDel, delT2, decT2, ampDel2), posDel2, levDel * 0.85);
	delay3 = Pan2.ar(AllpassC.ar(out, maxDel, delT3, decT3, ampDel3), posDel3, levDel * 0.8);
	delay4 = Pan2.ar(AllpassC.ar(out, maxDel, delT4, decT4, ampDel4), posDel4, levDel * 0.75);
	delay5 = Pan2.ar(AllpassC.ar(out, maxDel, delT5, decT5, ampDel5), posDel5, levDel * 0.7);
	delay6 = Pan2.ar(AllpassC.ar(out, maxDel, delT6, decT6, ampDel6), posDel6, levDel * 0.65);
	delay7 = Pan2.ar(AllpassC.ar(out, maxDel, delT7, decT7, ampDel7), posDel7, levDel * 0.6);
	mixOut = Mix.new([out, delay1, delay2, delay3, delay4, delay5, delay6, delay7]);
	OffsetOut.ar(bus, HPF.ar(FreeVerb.ar(mixOut, mix, room, damp), 40));
}).add;
)

a = Synth(\dynKlankDec);
a = Synth(\delSpreadDynKlankA);
a.set(\rateTrig, 17);
a.set(\decTDec, 0.03);
a.set(\room, 0.05);
~del = 0.4;
a.set(\delT1, ~del*0.1, \delT1, ~del*0.2, \delT1, ~del*0.3, \delT1, ~del*0.4, \delT1, ~del*0.5, \delT1, ~del*0.6, \delT7*0.7);

200* 1.05 * (0..17)
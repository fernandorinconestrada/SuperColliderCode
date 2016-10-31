(
SynthDef(\delSpread, { | rateTrig = 1, attTDec = 0.01, decTDec = 0.5, rateFreq = 5, mulFreq = 1.05, freq = 200, rateFB = 6, ampFreq = 8,  posOut = -1.0, levOut = 1, maxDel = 0.64, delT1 = 0.08, decT1 = 0.5, ampDel1 = 0.9, posDel1 = -0.71428571428571, levDel = 1.0, delT2 = 0.16,  decT2 = 0.43, ampDel2 = 0.8, posDel2 = -0.42857142857143, delT3 = 0.24,  decT3 = 0.36, ampDel3 = 0.7, posDel3 = -0.14285714285714, delT4 = 0.32,  decT4 = 0.29, ampDel4 = 0.6, posDel4 = 0.14285714285714, delT5 = 0.4,  decT5 = 0.22, ampDel5 = 0.5, posDel5 = 0.42857142857143, delT6 = 0.48, decT6 = 0.15, ampDel6 = 0.4, posDel6 = 0.71428571428571, delT7 = 0.56, decT7 = 0.8, ampDel7 = 0.3, posDel7 = 1.0, mix = 0.1, room = 0.1, damp = 0.1, bus = #[0,1] |
	var out, trig, mult, delay1, delay2, delay3, delay4, delay5, delay6, delay7, mixOut;
	trig = Impulse.ar(rateTrig);
	mult =SinOscFB.ar(LFNoise2.ar(rateFreq, mulFreq, freq), LFNoise2.ar(rateFB, 0.6, 0.4), LFNoise2.ar(ampFreq, 0.2, 0.1));
	out = Pan2.ar(LPF.ar( Decay2.ar(trig , attTDec, decTDec, mult), 19000), posOut, levOut);
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

(
SynthDef(\delSpreadDynKlank, { | rateTrig = 1, rateFreqRing1 = 4,  rateFreqRing2 = 5, rateFreqRing3 = 6, rateFreqRing4 = 8, rateRing1 = 8, rateRing2 = 7, rateRing3 = 6, rateRing4 = 5, rateampRing1 = 4, rateampRing2 = 5, rateampRing3 = 6, rateampRing4 = 7,  freqOffset = 8, rateDecKlang = 8, attTDec = 0.01, decTDec = 0.5, rateFreq = 5, mulFreq = 1.05, freq = 200, rateFB = 6, ampFreq = 8,  posOut = -1.0, levOut = 1, maxDel = 0.64, delT1 = 0.08, decT1 = 0.5, ampDel1 = 0.9, posDel1 = -0.71428571428571, levDel = 1.0, delT2 = 0.16,  decT2 = 0.43, ampDel2 = 0.8, posDel2 = -0.42857142857143, delT3 = 0.24,  decT3 = 0.36, ampDel3 = 0.7, posDel3 = -0.14285714285714, delT4 = 0.32,  decT4 = 0.29, ampDel4 = 0.6, posDel4 = 0.14285714285714, delT5 = 0.4,  decT5 = 0.22, ampDel5 = 0.5, posDel5 = 0.42857142857143, delT6 = 0.48, decT6 = 0.15, ampDel6 = 0.4, posDel6 = 0.71428571428571, delT7 = 0.56, decT7 = 0.8, ampDel7 = 0.3, posDel7 = 1.0, mix = 0.1, room = 0.1, damp = 0.1, bus = #[0,1] |
	var out, trig, freqRing1,  freqRing2, freqRing3, freqRing4, ring1, ring2, ring3, ring4, ampRing1, ampRing2, ampRing3, ampRing4, klank, mult, delay1, delay2, delay3, delay4, delay5, delay6, delay7, mixOut;
	trig = Impulse.ar(rateTrig, 0, 0.5);
	freqRing1 = LFNoise2.kr(rateFreqRing1, 40, 400);
	freqRing2 = LFNoise2.kr(rateFreqRing2, 80, 800);
	freqRing3 = LFNoise2.kr(rateFreqRing3, 160, 1600);
	freqRing4 = LFNoise2.kr(rateFreqRing4, 320, 6400);
	ampRing1 = LFNoise2.kr(rateRing1, 0.5, 0.1);
	ampRing2 = LFNoise2.kr(rateRing2, 0.5, 0.2);
	ampRing3 = LFNoise2.kr(rateRing3, 0.6, 0.3);
	ampRing4 = LFNoise2.kr(rateRing4, 0.7, 0.4);
	ring1 = Demand.ar(trig, 0, Dwhite(0.3, 0.8, inf));
	ring2 = Demand.ar(trig, 0, Dwhite(0.3, 0.8, inf));
	ring3 = Demand.ar(trig, 0, Dwhite(0.3, 0.8, inf));
	ring4 = Demand.ar(trig, 0, Dwhite(0.3, 0.8, inf));
	mult = Decay2.ar(trig , attTDec, decTDec, SinOscFB.ar(LFNoise2.ar(rateFreq, mulFreq, freq), LFNoise2.ar(rateFB, 0.6, 0.4), LFNoise2.ar(ampFreq, 0.2, 0.1)));
	klank = DynKlank.ar(`[[freqRing1, freqRing2, freqRing3, freqRing4], [ampRing1, ampRing2, ampRing3, ampRing4], [ring1, ring2, ring3, ring4]], mult, Demand.ar(trig, 0, Dwhite(0.95, 1.05, inf)), 0, LFNoise2.kr(rateDecKlang).range(0.1, 0.9));
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

a = Synth(\delSpreadDynKlank);
a.set(\rateTrig, 5);
a.set(\decTDec, 0.1);
a.set(\mix, 0.05, \room, 0.05, \damp, 0.8);
a.set(\damp, 0.1);
b = Synth(\delSpread, [\freq, 220, \rateTrig, 2]);
b.set(\freq, 220);
b.set(\decTDec, 0.3);
b.free;

c = Synth(\delSpread, [\freq, 210, \rateTrig, 1]);
c.set(\freq, 175);
c.set(\decTDec, 0.1);

0.08 * 8
0.5/7 * (0..7);
0.2*0.9 * (0..8);
2/7*(0..7) - 1.0;
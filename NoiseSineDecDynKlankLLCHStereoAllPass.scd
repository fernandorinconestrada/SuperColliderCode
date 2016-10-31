(
SynthDef(\test, { | freq = 1 |
	var trig;
	trig = Impulse.ar(freq);
	OffsetOut.ar([0,1], FreeVerb.ar(Decay2.ar(trig, 0.001, 0.5, DynKlank.ar(`[[330, 660, 990], nil, nil], BBandPass.ar(WhiteNoise.ar(1), 440, 0.001), LFNoise1.ar(10).range(1.001, 1.1), 0, LFNoise1.ar(20).range(0.2, 0.9))), 0.1, 0.2, 0.3));
}).add;
)

(
SynthDef(\SineNoiseDecDynKlankAllPass, { |trigRate = 1, attTDec = 0.001, decTDec = 0.5, freqs = #[1,1,1,1,1,1,1,1], ampsFreq = #[0,0,0,0,0,0,0,0], rings = #[1,1,1,1,1,1,1,1], levelWhite = 1.2, freqBand1 = 440, bw1 = 0.001, ampBand1 = 1.2, rateFreqScale = 10, loFreqScale = 1.01, hiFreqScale = 1.1, rateDecScale = 11, loDecScale = 0.2, hiDecScale = 0.9, posSine1 = -1.0, maxDel = 0.3, delT = 0.06, decT = 0.5, posDel1 = -0.71428571428571, levelDel1 = 0.75, durTrig1 = 0.2, freqBand2 = 440, bw2 = 0.001, ampBand2 = 1.2, posSine2 = -0.71428571428571, posDel2 = -0.42857142857143, levelDel2 = 0.75, durTrig2 = 0.4, freqBand3 = 440, bw3 = 0.001, ampBand3 = 1.2, posSine3 = -0.42857142857143, posDel3 = -0.14285714285714, levelDel3 = 0.75, durTrig3 = 0.6, freqBand4 = 440, bw4 = 0.001, ampBand4 = 1.2, posSine4 = -0.14285714285714, posDel4 = 0.14285714285714, levelDel4 = 0.75, durTrig4 = 0.8, freqBand5 = 440, bw5 = 0.001, ampBand5 = 1.2, posSine5 = 0.14285714285714, posDel5 = 0.42857142857143, levelDel5 = 0.75, durTrig5 = 1.0, freqBand6 = 440, bw6 = 0.001, ampBand6 = 1.2, posSine6 = 0.42857142857143, posDel6 = 0.71428571428571, levelDel6 = 0.75, durTrig6 = 1.2, freqBand7 = 440, bw7 = 0.001, ampBand7 = 1.2, posSine7 = 0.71428571428571, posDel7 = 1.0, levelDel7 = 0.75, durTrig7 = 1.4, freqBand8 = 440, bw8 = 0.001, ampBand8 = 1.2, posSine8 = 1.0, posDel8 = -1.0, levelDel8 = 0.75, bus = 0, mix = 0.1, room = 0.2, damp = 0.3 |
	var trig, sine1, delay1, sine2, delay2, sine3, delay3, sine4, delay4, sine5, delay5, sine6, delay6, sine7, delay7, sine8, delay8, mixSine;

	trig = Impulse.ar(trigRate);

	sine1 =  Pan2.ar(LPF.ar(Decay2.ar(trig, attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand1, bw1, ampBand1), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine1);
	delay1 = Pan2.ar(AllpassC.ar(sine1, maxDel, delT, decT), posDel1, levelDel1);

	sine2 =  Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrig1), attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand2, bw2, ampBand2), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine2);
	delay2 = Pan2.ar(AllpassC.ar(sine2, maxDel, delT, decT), posDel2, levelDel2);

	sine3 =  Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrig2), attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand3, bw3, ampBand3), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine3);
	delay3 = Pan2.ar(AllpassC.ar(sine3, maxDel, delT, decT), posDel3, levelDel3);

	sine4 =  Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrig3), attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand3, bw3, ampBand3), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine4);
	delay4 = Pan2.ar(AllpassC.ar(sine4, maxDel, delT, decT), posDel4, levelDel4);

	sine5 =  Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrig4), attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand4, bw4, ampBand4), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine5);
	delay5 = Pan2.ar(AllpassC.ar(sine5, maxDel, delT, decT), posDel5, levelDel5);

	sine6 =  Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrig5), attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand5, bw5, ampBand5), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine6);
	delay6 = Pan2.ar(AllpassC.ar(sine6, maxDel, delT, decT), posDel6, levelDel6);

	sine7 =  Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrig6), attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand7, bw7, ampBand7), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine7);
	delay7 = Pan2.ar(AllpassC.ar(sine7, maxDel, delT, decT), posDel7, levelDel7);

	sine8 =  Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durTrig7), attTDec, decTDec, DynKlank.ar(`[freqs, ampsFreq, rings], BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand8, bw8, ampBand8), LFNoise1.kr(rateFreqScale).range(loFreqScale, hiFreqScale), 0, LFNoise1.kr(rateDecScale).range(loDecScale, hiDecScale))), 19000), posSine8);
	delay8 = Pan2.ar(AllpassC.ar(sine8, maxDel, delT, decT), posDel8, levelDel8);

	mixSine = Mix.new([sine1, delay1, sine2, delay2, sine3, delay3, sine4, delay4, sine5, delay5, sine6, delay6, sine7, delay7, sine8, delay8]);
	OffsetOut.ar(bus, HPF.ar(FreeVerb.ar(mixSine, mix, room, damp), 40));
}).send(s);
)


a = Synth(\SineNoiseDecDynKlank, [\freqs, [220, 220 *2, 220 *3, 220 *4, 220 *5, 220 *6, 220*7, 220*8], \ampsFreq, [1/16, 1/15, 1/14, 1/13, 1/12, 1/11, 1/10, 1/9]]);
a.set(\trigRate, 27);

(
~fund = 220;
~amp = 0.2;
a.set(\freqBand1, ~fund, \freqBand2, ~fund *3, \freqBand3, ~fund *5, \freqBand4, ~fund *7, \freqBand5, ~fund *9, \freqBand6, ~fund *11, \freqBand7, ~fund *13, \freqBand8, ~fund *15);
a.set(\ampBand1, ~amp, \ampBand2, ~amp * 0.7, \ampBand3, ~amp * 0.6, \ampBand4, ~amp * 0.5, \ampBand5, ~amp * 0.4, \ampBand6, ~amp * 0.3, \ampBand7, ~amp * 0.2, \ampBand8, ~amp * 0.1);
)

(
~fund = 110;
~amp = 0.8;
a.set(\freqBand1, ~fund, \freqBand2, ~fund *3, \freqBand3, ~fund *5, \freqBand4, ~fund *7, \freqBand5, ~fund *9, \freqBand6, ~fund *11, \freqBand7, ~fund *13, \freqBand8, ~fund *15);
a.set(\ampBand1, ~amp/9, \ampBand2, ~amp/10, \ampBand3, ~amp/11, \ampBand4, ~amp/12, \ampBand5, ~amp/13, \ampBand6, ~amp/14, \ampBand7, ~amp/15, \ampBand8, ~amp/16);
)

// levels for additive in ampBands, movable spectrum freBand3, fix resonance freqs, levels of resonance in ampFreq
//nice crystal timbre comes from inverted amplitudes of resonant freqs 1/16 - 1/9

2/7*(0..7)-1.0;



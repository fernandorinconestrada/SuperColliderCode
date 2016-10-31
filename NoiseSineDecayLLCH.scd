(
SynthDef(\NoiseSineDecayLLCH, { | levelWhite = 1.0, freqBand1 = 440, bw1 = 0.001, ampBand1 = 1.2, freqBand2 = 440, bw2 = 0.001, ampBand2 = 1.2, freqBand3 = 440, bw3 = 0.001, ampBand3 = 1.2, freqBand4 = 440, bw4 = 0.001, ampBand4 = 1.2, freqBand5 = 440, bw5 = 0.001, ampBand5 = 1.2, freqBand6 = 440, bw6 = 0.001, ampBand6 = 1.2, freqBand7 = 440, bw7 = 0.001, ampBand7 = 1.2, freqBand8 = 440, bw8 = 0.001, ampBand8 = 1.2, freqBand9 = 440, bw9 = 0.001, ampBand9 = 1.2, freqBand10 = 440, bw10 = 0.001, ampBand10 = 1.2, rateTrig = 1, attTDec = 0.01, decTDec = 0.5, posOut1 = -1.0, maxDel = 0.2, delT = 0.6, decT = 0.5, posDel1 = -0.71428571428571, panDelAmp1 = 0.75, durDelTrig1 = 0.2, posOut2 = -0.71428571428571, posDel2 = -0.42857142857143, panDelAmp2 = 0.75, durDelTrig2 = 0.4, posOut3 = -0.42857142857143, posDel3 = -0.14285714285714, panDelAmp3 = 0.75, durDelTrig3 = 0.6, posOut4 = -0.14285714285714, posDel4 = 0.14285714285714, panDelAmp4 = 0.75, durDelTrig4 = 0.8, posOut5 = 0.14285714285714, posDel5 = 0.42857142857143, panDelAmp5 = 0.75, durDelTrig5 = 1.0, posOut6 = 0.42857142857143, posDel6 = 0.71428571428571, panDelAmp6 = 0.75, durDelTrig6 = 1.2, posOut7 = 0.71428571428571, posDel7 = 1.4, panDelAmp7 = 0.75, durDelTrig7 = 0.4, posOut8 = 1.0, posDel8 = -1.0, panDelAmp8 = 0.75,  bus = 0, mixRev = 0.1, room = 0.2, damp = 0.8 |

	var trig, sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10, mixSine, out1, delay1, out2, delay2, out3, delay3, out4, delay4, out5, delay5, out6, delay6, out7, delay7, out8, delay8, mixOut;

	trig = Impulse.ar(rateTrig);

	sine1 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand1, bw1, ampBand1);
	sine2 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand2, bw2, ampBand2);
	sine3 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand3, bw3, ampBand3);
	sine4 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand4, bw4, ampBand4);
	sine5 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand5, bw5, ampBand5);
	sine6 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand6, bw6, ampBand6);
	sine7 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand7, bw7, ampBand7);
	sine8 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand8, bw8, ampBand8);
	sine9 =  BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand9, bw9, ampBand9);
	sine10 = BBandPass.ar(WhiteNoise.ar(levelWhite), freqBand10, bw10, ampBand10);

	mixSine = Mix.new([sine1, sine2, sine3, sine4, sine5, sine6, sine7, sine8, sine9, sine10]);

	out1 = Pan2.ar(LPF.ar(Decay2.ar(trig, attTDec, decTDec, mixSine), 19000), posOut1);
	delay1 = Pan2.ar(HPF.ar(AllpassC.ar(out1, maxDel, delT, decT), 40), posDel1, panDelAmp1);

	out2 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durDelTrig1), attTDec, decTDec, mixSine), 19000), posOut2);
	delay2 = Pan2.ar(HPF.ar(AllpassC.ar(out2, maxDel, delT, decT), 40), posDel2, panDelAmp2);

	out3 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durDelTrig2), attTDec, decTDec, mixSine), 19000), posOut3);
	delay3 = Pan2.ar(HPF.ar(AllpassC.ar(out3, maxDel, delT, decT), 40), posDel3, panDelAmp3);

	out4 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durDelTrig3), attTDec, decTDec, mixSine), 19000), posOut4);
	delay4 = Pan2.ar(HPF.ar(AllpassC.ar(out4, maxDel, delT, decT), 40), posDel4, panDelAmp4);

	out5 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durDelTrig4), attTDec, decTDec, mixSine), 19000), posOut5);
	delay5 = Pan2.ar(HPF.ar(AllpassC.ar(out5, maxDel, delT, decT), 40), posDel5, panDelAmp5);

	out6 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durDelTrig5), attTDec, decTDec, mixSine), 19000), posOut6);
	delay6 = Pan2.ar(HPF.ar(AllpassC.ar(out6, maxDel, delT, decT), 40), posDel6, panDelAmp6);

	out7 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durDelTrig6), attTDec, decTDec, mixSine), 19000), posOut7);
	delay7 = Pan2.ar(HPF.ar(AllpassC.ar(out7, maxDel, delT, decT), 40), posDel7, panDelAmp7);

	out8 = Pan2.ar(LPF.ar(Decay2.ar(TDelay.ar(trig, durDelTrig7), attTDec, decTDec, mixSine), 19000), posOut8);
	delay8 = Pan2.ar(HPF.ar(AllpassC.ar(out8, maxDel, delT, decT), 40), posDel8, panDelAmp8);

	mixOut = Mix.new([out1, out2, out3, out4, out5, out6, out7, out8]);

	OffsetOut.ar(bus, HPF.ar(CompanderD.ar(FreeVerb.ar(mixOut, mixRev, room, damp), 0.5, 0.5, 4, 0.01, 0.01), 40));
}).add;
)

a = Synth(\NoiseSineDecayLLCH, [\rateTrig,  0.71428571428571]);
a.set(\bw, 0.001);
a.set(\rateTrig, 0.71428571428571*8);
a.set(\decTDec, 0.1);

(
~fund = 880;
~amp = 0.2;
a.set(\freqBand1, ~fund, \freqBand2, ~fund *3, \freqBand3, ~fund *5, \freqBand4, ~fund *7, \freqBand5, ~fund *9, \freqBand6, ~fund *11, \freqBand7, ~fund *13, \freqBand8, ~fund *15);
a.set(\ampBand1, ~amp, \ampBand2, ~amp * 0.7, \ampBand3, ~amp * 0.6, \ampBand4, ~amp * 0.5, \ampBand5, ~amp * 0.4, \ampBand6, ~amp * 0.3, \ampBand7, ~amp * 0.2, \ampBand8, ~amp * 0.1);
)



//Math Operations
2/7 * (0..7) - 1.0;
4/8

1000/1400
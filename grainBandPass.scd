(
SynthDef(\grainBandpass, { |dens = 1, amp = 1.5, freqB1 = 110, freqB2 = 220, freqB3 = 330, freqB4 = 440, freqB5 = 550, freqB6 = 660, bw1 = 0.01, bw2 = 0.01, bw3 = 0.01, bw4 = 0.01, bw5 = 0.01, bw6 = 0.01, ampB1 = 1.9, ampB2 = 1.7, ampB3 = 1.3, ampB4 = 1.3, ampB5 = 1.1, ampB6 = 1.1, delT1 = 0.019, decT1 0.8, ampDel1 = 0.75, delT2 = 0.017, decT2 0.8, ampDel2 = 0.75, delT3 = 0.013, decT3 0.8, ampDel3 = 0.75, delT4 = 0.011, decT4 0.8, ampDel4 = 0.75, delT5 = 0.07, decT5 0.8, ampDel5 = 0.75, delMix = 0.00, decMix = 0.9, ampMix = 0.75, busL = 0, busR = 2|
	var impulse, band1, band2, band3, band4, band5, band6, delay1, delay2, delay3, delay4, delay5, mix, delayMix;
	impulse = Impulse.ar(dens, 0, amp);
	//impulse = WhiteNoise.ar(amp) * EnvGen.ar(Env.perc, Impulse.kr(envImp));
	band1 = BBandPass.ar(impulse, freqB1, bw1, ampB1);
	band2 = BBandPass.ar(impulse, freqB2, bw2, ampB2);
	band3 = BBandPass.ar(impulse, freqB3, bw3, ampB3);
	band4 = BBandPass.ar(impulse, freqB4, bw4, ampB4);
	band5 = BBandPass.ar(impulse, freqB5, bw5, ampB5);
	band6 = BBandPass.ar(impulse, freqB6, bw6, ampB6);
	delay1 = AllpassC.ar(band2, 0.3, delT1, decT1, ampDel1);
	delay2 = AllpassC.ar(band3, 0.3, delT2, decT2, ampDel2);
	delay3 = AllpassC.ar(band4, 0.3, delT3, decT3, ampDel3);
	delay4 = AllpassC.ar(band5, 0.3, delT4, decT4, ampDel4);
	delay5 = AllpassC.ar(band6, 0.3, delT5, decT5, ampDel5);
	mix = Mix.new([band1, delay1, delay2, delay3, delay4, delay5]);
	delayMix = AllpassC.ar(mix, 0.3, delMix, decMix, ampMix);
	OffsetOut.ar(busL, HPF.ar(Limiter.ar(mix, 0.95), 20));
	OffsetOut.ar(busR, HPF.ar(Limiter.ar(delayMix, 0.9), 20));
}).add;
)

a = Synth(\grainBandpass);
a.set(\busL, 7, \busR, 3);
a.set(\bw1, 0.003, \bw2, 0.004, \bw3, 0.003, \bw4, 0.002, \bw5, 0.001, \bw6, 0.001);

a.set(\delMix, 0.1);
a.set(\amp, 2);
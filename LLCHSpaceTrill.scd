(
SynthDef(\LLCHSpreadSpaceTrill, { |busL = 0, busR = 2, busL1 = 4, busR1 = 6, gate = 0.5, durDel = 0.05, freqL = 330, fbL = 0.4, lofb = 0.3, hifb = 0.8, ampL = 10, loAmp = 0.02, hiAmp = 0.06, freqR = 331, fbR = 0.42, ampR = 13, maxDel_L = 0.2, delT_L = 0.09, decT_L = 0.5, ampDel_L = 0.5, maxDel_R = 0.2, delT_R = 1.1, decT_R = 0.5, ampDel_R = 0.5|
	var envL, envR, sigL, sigR, delayL, delayR;
	envL = EnvGen.kr(Env.perc(releaseTime:0.5, curve: -6), Impulse.kr(gate));
	envR = EnvGen.kr(Env.perc, TDelay.kr(Impulse.kr(gate), durDel));
	sigL = SinOscFB.ar(freqL, SinOsc.kr(fbL).range(lofb, hifb), LFNoise2.kr(ampL).range(loAmp, hiAmp)) * envL;
	sigR = SinOscFB.ar(freqR, SinOsc.kr(fbR).range(lofb, hifb), LFNoise2.kr(ampR).range(loAmp, hiAmp)) * envR;
	delayL = AllpassC.ar(sigL, maxDel_L, delT_L, decT_L, ampDel_L);
	delayR = AllpassC.ar(sigR, maxDel_R, delT_R, decT_R, ampDel_R);
	OffsetOut.ar(busL, sigL);
	OffsetOut.ar(busR, sigR);
	OffsetOut.ar(busL1, delayL);
	OffsetOut.ar(busR1, delayR);
}).add;
)

a = Synth(\LLCHSpreadSpaceTrill);
a.set(\durDel, 0.02);
a.set(\busL1, 4, \busR1, 6);
a.set(\freqL, 70, \freqR, 71);
b = Synth(\LLCHSpreadSpaceTrill, [\busL, 4, \busR, 6, \busL1, 0, \busR1, 2, \freqL, 329, \freqR, 331])
c = Synth(\LLCHSpreadSpaceTrill, [\busL, 7, \busR, 3, \busL1, 1, \busR1, 5, \freqL, 440, \freqR, 331]);
a.set(\gate, 103);
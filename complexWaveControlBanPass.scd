{
	OffsetOut.ar(0, BBandPass.ar(WhiteNoise.ar(1.5), 1200, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9)));
}.play;

{
	var att, dec;
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	OffsetOut.ar(0, BBandPass.ar(WhiteNoise.ar(1.5), 1200, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.035)*0.69]), Dust.kr(20)));
}.play;


{
	var att, dec, in, del;
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	in = BBandPass.ar(WhiteNoise.ar(1.5), 1200, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.035)*0.69]), Dust.kr(20));
	del = DelayC.ar(in, 0.1, 0.05, 0.75);
	OffsetOut.ar(0, [in, del]);
}.play;

{
	var att, dec, in, del;
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	in = BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7)).range(1180, 1220), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.035)*0.69]), Dust.kr(20));
	del = DelayC.ar(in, 0.1, 0.05, 0.75);
	OffsetOut.ar(0, [in, del]);
}.play;

{
	var att, dec, in, del;
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	in = BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7)).range(1180, 1220), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.035)*0.69]), Impulse.kr(20));
	del = DelayC.ar(in, 0.1, 0.06, 0.75);
	OffsetOut.ar(0, [in, del]);
}.play;


{
	var att, dec, in, del, trig;
	trig = Impulse.kr(20);
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	in = BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7)).range(1180, 1220), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.035)*0.69]), trig);
	del = DelayC.ar(BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(5)+SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(13)).range(1180, 1220), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.035)*0.69]), trig), 0.1, 0.06, 0.75);
	OffsetOut.ar(0, [in, del]);
}.play;

{
	var att, dec, in, del, trig;
	trig = Dust.kr(25);
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	in = BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7)).range(1180, 1220), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.015)*0.69]), trig);
	del = DelayC.ar(BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(5)+SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(13)).range(1140, 1260), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.035)*0.69]), trig), 0.1, 0.05, 0.75);
	OffsetOut.ar(0, [in, del]);
}.play;

{
	var att, dec, in, del, trig;
	trig = Dust.kr(25);
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	in = BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7)).range(1180*2, 1220*2), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.4, 0.7))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.015)*0.69]), trig);
	del = DelayC.ar(BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(5)+SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(13)).range(1140*3, 1260*3), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.015)*0.69]), trig), 0.1, 0.03, 0.5);
	OffsetOut.ar(0, [in, del]);
}.play;


{
	var att, dec, in, del, trig;
	trig = Dust.kr(25);
	att = SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(13);
	dec = SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7);
	in = BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(13)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(7)).range(1180*7, 1220*7), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.2, 0.5))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.015)*0.69]), trig);
	del = DelayC.ar(BBandPass.ar(WhiteNoise.ar(1.5), (SinOsc.kr(5)+SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(13)).range(1140*5, 1260*5), (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).abs.range(0.0001, 0.001).poll, (SinOsc.kr(7)+SinOsc.kr(11)+SinOsc.kr(5)+SinOsc.kr(13)).range(0.6, 0.9))*EnvGen.kr(Env([0,1,0], [att.range(0.001, 0.01)*0.3, dec.range(0.01, 0.015)*0.69]), trig), 0.1, 0.08, 0.3);
	OffsetOut.ar(0, [in, del]);
}.play;


(
SynthDef(\BandPassComplexWaveKtrl, { |attRate1 = 7, attRate2 = 5, attRate3 = 11, attRate4 = 13, decRate1 = 5, decRate2 = 11, decRate3 = 13, decRate4 = 7, trigRate = 20, loDurAtt = 0.001, hiDurAtt = 0.01, durAtt = 0.3, loDurDec = 0.01, hiDurDec = 0.03, durDec = 0.69, multWhite = 1.5, freqRate1 = 11, freqRate2 = 13, freqRate3 = 7, freqRate4 = 5, lofreq = 1180, hifreq = 1220, bwRate1 = 13, bwRate2 = 7, bwRate3 = 5, bwRate4 = 11, lobw = 0.0001, hibw = 0.001, ampRate1 = 7, ampRate2 = 5, ampRate3 = 11, ampRate4 = 13, loAmp = 0.6, hiAmp = 0.9, delFreqRate1 = 11, delFreqRate2 = 13, delFreqRate3 = 7, delFreqRate4 = 5, delLofreq = 1180, delHifreq = 1220, delBwRate1 = 13, delBwRate2 = 7, delBwRate3 = 5, delBwRate4 = 11, delLobw = 0.0001, delHibw = 0.001, delAmpRate1 = 7, delAmpRate2 = 5, delAmpRate3 = 11, delAmpRate4 = 13, delLoAmp = 0.6, delHiAmp = 0.9, delT = 0.04, ampDel = 0.75|
	var att, dec, white,trig, env, in, del;
	att = SinOsc.kr(attRate1)+SinOsc.kr(attRate2)+SinOsc.kr(attRate3)+SinOsc.kr(attRate4);
	dec = SinOsc.kr(decRate1)+SinOsc.kr(decRate2)+SinOsc.kr(decRate3)+SinOsc.kr(decRate4);
	white = WhiteNoise.ar(multWhite);
	trig = Dust.kr(trigRate);
	env = EnvGen.kr(Env([0,1,0], [att.range(loDurAtt, hiDurAtt)*durAtt, dec.range(loDurDec, hiDurDec)*durDec]), trig);
	in = BBandPass.ar(white, (SinOsc.kr(freqRate1)+SinOsc.kr(freqRate2)+SinOsc.kr(freqRate3)+SinOsc.kr(freqRate4)).range(lofreq, hifreq), (SinOsc.kr(bwRate1)+SinOsc.kr(bwRate2)+SinOsc.kr(bwRate3)+SinOsc.kr(bwRate4)).abs.range(lobw, hibw).poll, (SinOsc.kr(ampRate1)+SinOsc.kr(ampRate2)+SinOsc.kr(ampRate3)+SinOsc.kr(ampRate4)).range(loAmp, hiAmp));
	del = DelayC.ar(BBandPass.ar(white, (SinOsc.kr(delFreqRate1)+SinOsc.kr(delFreqRate2)+SinOsc.kr(delFreqRate3)+SinOsc.kr(delFreqRate4)).range(delLofreq, delHifreq), (SinOsc.kr(delBwRate1)+SinOsc.kr(delBwRate2)+SinOsc.kr(delBwRate3)+SinOsc.kr(delBwRate4)).abs.range(delLobw, delHibw).poll, (SinOsc.kr(delAmpRate1)+SinOsc.kr(delAmpRate2)+SinOsc.kr(delAmpRate3)+SinOsc.kr(delAmpRate4)).range(delLoAmp, delHiAmp)), 0.2, delT, ampDel);
	OffsetOut.ar(0, [in, del]*env);
}).add;
)

a = Synth(\BandPassComplexWaveKtrl, [\attRate1, 5, \attRate2, 11, \attRate3, 7, \attRate4, 13, \decRate1, 11, \decRate2, 7, \decRate3, 13, \decRate4, 5, \freqRate1, 7, \freqRate2, 13, \freqRate3, 5, \freqRate4, 11, \lofreq, 1180, \hifreq, 1220, \bwRate1, 13, \bwRate2, 5, \bwRate3, 11, \bwRate4, 7, \lobw, 0.0001, \hibw, 0.001, \ampRate1, 5, \ampRate2, 11, \ampRate3, 7, \ampRate4, 13, \loAmp, 0.6, \hiAmp, 0.9, \delFreqRate1, 11, \delFreqRate2, 7, \delFreqRate3, 13, \delFreqRate4, 5, \delLofreq, 1180*3, \delHifreq, 1220*3, \delBwRate1, 7, \delBwRate2, 13, \delBwRate3, 5, \delBwRate4, 11, \lobw, 0.0001, \hibw, 0.001, \delAmpRate1, 13, \delAmpRate2, 5, \delAmpRate3, 11, \delAmpRate4, 7, \delLoAmp, 0.3, \delHiAmp, 0.5, \delT, 0.06, \ampDel, 0.5]);

b = Synth(\BandPassComplexWaveKtrl, [\attRate1, 5, \attRate2, 11, \attRate3, 7, \attRate4, 13, \decRate1, 11, \decRate2, 7, \decRate3, 13, \decRate4, 5, \freqRate1, 7, \freqRate2, 13, \freqRate3, 5, \freqRate4, 11, \lofreq, 1180*11, \hifreq, 1220*11, \bwRate1, 13, \bwRate2, 5, \bwRate3, 11, \bwRate4, 7, \lobw, 0.0005, \hibw, 0.005, \ampRate1, 5, \ampRate2, 11, \ampRate3, 7, \ampRate4, 13, \loAmp, 0.1, \hiAmp, 0.4, \delFreqRate1, 11, \delFreqRate2, 7, \delFreqRate3, 13, \delFreqRate4, 5, \delLofreq, 1180*5, \delHifreq, 1220*5, \delBwRate1, 7, \delBwRate2, 13, \delBwRate3, 5, \delBwRate4, 11, \lobw, 0.001, \hibw, 0.01, \delAmpRate1, 13, \delAmpRate2, 5, \delAmpRate3, 11, \delAmpRate4, 7, \delLoAmp, 0.3, \delHiAmp, 0.5, \delT, 0.03, \ampDel, 0.5]);

b.free;

c = Synth.before(\fxchain, )


(
SynthDef(\fxChain, {
	ReplaceOut.ar(0, GVerb.ar(In.ar(0, 2)));
}).add;
)
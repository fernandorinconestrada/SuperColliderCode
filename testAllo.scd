(
SynthDef(\testAllo, { | busL = 0, freqL = 220, fbRateL = 0.2, mulRateL = 0.4, ampMulL = 0.2, busR = 1, freqR = 220, fbRateR = 0.23, mulRateR = 0.3, ampMulR = 0.2 |
	OffsetOut.ar(busL, SinOscFB.ar(freqL, SinOsc.kr(fbRateL), SinOsc.kr(mulRateL, 0, ampMulL)));
	OffsetOut.ar(busR, SinOscFB.ar(freqR, SinOsc.kr(fbRateR), SinOsc.kr(mulRateR, 0, ampMulR)));
}).add;
)

(
SynthDef(\testAlloA, { | busL = 0, freqL = 220, fbRateL = 0.2, mulRateL = 0.4, busR = 1, freqR = 220, fbRateR = 0.23, mulRateR = 0.3, rateTrigL = 5, rateTrigR = 5|
	var ampMulL, ampMulR;
	ampMulL = LFNoise0.kr(rateTrigL, 0.05, 0.05);
	ampMulR = LFNoise0.kr(rateTrigR, 0.05, 0.05);
	OffsetOut.ar(busL, SinOscFB.ar(freqL, SinOsc.kr(fbRateL), SinOsc.kr(mulRateL, 0, ampMulL)));
	OffsetOut.ar(busR, SinOscFB.ar(freqR, SinOsc.kr(fbRateR), SinOsc.kr(mulRateR, 0, ampMulR)));
}).add;
)

(
SynthDef(\testAlloB, { | busL = 0, busR = 1, rateTrig1 = 8, rateTrig2 = 8, rateTrig3 = 9, rateTrig4 = 9, freq1 = 220, freq2 = 220.3, freq3 = 221, freq4 = 221.4, fbRate1 = 0.2, fbRate2 = 0.23, fbRate3 = 0.2, fbRate4 = 0.23, freqR = 220, mulRate1 = 3,   mulRate2 = 2, mulRate3 = 3,   mulRate4 = 5|
	var ampMul1, ampMul2, ampMul3, ampMul4;
	ampMul1 = LFNoise0.kr(rateTrig1, 0.05, 0.05);
	ampMul2 = LFNoise0.kr(rateTrig2, 0.05, 0.05);
	ampMul3 = LFNoise0.kr(rateTrig3, 0.05, 0.05);
	ampMul4 = LFNoise0.kr(rateTrig4, 0.05, 0.05);
	OffsetOut.ar(busL, SinOscFB.ar(freq1, SinOsc.kr(fbRate1, 0, 0.8), SinOsc.kr(mulRate1, 0, ampMul1)));
	OffsetOut.ar(busR, SinOscFB.ar(freq2, SinOsc.kr(fbRate2, 0, 0.6), SinOsc.kr(mulRate2, 0, ampMul2)));
	OffsetOut.ar(busR, SinOscFB.ar(freq3, SinOsc.kr(fbRate3, 0, 0.7), SinOsc.kr(mulRate3, 0, ampMul3)));
	OffsetOut.ar(busL, SinOscFB.ar(freq4, SinOsc.kr(fbRate4, 0, 0.9), SinOsc.kr(mulRate4, 0, ampMul4)));
}).add;
)

(
SynthDef(\testAlloC, { | busL = 0, busR = 1, rateTrig1 = 8, rateTrig2 = 8, rateTrig3 = 9, rateTrig4 = 9, rateTrig5 = 10, rateTrig6 = 10, rateTrig7 = 11, rateTrig8 = 11, freq1 = 220, freq2 = 220, freq3 = 221, freq4 = 221, freq5 = 222, freq6 = 222, freq7 = 223, freq8 = 223, fbRate1 = 0.2, fbRate2 = 0.23, fbRate3 = 0.2, fbRate4 = 0.23, fbRate5 = 0.29, fbRate6 = 0.31, fbRate7 = 0.29, fbRate8 = 0.31, mulRate1 = 3,   mulRate2 = 2, mulRate3 = 3,   mulRate4 = 5,  mulRate5 = 7,   mulRate6 = 2, mulRate7 = 5,   mulRate8 = 3|
	var ampMul1, ampMul2, ampMul3, ampMul4, ampMul5, ampMul6, ampMul7, ampMul8;
	ampMul1 = LFNoise0.kr(rateTrig1, 0.05, 0.05);
	ampMul2 = LFNoise0.kr(rateTrig2, 0.05, 0.05);
	ampMul3 = LFNoise0.kr(rateTrig3, 0.05, 0.05);
	ampMul4 = LFNoise0.kr(rateTrig4, 0.05, 0.05);
	ampMul5 = LFNoise0.kr(rateTrig5, 0.05, 0.05);
	ampMul6 = LFNoise0.kr(rateTrig6, 0.05, 0.05);
	ampMul7 = LFNoise0.kr(rateTrig7, 0.05, 0.05);
	ampMul8 = LFNoise0.kr(rateTrig8, 0.05, 0.05);
	OffsetOut.ar(busL, SinOscFB.ar(freq1, SinOsc.kr(fbRate1, 0, 0.8), SinOsc.kr(mulRate1, 0, ampMul1)));
	OffsetOut.ar(busR, SinOscFB.ar(freq2, SinOsc.kr(fbRate2, 0, 0.6), SinOsc.kr(mulRate2, 0, ampMul2)));
	OffsetOut.ar(busR, SinOscFB.ar(freq3, SinOsc.kr(fbRate3, 0, 0.7), SinOsc.kr(mulRate3, 0, ampMul3)));
	OffsetOut.ar(busL, SinOscFB.ar(freq4, SinOsc.kr(fbRate4, 0, 0.9), SinOsc.kr(mulRate4, 0, ampMul4)));
	OffsetOut.ar(busL, SinOscFB.ar(freq5, SinOsc.kr(fbRate5, 0, 0.8), SinOsc.kr(mulRate5, 0, ampMul5)));
	OffsetOut.ar(busR, SinOscFB.ar(freq6, SinOsc.kr(fbRate6, 0, 0.6), SinOsc.kr(mulRate6, 0, ampMul6)));
	OffsetOut.ar(busR, SinOscFB.ar(freq7, SinOsc.kr(fbRate7, 0, 0.7), SinOsc.kr(mulRate7, 0, ampMul7)));
	OffsetOut.ar(busL, SinOscFB.ar(freq8, SinOsc.kr(fbRate8, 0, 0.9), SinOsc.kr(mulRate8, 0, ampMul8)));
}).add;
)

(
SynthDef(\testAlloD, { | busL = 0, busR = 1, rateTrigDec = 1.25, rateTrig1 = 8, rateTrig2 = 8, rateTrig3 = 9, rateTrig4 = 9, rateTrig5 = 10, rateTrig6 = 10, rateTrig7 = 11, rateTrig8 = 11, freq1 = 220, freq2 = 220, freq3 = 221, freq4 = 221, freq5 = 222, freq6 = 222, freq7 = 223, freq8 = 223, fbRate1 = 0.2, fbRate2 = 0.23, fbRate3 = 0.2, fbRate4 = 0.23, fbRate5 = 0.29, fbRate6 = 0.31, fbRate7 = 0.29, fbRate8 = 0.31, mulRate1 = 3,   mulRate2 = 2, mulRate3 = 3,   mulRate4 = 5,  mulRate5 = 7,   mulRate6 = 2, mulRate7 = 5,   mulRate8 = 3|
	var trig, ampMul1, ampMul2, ampMul3, ampMul4, ampMul5, ampMul6, ampMul7, ampMul8;
	trig = Impulse.ar(rateTrigDec);
	ampMul1 = LFNoise0.kr(rateTrig1, 0.05, 0.05);
	ampMul2 = LFNoise0.kr(rateTrig2, 0.05, 0.05);
	ampMul3 = LFNoise0.kr(rateTrig3, 0.05, 0.05);
	ampMul4 = LFNoise0.kr(rateTrig4, 0.05, 0.05);
	ampMul5 = LFNoise0.kr(rateTrig5, 0.05, 0.05);
	ampMul6 = LFNoise0.kr(rateTrig6, 0.05, 0.05);
	ampMul7 = LFNoise0.kr(rateTrig7, 0.05, 0.05);
	ampMul8 = LFNoise0.kr(rateTrig8, 0.05, 0.05);
	OffsetOut.ar(busL, Decay2.ar(trig, 0.01, 0.5, SinOscFB.ar(freq1, SinOsc.kr(fbRate1, 0, 0.8), SinOsc.kr(mulRate1, 0, ampMul1))));
	OffsetOut.ar(busR, Decay2.ar(TDelay.ar(trig, 0.1), 0.01, 0.5, SinOscFB.ar(freq2, SinOsc.kr(fbRate2, 0, 0.6), SinOsc.kr(mulRate2, 0, ampMul2))));
	OffsetOut.ar(busR, Decay2.ar(TDelay.ar(trig, 0.2), 0.01, 0.5, SinOscFB.ar(freq3, SinOsc.kr(fbRate3, 0, 0.7), SinOsc.kr(mulRate3, 0, ampMul3))));
	OffsetOut.ar(busL, Decay2.ar(TDelay.ar(trig, 0.3), 0.01, 0.5, SinOscFB.ar(freq4, SinOsc.kr(fbRate4, 0, 0.9), SinOsc.kr(mulRate4, 0, ampMul4))));
	OffsetOut.ar(busL, Decay2.ar(TDelay.ar(trig, 0.4), 0.01, 0.5, SinOscFB.ar(freq5, SinOsc.kr(fbRate5, 0, 0.8), SinOsc.kr(mulRate5, 0, ampMul5))));
	OffsetOut.ar(busR, Decay2.ar(TDelay.ar(trig, 0.5), 0.01, 0.5, SinOscFB.ar(freq6, SinOsc.kr(fbRate6, 0, 0.6), SinOsc.kr(mulRate6, 0, ampMul6))));
	OffsetOut.ar(busR, Decay2.ar(TDelay.ar(trig, 0.6), 0.01, 0.5, SinOscFB.ar(freq7, SinOsc.kr(fbRate7, 0, 0.7), SinOsc.kr(mulRate7, 0, ampMul7))));
	OffsetOut.ar(busL, Decay2.ar(TDelay.ar(trig, 0.7), 0.01, 0.5, SinOscFB.ar(freq8, SinOsc.kr(fbRate8, 0, 0.9), SinOsc.kr(mulRate8, 0, ampMul8))));
}).add;
)

a = Synth(\testAllo);
a = Synth(\testAlloA);
a = Synth(\testAlloB);
a = Synth(\testAlloC);
a = Synth(\testAlloD);
a.free;
a.set(\freq1, 220, \freq2, 222, \freq3, 441, \freq4, 436, \freq5,1336, \freq6, 1320, \freq7, 2410, \freq8, 2421);
a.set(\rateTrigDec, 10);


a.set(\mulRateL, 3, \mulRateR, 2);
a.set(\rateTrigL, 8, \rateTrigR, 8);

1/0.8
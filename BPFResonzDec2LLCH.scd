(
SynthDef(\BPFRezonsDec, { | trigRate = 10, attT = 0.01, decT = 0.08, levWhite = 1.8, rateFreqBPF = 16, loFreqBPF = 49, hiFreqBPF = 880, bwBPF = 0.01, ampBPF = 1.8, rateRes = 8, loFreqRes = 49, hiFreqRes = 880, bwRes = 0.001, ampRes = 1.2, delTrig0 = 0.1, delTrig1 = 0.2, delTrig2 = 0.3, delTrig3 = 0.4, delTrig4 = 0.5, delTrig5 = 0.6, delTrig6 = 0.7, delAll = 0.05, decAll = 0.5 |
var trig, in0, in1, in2, in3, in4, in5, in6, in7/*, bwBPF, bwRes*/;
	trig = Impulse.ar(trigRate);
	//bwBPF = LFNoise0.kr(16).range(0.001, 0.1);
	//bwRes = LFNoise0.kr(16).range(0.001, 0.1);
	in0 = Decay2.ar(trig, attT, decT, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	in1 = Decay2.ar(TDelay.ar(trig, delTrig0), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	in2 = Decay2.ar(TDelay.ar(trig, delTrig1), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	in3 = Decay2.ar(TDelay.ar(trig, delTrig2), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	in4 = Decay2.ar(TDelay.ar(trig, delTrig3), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	in5 = Decay2.ar(TDelay.ar(trig, delTrig4), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	in6 = Decay2.ar(TDelay.ar(trig, delTrig5), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	in7 = Decay2.ar(TDelay.ar(trig, delTrig6), 0.01, 0.08, Resonz.ar(BPF.ar(WhiteNoise.ar(levWhite), LFNoise0.kr(rateFreqBPF).range(loFreqBPF, hiFreqBPF), bwBPF, ampBPF), LFNoise0.kr(rateRes).range(loFreqRes, hiFreqRes), bwRes, ampRes));
	OffsetOut.ar(0, AllpassC.ar(in0, 0.2, delAll, decAll));
	OffsetOut.ar(1, AllpassC.ar(in1, 0.2, delAll, decAll));
	OffsetOut.ar(2, AllpassC.ar(in2, 0.2, delAll, decAll));
	OffsetOut.ar(3, AllpassC.ar(in3, 0.2, delAll, decAll));
	OffsetOut.ar(4, AllpassC.ar(in4, 0.2, delAll, decAll));
	OffsetOut.ar(5, AllpassC.ar(in5, 0.2, delAll, decAll));
	OffsetOut.ar(6, AllpassC.ar(in6, 0.2, delAll, decAll));
	OffsetOut.ar(7, AllpassC.ar(in7, 0.2, delAll, decAll));
	OffsetOut.ar(7, in0);
	OffsetOut.ar(6, in1);
	OffsetOut.ar(5, in2);
	OffsetOut.ar(4, in3);
	OffsetOut.ar(3, in4);
	OffsetOut.ar(2, in5);
	OffsetOut.ar(1, in6);
	OffsetOut.ar(0, in7);
}).add;
)

// 100 ms trig delays gives trigRate multiples of 5
//Randomizing one of /bwRes or /bwBPF between comfortable ranges works, both /bwRes and bwBPF doesn't work, is not clean
//the contrary motion between initial and delay works nice

a = Synth(\BPFRezonsDec);
a.free;
b.free;
a.set(\loFreqBPF, 220, \hiFreqBPF, 880, \loFreqRes, 55, \hiFreqRes, 880); //
a.set(\loFreqBPF, 220, \hiFreqBPF, 880, \loFreqRes, 55, \hiFreqRes, 1760*2); // good parameters
a.set(\loFreqBPF, 440, \hiFreqBPF, 880, \loFreqRes, 55, \hiFreqRes, 1760*8); // good parameters, the frequency range of the resonz affects color dark to bright, BPF ranges focuses on pitch

a.set(\bwRes, 0.01)// very nice more warmth
a.set(\bwRes, 0.1);//very effective timbre change from this parameter
a.set(\bwRes, 1);//snare drum
a.set(\bwRes, 0.001);//initial value

a.set(\bwBPF, 0.01);// very nice more warmth, initial value
a.set(\bwBPF, 0.1);//very effective timbre change from this parameter
a.set(\bwBPF, 1);//crystal tile sound when \bwRes in inital parameter
a.set(\bwBPF, 0.001);//quiet background

a.set(\delAll, 0.008);//synthetic between 0.01-0.04, frequencies transposition > 0.1
a.set(\delAll, 0.05);//sharpAttack, movement is subtle and clear
a.set(\delAll, 0.06);//watery sound, blurred position
a.set(\delAll, 0.07);// percussive echo
a.set(\delAll, 0.08);//bouncing
a.set(\delAll, 0.09);//phasing, movement is clear
a.set(\delAll, 0.1);

a.set(\trigRate, 10);
a.set(\trigRate, 20);
a.set(\trigRate, 40);

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/EightChannPreCompTakes/Take1_BFPResonz.aif");
s.record;
s.stopRecording;
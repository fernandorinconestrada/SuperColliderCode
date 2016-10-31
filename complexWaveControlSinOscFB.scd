{ SinOscFB.ar(440, (SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(3)).range(0.2, 0.8).poll, 0.1) }.scope;

{ var sig, del;
	sig = SinOscFB.ar(440, (SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(3)).range(0.2, 0.8).poll, 0.1);
	del = SinOscFB.ar(450, (SinOsc.kr(3)+SinOsc.kr(5)+SinOsc.kr(7)+SinOsc.kr(11)).range(0.2, 0.8).poll, 0.1);
	OffsetOut.ar(0, sig);
	OffsetOut.ar(1, DelayC.ar(del, 0.1, 0.08, 0.75));
}.scope;


{ var freq, arr, fund, part, mix, del;
	freq = 60;
	arr = [3,5,7,11,13, 17, 19, 23];
	fund = SinOscFB.ar(freq, (SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(3)).range(0.1, 0.7).poll(label: \fund), 0.1);
	part = Mix.new(SinOscFB.ar(freq*arr, (SinOsc.kr(arr.choose).poll(label: \one)+SinOsc.kr(arr.choose).poll(label: \two)+SinOsc.kr(arr.choose).poll(label: \three)+SinOsc.kr(arr.choose).poll(label: \four)).range(0.2, 0.6).poll(label: \sum), 0.05));
	mix = LPF.ar(Mix.new(fund, part), 20000);
	del = DelayC.ar(mix, 0.1, 0,05, 0.75);
	OffsetOut.ar(0, LeakDC.ar([mix, del]));
}.scope;

{ var freq, arr, fund, part, mix, del;
	freq = 60;
	arr = [3,5,7,11,13, 17, 19, 23];
	fund = SinOscFB.ar(freq, (SinOsc.kr(11)+SinOsc.kr(7)+SinOsc.kr(5)+SinOsc.kr(3)).range(0.1, 0.7).poll(label: \fund), 0.1);
	part = Mix.new(SinOscFB.ar(freq*arr, (SinOsc.kr(arr.choose.postln)+SinOsc.kr(arr.choose.postln)+SinOsc.kr(arr.choose.postln)+SinOsc.kr(arr.choose.postln)).range(0.2, 0.6).poll(label: \sum), 0.05));
	mix = LPF.ar(Mix.new(fund, part), 20000);
	del = DelayC.ar(mix, 0.1, 0,05, 0.75);
	OffsetOut.ar(0, LeakDC.ar([mix, del]));
}.scope;


(
SynthDef(\complexWaveControl, { | freq, sum1, sum2, sum3, sum4, sum5, loFund = 0.1, hiFund = 0.8, ampFund = 0.1, loPart = 0.2, hiPart = 0.6, ampPart = 0.05, arr =#[1,2,3,4,5,6,7], delT, ampDel|
	var  control, fund, part, mix ,del;
	control = SinOsc.kr(sum1)+SinOsc.kr(sum2)+SinOsc.kr(sum3)+SinOsc.kr(sum4)+SinOsc.kr(sum5);
	fund = SinOscFB.ar(freq, control.range(loFund, hiFund), ampFund);
	part = Mix.new(SinOscFB.ar(freq*arr, control.range(loPart, hiPart), ampPart));
	mix = LPF.ar(Mix.new([fund, part]), 20000);
	del = DelayC.ar(mix, 0.2, delT, ampDel);
	OffsetOut.ar(0, LeakDC.ar([mix, del]));
}).add;
)

(
SynthDef(\complexWaveControlEnv, { | freq, sum1, sum2, sum3, sum4, sum5, loFund = 0.1, hiFund = 0.8, ampFund = 0.1, loPart = 0.2, hiPart = 0.6, ampPart = 0.05, arr =#[1,2,3,4,5,6,7], delT, ampDel, gate = 1, step1, step2, step3, envT1, envT2, envT3, envT4 |
	var  control, fund, part, mix ,del, env;
	env = EnvGen.kr(Env([0, step1, step2, step3, 0], [envT1, envT2, envT3, envT4]), gate, doneAction:2);
	control = SinOsc.kr(sum1)+SinOsc.kr(sum2)+SinOsc.kr(sum3)+SinOsc.kr(sum4)+SinOsc.kr(sum5);
	fund = SinOscFB.ar(freq, control.range(loFund, hiFund), ampFund);
	part = Mix.new(SinOscFB.ar(freq*arr, control.range(loPart, hiPart), ampPart));
	mix = LPF.ar(Mix.new([fund, part]), 20000);
	del = DelayC.ar(mix, 0.2, delT, ampDel);
	OffsetOut.ar(0, JPverb.ar(LeakDC.ar([mix, del]*env), 80, 0, 6));
}).add;
)

(
~a = Routine({
	var array, freq, delta;
	array = [2,3,5,7,11,13,17];
	freq = [55, 110, 220, 330, 440, 550, 660, 770, 880, 990];
	delta = rrand(3,7);
	10.do{
	Synth(\complexWaveControl, [\freq, freq.choose, \arr, array, \sum1, array.choose, \sum2, array.choose, \sum3, array.choose, \sum4, array.choose, \sum5, array.choose, \delT, 0.04, \ampDel, 0.75]);
	delta.yield;
	}
})
)

~a.play;

(
~aEnv = Routine({
	var array, freq, freq1, delta, stepsEnv, envTs, ampDel, delT, ampFund, ampPart;
	array = [2,3,5,7,11,13,17];
	freq = [55, 110, 220, 330, 440, 550, 660, 770, 880, 990];
	freq1 = 55*[1,2,3,4,5,6,7];
	delta = rrand(0.01,0.08);
	stepsEnv = (1..8)*0.1;
	envTs = (1..6)*0.01;
	ampDel = (50..70)*0.01;
	delT = (1..80)*0.01;
	ampFund = (5..12)*0.01;
	ampPart = (5..12)*0.01;
	500.do{
	Synth(\complexWaveControlEnv, [\freq, freq.choose, \arr, array, \sum1, array.choose, \sum2, array.choose, \sum3, array.choose, \sum4, array.choose, \sum5, array.choose, \delT, delT.choose, \ampDel, ampDel.choose, \step1, stepsEnv.choose, \step2, stepsEnv.choose,\step3, stepsEnv.choose, \envT1, envTs.choose, \envT2, envTs.choose,\envT3, envTs.choose,\envT4, envTs.choose, \ampFund, ampFund.choose, \ampPart, ampPart.choose]);
	delta.yield;
	Synth(\complexWaveControlEnv, [\freq, freq1.choose, \arr, array, \sum1, array.choose, \sum2, array.choose, \sum3, array.choose, \sum4, array.choose, \sum5, array.choose, \delT, delT.choose, \ampDel, ampDel.choose, \step1, stepsEnv.choose, \step2, stepsEnv.choose,\step3, stepsEnv.choose, \envT1, envTs.choose, \envT2, envTs.choose,\envT3, envTs.choose,\envT4, envTs.choose, \ampFund, ampFund.choose, \ampPart, ampPart.choose]);
	delta.yield;
	}
})
)

~aEnv.play;


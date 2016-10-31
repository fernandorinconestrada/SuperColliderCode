s.boot
Ndef(\pitch, {SinOsc.ar(1).exprange(400, 4000)})
Ndef(\k, {SinOsc.ar(Ndef.ar(\pitch),0,0.25)}).play
Ndef(\j, {Pulse.ar(200)*((Ndef.ar(\pitch)>3800) * 7).poll(100)}).play
Ndef(\pitch, {1999})
Ndef(\pitch, {2000})
Ndef(\pitch, {4001}) //pulse should turn on here

{ Pulse.ar(440) * 0.1 }.play;

Ndef(\trig, {WhiteNoise.ar(1)} )
Ndef(\a, {Out.ar(0, Decay2.ar((Ndef.ar(\trig) > 0.776) * (Ndef.ar(\trig) < 0.778), 0.01, 0.1, SinOscFB.ar(440, 0.6, 0.01)))}).play
Ndef(\b, {Out.ar(1, Decay2.ar((Ndef.ar(\trig) > 0.444) * (Ndef.ar(\trig) < 0.446), 0.01, 0.1, SinOscFB.ar(660, 0.6, 0.01)))}).play
Ndef(\c, {Out.ar(1, Decay2.ar((Ndef.ar(\trig) > 0.881) * (Ndef.ar(\trig) < 0.883), 0.01, 0.1, SinOscFB.ar(880, 0.6, 0.01)))}).play
Ndef(\d, {Out.ar(0, Decay2.ar((Ndef.ar(\trig) > 0.222) * (Ndef.ar(\trig) < 0.224), 0.01, 0.1, SinOscFB.ar(1320, 0.6, 0.01)))}).play

1 - 0.777;

{
	var trig = WhiteNoise.ar(1);
	OffsetOut.ar(0, Decay2.ar((trig > 0.111) * (trig < 0.113), 0.01, 0.1, SinOscFB.ar(440, 0.7, 0.1)));
	OffsetOut.ar(1, Decay2.ar((trig > 0.444) * (trig < 0.446), 0.01, 0.1, SinOscFB.ar(660, 0.4, 0.1)));
}.play;

(
SynthDef(\whiteTrigSine, { |rateWhite = 0.005, rateDel1 = 0.003, rateDel2 = 0.0023, loRangeIn1 = 0.111, hiRangeIn1 = 0.113, att1 = 0.01, rel1 = 0.03, freq1 = 440, rateFB1 = 0.2,  loRangeIn2 = 0.222, hiRangeIn2 = 0.224, att2 = 0.01, rel2 = 0.035, freq2 = 440, rateFB2 = 0.3, delAmp = 0.75, delT1 = 0.06, delT2 = 0.07, decT1 = 0.8, decT2 = 0.6, allAmp = 0.5 |
	var trig, in1, in2, del1, del2, delay1, delay2;
	trig = WhiteNoise.ar(SinOsc.kr(rateWhite, 0, 0.99, 0.01));
	delay1 = SinOsc.kr(rateDel1, 0, 22049, 1)/44100;
	delay2 = SinOsc.kr(rateDel2, 0, 22049, 1)/44100;
	in1 = Decay2.ar((trig > loRangeIn1) * (trig < hiRangeIn1), att1, rel1, SinOscFB.ar(freq1, SinOsc.kr(rateFB1, 0, 0.6, 0.2), LFNoise0.kr(40, 0.1, 0.05)));
	in2 = Decay2.ar((trig > loRangeIn2) * (trig < hiRangeIn2), att2, rel2, SinOscFB.ar(freq2, SinOsc.kr(rateFB2, 0, 0.6, 0.2), LFNoise0.kr(30, 0.1, 0.05)));
	del1 = DelayN.ar(in1, 0.2, delay1, delAmp);
	del2 = DelayN.ar(in2, 0.2, delay2, delAmp);
	OffsetOut.ar(0, in1);
	OffsetOut.ar(1, in2);
	OffsetOut.ar(1, del1);
	OffsetOut.ar(0, del2);
	OffsetOut.ar(0, AllpassC.ar(del1, 0.2, delT1, decT1, allAmp));
	OffsetOut.ar(1, AllpassC.ar(del2, 0.2, delT2, decT2, allAmp));
}).add;
)

a = Synth(\whiteTrigSine);
a.set(\rateWhite, 0.4);
a.set(\freq2, 218);
a.set(\freq1, 220);
a.set(\rel1, 0.05);
a.set(\rel2, 0.03);
a.set(\rateDel1, 13);

b = Synth(\whiteTrigSine, [\rateWhite, 0.004]);
b.set(\freq1, 221);
b.set(\freq2, 219);
b.set(\rel1, 0.04);
b.set(\rel2, 0.03);
b.set(\rateDel2, 15);